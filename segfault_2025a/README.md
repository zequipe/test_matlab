This is a bug in MATLAB R2025a MEX when handling internal subroutines in Fortran.

In brief, if the Fortran MEX file contains an internal subroutine used as an actual argument to another subroutine, then MATLAB R2025a encounters a segfault under **Ubuntu** 24.04. Previous versions of MATLAB work without a problem (I have tested R2024a and R2024b). Windows and macOS have not been tested.

To reproduce the issue, download the files in this folder, and run the test by executing the following in the MATLAB command window:

```matlab
>> test
```

If your MATLAB is R2025a, you will see a segmentation fault. If you are using an earlier version,
the test should complete without errors.

See https://github.com/zequipe/test_matlab/actions/runs/16096537922 for a GitHub Actions run that
reproduces the issue.
