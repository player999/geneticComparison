function f = create_test_function(fname)
    if strcmp(fname, 'F15') == 1
        f = struct('func', @create_function_15, 'xlim', [0,1], 'peaks', @peaks15);
    end
    if strcmp(fname, 'F16') == 1
        f = struct('func', @create_function_16, 'xlim', [0,1], 'peaks', @peaks15);
    end
    if strcmp(fname, 'F18') == 1
        f = struct('func', @create_function_18, 'xlim', [0,1], 'peaks', @peaks18);
    end
    if strcmp(fname, 'F19') == 1
        f = struct('func', @create_function_19, 'xlim', [0,1], 'peaks', @peaks18);
    end
    if strcmp(fname, 'F20min') == 1
        f = struct('func', @create_function_20min, 'xlim', [-5.12,5.12], 'peaks', @peaks20min);
    end
    if strcmp(fname, 'F20max') == 1
        f = struct('func', @create_function_20max, 'xlim', [-5.12,5.12], 'peaks', @peaks20max);
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

function rval = create_function_18(args)
    rval = 0;
    for i = 1:numel(args)
       rval = rval + sin(5 * pi * (args(i)^0.75 - 0.05))^6;
    end
    rval = rval / numel(args);
end

function rval = create_function_19(args)
    rval = 0;
    for i = 1:numel(args)
       rval = rval + exp(-2 * log(2)*((args(i)-0.08)/0.854)^2) * sin(5 * pi * (args(i)^0.75 - 0.05))^6;
    end
    rval = rval / numel(args);
end

function rval = create_function_20min(args)
    rval = 10 * numel(args);
    for i = 1:numel(args)
       rval = rval + args(i)^2 - 10 * cos(2 * pi * args(i));
    end
    rval = rval / numel(args);
end

function rval = create_function_20max(args)
    rval = -10 * numel(args);
    for i = 1:numel(args)
       rval = rval - args(i)^2 + 10 * cos(2 * pi * args(i));
    end
    rval = rval / numel(args);
end

function rval = peaks15(nargs)
    vectors = {};
    for i=1:nargs
       vectors{i} = [0.1:0.2:0.9];
    end
    rval = combvec(vectors{:})';
end

function rval = peaks18(nargs)
    vectors = {};
    for i=1:nargs
       vectors{i} = arrayfun(@(x)(x^(4/3)), [0.15:0.2:0.95]);
    end
    rval = combvec(vectors{:})';
end

function rval = peaks20min(nargs)
    vectors = {};
    for i=1:nargs
       vectors{i} = [-4.52299 -3.51786 -2.51274 -1.50764 -0.502546 0.502546 1.50764 2.51274 3.51786 4.52299];
    end
    rval = combvec(vectors{:})';
end

function rval = peaks20max(nargs)
    vectors = {};
    for i=1:nargs
       vectors{i} = [-3.97978 -2.98486 -1.98991 -0.994959 0 0.994959 1.98991 2.98486 3.97978];
    end
    rval = combvec(vectors{:})';
end