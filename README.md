## Introduction

[`crash.m`](https://github.com/zaikunzhang/test_matlab/blob/master/crash.m) illustrates a bug of
MATLAB concerning [`MEX`](https://www.mathworks.com/help/matlab/ref/mex.html).

## How to crash MATLAB?

Run the following commands in the MATLAB command line under the directory containing `crash.m`.

```matlab
crash('setup');  % crash during `mex('-setup', 'C')`; running `crash` has the same effect
crash('mex');  % crash during `mex(timestwo_src, '-outdir', build_dir)`
```

The above execution crashes MATLAB under Linux, which is confirmed on the following versions.

- R2018b Update 3 (9.5.0.1049112) 64-bit (glnxa64)
- R2019b Update 5 (9.7.0.1319299) 64-bit (glnxa64)
- R2020a (9.8.0.1323502) 64-bit (glnxa64)
- R2021a Update 5 (9.10.0.1739362) 64-bit (glnxa64),
- R2021b Update 1 (9.11.0.1809720) (glnxa64)

If you want to see how the crash looks like, check the
GitHub Action [`Crash MATLAB`](https://github.com/zaikunzhang/test_matlab/actions) of this repo.

To reproduce the crash on your own machine, your MATLAB has to have `MEX` configured for compiling `C`.
On Linux, normally you only need to install `gcc` and then run `mex('-setup', 'C')` in MATLAB.

According to limited tests, the bug does not affect the macOS version of MATLAB. Windows has not
been tested.


## How to fix the problem?

Before MathWorks fixes the bug, the crash can be avoided according to the comments in the function
[`copy_src`](https://github.com/zaikunzhang/test_matlab/blob/e8b16e11624e44f2c7702453994a0d322c6b208b/crash.m#L155)
in `crash.m`.


## Contact

Feel free to contact me if have suggestions or questions.
See my [homepage](https://www.zhangzk.net) for contact information.
