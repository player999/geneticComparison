function real = real_code(val, func)
    norma = @(x)((x - func.xlim(1))/(func.xlim(2) - func.xlim(1)));
    real = arrayfun(norma, val);
end