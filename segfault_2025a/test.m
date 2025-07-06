function test()
%This function tests the mex function for the Fortran code 'optimize.F90'.

fprintf('MATLAB version is %s.\n', version('-release'));
if verLessThan('matlab', '25.1')  % The version number of R2025a is 25.1.
    fprintf('The test should succeed.\n');
else
    fprintf('The test should fail with a segfault.\n');
end
fprintf('**************************************************************************\n');

mex('-g', 'optimize.F90');
optimize();

fprintf('**************************************************************************\n');
fprintf('Test completed successfully.\n');

end
