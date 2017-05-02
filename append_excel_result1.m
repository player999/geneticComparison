function append_excel_result1(results, params, fname)
    if exist(fname, 'file') == 0
        copyfile('result_template2.xlsx', fname);
    end
    
    %Find free line
    line_idx = 6;
    while isempty(xlsread(fname,1,sprintf('A%d', line_idx))) == 0
        line_idx = line_idx + 1;
    end
 
    res_matrix = [];
    for i=1:numel(results.per_run)
        res_matrix = cat(2, res_matrix, [results.per_run{i}.nfe results.per_run{i}.pn results.per_run{i}.pr results.per_run{i}.pa results.per_run{i}.da]);
    end
    res_matrix = cat(2, res_matrix, [results.anfe results.anp results.apr results.apa results.ada]);
    xlswrite(fname, res_matrix, 1, sprintf('A%d:BC%d', line_idx, line_idx));
end