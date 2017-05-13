function res = prepare_result(results, params)
    cell_count = 6 + 6 * (numel(results.per_run) + 1);
    res = zeros(1, cell_count);
    if isfield(params.common, 'population')
        res(1) = params.common.population;
    end
    if isfield(params, 'neighbourhood')
        res(2) = params.neighbourhood;
    end
    if isfield(params, 'epsilon')
        res(3) = params.epsilon;
    end
    if isfield(params, 'offspring')
        res(4) = params.offspring;
    end
    if isfield(params, 'sigma_freq')
        res(5) = params.sigma_freq;
    end
    if isfield(params, 'gaussian_sigma')
        res(6) = params.gaussian_sigma;
    end
    offset = 7;
    for i = 1:numel(results.per_run)
       dta = results.per_run{i};
       res(offset + 0) = dta.nfe;
       res(offset + 1) = dta.pn_new;
       res(offset + 2) = dta.pn;
       res(offset + 3) = dta.pr;
       res(offset + 4) = dta.pa;
       res(offset + 5) = dta.da;
       offset = offset + 6 * i;
    end
 
   res(offset + 0) = results.anfe;
   res(offset + 1) = results.anp_new;
   res(offset + 2) = results.anp;
   res(offset + 3) = results.apr;
   res(offset + 4) = results.apa;
   res(offset + 5) = results.ada;
end