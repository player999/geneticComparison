function mat2xlsx(matname, xlsname)
    copyfile('result_template2.xlsx', xlsname);
    load(matname, 'res_matrix');
    lines_count = size(res_matrix, 1);
    xlswrite(xlsname, res_matrix, 1, sprintf('A6:BC%d', lines_count + 6));
end