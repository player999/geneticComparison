%  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



eval('test_config_a3_f15_n1_s2_1');
%Generate 
func = create_test_function(params.common.function);
population = make_populations(params.common.population, params.common.nargs, repmat(func.xlim, params.common.nargs, 1), params.common.runs);
%results = multiple_runs(params, population);
%append_log(results, params);
%save('test_config_1.mat', 'results');