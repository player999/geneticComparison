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
params.common.nargs = 3;
params.common.function = 'F19';
params.common.algorithm = 'algorithm1';
params.common.runs = 10;
params.common.delta = 0.01;
params.common.sigma = 0.01;
params.neighbourhood = 0.05;
params.epsilon = 10e-5;
params.common.population = 500;
params.common.max_evals = 50000;