function rval = real_decode(val, func)
    denorma = @(x)(x * (func.xlim(2) - func.xlim(1)) + func.xlim(1));
    rval = arrayfun(denorma, val);
end