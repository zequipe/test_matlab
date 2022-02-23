function mex_time(language)

if strcmpi(language, 'Fortran')
    timestwo_src = 'timestwo.F';
else
    timestwo_src = 'timestwo.c';
end

tic;
mex('-setup', '-v', language);
fprintf('\n======> Time for setting MEX up: %f seconds\n\n', toc);

clear('timestwo');
tic;
mex(fullfile(matlabroot, 'extern', 'examples', 'refbook', timestwo_src));
fprintf('======> Time for mexifying timestwo: %f seconds\n', toc);

tic;
for i = 1 : 100
    timestwo(i);
end
fprintf('\n======> Time for 100 runs of timestwo: %f seconds\n', toc);
delete('timestwo.*');
