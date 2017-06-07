 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function [result_population, data] = algorithm4_1(parameters, population)
    pop_size = parameters.common.population;
    offspring = parameters.offspring;
    pm = parameters.pm;
    rm = parameters.rm;
    sigma_coef = parameters.gaussian_sigma;
    sigma_option = parameters.sigma_option;
    sigma_freq = parameters.sigma_freq;
    generations = floor(parameters.common.max_evals / 2);
    fitness_function = create_test_function(parameters.common.function);
    data = struct;
    nfe = 0;

    %Init population
    pop = [];
    for i=1:pop_size
        pop = cat(1, pop, real_code(population(i, :), fitness_function));
    end

    last_five = {1,2,3,4,5};
    if (sigma_option == 1) || (sigma_option == 2)
        pairs1 = zeros(pop_size,1);
        pairs1(randsample(1:pop_size, pop_size/2)) = 1;
        pairs2 = ones(pop_size, 1);
        pairs2(find(pairs1)) = 0;
        pairs1 = find(pairs1);
        pairs2 = find(pairs2);
        distances = arrayfun(@(x)(real_euclidian_distance(pop(pairs1(x),:), pop(pairs2(x),:))), 1:pop_size/2);
        sigma = mean(distances) * sigma_coef;
    end
    fprintf('Sigma = %f\n', sigma);

    for generation=1:generations
        %Mutation
        offs = [];
        indices = [];
        for i = 1:pop_size
            if rand() < pm
               off = real_gaussian_mutation_prob(pop(i, :), offspring, sigma, fitness_function, rm);
               offs = cat(1, offs, off); 
               indices = cat(1, indices, i);
            end
        end

        %Evaluate
        parent_score = real_evaluate_function(fitness_function, pop);
        nfe = nfe + size(pop, 1);
        last_five = last_five(2:end);
        last_five{end+1} = mean(parent_score);
        if(abs(last_five{1} - last_five{5}) < 0.00001 )
            result_population = [];
            for i=1:pop_size
                result_population = cat(1, result_population, real_decode(pop(i, :), fitness_function));
            end
            break;
        end
        offspring_score = real_evaluate_function(fitness_function, offs);
        nfe = nfe + size(offs, 1);
        mean_score = mean(parent_score);
        display(sprintf('Mean score: %f', mean_score));
        if (sigma_option == 2) && (mod(generation, sigma_freq) == 0)
            pairs1 = zeros(pop_size,1);
            pairs1(randsample(1:pop_size, pop_size/2)) = 1;
            pairs2 = ones(pop_size, 1);
            pairs2(find(pairs1)) = 0;
            pairs1 = find(pairs1);
            pairs2 = find(pairs2);
            distances = arrayfun(@(x)(real_euclidian_distance(pop(pairs1(x),:), pop(pairs2(x),:))), 1:pop_size/2);
            sigma = mean(distances) * sigma_coef;
        end

        %Tournament
        new_pop = [];
        for i=1:pop_size
            if sum(i == indices) > 0
                candidates = cat(1, pop(i,:), offs((i-1)*offspring + 1:i*offspring,:));
                scores = cat(1, parent_score(i), offspring_score((i-1)*offspring + 1:i*offspring));
                winner = real_tournament(candidates, scores);
                new_pop = cat(1, new_pop, winner);
            else
                new_pop = cat(1, new_pop, pop(i,:));
            end
        end
        pop = new_pop;
    end
    data.nfe = nfe;
end
