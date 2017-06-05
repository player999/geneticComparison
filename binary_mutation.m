 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function result = binary_mutation(element, rate)
    cnt = numel(element);
    nmu = ceil(cnt * rate);
    j = randsample(cnt, nmu);
    result = element;
    result(j) = 1 - element(j);
end