function append_log(results)
    f = fopen('testing.log', 'a+');
    line = sprintf('All peaks found: %f\n', results.apf);
    fwrite(f, line);
    line = sprintf('Average peak ratio: %f\n', results.apr);
    fwrite(f, line);
    line = sprintf('Average peak accuracy: %f\n', results.apa);
    fwrite(f, line);
    line = sprintf('Average distance accuracy: %f\n', results.ada);
    fwrite(f, line);
    line = sprintf('Average number of function evalualtions: %f\n', results.anfe);
    fwrite(f, line);
    for i = 1:numel(results.per_run)
        data = results.per_run{i};
        line = sprintf('\tRun %d: Function evaluations: %d\n', i, data.nfe);
        fwrite(f, line);
        line = sprintf('\tRun %d: Peak number: %d\n', i, data.pn);
        fwrite(f, line);
        line = sprintf('\tRun %d: Peak ratio: %f\n', i, data.pr);
        fwrite(f, line);
        line = sprintf('\tRun %d: Peak accuracy: %f\n', i, data.pa);
        fwrite(f, line);
        line = sprintf('\tRun %d: Distance accuracy: %f\n', i, data.da);
        fwrite(f, line);
    end
    line = sprintf('\n');
    fwrite(f, line);
    fclose(f);
end