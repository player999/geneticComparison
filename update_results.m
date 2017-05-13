function res = update_results(results, params)
    func = create_test_function(params.common.function);
    ave = 0;
    for i = 1:numel(results.per_run)
       matched_peaks = match_peaks_new(results.per_run{i}.pop, params.common.sigma, params.common.delta, func);
       np = size(matched_peaks, 1);
       results.per_run{i}.pn_new = np;
       ave = ave + np;
    end
    ave = ave / numel(results.per_run);
    results.anp_new = ave;
    res = results;
end