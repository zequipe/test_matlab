## Introduction

[`mex_time.m`](https://github.com/equipez/test_matlab/blob/master/mex_time/mex_time.m) tests the
running time of MATLAB concerning `MEX`, in particular on GitHub Actions. See the action
"[Test running time concerning MEX](https://github.com/equipez/test_matlab/actions/workflows/mex_time.yml)" for the results.

Here is the data obtained by the [action on 23 February 2022](https://github.com/equipez/test_matlab/actions/runs/1885237017).
```
System: GNU/Linux	Language: C	Time: 2022.02.26 05:13:57
MEX configured to use 'gcc' for C language compilation.
- Time for setting MEX up: 0.458058 seconds
- Time for mexifying timestwo: 4.414136 seconds
- Time for 100 runs of timestwo: 0.003987 seconds

System: macOS	Language: C	Time: 2022.02.26 05:17:11
MEX configured to use 'Xcode with Clang' for C language compilation.
- Time for setting MEX up: 19.451248 seconds
- Time for mexifying timestwo: 6.071816 seconds
- Time for 100 runs of timestwo: 0.121092 seconds

System: Windows	Language: C	Time: 2022.02.26 05:15:26
MEX configured to use 'Microsoft Visual C++ 2019 (C)' for C language compilation.
- Time for setting MEX up: 2.682795 seconds
- Time for mexifying timestwo: 7.153244 seconds
- Time for 100 runs of timestwo: 0.003125 seconds


System: GNU/Linux	Language: Fortran	Time: 2022.02.26 05:14:06
MEX configured to use 'gfortran' for FORTRAN language compilation.
- Time for setting MEX up: 0.784235 seconds
- Time for mexifying timestwo: 3.438739 seconds
- Time for 100 runs of timestwo: 0.002906 seconds

System: macOS	Language: Fortran	Time: 2022.02.26 05:17:17
MEX configured to use 'Intel Fortran Composer XE' for FORTRAN language compilation.
- Time for setting MEX up: 229.320783 seconds
- Time for mexifying timestwo: 78.282772 seconds
- Time for 100 runs of timestwo: 0.080919 seconds
```

It turns out that MEX is much slower on macOS than on Linux: slow to set up, slow to mexify,
and the MEX function is slow to run. In particular, it is about 250 times slower to set up MEX for Fortran on macOS than on Linux.

However, note that the significant difference probably comes from the setup of MATLAB on GitHub Actions for Linux and for macOS.
It will likely disappear if we do the timing on local machines. See the discussions in the GitHub issue
"[`MEX` is much slower on macOS than on Linux](https://github.com/matlab-actions/setup-matlab/issues/30)".


## Contact

Feel free to contact me if have suggestions or questions.
See my [homepage](https://www.zhangzk.net) for contact information.
