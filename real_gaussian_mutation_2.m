 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function offsprings = real_gaussian_mutation_2(vater, count, pop_size, func)
    range = size(vater, 2) / 2;
    tau_shtrikh = 1/sqrt(2 * pop_size);
    tau = 1/sqrt(2 * sqrt(pop_size));

    %Calculate new sigma
    new_sigma = repmat(vater(range+1:end), count, 1);
    common_sigma = normrnd(0, tau, [count, 1]);
    common_sigma = repmat(common_sigma, 1, range);

    new_sigma = new_sigma .* exp(common_sigma + normrnd(0, tau_shtrikh, size(new_sigma)));

    vater = repmat(vater, count, 1);
 
    vater(:, 1:range) = vater(:, 1:range) + new_sigma .* normrnd(0, 1, size(new_sigma));
    vater(:, range + 1:end) = new_sigma;
    offsprings = arrayfun(@(x)(constraints(x, func.xlim)), vater);
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