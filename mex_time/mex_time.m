function mex_time(language)

orig_warning_state = warning;
warning('off','all');

if nargin == 1 && (isa(language, 'char') || isa(language, 'string')) && strcmpi(language, 'Fortran')
    language = 'Fortran';
    timestwo_src = 'timestwo.F';
else
    language = 'C';
    timestwo_src = 'timestwo.c';
end

if ismac
    sys = 'macOS';
elseif isunix
    sys = 'GNU/Linux';
elseif ispc
    sys = 'Windows';
else
    error('Platform not supported.')
end

matlab_version = version('-release');
date_time = datestr(now,'yyyy.mm.dd HH:MM:SS');

fprintf('\nSystem: %s | Language: %s | MATLAB: %s | Time: %s\n\n', sys, language, matlab_version, date_time);

tic;
mex('-setup', language);
fprintf('\n- Time for setting MEX up: %f seconds\n\n', toc);

clear('timestwo');
tic;
mex(fullfile(matlabroot, 'extern', 'examples', 'refbook', timestwo_src));
fprintf('\n- Time for mexifying timestwo: %f seconds\n', toc);

tic;
for i = 1 : 100
    timestwo(i);
end
fprintf('\n- Time for 100 runs of timestwo: %f seconds\n\n', toc);
delete('timestwo.*');

warning(orig_warning_state);
