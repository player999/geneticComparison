function append_excel_result1(results, params, fname)
    if exist(fname, 'file') ~= 0
        copyfile('result_template2.xlsx', fname);
    end
    
    %Find free line
    line_idx = 1;
    while isempty(xlsread('result_template2.xlsx',1,'A6')) == 0
        line_idx = line_idx + 1;
    end
    
    write_columns = [ 'A'  'B'  'C'  'D'  'E';
                      'F'  'G'  'H'  'I'  'J';
                      'K'  'L'  'M'  'N'  'O';
                      'P'  'Q'  'R'  'S'  'T';
                      'U'  'V'  'W'  'X'  'Y';
                      'Z' 'AA' 'AB' 'AC' 'AD';
                     'AE' 'AF' 'AG' 'AH' 'AI';
                     'AJ' 'AK' 'AL' 'AM' 'AN';
                     'AO' 'AP' 'AQ' 'AR' 'AS';
                     'AT' 'AU' 'AV' 'AW' 'AX';
                     'AY' 'AZ' 'BA' 'BB' 'BC'];
    
    for i=1:size(write_columns,1)
        xlswrite(resfile, results.per_run{1}.nfe, 1, sprintf('%s%d', write_columns(i, 1), line_idx));%Runi NFE
        xlswrite(resfile, results.per_run{1}.pn, 1, sprintf('%s%d', write_columns(i, 2), line_idx));%Runi NP
        xlswrite(resfile, results.per_run{1}.pr, 1, sprintf('%s%d', write_columns(i, 3), line_idx));%Runi PR
        xlswrite(resfile, results.per_run{1}.pa, 1, sprintf('%s%d', write_columns(i, 4), line_idx));%Runi PA
        xlswrite(resfile, results.per_run{1}.da, 1, sprintf('%s%d', write_columns(i, 5), line_idx));%Runi DA
    end
    xlswrite(resfile, results.anfe, 1, sprintf('%s%d', write_columns(11, 1)));%AVE NFE
    xlswrite(resfile, results.anp, 1, sprintf('%s%d', write_columns(11, 2)));%AVE NP
    xlswrite(resfile, results.apr, 1, sprintf('%s%d', write_columns(11, 3)));%AVE PR
    xlswrite(resfile, results.apa, 1, sprintf('%s%d', write_columns(11, 4)));%AVE PA
    xlswrite(resfile, results.ada, 1, sprintf('%s%d', write_columns(11, 5)));%AVE DA
end