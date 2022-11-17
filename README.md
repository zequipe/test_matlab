## Introduction

This repository contains a set of tools for testing the behavior of MATLAB.

- [`crash`](https://github.com/equipez/test_matlab/blob/master/crash) illustrates a bug of
the **Linux** version of MATLAB concerning [`MEX`](https://www.mathworks.com/help/matlab/ref/mex.html).
[[README](https://github.com/equipez/test_matlab/blob/master/crash/README.md)]

- [`test_compiler`](https://github.com/zequipe/test_matlab/blob/master/.github/workflows/test_compiler.yml) tests which versions of `gfortran` are supported by MATLAB to mexify Fortran code; the result differs from the (initial) [official documentation of MathWorks](https://www.mathworks.com/support/requirements/supported-compilers.html); particularly, [MATLAB R2022a does not support `gfortran 8.x` as claimed](https://www.mathworks.com/matlabcentral/answers/1674509-bug-in-matlab-r2022a-mex-does-not-support-gfortran-8-x-as-specified-in-the-official-documentation).

- [`mex_time`](https://github.com/equipez/test_matlab/blob/master/mex_time) tests the
running time of MATLAB concerning `MEX`,
in particular on [GitHub Actions](https://github.com/equipez/test_matlab/actions/workflows/mex_time.yml).
[[README](https://github.com/equipez/test_matlab/blob/master/mex_time/README.md)]

## Discussions

- GitHub issue of [`matlab-actions/setup-matlab`](https://github.com/matlab-actions/setup-matlab):
[MATLAB R2022a: MEX does not support the Fortran compilers specified in the official documentation](https://github.com/matlab-actions/setup-matlab/issues/33)

- StackOverflow: [Does MATLAB R2022a support gfortran 8.x on Linux (as specified by the documentation)?](https://stackoverflow.com/questions/71552747/does-matlab-r2022a-support-gfortran-8-x-on-linux-as-specified-by-the-documentat)

- MATLAB Answer: [MATLAB R2022a: MEX does not support the Fortran compilers on Linux as specified in the official documentation](https://www.mathworks.com/matlabcentral/answers/1674509-matlab-r2022a-mex-does-not-support-the-fortran-compilers-on-linux-as-specified-in-the-official-docu)

- GitHub issue of [`matlab-actions/setup-matlab`](https://github.com/matlab-actions/setup-matlab):
[MEX is much slower on macOS than on Linux](https://github.com/matlab-actions/setup-matlab/issues/30)

- StackOverflow: [Is MEX of MATLAB known to be slow on macOS?](https://stackoverflow.com/questions/71274732/is-mex-of-matlab-known-to-be-slow-on-macos)

- MATLAB Answers: [Is MEX known to be slow on macOS?](https://www.mathworks.com/matlabcentral/answers/1658820-is-mex-known-to-be-slow-on-macos?)

- GitHub issue of [`matlab-actions/setup-matlab`](https://github.com/matlab-actions/setup-matlab):
[MATLAB crashes when mexifying the official `timestwo.F`](https://github.com/matlab-actions/overview/issues/7)

- MATLAB Answers: [Bug: MATLAB crashes when mexifying the official `timestwo.c`](https://www.mathworks.com/matlabcentral/answers/1651930-bug-matlab-crashes-when-mexifying-the-official-timestwo-c)


## Contact

Feel free to contact me if have suggestions or questions.
See my [homepage](https://www.zhangzk.net) for contact information.
