function [result_population, data] = algorithm2(parameters, population)
    pop_size = parameters.common.population;
    mutation_rate = parameters.mutation_rate;
    mutation_percentage =  parameters.mutation_percentage;
    generations = floor(parameters.common.max_evals / 2);
    fitness_function = create_test_function(parameters.common.function);
    nfe = 0;
   
    pop = [];
    for i=1:pop_size
        pop = cat(1, pop, binary_code(population(i, :), fitness_function));
    end
 
    last_five = {1,2,3,4,5};
    for generation = 1:generations
        %Evaluate
        scores = binary_evaluate_function(fitness_function, pop);
        nfe = nfe + size(pop, 1);
        last_five = last_five(2:end);
        last_five{end+1} = mean(scores);
        if(abs(last_five{1} - last_five{5}) < 0.00001 )
            break;
        end
        %Randomly select pairs
        pair1idx = randsample(pop_size, pop_size / 2);
        pair1 = pop(pair1idx, :);
        pair2idx = randsample(setdiff([1:pop_size], pair1idx), pop_size / 2)';
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
        new_scores = binary_evaluate_function(fitness_function, new_pop);
        nfe = nfe + size(new_pop, 1);

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
        display(sprintf('Generation %d', generation));
    end

    result_population = [];
    for i=1:pop_size
        result_population = cat(1, result_population, binary_decode(pop(i, :), fitness_function));
    end
    data = struct;
    data.nfe = nfe;
end