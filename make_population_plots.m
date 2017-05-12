function make_population_plots(source_file_fmt, dst_dir, func)
    idx = 1;
    if exist(sprintf(source_file_fmt, 1), 'file')
        resfile = sprintf(source_file_fmt, 1);
        load(resfile, 'results');
        dims = size(results.per_run{1}.pop, 2);
    else
       return; 
    end
    fun = create_test_function(func);
    f = fun.func;
    if dims == 1
        xrange = fun.xlim(1):(fun.xlim(2) - fun.xlim(1))/1500:fun.xlim(2);
        yfunction = zeros(1, size(xrange,1));
        for i=1:size(xrange,1)
            yfunction(i) = f(xrange(i,:)); 
        end
    elseif dims == 2
        [xrange1,xrange2] = meshgrid(fun.xlim(1):(fun.xlim(2) - fun.xlim(1))/200:fun.xlim(2), fun.xlim(1):(fun.xlim(2) - fun.xlim(1))/200:fun.xlim(2));
        yfunction = zeros(size(xrange1,1), size(xrange2,1));
        funcplan = combvec(1:size(xrange1,1), 1:size(xrange2,1))';
        for i=1:size(funcplan,1)
            x1 = xrange1(funcplan(i,1), funcplan(i,2));
            x2 = xrange2(funcplan(i,1), funcplan(i,2));
            yfunction(funcplan(i,1), funcplan(i,2)) = f([x1 x2]); 
        end
    else
        return;
    end
  
    while exist(sprintf(source_file_fmt, idx), 'file')
        resfile = sprintf(source_file_fmt, idx);
        load(resfile, 'results');
        sp = strsplit(resfile, '/');
        figname = sp{end};
        figname = figname(1:end-4);
        for i = 1:numel(results.per_run)
           pop = results.per_run{i}.pop;
           seeds = match_peaks_new(pop, 0.01, 0.01, fun);
           yseeds = zeros(size(seeds, 1), 1);
           for j = 1:size(seeds, 1)
              yseeds(j) = f(seeds(j,:)); 
           end
           picture = figure('Name', figname, 'PaperType', '<custom>', 'PaperUnits', 'points', 'PaperSize', [1000 1000]);
           hold on;
           if dims == 1
               plot(xrange, yfunction);
               scatter(seeds, yseeds);
           else
               surf(xrange1, xrange2, yfunction);
               view(-40, 40);
               scatter3(seeds(:,1), seeds(:,2), yseeds, 'filled');
           end
           hold off;
           save_fn = sprintf([dst_dir '/' figname '_%d.png'], i);
           saveas(picture, save_fn);
           close(picture);
        end
        idx = idx + 1;
    end
end