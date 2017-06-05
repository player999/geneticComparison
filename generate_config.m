 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



varargs = struct;
varargs.common = struct;
varargs.offspring = [1 2 3];
varargs.gaussian_sigma = [1/2 1/4 ];
generate_multiple_configs(varargs, 'config_generate_template_alg4_sigma_opt1.tmp', 'test_config_F15_n1_algorithm4_sigma1_%d.m');

varargs.offspring = [1 2 3];
varargs.gaussian_sigma = [1/2 1/4 1/8];
generate_multiple_configs(varargs, 'config_generate_template_alg4_sigma_opt1.tmp', 'test_config_F15_n1_algorithm4_sigma1_%d.m');
