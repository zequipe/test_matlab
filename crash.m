function crash(crash_indicator)

cind = ((nargin < 1) || crash_indicator);

% The official example for Fortran MEX provided by MathWorks.
official_timestwo_src = fullfile(matlabroot, 'extern', 'examples', 'refbook', 'timestwo.F');

% Directories.
test_dir = pwd();
src_dir = fullfile(test_dir, 'src');
build_dir = fullfile(test_dir, 'build');

fprintf('\nCopy the official `timestwo.F` to the source directory ... ');
copyfile(official_timestwo_src, src_dir);
fprintf('Done.\n')

fprintf('\nConfigure MEX for compiling Fortran ...\n');
mex('-setup', 'FORTRAN');
fprintf('Done.\n')

for itest = 1 : 2

    fprintf('\n**************** Test %d starts. ****************\n', itest);

    compile(src_dir, build_dir, cind);

    fprintf('\nWhich `timestwo`?\n');
    which('timestwo')

    fprintf('\nEvaluate `timestwo(1)` ... ');
    timestwo(1)

    fprintf('***************** Test %d ends. *****************\n\n', itest);
end

return


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function compile(src_dir, build_dir, cind)

fprintf('\nCopy the source directory to the build directory ... ');
copyfile(src_dir, build_dir);
fprintf('Done.\n');

if cind
    fprintf('\nChange directory to the build directory ... ');
    cd(build_dir);
    fprintf('Done.\n');
end

fprintf('\nCompile `timestwo.F` ... \n');
timestwo_src = fullfile(build_dir, 'timestwo.F');
mex(timestwo_src);
addpath(build_dir);
fprintf('Done.\n');

return
