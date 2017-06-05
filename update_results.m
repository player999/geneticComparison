 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function res = update_results(results, params)
    func = create_test_function(params.common.function);
    ave = 0;
    aveg = 0;
    avel = 0;
    avef = 0;
    anp = 0;
    apr = 0;
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
       
       func_peaks = func.peaks;
       peaks = func_peaks(params.common.nargs);
       matched_peaks_all = match_peaks(params, results.per_run{i}.pop, peaks);
       pn = numel(unique(matched_peaks_all(:,2)));
       results.per_run{i}.pn = pn;
       anp = anp + pn;
       pr = pn /  size(peaks, 1);
       results.per_run{i}.pr = pr;
       apr = apr + pr;
       
       np = size(matched_peaks, 1);
       results.per_run{i}.pn_new = np;
       results.per_run{i}.falseratio = 1 - results.per_run{i}.pn / np;
       avef = avef + results.per_run{i}.falseratio;
       ave = ave + np;
    end
    ave = ave / numel(results.per_run);
    anp = anp / numel(results.per_run);
    apr = apr / numel(results.per_run);
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
    results.anp = anp;
    results.apr = apr;
    res = results;
end