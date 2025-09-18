function profile()

    olddir = pwd();
    cd(tempdir);
    fprintf('\nCurrent directory: %s\n', pwd());

    func = @(x) fun(x, 0);

    addpath(fullfile(fileparts(mfilename('fullpath')), 'try_parfor'));
    try_parfor(func);

    cd(olddir);
    fprintf('\nCurrent directory: %s\n', pwd());

    fprintf('\nSuccess!\n');

end


function y = fun(x, z)
    y = x + z;
end
