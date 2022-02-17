function crash(crash_indicator)

cind = ((nargin < 1) || crash_indicator);

% The official example for Fortran MEX provided by MathWorks.
official_timestwo_src = fullfile(matlabroot, 'extern', 'examples', 'refbook', 'timestwo.F');

% Directories.
test_dir = pwd();
src_dir = fullfile(test_dir, 'src');
build_dir = fullfile(test_dir, 'build');
if ~exist(src_dir, 'dir')
    mkdir(src_dir);
end

fake_mex_file_name = ['timestwo.', mexext];
fake_mex_file = fullfile(src_dir, fake_mex_file_name);
fprintf('\nCreate a fake %s file in the source directory ... ', fake_mex_file_name);
fclose(fopen(fake_mex_file, 'w'));
fprintf('Done.\n')

fprintf('\nCopy the official `timestwo.F` to the source directory ... ');
timestwo_src = fullfile(src_dir, 'timestwo.F');
copyfile(official_timestwo_src, timestwo_src);
fileattrib(timestwo_src, '+w')
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
mex(timestwo_src, '-outdir', build_dir);
addpath(build_dir);
fprintf('Done.\n');

return
