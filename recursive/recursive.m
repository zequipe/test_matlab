function recursive(depth)

mex evaluate.F

f = @(x) x;

for i = 1 : depth
    f = @(x) evaluate(f, x) + 1;
end

y = evaluate(f, 0.0)
