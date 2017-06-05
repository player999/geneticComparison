 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function real = real_code(val, func)
    norma = @(x)((x - func.xlim(1))/(func.xlim(2) - func.xlim(1)));
    real = arrayfun(norma, val);
end