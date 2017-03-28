pop_size = 1000;
offspring = 2;
generations = 100;
sigma_option = 1;
sigma_coef = 1/125;
fitness_function = create_test_function('F15');

%Init population
pop = real_generate_pop(pop_size, 2, fitness_function);

if sigma_option == 1
    pairs1 = zeros(pop_size,1);
    pairs1(randsample(1:pop_size, pop_size/2)) = 1;
    pairs2 = ones(pop_size, 1);
    pairs2(find(pairs1)) = 0;
    pairs1 = find(pairs1);
    pairs2 = find(pairs2);
    distances = arrayfun(@(x)(real_euclidian_distance(pop(pairs1(x),:), pop(pairs2(x),:))), 1:50);
    sigma = mean(distances) * sigma_coef;
end


for generation=1:generations
    %Mutation
    offs = [];
    for i = 1:pop_size
        off = real_gaussian_mutation(pop(i, :), offspring, sigma, fitness_function);
        offs = cat(1, offs, off);
    end

    %Evaluate
    parent_score = real_evaluate_function(fitness_function, pop);
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