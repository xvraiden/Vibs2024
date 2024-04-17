function [val, index] = closest_value_ndx(vector, value)
    [val, index] = min(abs(vector-value));
end