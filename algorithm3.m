function [result_population, data] = algorithm3(parameters, population)
    pop_size = parameters.common.population;
    offspring = parameters.offspring;
    sigma = parameters.gaussian_sigma;
    generations = floor(parameters.common.max_evals / 2);
    fitness_function = create_test_function(parameters.common.function);
    data = struct;
    
    %Init population
    pop = [];
    for i=1:pop_size
        pop = cat(1, pop, real_code(population(i, :), fitness_function));
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

        %Tournament
        new_pop = [];
        for i=1:pop_size
            candidates = cat(1, pop(i,:), offs((i-1)*offspring + 1:i*offspring,:));
            scores = cat(1, parent_score(i), offspring_score((i-1)*offspring + 1:i*offspring));
            winner = real_tournament(candidates, scores);
            new_pop = cat(1, new_pop, winner);
        end
        pop = new_pop;
    end
    data.nfe = generation * 2;
end