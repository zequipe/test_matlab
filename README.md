## Introduction

This repository contains a set of tools for testing the behavior of MATLAB.

- [`crash`](https://github.com/equipez/test_matlab/blob/master/crash) illustrates a bug of
the **Linux** version of MATLAB concerning [`MEX`](https://www.mathworks.com/help/matlab/ref/mex.html).
[[README](https://github.com/equipez/test_matlab/blob/master/crash/README.md)]

- [`mex_time`](https://github.com/equipez/test_matlab/blob/master/mex_time) tests the
running time of MATLAB concerning `MEX`,
in particular on [GitHub Actions](https://github.com/equipez/test_matlab/actions/workflows/mex_time.yml).
[[README](https://github.com/equipez/test_matlab/blob/master/mex_time/README.md)]

## Discussions

- GitHub issue of [`matlab-actions/setup-matlab`](https://github.com/matlab-actions/setup-matlab):
[MATLAB R2022a: MEX does not support the Fortran compilers specified in the official documentation](https://github.com/matlab-actions/setup-matlab/issues/33)

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
