 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function pops = make_populations(popsize, nargs, lims, runs)
    pops = zeros(popsize, nargs, runs);
    for i=1:runs
        pop = rand(popsize, nargs);
        for j=1:nargs
            pop(:,j) = (pop(:,j) .* (lims(j,2) - lims(j,1))) + lims(j,1);
            pops(:,:,i) = pop;
        end
    end
end