function res = prepare_result(results, params)
    cell_count = 8 + 9 * (numel(results.per_run) + 1);
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
    if isfield(params, 'mutation_rate')
        res(4) = params.mutation_rate;
    end
    if isfield(params, 'mutation_percentage')
        res(5) = params.mutation_percentage;
    end
    if isfield(params, 'offspring')
        res(6) = params.offspring;
    end
    if isfield(params, 'sigma_freq')
        res(7) = params.sigma_freq;
    end
    if isfield(params, 'gaussian_sigma')
        res(8) = params.gaussian_sigma;
    end
    offset = 9;
    for i = 1:numel(results.per_run)
       dta = results.per_run{i};
       res(offset + 0) = dta.nfe;
       res(offset + 1) = dta.pn_new;
       res(offset + 2) = dta.pn;
       res(offset + 3) = dta.pr;
       res(offset + 4) = dta.falseratio;
       if isfield(dta, 'png')
            res(offset + 5) = dta.png;
       else
            res(offset + 5) = -1;
       end
       if isfield(dta, 'pnl')
            res(offset + 6) = dta.pnl;
       else
            res(offset + 6) = -1;
       end
       res(offset + 7) = dta.pa;
       res(offset + 8) = dta.da;
       offset = offset + 9;
    end
 
   res(offset + 0) = results.anfe;
   res(offset + 1) = results.anp_new;
   res(offset + 2) = results.anp;
   res(offset + 3) = results.apr;
   res(offset + 4) = results.afalseratio;
   if isfield(results, 'anpg')
       res(offset + 5) = results.anpg;
   else
       res(offset + 5) = -1;
   end
   if isfield(results, 'anpl')
       res(offset + 6) = results.anpl;
   else
       res(offset + 6) = -1;
   end
   res(offset + 7) = results.apa;
   res(offset + 8) = results.ada;
end