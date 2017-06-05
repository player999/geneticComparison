 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.


function [pa, da] = accuracy(params, peaks, population)
    pa = 0;
    da = 0;
    func = create_test_function(params.common.function);
    for i=1:size(peaks, 1)
        distance = 10000;
        idx = -1;
        for j=1:size(population, 1)
            d = dist(peaks(i, :), population(j,:)');
            if d < distance
               distance = d;
               idx = j;
            end
        end
        closest = population(idx, :);
        peak = peaks(i, :);
        pa = pa + abs(func.func(closest) - func.func(peak));
        da = da + distance;
    end
end