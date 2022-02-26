## Introduction

[`mex_time.m`](https://github.com/equipez/test_matlab/blob/master/mex_time/mex_time.m) tests the
running time of MATLAB concerning `MEX`, in particular on GitHub Actions. See the action
"[Test running time concerning MEX](https://github.com/equipez/test_matlab/actions/workflows/mex_time.yml)" for the results.

Here is the data obtained by the [action on 26 February 2022](https://github.com/equipez/test_matlab/actions/runs/1902217520).
```
System: GNU/Linux | Language: C | MATLAB: 2021b | Time: 2022.02.26 05:46:36
MEX configured to use 'gcc' for C language compilation.
- Time for setting MEX up: 0.477950 seconds
- Time for mexifying timestwo: 4.500026 seconds
- Time for 100 runs of timestwo: 0.003845 seconds

System: Windows | Language: C | MATLAB: 2021b | Time: 2022.02.26 05:47:56
MEX configured to use 'Microsoft Visual C++ 2019 (C)' for C language compilation.
- Time for setting MEX up: 2.518557 seconds
- Time for mexifying timestwo: 4.416958 seconds
- Time for 100 runs of timestwo: 0.004215 seconds

System: macOS | Language: C | MATLAB: 2021b | Time: 2022.02.26 05:49:01
MEX configured to use 'Xcode with Clang' for C language compilation.
- Time for setting MEX up: 17.602277 seconds
- Time for mexifying timestwo: 5.979585 seconds
- Time for 100 runs of timestwo: 0.130843 seconds


System: GNU/Linux | Language: Fortran | MATLAB: 2021b | Time: 2022.02.26 05:46:20
MEX configured to use 'gfortran' for FORTRAN language compilation.
- Time for setting MEX up: 0.835881 seconds
- Time for mexifying timestwo: 2.768746 seconds
- Time for 100 runs of timestwo: 0.003279 seconds

System: Windows | Language: Fortran | MATLAB: 2021b | Time: 2022.02.26 05:51:04
MEX configured to use 'Intel oneAPI 2021 for Fortran with Microsoft Visual Studio 2019' for FORTRAN language compilation.
- Time for setting MEX up: 1.660305 seconds
- Time for mexifying timestwo: 3.495534 seconds
- Time for 100 runs of timestwo: 0.003299 seconds

System: macOS | Language: Fortran | MATLAB: 2021b | Time: 2022.02.26 05:49:47
MEX configured to use 'Intel Fortran Composer XE' for FORTRAN language compilation.
- Time for setting MEX up: 248.263933 seconds
- Time for mexifying timestwo: 87.093711 seconds
- Time for 100 runs of timestwo: 0.078741 seconds
```

It turns out that MEX is much slower on macOS than on Linux: slow to set up, slow to mexify,
and the MEX function is slow to run. In particular, it is about 250 times slower to set up MEX for Fortran on macOS than on Linux.

However, note that the significant difference probably comes from the setup of MATLAB on GitHub Actions for Linux and for macOS.
It will likely disappear if we do the timing on local machines.

## Discussions
- GitHub issue of [`matlab-actions/setup-matlab`](https://github.com/matlab-actions/setup-matlab): [`MEX` is much slower on macOS than on Linux](https://github.com/matlab-actions/setup-matlab/issues/30).
- MATLAB Answers: [Is MEX known to be slow on macOS?
](https://www.mathworks.com/matlabcentral/answers/1658820-is-mex-known-to-be-slow-on-macos)
- StackOverflow: [Is MEX known to be slow on macOS?](https://stackoverflow.com/questions/71274732/is-mex-of-matlab-known-to-be-slow-on-macos)

## Contact

Feel free to contact me if have suggestions or questions.
See my [homepage](https://www.zhangzk.net) for contact information.
