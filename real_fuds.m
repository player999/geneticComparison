function [new_pop, new_score] = real_fuds(pop, score, nlevels)
    new_pop = pop;
    new_score = score;
    
    low_level = min(score);
    high_level = max(score);
    epsilon = (high_level - low_level) / nlevels;
    getrange = @(x)([low_level + ((x) * epsilon), low_level + (x + 1) * epsilon]);
    ranges = [];
    for i=0:nlevels-2
        ranges = cat(1, ranges, getrange(i));
    end
    ranges = cat(1, ranges, [low_level + (nlevels-1) * epsilon, high_level]);
    
    members_level = zeros(nlevels, 1);
    for i = 1:nlevels
       x1 = ranges(i, 1);
       x2 = ranges(i, 2);
       mask1 = new_score > x1;
       mask2 = new_score < x2;
       mask = mask1 .* mask2;
       members_level(i) = sum(mask);
    end
    
    [~, idx] = max(members_level);
    x1 = ranges(idx, 1);
    x2 = ranges(idx, 2);
    mask1 = new_score > x1;
    mask2 = new_score < x2;
    mask = mask1 .* mask2;
    indexes = find(mask);
    victim = randsample(indexes, 1);
    new_pop(victim, :) = [];
    new_score(victim, :) = [];
end