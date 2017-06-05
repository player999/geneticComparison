 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function mat2xlsx(matname, xlsname)
    copyfile('result_template2.xlsx', xlsname);
    load(matname, 'res_matrix');
    lines_count = size(res_matrix, 1);
    xlswrite(xlsname, res_matrix, 1, sprintf('A6:BC%d', lines_count + 5));
end