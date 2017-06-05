 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



params = struct;
params.common = struct;
params.common.nargs = 1;
params.common.function = 'F15';
params.common.algorithm = 'algorithm2';
params.common.runs = 10;
params.common.delta = 0.01;
params.common.sigma = 0.01;
params.common.population = 500;
params.mutation_rate = 0.300000;
params.mutation_percentage = 0.300000;
params.common.max_evals = 50000;