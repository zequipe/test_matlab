This is a reproducer for an issue with `parfor` in MATLAB R2023a--R2025a.

To see the issue, do the following in **MATLAB R2023a--R2025a with the Parallel Computing Toolbox installed**.

1. Download this directory. Suppose that you name it `test_parfor`.

2. Open MATLAB and change the current directory to `test_parfor`.

3. Run the following command in the MATLAB command window:

   ```matlab
   test
   ```

   It should print `Success!` at the end.

4. Now, run the following command in the MATLAB command window:

   ```matlab
   profile
   ```

   It should fail with an error like the following:

   ```plaintext
    Analyzing and transferring files to the workers ...done.
    {Error using try_parfor (line 6)
    The source code
    (/home/runner/work/test_matlab/test_matlab/test_parfor/try_parfor/try_parfor.m)
    for the parfor-loop that is trying to execute on the worker could not be found.

    Error in profile (line 10)
        try_parfor(func);
        ^^^^^^^^^^^^^^^^^

    Caused by:
        Unrecognized function or variable 'fun'.
        Worker unable to find file.
            Unrecognized function or variable 'fun'.
    }
    exit status 1
   ```

However, comparing test.m and profile.m, you will find that **they are identical except for the function names**. **Is this expected or a bug**?

I understand that the failure must depend on the fact that **MATLAB has a built-in function named "profile", which is shadowed by "profile.m"**. But it is not clear to me why it should lead to such a failure.
