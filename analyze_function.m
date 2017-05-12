function results = analyze_function(params, population)
    algo = params.common.algorithm;
    
    if(strcmp(algo,'algorithm2') == 1)
        algorithm = @algorithm2;
    elseif (strcmp(algo,'algorithm3') == 1)
        algorithm = @algorithm3;
    elseif (strcmp(algo,'algorithm4') == 1)
        algorithm = @algorithm4;
    elseif (strcmp(algo,'algorithm5') == 1)
        algorithm = @algorithm5;
    elseif (strcmp(algo,'algorithm43') == 1)
        algorithm = @algorithm43;
    elseif (strcmp(algo,'algorithm4evs') == 1)
        algorithm = @algorithm4evs;
    elseif (strcmp(algo,'algorithm1') == 1)
        algorithm = @algorithm1;
    end
  
    runs = params.common.runs;
    func = create_test_function(params.common.function);
    fpeaks = func.peaks;

    run_results = cell(1, runs);
    [result_population, data] = algorithm(params, population);
    peaks = fpeaks(params.common.nargs);
    matched_peaks1 = match_peaks(params, result_population, peaks);
    matched_peaks2 = match_peaks_new(result_population, params.common.sigma, params.common.delta, func);
    peak_number = numel(unique(matched_peaks1(:,2)));
    peak_number2 = size(matched_peaks2,1);
    pr = peak_number /  size(peaks, 1);
    [pa, da] = accuracy(params, peaks, population);
    res = struct;
    res.nfe = data.nfe;
    res.pn = peak_number;
    res.pn_new = peak_number2;
    res.pr = pr;
    res.pa = pa;
    res.da = da;
    res.pop = result_population;
    results = res;
end