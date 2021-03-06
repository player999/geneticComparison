 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function append_mat_result1(results, params, fname)     
    res = [];
    for i=1:numel(results.per_run)
        res = cat(2, res, [results.per_run{i}.nfe results.per_run{i}.pn results.per_run{i}.pr results.per_run{i}.pa results.per_run{i}.da]);
    end
    res = cat(2, res, [results.anfe results.anp results.apr results.apa results.ada]);
    
    if exist(fname, 'file') == 0
        res_matrix = res;
        save(fname,'res_matrix');
    else
        load(fname, 'res_matrix');
        res_matrix = cat(1, res_matrix, res);
        save(fname,'res_matrix');
    end
end