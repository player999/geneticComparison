function analyze_results(tmp_file, dst_dir)
    idx = 1;
    table_list = [];
    while exist(sprintf(tmp_file, idx), 'file')
        results_file = sprintf(tmp_file, idx);
        params_file = results_file(1:end-4);
        load(results_file);
        eval(params_file);
        results = update_results(results, params);
        table_list = cat(1, table_list, prepare_result(results, params));
        idx = idx + 1; 
    end
    fl = strrep(tmp_file, '_%d', '');
    fl = fl(1:end-4);
    
    fname_xls = [dst_dir '/' fl '.xlsx'];
    fname_mat = [dst_dir '/' fl '.mat'];
    
    if strcmp(computer(), 'GLNXA64')
        table = table_list;
        save(fname_mat, 'table');
    else
        copyfile('result_template4.xlsx', fname_xls);
        xlswrite(fname_xls, table_list, 1, 'A9');
    end
    make_population_plots(tmp_file, dst_dir, params.common.function);
end