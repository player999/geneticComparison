pop_size = 100;
mutation_rate = 0.02;
mutation_percentage = 0.3;
generations = 100;

fitness_function = create_test_function('F15');

%Generate population
pop = binary_generate_pop(pop_size, 2, fitness_function);

for generation = 1:generations
    %Evaluate
    scores = evaluate_function(fitness_function, pop);

    %Randomly select pairs
    pair1idx = randsample(pop_size, pop_size / 2);
    pair1 = pop(pair1idx, :);
    pair2idx = randsample(setdiff([1:100], pair1idx), pop_size / 2)';
    pair2 = pop(pair2idx, :);

    %Crossing over
    new_pop = [];
    for i = 1:pop_size / 2
       [y1, y2] = binary_crossing_over(pair1(i, :), pair2(i, :));
       new_pop = cat(1, new_pop, y1, y2);
    end

    %Mutation
    number_mutants = ceil(mutation_percentage * pop_size);
    mutidx = randsample(pop_size, number_mutants);
    for i = 1:numel(mutidx)
        mutid = mutidx(i);
        new_pop(mutid, :) = binary_mutation(new_pop(mutid, :), mutation_rate);
    end

    %New scores
    new_scores = evaluate_function(fitness_function, new_pop);

    %Tournament
    new_pop2 = [];
    for i = 1:2:pop_size
        d1 = binary_hamming_distance(pop(i, :), new_pop(i, :)) + binary_hamming_distance(pop(i + 1, :), new_pop(i + 1, :));
        d2 = binary_hamming_distance(pop(i, :), new_pop(i + 1, :)) + binary_hamming_distance(pop(i + 1, :), new_pop(i, :));
        if d1 <= d2
            if new_scores(i) > scores(i)
               new_pop2 = cat(1, new_pop2, new_pop(i, :)); 
            else
               new_pop2 = cat(1, new_pop2, pop(i, :)); 
            end

            if new_scores(i  +1) > scores(i + 1)
               new_pop2 = cat(1, new_pop2, new_pop(i + 1, :)); 
            else
               new_pop2 = cat(1, new_pop2, pop(i + 1, :)); 
            end
        else
            if new_scores(i + 1) > scores(i)
               new_pop2 = cat(1, new_pop2, new_pop(i + 1, :)); 
            else
               new_pop2 = cat(1, new_pop2, pop(i, :)); 
            end

            if new_scores(i) > scores(i + 1)
               new_pop2 = cat(1, new_pop2, new_pop(i, :)); 
            else
               new_pop2 = cat(1, new_pop2, pop(i + 1, :)); 
            end
        end
    end

    pop = new_pop2;
end

human_read = [];
for i=1:pop_size
    human_read = cat(1, human_read, binary_decode(pop(i, :), fitness_function));
end