function write_single_result(result)
    line = sprintf('%f %f %f %f %f\n', result.apr, result.apf, result.apa, result.ada, result.anfe);
    f = fopen('res.txt', 'w');
    fwrite(f, line);
    fclose(f);
end