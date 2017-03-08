function val = binary_generate_pop(count, args, func)
    rval = rand(count, args);
    rval = (rval - func.xlim(1)) ./ (func.xlim(2) - func.xlim(1));
    val = [];
    for i=1:count
       val = cat(1, val, binary_code(rval(i, :), func)); 
    end
end

