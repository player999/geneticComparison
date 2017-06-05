 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function generate_multiple_configs(varargs, config_file, fname_fmt)
    changing_values = {};
    specific_names = fieldnames(varargs);
    common_idx = 999;
    for i = 1:numel(specific_names)
       if strcmp(specific_names{i}, 'common') == 1
           common_idx = i;
       end
    end
    if common_idx ~= 999
        specific_names(common_idx) = [];
    end
    common_names = fieldnames(varargs.common);
    for i = 1:numel(specific_names)
        changing_values{i} = getfield(varargs, specific_names{i});
    end
    off = numel(changing_values);
    for i = 1:numel(common_names)
        if strcmp(common_names(i), 'function')
            changing_values{i+off} = 1:numel(varargs.common.function);
        else
            changing_values{i+off} = getfield(varargs.common, common_names{i});
        end
    end
    parameters = combvec(changing_values{:});
    fh = fopen(config_file, 'r');
    file_contents = char(fread(fh, 10000))';
    fclose(fh);
    
    name_list = specific_names;
    off = numel(name_list);
    for i = 1:size(common_names, 1)
        name_list{off + i} = ['common.' common_names{i}];
    end

    for i = 1:size(parameters, 2)
        param_set = parameters(:, i)';
        new_file = file_contents;
        for j=1:numel(param_set)
            if strcmp(name_list{j}, 'common.function') == 1   
                new_file = strrep(new_file, ['%' name_list{j} '%'], sprintf('%s', varargs.common.function{param_set(j)}));
            else
                new_file = strrep(new_file, ['%' name_list{j} '%'], sprintf('%f', param_set(j)));
            end
        end
        fh = fopen(sprintf(fname_fmt, i), 'w');
        fwrite(fh, new_file);
        fclose(fh);
    end
end