run_range = [1:10];
population = make_populations(params.common.population, params.common.nargs, repmat(func.xlim, params.common.nargs, 1), params.common.runs);
for i = 1:numel(run_range)
    config_name = sprintf('test_config_%d', run_range(i));
    eval(config_name);
    %Generate 
    func = create_test_function(params.common.function);
    results = multiple_runs(params, population);
    append_log(results, params);
    write_excel_result(results, params);
    append_excel_result1(results, params, 'res.xls');
end