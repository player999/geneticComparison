eval('config_alg5');
%Generate 
func = create_test_function(params.common.function);
population = make_populations(params.common.population, params.common.nargs, repmat(func.xlim, params.common.nargs, 1), params.common.runs);
results = multiple_runs(params, population);
append_log(results, params);
