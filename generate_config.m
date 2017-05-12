varargs = struct;
varargs.common = struct;
varargs.offspring = [1 2 3];
varargs.gaussian_sigma = [1/2 1/4 1/8];
generate_multiple_configs(varargs, 'config_generate_template_alg4_sigma_opt1.tmp', 'test_config_F15_n1_algorithm4_sigma1_%d.m');

