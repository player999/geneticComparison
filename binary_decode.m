function a = binary_decode(gr, func)
    k = 1000;
    numdigs = ceil(log2(k * (func.xlim(2) - func.xlim(1))));
    valcount = numel(gr) / numdigs;
    a = zeros(1, valcount);
    for i=1:valcount
        from = (i - 1) * numdigs + 1;
        to = i * numdigs;
        a(i) = bin2dec(gray2bin(gr(from:to)));
        a(i) =  func.xlim(1) * k + k * a(i) * (func.xlim(2) - func.xlim(1)) / (2 ^ numdigs - 1);
        a(i) = a(i) / k;
    end
end

function bin = gray2bin(gray)
    bin = zeros(1, numel(gray));
    count = numel(gray);
    bin(1) = gray(1);
    for i=2:count
        bin(i) = bitxor(bin(i - 1), gray(i));
    end
end

function dec = bin2dec(bin)
    dec = 0;
    cnt = numel(bin);
    for i = 0:cnt - 1
       dec = dec + bin(cnt - i) * (2 ^ i); 
    end
end