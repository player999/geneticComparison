function f = create_test_function(fname)
    if strcmp(fname, 'F15') == 1
        f = struct('func', @create_function_15, 'xlim', [0,1]);
    end
    if strcmp(fname, 'F16') == 1
        f = struct('func', @create_function_16, 'xlim', [0,1]);
    end
end

function rval = create_function_15(args)
    rval = 0;
    for i = 1:numel(args)
       rval = rval + sin(5 * pi * args(i)) ^ 6;
    end
    rval = rval / numel(args);
end

function rval = create_function_16(args)
    rval = 0;
    for i = 1:numel(args)
       rval = rval + exp(-2 * log(2) * ((args(i) - 0.1) / 0.8 )^2) * sin(5 * pi * args(i)) ^ 6;
    end
end