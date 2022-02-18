function crash(crash_type, crash_indicator, language)
%CRASH is a script to crash MATLAB provided that MEX is configured for `language` and
% `crash_indicator` is absent or set to true. There are two types of crashes:
% 1. if crash_type == 'setup', then `mex('-setup', language)` crashes;
% 2. if crash_type == 'mex', then `mex(timestwo_src, '-outdir', build_dir)` crashes.


% Parse the input.
if nargin < 1 || ~(isa(crash_type, 'char') || isa(crash_type, 'str'))
    crash_type = 'setup';
end

cind = (nargin < 2 || crash_indicator);

if nargin < 3 || ~(isa(language, 'char') || isa(language, 'str'))
    language = 'C';
end


% Locate the official example for MEX provided by MathWorks.
if strcmpi(language, 'Fortran')
    timestwo_src_name = 'timestwo.F';
elseif strcmpi(language, 'C') || strcmpi(language, 'C++')
    timestwo_src_name = 'timestwo.c';
else
    error('Unknown language: %s', language);
end

official_timestwo_src = fullfile(matlabroot, 'extern', 'examples', 'refbook', timestwo_src_name);


% Directories.

% The test directory.
test_dir = pwd();

% The source directory.
src_dir = fullfile(test_dir, 'src');
if exist(src_dir, 'dir')
    rmdir(src_dir, 's');
elseif exist(src_dir, 'file')
    delete(src_dir);
end

% The build directory.
build_dir = fullfile(test_dir, 'build');
if exist(build_dir, 'dir')
    rmdir(build_dir, 's');
elseif exist(build_dir, 'file')
    delete(build_dir);
end


% Conduct the tests.
for itest = 1 : 2
    fprintf('\n************************* Test %d starts. *************************\n', itest);

    mkdir(src_dir);

    fprintf('\nCopy the official `%s` to the source directory ... ', timestwo_src_name);
    timestwo_src = fullfile(src_dir, timestwo_src_name);
    copyfile(official_timestwo_src, timestwo_src, 'f');
    fileattrib(timestwo_src, '+w');
    fprintf('Done.\n');

    if cind
        % Create in the source directory a file with the same name as the mexified `timestwo`.
        fake_mex_file_name = ['timestwo.', mexext];
        fake_mex_file = fullfile(src_dir, fake_mex_file_name);
        fprintf('\nCreate a fake %s file in the source directory ... ', fake_mex_file_name);
        fclose(fopen(fake_mex_file, 'w'));
        fprintf('Done.\n');
    end

    compile(src_dir, build_dir, timestwo_src_name, crash_type);

    fprintf('\nWhich `timestwo`?\n');
    which('timestwo')

    fprintf('\nEvaluate `timestwo(1)` ... ');
    timestwo(1)

    fprintf('************************** Test %d ends. **************************\n\n', itest);
end


return



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function compile(src_dir, build_dir, timestwo_src_name, crash_type)
%COMPILE is a script that copies the source files from src_dir to build_dir and then compile them.


% Decide the language being tested.
if endsWith(timestwo_src_name, 'F')
    language = 'Fortran';
elseif endsWith(timestwo_src_name, 'c')
    language = 'C';
else
    error('Unknown source file name %s', timestwo_src_name)
end


% Copy the source files and set up MEX. The order decides what kind of crash will occur.
switch crash_type

case 'setup' % First copy the source files from `src_dir` to `build_dir`, and then set up MEX.

    fprintf('\nCopy the source directory to the build directory ... ');
    copy_src(src_dir, build_dir);
    fprintf('Done.\n');

    fprintf('\nConfigure MEX for compiling %s ...\n', language);
    mex('-setup', language);
    fprintf('Done.\n');

case 'mex'  % First set up MEX, and then copy the source files from `src_dir` to `build_dir`.

    fprintf('\nConfigure MEX for compiling %s ...\n', language);
    mex('-setup', language);
    fprintf('Done.\n');

    fprintf('\nCopy the source directory to the build directory ... ');
    copy_src(src_dir, build_dir);
    fprintf('Done.\n');

otherwise

    error('Unknown crash type %s', crash_type);

end


% Compilation.
fprintf('\nCompile `%s` ... \n', timestwo_src_name);
timestwo_src = fullfile(build_dir, timestwo_src_name);
mex(timestwo_src, '-outdir', build_dir);
addpath(build_dir);
fprintf('Done.\n');


return



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function copy_src(src_dir, build_dir)

%restoredefaultpath; % `restoredefaultpath` or `rmpath(build_dir)` alone can NOT fix the crash

%clear('timestwo');  % This line alone can fix the crash

%delete(fullfile(src_dir, ['timestwo.', mexext]));  % This line alone can fix the crash

%if exist(build_dir, 'dir'); delete(fullfile(build_dir, ['timestwo.', mexext])); end  % This line alone can fix the crash

copyfile(src_dir, build_dir, 'f');

%clear('timestwo')  % This line alone can NOT fix the crash

delete(fullfile(src_dir, ['timestwo.', mexext]));  % This line alone can NOT fix the crash

%delete(fullfile(build_dir, ['timestwo.', mexext]));  % This line alone can NOT fix the crash

return
