function results = analyze_function(params, population)
    algo = params.common.algorithm;
    
    if(strcmp(algo,'algorithm2') == 1)
        algorithm = @algorithm2;
    end
  
    runs = params.common.runs;
    func = create_test_function(params.common.function);
    fpeaks = func.peaks;

    run_results = cell(1, runs);
    [result_population, nfe] = algorithm(params, population);
    peaks = fpeaks(params.common.nargs);
    matched_peaks = match_peaks(params, peaks, result_population);
    peak_number = numel(unique(matched_peaks(:,1)));
    pr = peak_number /  size(peaks, 1);
    [pa, da] = accuracy(params, peaks, population);
    res = struct;
    res.nfe = nfe;
    res.pn = peak_number;
    res.pr = pr;
    res.pa = pa;
    res.da = da;
    results = res;
end