function write_excel_result(results, params)
    resfile = sprintf('result_%s.xlsx', datestr(datetime,'dd_MM_yyyy_HH_mm_ss')); 
    copyfile('result_template.xlsx', resfile);
    xlswrite(resfile, results.per_run{1}.nfe, 1, 'A6');%Run1 NFE
    xlswrite(resfile, results.per_run{1}.pn, 1, 'B6');%Run1 NP
    xlswrite(resfile, results.per_run{1}.pr, 1, 'C6');%Run1 PR
    xlswrite(resfile, results.per_run{1}.pa, 1, 'D6');%Run1 PA
    xlswrite(resfile, results.per_run{1}.da, 1, 'E6');%Run1 DA

    xlswrite(resfile, results.per_run{2}.nfe, 1, 'F6');%Run2 NFE
    xlswrite(resfile, results.per_run{2}.pn, 1, 'G6');%Run2 NP
    xlswrite(resfile, results.per_run{2}.pr, 1, 'H6');%Run2 PR
    xlswrite(resfile, results.per_run{2}.pa, 1, 'I6');%Run2 PA
    xlswrite(resfile, results.per_run{2}.da, 1, 'J6');%Run2 DA

    xlswrite(resfile, results.per_run{3}.nfe, 1, 'K6');%Run3 NFE
    xlswrite(resfile, results.per_run{3}.pn, 1, 'L6');%Run3 NP
    xlswrite(resfile, results.per_run{3}.pr, 1, 'M6');%Run3 PR
    xlswrite(resfile, results.per_run{3}.pa, 1, 'N6');%Run3 PA
    xlswrite(resfile, results.per_run{3}.da, 1, 'O6');%Run3 DA

    xlswrite(resfile, results.per_run{4}.nfe, 1, 'P6');%Run4 NFE
    xlswrite(resfile, results.per_run{4}.pn, 1, 'Q6');%Run4 NP
    xlswrite(resfile, results.per_run{4}.pr, 1, 'R6');%Run4 PR
    xlswrite(resfile, results.per_run{4}.pa, 1, 'S6');%Run4 PA
    xlswrite(resfile, results.per_run{4}.da, 1, 'T6');%Run4 DA

    xlswrite(resfile, results.per_run{5}.nfe, 1, 'U6');%Run5 NFE
    xlswrite(resfile, results.per_run{5}.pn, 1, 'V6');%Run5 NP
    xlswrite(resfile, results.per_run{5}.pr, 1, 'W6');%Run5 PR
    xlswrite(resfile, results.per_run{5}.pa, 1, 'X6');%Run5 PA
    xlswrite(resfile, results.per_run{5}.da, 1, 'Y6');%Run5 DA

    xlswrite(resfile, results.per_run{6}.nfe, 1, 'Z6');%Run6 NFE
    xlswrite(resfile, results.per_run{6}.pn, 1, 'AA6');%Run6 NP
    xlswrite(resfile, results.per_run{6}.pr, 1, 'AB6');%Run6 PR
    xlswrite(resfile, results.per_run{6}.pa, 1, 'AC6');%Run6 PA
    xlswrite(resfile, results.per_run{6}.da, 1, 'AD6');%Run6 DA

    xlswrite(resfile, results.per_run{7}.nfe, 1, 'AE6');%Run7 NFE
    xlswrite(resfile, results.per_run{7}.pn, 1, 'AF6');%Run7 NP
    xlswrite(resfile, results.per_run{7}.pr, 1, 'AG6');%Run7 PR
    xlswrite(resfile, results.per_run{7}.pa, 1, 'AH6');%Run7 PA
    xlswrite(resfile, results.per_run{7}.da, 1, 'AI6');%Run7 DA

    xlswrite(resfile, results.per_run{8}.nfe, 1, 'AJ6');%Run8 NFE
    xlswrite(resfile, results.per_run{8}.pn, 1, 'AK6');%Run8 NP
    xlswrite(resfile, results.per_run{8}.pr, 1, 'AL6');%Run8 PR
    xlswrite(resfile, results.per_run{8}.pa, 1, 'AM6');%Run8 PA
    xlswrite(resfile, results.per_run{8}.da, 1, 'AN6');%Run8 DA

    xlswrite(resfile, results.per_run{9}.nfe, 1, 'AO6');%Run9 NFE
    xlswrite(resfile, results.per_run{9}.pn, 1, 'AP6');%Run9 NP
    xlswrite(resfile, results.per_run{9}.pr, 1, 'AQ6');%Run9 PR
    xlswrite(resfile, results.per_run{9}.pa, 1, 'AR6');%Run9 PA
    xlswrite(resfile, results.per_run{9}.da, 1, 'AS6');%Run9 DA

    xlswrite(resfile, results.per_run{10}.pn, 1, 'AU6');%Run10 NP
    xlswrite(resfile, results.per_run{10}.pr, 1, 'AV6');%Run10 PR
    xlswrite(resfile, results.per_run{10}.pa, 1, 'AW6');%Run10 PA
    xlswrite(resfile, results.per_run{10}.da, 1, 'AX6');%Run10 DA

    xlswrite(resfile, results.anfe, 1, 'AY6');%AVE NFE
    xlswrite(resfile, results.anp, 1, 'AZ6');%AVE NP
    xlswrite(resfile, results.apr, 1, 'BA6');%AVE PR
    xlswrite(resfile, results.apa, 1, 'BB6');%AVE PA
    xlswrite(resfile, results.ada, 1, 'BC6');%AVE DA
end