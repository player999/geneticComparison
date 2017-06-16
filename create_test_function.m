 %  Copyright (C) 2017
 %
 %  Author: Kateryna Nikishchikhina <kateryna.nikishchikhina@gmail.com>
 %
 %  This program is free software; you can redistribute it and/or
 %  modify it under the terms of the GNU General Public License as
 %  published by the Free Software Foundation, version 2 of the
 %  License.



function f = create_test_function(fname)
    if strcmp(fname, 'F15') == 1
        f = struct('func', @create_function_15, 'xlim', [0,1], 'peaks', @peaks15);
        f.gpeaks = @peaks15;
        f.lpeaks = @peaks_empty;
    end
    if strcmp(fname, 'F16') == 1
        f = struct('func', @create_function_16, 'xlim', [0,1], 'peaks', @peaks15);
        f.gpeaks = @gpeaks16;
        f.lpeaks = @lpeaks16;
    end
    if strcmp(fname, 'F18') == 1
        f = struct('func', @create_function_18, 'xlim', [0,1], 'peaks', @peaks18);
        f.gpeaks = @peaks18;
        f.lpeaks = @peaks_empty;
    end
    if strcmp(fname, 'F19') == 1
        f = struct('func', @create_function_19, 'xlim', [0,1], 'peaks', @peaks18);
        f.gpeaks = @gpeaks19;
        f.lpeaks = @lpeaks19;
    end
    if strcmp(fname, 'F20min') == 1
        f = struct('func', @create_function_20min, 'xlim', [-5.12,5.12], 'peaks', @peaks20min);
        f.lpeaks = @peaks20min;
    end
    if strcmp(fname, 'F20max') == 1
        f = struct('func', @create_function_20max, 'xlim', [-5.12,5.12], 'peaks', @gpeaks20max);
        f.gpeaks = @gpeaks20max;
    end
    if strcmp(fname, 'F22') == 1
        f = struct('func', @create_function_22, 'xlim', [-600,600], 'peaks', @peaks22);
        f.gpeaks = @peaks22;
    end
    if strcmp(fname, 'F23') == 1
        f = struct('func', @create_function_23, 'xlim', [-500,500], 'peaks', @peaks23);
        f.gpeaks = @peaks23;
    end
    if strcmp(fname, 'F24') == 1
        f = struct('func', @create_function_24, 'xlim', [-10,10], 'peaks', @peaks_empty);
        f.gpeaks = @peaks_empty;
    end
    if strcmp(fname, 'F25') == 1
        f = struct('func', @create_function_25, 'xlim', [-32.768,32.768], 'peaks', @peaks25);
        f.gpeaks = @peaks25;
    end
    if strcmp(fname, 'F30') == 1
        f = struct('func', @create_function_30, 'xlim', [-2*pi,2*pi], 'peaks', @peaks30);
        f.gpeaks = @peaks30;
    end
    if strcmp(fname, 'F31') == 1
        f = struct('func', @create_function_31, 'xlim', [-10,10], 'peaks', @peaks31);
        f.gpeaks = @peaks31;
    end
    if strcmp(fname, 'F38') == 1
        f = struct('func', @create_function_38, 'xlim', [-2,2], 'peaks', @peaks38);
        f.gpeaks = @gpeaks38;
        f.lpeaks = @lpeaks38;
    end
    if strcmp(fname, 'F46') == 1
        f = struct('func', @create_function_46, 'xlim', [-3,3], 'peaks', @peaks46);
        f.gpeaks = @gpeaks46;
        f.lpeaks = @lpeaks46;
    end
    if strcmp(fname, 'F54') == 1
        f = struct('func', @create_function_54, 'xlim', [-65,65], 'peaks', @peaks54);
        f.gpeaks = @gpeaks54;
        f.lpeaks = @lpeaks54;
    end
    if strcmp(fname, 'F57') == 1
        f = struct('func', @create_function_57, 'xlim', [-2,2], 'peaks', @gpeaks57);
        f.gpeaks = @gpeaks57;
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

