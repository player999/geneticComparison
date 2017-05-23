function res = update_results(results, params)
    func = create_test_function(params.common.function);
    ave = 0;
    aveg = 0;
    avel = 0;
    avef = 0;
    for i = 1:numel(results.per_run)
       matched_peaks = match_peaks_new(results.per_run{i}.pop, params.common.sigma, params.common.delta, func);
       func = create_test_function(params.common.function);
       if isfield(func, 'gpeaks')
            gpeaks = func.gpeaks;
            peaks = gpeaks(params.common.nargs);
            matched_peaks_global = match_peaks(params, results.per_run{i}.pop, peaks);
            npg = numel(unique(matched_peaks_global(:,2)));
            results.per_run{i}.png = npg;
            aveg = aveg + npg;
       end
       
       if isfield(func, 'lpeaks')
           lpeaks = func.lpeaks;
           peaks = lpeaks(params.common.nargs);
           matched_peaks_local = match_peaks(params, results.per_run{i}.pop, peaks);
           npl = numel(unique(matched_peaks_local(:,2)));
           results.per_run{i}.pnl = npl;
           avel = avel + npl;
       end
       np = size(matched_peaks, 1);
       results.per_run{i}.pn_new = np;
       results.per_run{i}.falseratio = 1 - results.per_run{i}.pn / np;
       avef = avef + results.per_run{i}.falseratio;
       ave = ave + np;
    end
    ave = ave / numel(results.per_run);
    if isfield(func, 'gpeaks')
        aveg = aveg / numel(results.per_run);
        results.anpg = aveg;
    end
    if isfield(func, 'lpeaks')
        avel = avel / numel(results.per_run);
        results.anpl = avel;
    end
    results.afalseratio = avef / numel(results.per_run);
    results.anp_new = ave;
    res = results;
end