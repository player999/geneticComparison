function write_excel_result(results, params)
    resfile = sprintf('result_%s.xlsx', datestr(datetime,'dd_MM_yyyy_HH_mm_ss')); 
    copyfile('result_template.xlsx', resfile);
    xlswrite(resfile, results.per_run{1}.nfe, 'A6');%Run1 NFE
    xlswrite(resfile, results.per_run{1}.pn, 'B6');%Run1 NP
    xlswrite(resfile, results.per_run{1}.pr, 'C6');%Run1 PR
    xlswrite(resfile, results.per_run{1}.pa, 'D6');%Run1 PA
    xlswrite(resfile, results.per_run{1}.da, 'E6');%Run1 DA
    
end