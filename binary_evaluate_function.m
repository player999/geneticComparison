function results = evaluate_function(fu, dat)
    results = [];
    for i=1:size(dat, 1)
        results = cat(1, results, fu.func(binary_decode(dat(i, :), fu)));
    end
end