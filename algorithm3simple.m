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