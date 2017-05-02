function append_log(results, params)
    f = fopen('testing.log', 'a+');
    fwrite(f, sprintf('-------------------------------------------------------------------------------\n'));
    line = sprintf('%s\n', datestr(datetime));
    fwrite(f, line);
    fwrite(f, sprintf('===Parameters===\n'));
    if isfield(params, 'neighbourhood')
        line = sprintf('Specific neighbourhood size: %f\n', params.neighbourhood);
        fwrite(f, line);
    end
    if isfield(params, 'epsilon')
        line = sprintf('Specific epsilon: %f\n', params.epsilon);
        fwrite(f, line);
    end
    if isfield(params, 'mutation_rate')
        line = sprintf('Specific mutation rate: %f\n', params.mutation_rate);
        fwrite(f, line);
    end
    if isfield(params, 'mutation_percentage')
        line = sprintf('Specific mutation percentage: %f\n', params.mutation_percentage);
        fwrite(f, line);
    end
    if isfield(params, 'offspring')
        line = sprintf('Specific offspring count: %d\n', params.offspring);
        fwrite(f, line);
    end
    if isfield(params, 'gaussian_sigma')
        line = sprintf('Specific gaussian sigma: %f\n', params.gaussian_sigma);
        fwrite(f, line);
    end
    if isfield(params, 'sigma_option')
        line = sprintf('Specific sigma calculation option: %d\n', params.sigma_option);
        fwrite(f, line);
    end
    if isfield(params, 'sigma_freq')
        line = sprintf('Specific sigma calculation frequency: %d\n', params.sigma_freq);
        fwrite(f, line);
    end
    if isfield(params.common, 'function')
        line = sprintf('Function name: %s\n', params.common.function);
        fwrite(f, line);
    end
    if isfield(params.common, 'nargs')
        line = sprintf('Arguments count: %d\n', params.common.nargs);
        fwrite(f, line);
    end
    if isfield(params.common, 'algorithm')
        line = sprintf('Algorithm name: %s\n', params.common.algorithm);
        fwrite(f, line);
    end
    if isfield(params.common, 'runs')
        line = sprintf('Runs count: %d\n', params.common.runs);
        fwrite(f, line);
    end
    if isfield(params.common, 'delta')
        line = sprintf('Delta: %f\n', params.common.delta);
        fwrite(f, line);
    end
    if isfield(params.common, 'sigma')
        line = sprintf('Sigma: %f\n', params.common.sigma);
        fwrite(f, line);
    end
    if isfield(params.common, 'population')
        line = sprintf('Population size: %d\n', params.common.population);
        fwrite(f, line);
    end
    if isfield(params.common, 'max_evals')
        line = sprintf('Maximal evaluations count: %d\n', params.common.max_evals);
        fwrite(f, line);
    end
    fwrite(f, sprintf('===Results===\n'));
    line = sprintf('All peaks found: %f\n', results.apf);
    fwrite(f, line);
    line = sprintf('Average peak ratio: %f\n', results.apr);
    fwrite(f, line);
    line = sprintf('Average peak accuracy: %f\n', results.apa);
    fwrite(f, line);
    line = sprintf('Average distance accuracy: %f\n', results.ada);
    fwrite(f, line);
    line = sprintf('Average number of function evalualtions: %f\n', results.anfe);
    fwrite(f, line);
    line = sprintf('Average number of peaks: %f\n', results.anp);
    fwrite(f, line);
    for i = 1:numel(results.per_run)
        data = results.per_run{i};
        line = sprintf('\tRun %d: Function evaluations: %d\n', i, data.nfe);
        fwrite(f, line);
        line = sprintf('\tRun %d: Peak number: %d\n', i, data.pn);
        fwrite(f, line);
        line = sprintf('\tRun %d: Peak ratio: %f\n', i, data.pr);
        fwrite(f, line);
        line = sprintf('\tRun %d: Peak accuracy: %f\n', i, data.pa);
        fwrite(f, line);
        line = sprintf('\tRun %d: Distance accuracy: %f\n', i, data.da);
        fwrite(f, line);
    end
    line = sprintf('\n');
    fwrite(f, line);
    fclose(f);
end