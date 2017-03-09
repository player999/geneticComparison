function winner = real_tournament(candidates, results)
    [~, widx] = max(results);
    winner = candidates(widx, :);
end