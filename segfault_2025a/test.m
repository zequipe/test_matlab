function test()
%This function tests the mex function for the Fortran code 'optimize.F90'.

mex('-v', '-setup', 'fortran');
fprintf('**************************************************************************\n');
fprintf('>>>>>> Mex set up successfully.\n');

fprintf('**************************************************************************\n');
fprintf('>>>>>> MATLAB version is %s.\n', version('-release'));

compiler_configurations = mex.getCompilerConfigurations('fortran', 'selected');
gfortran_major_version = sscanf(compiler_configurations.Version, '%d');
fprintf('>>>>>> Using gfortran version %s; the major version is %d.\n', compiler_configurations.Version, gfortran_major_version);

gcc_version = getMexLibgcc().latestGccVersion;  % Latest gcc version string embedded in libgcc
gcc_major_version = sscanf(gcc_version, '%d');
fprintf('>>>>>> The latest gcc version embedded in libgcc is %s; the major version is %d.\n', gcc_version, gcc_major_version);

% The version number of R2025a is 25.1.
support_internal_procedures = (verLessThan('matlab', '25.1')  || ~verLessThan('matlab', '25.2') || ...
    (gfortran_major_version >= 14 && gcc_major_version >= 14));
if support_internal_procedures
    fprintf('>>>>>> The test should succeed.\n');
else
    fprintf('>>>>>> The test should fail with a segfault.\n');
end
fprintf('**************************************************************************\n');

if gfortran_major_version >= 14 && gcc_major_version >= 14
    mex('-v',  '-g', 'FFLAGS="$FFLAGS -ftrampoline-impl=heap"', 'optimize.F90');
else
    mex('-v',  '-g', 'optimize.F90');
end
fprintf('**************************************************************************\n');
fprintf('>>>>>> Compilation completed successfully.\n');

optimize();

fprintf('**************************************************************************\n');
fprintf('>>>>>> Test completed successfully.\n');
fprintf('**************************************************************************\n');

end
