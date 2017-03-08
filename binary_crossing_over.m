function [y1, y2] = binary_crossing_over(x1, x2)
    num = numel(x1);
    point = randi([1, num-1]);
    y1 = cat(2, x1(1:point), x2(point + 1:end));
    y2 = cat(2, x2(1:point), x1(point + 1:end));
end