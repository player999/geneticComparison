 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function results = multiple_runs(params, populations)
    res = cell(size(populations,3),1);
    runs = size(populations, 3);
    APR = 0;
    APF = 0;
    ANFE = 0;
    APA = 0;
    ADA = 0;
    ANP = 0;
    ANP_NEW = 0;
    results = struct;
    for i=1:runs
        res{i} = analyze_function(params, populations(:,:,i));
        ANFE = ANFE + res{i}.nfe;
        APR = APR + res{i}.pr;
        if res{i}.pr == 1 
           APF = APF + 1; 
        end
        APA = APA + res{i}.pa;
        ADA = ADA + res{i}.da;
        ANP = ANP + res{i}.pn;
        ANP_NEW = ANP_NEW + res{i}.pn_new;
    end
    results.apr = APR / runs;
    results.apf = APF / runs;
    results.anfe = ANFE / runs;
    results.apa = APA / runs;
    results.ada = ADA / runs;
    results.anp = ANP / runs;
    results.anp_new = ANP_NEW / runs;
    results.per_run = res; 
end