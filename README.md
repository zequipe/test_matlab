## Introduction

This is a set of tools for testing the behavior of MATLAB.

## Usage

```matlab
crash  % Run this command in the MATLAB command line under the directory containing crash.m
```

The above execution crashes MATLAB under Linux, which is confirmed on the following versions.

- R2018b Update 3 (9.5.0.1049112) 64-bit (glnxa64)
- R2019b Update 5 (9.7.0.1319299) 64-bit (glnxa64)
- R2020a (9.8.0.1323502) 64-bit (glnxa64)
- R2021a Update 5 (9.10.0.1739362) 64-bit (glnxa64),
- R2021b Update 1 (9.11.0.1809720) (glnxa64)

If you want to see how the crash looks like, check the
GitHub Action [`Crash MATLAB`](https://github.com/zaikunzhang/test_matlab/actions) of this repo.

To reproduce the crash on your own machine, your MATLAB has to have `MEX` configured for `Fortran`. On Linux,
normally you only need to install `gfortran` and then run `mex('-setup', 'FORTRAN')` in MATLAB.

According to limited tests, the bug does not affect the macOS version of MATLAB. Windows has not
been tested.

## Contact

Feel free to contact me if have suggestions or questions.
See my [homepage](https://www.zhangzk.net) for contact information.
