function results = multiple_runs(params, populations)
    res = cell(size(populations,3),1);
    runs = size(populations, 3);
    APR = 0;
    APF = 0;
    ANFE = 0;
    APA = 0;
    ADA = 0;
    ANP = 0;
    results = struct;
    for i=1:runs
        res{i} = analyze_function(params, populations(:,:,1));
        ANFE = ANFE + res{i}.nfe;
        APR = APR + res{i}.pr;
        if res{i}.pr == 1 
           APF = APF + 1; 
        end
        APA = APA + res{i}.pa;
        ADA = ADA + res{i}.da;
        ANP = ANP + res{i}.pn;
    end
    results.apr = APR / runs;
    results.apf = APF / runs;
    results.anfe = ANFE / runs;
    results.apa = APA / runs;
    results.ada = ADA / runs;
    results.anp = ANP / runs;
    results.per_run = res;
end