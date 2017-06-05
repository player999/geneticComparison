 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function results = real_evaluate_function(fu, dat)
    results = [];
    for i=1:size(dat, 1)
        results = cat(1, results, fu.func(real_decode(dat(i, :), fu)));
    end
end