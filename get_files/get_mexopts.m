function succ = get_mexopts(directory)
%Get the mexopts the current MATLAB and save it to `directory`.

% "directory" can be given by a full path or a path relative to the
% current directory. The following lines get its full path.
if nargin < 1
    directory = pwd();  % When "directory" is not given, we default it to the current directory
end
origdir = pwd();
cd(directory);
directory = pwd();  % Full path of the given directory, which is the current directory now.
cd(origdir);

% Copy `mexopts` to `directory`.
fileattrib(directory, '+w')
copyfile(fullfile(matlabroot(), 'bin', computer('arch'), 'mexopts'), directory);

% Add time stamp.
time = datestr(datetime(), 'HH.MM.SS, yyyy-mm-dd');
matv = [version, ', ', computer];
stamp = fullfile(directory, 'stamp.txt');
fid = fopen(stamp, 'w');  % Open/create file for writing. Discard existing contents.
if fid == -1
    error('Cannot open file %s', stamp);
end
fprintf(fid, [time, '\n', matv]);
fclose(fid);
succ = true;

return
