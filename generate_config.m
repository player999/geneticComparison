varargs = struct;
varargs.common = struct;
varargs.common.function = {'F15' 'F16' 'F18' 'F19'};
varargs.common.nargs = [1 2 3 5];
varargs.common.delta = [1e-1 1e-2 1e-3 1e-4 1e-5];
varargs.offspring = [1 2 3];
varargs.sigma_option = [1 2];
varargs.gaussian_sigma = [1/2 1/4 1/8];
generate_multiple_configs(varargs, 'config_generate_template.tmp');