function rval = create_function_22(args)
    rval = numel(args);
    mult = 1;
    for i = 1:numel(args)
       rval = rval - (args(i)^2)/4000;
       mult = mult * cos(args(i)/sqrt(i));
    end
    rval = rval + mult -1;
end

function rval = create_function_23(args)
    rval = 0;
    for i = 1:numel(args)
       rval = rval + args(i) * sin(sqrt(abs(args(i))));
    end
end

function rval = create_function_20max(args)
    rval = -10 * numel(args);
    for i = 1:numel(args)
       rval = rval - args(i)^2 + 10 * cos(2 * pi * args(i));
    end
    rval = rval / numel(args);
end

function rval = create_function_24(args)
    rval = 1;
    for i=1:numel(args)
       added = 0;
       for j=1:5
           added = added + j * cos((j+1)*args(i) + j);
       end
       rval = rval * added;
    end
    rval = -rval;
end

function rval = create_function_25(args)
    sum1 = 0;
    sum2 = 0;
    for i=1:numel(args)
        sum1 = sum1 + args(i) * args(i);
    end
    for i=1:numel(args)
        sum2 = sum2 + cos(2 * pi * args(i));
    end
    rval = 20 * exp(-0.2 * sqrt(1 / numel(args) * sum1)) + exp(1 / numel(args) * sum2) - 20 - exp(1);
end

function rval = create_function_30(args)
    val1 = 0;
    for i=1:numel(args)
        val1 = val1 + abs(args(i));
    end
    val2 = 0;
    for i=1:numel(args)
        val2 = val2 + sin(args(i)*args(i));
    end
    rval = -val1 * exp(-val2);
end

function rval = create_function_31(args)
    val1 = 0;
    for i=1:numel(args)
        val1 = val1 + abs(args(i));
    end
    val2 = 0;
    for i=1:numel(args)
        val2 = val2 + args(i)*args(i);
    end
    val2 = -val2;
    rval = val1 * exp(val2);
end

function rval = create_function_38(args)
    x1 = args(1);
    x2 = args(2);
    rval = -(1 + (1 + x1 + x2)^2 * (19 - 14 * x1 + 3*x1*x1 - 14 * x2 + 6 *x1 * x2 + 3 * x2 * x2)) * (30 + (2*x1 - 3*x2)^2 * (18 - 32 * x1 + 12 * x1 * x1 + 48 * x2 - 36 * x1 * x2 + 27 * x2 * x2));
end

function rval = create_function_46(args)
    x1 = args(1);
    x2 = args(2);
    rval = -((4-2.1*x1*x1 + (x1^4)/3)*x1*x1 + x1*x2 + 4 * (x2*x2 - 1) * (x2 * x2));
end

function rval = create_function_54(args)
    a = @(x)(16 * (mod(x, 5) - 2));
    b = @(x)(16 * (abs(x / 5) - 2));
    x1 = args(1);
    x2 = args(2);
    sum = 0;
    for i=1:24
       sum = sum + 1 / (1 + i + (x1 - a(i))^6 + (x2 - b(i))^6); 
    end
    rval = 500 - 1 / (0.002 + sum);
end

function rval = create_function_57(args)
    x1 = args(1);
    x2 = args(2);
    z = complex(x1, x2);
    zrval = 1 / (1 + abs(z^6 - 1));
    rval = abs(zrval);
end

function rval = peaks_empty(nargs)
    rval = [];
end

function rval = peaks15(nargs)
    vectors = {};
    for i=1:nargs
       vectors{i} = [0.1:0.2:0.9];
    end
    rval = combvec(vectors{:})';
end

function rval = gpeaks16(nargs)
    rval = [0.1];
    rval = repmat(rval, [1 nargs]);
end

