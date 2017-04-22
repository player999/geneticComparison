function seeds = match_peaks_new(apeaks, epsilon, delta, func)
    seeds = [];
    scores = [];
    for i=1:size(apeaks, 1)
       scores = cat(1, scores, func.func(apeaks(i, :)));
    end
    while size(apeaks, 1) > 0
        found = 0;
        [sc, index] = max(scores);
        scores(index) = [];
        x = apeaks(index, :);
        apeaks(index, :) = [];
        if abs(1 - sc) < delta
            if size(seeds, 1) == 0
               seeds = cat(1, seeds, x); 
            else
                for i = 1:size(seeds,1)
                   if dist(x, seeds(i,:)') < epsilon
                       found = 1;
                       break;
                   end
                end
                if found == 0 
                    seeds = cat(1, seeds, x);
                end
            end
        end
    end
end