function result = binary_mutation(element, rate)
    cnt = numel(element);
    nmu = ceil(cnt * rate);
    j = randsample(cnt, nmu);
    result = element;
    result(j) = 1 - element(j);
end