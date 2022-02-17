## Introduction

This is a set of tools for testing the behavior of MATLAB.

## Usage

```matlab
crash
```

The above execution crashes MATLAB under Linux, which is confirmed on the following versions.

- R2018b Update 3 (9.5.0.1049112) 64-bit (glnxa64)
- R2019b Update 5 (9.7.0.1319299) 64-bit (glnxa64)
- R2020a (9.8.0.1323502) 64-bit (glnxa64)
- R2021a Update 5 (9.10.0.1739362) 64-bit (glnxa64),
- R2021b Update 1 (9.11.0.1809720) (glnxa64)

To reproduce the crash, your MATLAB has to have `MEX` configured for `Fortran`. On Linux,
normally you only need to install `gfortran` and then run `mex('-setup', 'FORTRAN')` in MATLAB.

## Contact

Feel free to contact me if have suggestions or questions.
See my [homepage](https://www.zhangzk.net) for contact information.
