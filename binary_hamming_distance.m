function d = binary_hamming_distance(x1, x2)
    d = sum(bitxor(x1, x2));
end