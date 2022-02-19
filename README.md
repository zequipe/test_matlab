## Introduction

[`crash.m`](https://github.com/zaikunzhang/test_matlab/blob/master/crash.m) illustrates a bug of
the **Linux** version of MATLAB concerning [`MEX`](https://www.mathworks.com/help/matlab/ref/mex.html).

## How to crash MATLAB?

Run the following commands in the MATLAB command line under the directory containing `crash.m`.

- Make MATLAB crash during `mex('-setup', 'C')`:
```matlab
crash('setup');  % running only `crash` has the same effect
```

- Make MATLAB crash during `mex(timestwo_src, '-outdir', build_dir)`:
```matlab
crash('mex');
```

The above commands crash MATLAB **under Linux**, as has been confirmed on the following versions.

- R2018b Update 3 (9.5.0.1049112) 64-bit (glnxa64)
- R2019b Update 5 (9.7.0.1319299) 64-bit (glnxa64)
- R2020a (9.8.0.1323502) 64-bit (glnxa64)
- R2021a Update 5 (9.10.0.1739362) 64-bit (glnxa64),
- R2021b Update 1 (9.11.0.1809720) (glnxa64)

If you want to see how the crash looks like, check the
GitHub Action [`Crash MATLAB`](https://github.com/zaikunzhang/test_matlab/actions) of this repo.

To reproduce the crash on your own machine, your MATLAB has to have `MEX` configured for compiling `C`.
Normally you only need to install `gcc` and then run `mex('-setup', 'C')` in MATLAB.

According to limited tests, the bug does not affect the macOS version of MATLAB. On Windows,
Windows will raise an error that
```
Error using crash>copy_src (line 165)
  The process cannot access the file because it is being used by another process.
```
This is much more decent than crashing!


## Why does MATLAB crash in this case?

Comparing the behaviors of MATLAB under Linux and Windows when executing `crash.m`, here is my
speculation about the cause for the crash.

What `crash.m` does is simple:

* **Step 1**. Create a source directory named `src` containing `timestwo.c` **and `timestwo.mexa64`**;
* **Step 2**. Copy the source directory `src` to a build directory named `build`;
* **Step 3**. Call `mex` to compile `timestwo.c` in `build`, and then run `timestwo(1)`;
* **Step 4**. Redo the first three steps.

It is the **`timestwo.mexa64` contained in the `src` directory** in **Step 1** that causes the crash.

Why? In **Step 3**, a `timestwo.mexa64` is created in the `build` directory, and then loaded into the
memory when `timestwo(2)` is invoked. When we redo **Steps 1** and **2**, MATLAB will try replacing the
`timestwo.mexa64` contained in `build` by the one from `src` --- but note that the former has been
loaded into the memory! On Windows, MATLAB detects the problem and tells us that "The process cannot
access the file because it is being used by another process", where "the file" seems to refer to
the `timestwo.mexa64` in `build`; on Linux, however, MATLAB does something wrong and corrupted the
memory, leading to the crash.

In this case, MATLAB has done a good job on Windows. Meanwhile the macOS version handles everythig
nicely without any error, which seems more desirable.


## How to avoid the crash?

Before MathWorks fixes the bug, the crash can be avoided as demonstrated in the
[`fix` directory](https://github.com/zaikunzhang/test_matlab/tree/master/fix), where each script
starting with `yes_` is a **slightly** modified version
of [`crash.m`](https://github.com/zaikunzhang/test_matlab/blob/master/crash.m) that does not suffer from the bug.
The scripts starting with `no_` illustrate some modifications that fail to solve the problem.

To summarize, MATLAB will stop crashing if we take any **one** of the following actions
**before** copying the source files from the source directory to the build directory.

1. Clear the mex function to be compiled before compiling it
([`yes_clear_mex_before_copy.m`](https://github.com/zaikunzhang/test_matlab/blob/master/fix/yes_clear_mex_before_copy.m)).
2. In the source directory, remove any file with the same name as the mex file to be compiled
([`yes_clean_src_dir_before_copy.m`](https://github.com/zaikunzhang/test_matlab/blob/master/fix/yes_clean_src_dir_before_copy.m)).
3. In the build directory, remove any file with the same name as the mex file to be compiled
([`yes_clean_build_dir_before_copy.m`](https://github.com/zaikunzhang/test_matlab/blob/master/fix/yes_clean_build_dir_before_copy.m)).

However, doing any one of them **after** copying the source files cannot solve the problem:
MATLAB will still crash, but this time during the copying
([`no_clear_mex_after_copy.m`](https://github.com/zaikunzhang/test_matlab/blob/master/fix/no_clear_mex_after_copy.m),
[`no_clean_src_dir_after_copy.m`](https://github.com/zaikunzhang/test_matlab/blob/master/fix/no_clean_src_dir_after_copy.m),
[`no_clean_build_dir_after_copy.m`](https://github.com/zaikunzhang/test_matlab/blob/master/fix/no_clean_build_dir_after_copy.m)).


## Contact

Feel free to contact me if have suggestions or questions.
See my [homepage](https://www.zhangzk.net) for contact information.
