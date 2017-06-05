 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



load('C:/Users/Kate-lenovo/Documents/Могилянка магистерка/2 курс/Диплом/geneticComparison/популяции/n1/population f15 n1 500.mat')
run_range = [1:12];
name_template = 'test_config_f15_n1_s2_%d';
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

load('C:/Users/Kate-lenovo/Documents/Могилянка магистерка/2 курс/Диплом/geneticComparison/популяции/n2/population f15 n2 500.mat')
run_range = [1:12];
name_template = 'test_config_f15_n2_s2_%d';
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
