 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function d = real_euclidian_distance(p1, p2)
    summa = 0;
    for i=1:numel(p1)
        summa = summa + (p1(i) - p2(i))^2;
    end
    d = sqrt(summa);
end