function rval = lpeaks16(nargs)
     vectors = {};
    for i=1:nargs
       vectors{i} = [0.1:0.2:0.9];
    end
    rval = combvec(vectors{:})';
    rval(1,:) = [];
end

function rval = peaks18(nargs)
    vectors = {};
    for i=1:nargs
       vectors{i} = arrayfun(@(x)(x^(4/3)), [0.15:0.2:0.95]);
    end
    rval = combvec(vectors{:})';
end

function rval = gpeaks19(nargs)
    rval = [0.15^(4/3)];
    rval = repmat(rval, [1 nargs]);
end

function rval = lpeaks19(nargs)
    vectors = {};
    for i=1:nargs
       vectors{i} = arrayfun(@(x)(x^(4/3)), [0.15:0.2:0.95]);
    end
    rval = combvec(vectors{:})';
    rval(1, :) = [];
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

function rval = gpeaks20max(nargs)
    rval = [0];
    rval = repmat(rval, [1 nargs]);
end

function rval = lpeaks20max(nargs)
    vectors = {};
    for i=1:nargs
       vectors{i} = [0 -3.97978 -2.98486 -1.98991 -0.994959 0.994959 1.98991 2.98486 3.97978];
    end
    rval = combvec(vectors{:})';
    rval(1, :) = [];
end

function rval = peaks22(nargs)
    rval = zeros(1, nargs);
end

function rval = peaks23(nargs)
    rval = ones(1, nargs) * 420.9687;
end

function rval = peaks25(nargs)
    rval = zeros(1, nargs);
end

function rval = peaks30(nargs)
    rval = zeros(1, nargs);
end

function rval = peaks31(nargs)
    rval = [ 0.5  0.5;
             0.5 -0.5;
            -0.5  0.5;
            -0.5 -0.5];
end

function rval = peaks38(nargs)
    rval = [ 1.2  0.8;
             1.8  0.2;
            -0.6 -0.4;
             0   -1];
end

function rval = gpeaks38(nargs)
    rval = [0   -1];
end

function rval = lpeaks38(nargs)
    rval = [ 1.2  0.8;
             1.8  0.2;
            -0.6 -0.4];
end

function rval = peaks46(nargs)
    rval = [-0.0898,  0.7126;
             0.0898, -0.7126;
            -1.7036,  0.7961;
             1.7036, -0.7961;
            -1.6071, -0.5687;
             1.6071,  0.5687];
end

function rval = gpeaks46(nargs)
    rval = [-0.0898,  0.7126;
             0.0898, -0.7126];
end

function rval = lpeaks46(nargs)
    rval = [-1.7036,  0.7961;
             1.7036, -0.7961;
            -1.6071, -0.5687;
             1.6071,  0.5687];
end

function rval = peaks54(nargs)
    rval = [-32 -32;
            -32 -16;
            -32  0;
            -32  16;
            -32  32;
            -16 -32;
            -16 -16;
            -16  0;
            -16  16;
            -16  32;
             0  -32;
             0  -16;
             0   0;
             0   16;
             0   32;
            16  -32;
            16  -16;
            16   0;
            16   16;
            16   32;
            32  -32;
            32  -16;
            32   0;
            32   16;
            32   32];
end

function rval = gpeaks54(nargs)
    rval = [-32  32];
end

function rval = lpeaks54(nargs)
    rval = [-32 -32;
            -32 -16;
            -32  0;
            -32  16;
            -16 -32;
            -16 -16;
            -16  0;
            -16  16;
            -16  32;
             0  -32;
             0  -16;
             0   0;
             0   16;
             0   32;
            16  -32;
            16  -16;
            16   0;
            16   16;
            16   32;
            32  -32;
            32  -16;
            32   0;
            32   16;
            32   32];
end

function rval = gpeaks57(nargs)
    rval = [-1  0;
             1  0;
          -0.5  -sqrt(3)/2;
           0.5  -sqrt(3)/2;
          -0.5  sqrt(3)/2;
           0.5  sqrt(3)/2];
end