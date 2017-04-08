function [result_population, data] = algorithm5(parameters, population)    
    pop_size = parameters.common.population;
    offspring = parameters.offspring;
    sigma = parameters.gaussian_sigma;
    sigma_option = parameters.sigma_option;
    generations = floor(parameters.common.max_evals / 2);
    fitness_function = create_test_function(parameters.common.function);
    data = struct;

    %Init population
    pop = [];
    for i=1:pop_size
        pop = cat(1, pop, real_code(population(i, :), fitness_function));
    end

    if sigma_option == 1
        pairs1 = zeros(pop_size,1);
        pairs1(randsample(1:pop_size, pop_size/2)) = 1;
        pairs2 = ones(pop_size, 1);
        pairs2(find(pairs1)) = 0;
        pairs1 = find(pairs1);
        pairs2 = find(pairs2);
        distances = arrayfun(@(x)(real_euclidian_distance(pop(pairs1(x),:), pop(pairs2(x),:))), 1:pop_size/2);
        sigma = mean(distances) * sigma_coef;
    end

    last_five = {1,2,3,4,5};
    for generation=1:generations
        %Mutation
        offs = [];
        for i = 1:pop_size
            off = real_gaussian_mutation(pop(i, :), offspring, sigma, fitness_function);
            offs = cat(1, offs, off);
        end

        %Evaluate
        parent_score = real_evaluate_function(fitness_function, pop);
        last_five = last_five(2:end);
        last_five{end+1} = mean(parent_score);
        if(abs(last_five{1} - last_five{5}) < 0.00001 )
            result_population = pop;
            break;
        end
        offspring_score = real_evaluate_function(fitness_function, offs);

        %Deletion
        new_pop = cat(1, pop, offs);
        new_score = cat(1, parent_score, offspring_score);
        wellness_levels = floor(sqrt(pop_size));
        for i = 1:(size(new_pop, 1) - pop_size)
            [new_pop, new_score] = real_fuds(new_pop, new_score, wellness_levels);
        end
        pop = new_pop;
        display(sprintf('Over 0.9 count %d mean %d', sum(new_score > 0.9), mean(new_score)));
    end
    data.nfe = generation * 2;
end