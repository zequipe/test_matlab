function try_parfor(func)

    fprintf('\nEntering try_parfor\n');
    fprintf('\nCurrent directory: %s\n', pwd());

    parfor i = 1:2
        fprintf("\n%d\n", feval(func, i));
    end

    fprintf('\nExiting try_parfor\n');

end
