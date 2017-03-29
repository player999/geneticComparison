%Params
params = struct;
params.common = struct;
params.common.nargs = 2;
params.common.function = 'F15';
params.common.algorithm = 'algorithm2';
params.common.runs = 10;
params.common.delta = 1e-3;
params.common.sigma = 0.001;
params.common.population = 100;
params.mutation_rate = 0.02;
params.mutation_percentage = 0.3;
params.common.max_evals = 50000;

%Generate 
func = create_test_function(params.common.function);
population = make_populations(params.common.population, params.common.nargs, repmat(func.xlim, params.common.nargs, 1), params.common.runs);

results = analyze_function(params, population(:,:,1));