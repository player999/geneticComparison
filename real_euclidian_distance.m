function d = real_euclidian_distance(p1, p2)
    summa = 0;
    for i=1:numel(p1)
        summa = summa + (p1(i) - p2(i))^2;
    end
    d = sqrt(summa);
end