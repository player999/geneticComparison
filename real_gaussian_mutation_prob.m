 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function offsprings = real_gaussian_mutation_prob(vater, count, sigma, func, rm)
    distribution = normrnd(0, sigma, [count numel(vater)]);
    for i=1:count
       for j=1:numel(vater)
          if rand() > rm
              distribution(i, j) = 0;
          end
       end
    end
    vater = repmat(vater, count, 1);
    offsprings = vater + distribution;
    offsprings = arrayfun(@(x)(constraints(x, func.xlim)), offsprings);
end

function res = constraints(v, lims)
    if v > lims(2)
        res = lims(2);
    elseif v < lims(1)
        res = lims(1);
    else
        res = v;
    end
end