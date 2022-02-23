## Introduction

[`mex_time.m`](https://github.com/equipez/test_matlab/blob/master/mex_time/mex_time.m) tests the
running time of MATLAB concerning `MEX`, in particular on GitHub Actions. See the action "[Test running time concerning MEX]
(https://github.com/equipez/test_matlab/actions/workflows/mex_time.yml)" for the results.

Here is the data obtained by the [action on 23 February 2022](https://github.com/equipez/test_matlab/actions/runs/1885237017).
```
Linux, C:
Time for setting MEX up: 0.407079
Time for mexifying timestwo: 1.806865
Time for 100 runs of timestwo: 0.004839

macOS, C:
Time for setting MEX up: 19.406536
Time for mexifying timestwo: 8.069325
Time for 100 runs of timestwo: 0.180631

Linux, Fortran:
Time for setting MEX up: 0.943829
Time for mexifying timestwo: 2.649082
Time for 100 runs of timestwo: 0.004879

macOS, Fortran:
Time for setting MEX up: 228.225968
Time for mexifying timestwo: 83.066689
Time for 100 runs of timestwo: 0.109698
```

It turns out that MEX is much slower on macOS than on Linux: slow to set up, slow to mexify,
and the MEX function is slow to run. In particular, it is about 250 times slower to set up MEX for Fortran on macOS than on Linux.

However, note that the significant difference probably comes from the setup of MATLAB on GitHub Actions for Linux and for macOS.
It will likely disappear if we do the timing on local machines. See the discussions in the GitHub issue
"[`MEX` is much slower on macOS than on Linux](https://github.com/matlab-actions/setup-matlab/issues/30)".


## Contact

Feel free to contact me if have suggestions or questions.
See my [homepage](https://www.zhangzk.net) for contact information.
