## Introduction

This repository contains a set of scripts that test the behavior of MATLAB, sometimes illustrate its bugs.

- [`test_parfor`](https://github.com/zequipe/test_matlab/tree/master/test_parfor) illustrates a bug
  of MATLAB R2023b+ concerning `parfor` [[README](https://https://github.com/zequipe/test_matlab/blob/master/test_parfor/README.md)].

- [`segfault_2025a`](https://github.com/zequipe/test_matlab/tree/master/segfault_2025a) illustrates
  a bug in MATLAB R2025a MEX when handling internal subroutines in Fortran. [[README](https://github.com/zequipe/test_matlab/blob/master/segfault_2025a/README.md)]

- [`crash`](https://github.com/equipez/test_matlab/blob/master/crash) illustrates a bug of
the **Linux** version of MATLAB (up to R2023b) concerning [`MEX`](https://www.mathworks.com/help/matlab/ref/mex.html).
[[README](https://github.com/equipez/test_matlab/blob/master/crash/README.md)]

- [`test_compiler`](https://github.com/zequipe/test_matlab/blob/master/.github/workflows/test_compiler.yml) tests which versions of `gfortran` are supported by MATLAB to mexify Fortran code; the result differs from the (initial) [official documentation of MathWorks](https://www.mathworks.com/support/requirements/supported-compilers.html); particularly, [MATLAB R2022a does not support `gfortran 8.x` as claimed](https://www.mathworks.com/matlabcentral/answers/1674509-bug-in-matlab-r2022a-mex-does-not-support-gfortran-8-x-as-specified-in-the-official-documentation).

- [`test_copyfile`](https://github.com/zequipe/test_matlab/blob/master/copyfile/test_copyfile.m)
  illustrates a bug of MATLAB (up to R2023b) concerning `copyfile` on Linux and macOS.

- [`test_mac`](https://github.com/zequipe/test_matlab/tree/master/test_mac) shows that the MEX of MATLAB R2023b (update 6 as of February 15, 2024) does not work with Xcode 15 and Intel oneAPI 2023. This differs from the [official documentation](https://www.mathworks.com/support/requirements/supported-compilers-mac.html).

- [`mex_time`](https://github.com/equipez/test_matlab/blob/master/mex_time) tests the
running time of MATLAB concerning `MEX`,
in particular on [GitHub Actions](https://github.com/equipez/test_matlab/actions/workflows/mex_time.yml).
[[README](https://github.com/equipez/test_matlab/blob/master/mex_time/README.md)]

## Discussions

- StackOverflow: [Does MEX of MATLAB R2023b (update 6) on macOS-13 work with Xcode 15.0 and Intel oneAPI 2023?](https://stackoverflow.com/questions/77998520/does-mex-of-matlab-r2023b-update-6-work-with-xcode-15-0-and-intel-oneapi-2023)

- MATLAB Answer: [Does MEX of MATLAB R2023b (update 6) on macOS-13 work with Xcode 15.0 and Intel oneAPI 2023?](https://www.mathworks.com/matlabcentral/answers/2082233-does-mex-of-matlab-r2023b-update-6-on-macos-13-work-with-xcode-15-0-and-intel-oneapi-2023)

- GitHub issue of [`matlab-actions/setup-matlab`](https://github.com/matlab-actions/setup-matlab):
[MEX of MATLAB R2023b provided by setup-matlab@v2 does not work with Xcode 15.0 and Intel oneAPI 2023](https://github.com/matlab-actions/setup-matlab/issues/96)

- StackOverflow: [Strange behavior of `copyfile` regarding symlinks on Linux and macOS](https://stackoverflow.com/questions/77340268/strange-behavior-of-copyfile-regarding-symlinks-on-linux-and-macos)

- MATLAB Answer: [Strange behavior of `copyfile` regarding symlinks on Linux and macOS](https://www.mathworks.com/matlabcentral/answers/2036891-strange-behavior-of-copyfile-regarding-symlinks-on-linux-and-macos?s_tid=srchtitle)

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

- StackOverflow: [Bug of MATLAB 2025a: segfaults on Ubuntu when handling Fortran MEX files with internal subroutines](https://stackoverflow.com/questions/79699706/bug-of-matlab-2025a-segfaults-on-ubuntu-when-handling-fortran-mex-files-with-in)

- MATLAB Answers: [Bug: MATLAB 2025a segfaults on Ubuntu when handling Fortran MEX files with internal subroutines](https://www.mathworks.com/matlabcentral/answers/2178414-bug-matlab-2025a-segfaults-on-ubuntu-when-handling-fortran-mex-files-with-internal-subroutines)


## Contact

Feel free to contact me if have suggestions or questions.
See my [homepage](https://www.zhangzk.net) for contact information.
