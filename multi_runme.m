run_range = [1:90];
name_template = 'test_config_%d';
for i = 1:numel(run_range)
    config_name = sprintf(name_template, run_range(i));
    eval(config_name);
    func = create_test_function(params.common.function);
    %population = make_populations(params.common.population, params.common.nargs, repmat(func.xlim, params.common.nargs, 1), params.common.runs);
    %Generate 
    results = multiple_runs(params, population);
    save([sprintf(name_template, run_range(i)) '.mat'], 'results');
    append_log(results, params);
    append_mat_result1(results, params, [sprintf(name_template, run_range(i)) '_log.mat']);
end