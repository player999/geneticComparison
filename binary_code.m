function a = binary_code(vals, func)
    % Normalize
    k = 1000;
    vals = vals .* k; % Fixed point, 3 digits
    numdigs = ceil(log2(k * (func.xlim(2) - func.xlim(1))));
    norma = @(x)(round((x - func.xlim(1) * k) / (k * (func.xlim(2) - func.xlim(1))) * (2 ^ numdigs - 1)));
    normalized = arrayfun(norma, vals);
    bins = zeros(numel(vals), numdigs);
    for i = 1:numel(vals)
        bins(i, :) = bin2gray(int2bin(normalized(i), numdigs));
    end
    retval = [];
    for i=1:numel(vals)
       retval = cat(2, retval, bins(i, :));
    end
    a = retval;
end

function binval = int2bin(val, bits)
    binval = zeros(1, bits);
    for i = 1:bits
       binval(bits - i + 1) = bitget(val, i);
    end
    binval = uint8(binval);
end

function grayval = bin2gray(val)
    grayval = zeros(1, numel(val));
    grayval(1) = bitxor(val(1), 0);
    for i = 2:numel(val)
        grayval(i) =  bitxor(val(i), val(i - 1));
    end
    grayval = uint8(grayval);
end