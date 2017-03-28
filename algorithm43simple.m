pop_size = 100;
offspring = 2;
sigma_coef = 0.5;
sigma_freq = 10;
generations = 1000;
fitness_function = create_test_function('F15');
args = 2;

%Init population
pop = real_generate_pop(pop_size, args, fitness_function);
pop = cat(2, pop, zeros(pop_size, args + 1));

pairs1 = zeros(pop_size,1);
pairs1(randsample(1:pop_size, pop_size/2)) = 1;
pairs2 = ones(pop_size, 1);
pairs2(find(pairs1)) = 0;
pairs1 = find(pairs1);
pairs2 = find(pairs2);
distances = arrayfun(@(x)(real_euclidian_distance(pop(pairs1(x),:), pop(pairs2(x),:))), 1:50);
sigma = mean(distances) * sigma_coef;

range = ((numel(pop(1,:)) - 1)/2);
pop(:, range:end) = mean(distances);

for generation=1:generations
    %Mutation
    offs = [];
    for i = 1:pop_size
        off = real_gaussian_mutation(pop(i, :), offspring, sigma, fitness_function);
        offs = cat(1, offs, off);
    end

    %Evaluate
    parent_score = real_evaluate_function(fitness_function, pop(:,range:end));
    offspring_score = real_evaluate_function(fitness_function, offs(:,range:end));
    mean_score = mean(parent_score);
    display(sprintf('Mean score: %f', mean_score));

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