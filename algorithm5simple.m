pop_size = 100;
offspring = 2;
sigma = 0.125;
generations = 100;
fitness_function = create_test_function('F15');

%Init population
pop = real_generate_pop(pop_size, 2, fitness_function);

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
end