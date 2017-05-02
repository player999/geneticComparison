function write_excel_result(results, params)
    resfile = sprintf('result_%s.xlsx', datestr(datetime,'dd_MM_yyyy_HH_mm_ss')); 
    copyfile('result_template.xlsx', resfile);
    xlswrite(resfile, results.per_run{1}.nfe, 1, 'A6');%Run1 NFE
    xlswrite(resfile, results.per_run{1}.pn, 1, 'B6');%Run1 NP
    xlswrite(resfile, results.per_run{1}.pr, 1, 'C6');%Run1 PR
    xlswrite(resfile, results.per_run{1}.pa, 1, 'D6');%Run1 PA
    xlswrite(resfile, results.per_run{1}.da, 1, 'E6');%Run1 DA
    
end