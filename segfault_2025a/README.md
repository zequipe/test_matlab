This is a bug in MATLAB R2025a MEX when handling internal subroutines in Fortran.

In brief, if the Fortran MEX file contains an internal subroutine used as an actual argument to another subroutine, then MATLAB R2025a encounters a segfault under **Ubuntu** 22.04 and 24.04. Previous versions of MATLAB work without a problem (I have tested R2024a and R2024b). Windows and macOS have not been tested.

To reproduce the issue, download the files in this folder, and run the test by executing the following in the MATLAB command window:

```matlab
>> test
```

If your MATLAB is R2025a, you will see a segmentation fault as follows.
```text
Verbose mode is on.
No MEX options file identified; looking for an implicit selection.
... Looking for compiler 'gfortran' ...
... Executing command 'which gfortran' ...Yes ('/usr/bin/gfortran').
... Looking for folder '/usr/bin' ...Yes.
... Executing command 'which gfortran' ...Yes ('/usr/bin/gfortran').
... Executing command 'which gfortran' ...Yes ('/usr/bin/gfortran').
... Executing command 'gfortran -print-file-name=libgfortran.so' ...Yes ('/usr/lib/gcc/x86_64-linux-gnu/10/libgfortran.so').
... Looking for folder '/usr/lib/x86_64-linux-gnu' ...Yes.
... Executing command 'which gfortran' ...Yes ('/usr/bin/gfortran').
... Executing command 'gfortran -dumpversion | awk -F '.' '$1>=6' ' ...Yes ('10').
Found installed compiler 'gfortran'.
... Looking for compiler 'gfortran6-' ...
... Executing command 'which gfortran' ...Yes ('/usr/bin/gfortran').
... Looking for folder '/usr/bin' ...Yes.
... Executing command 'which gfortran' ...Yes ('/usr/bin/gfortran').
... Executing command 'gfortran -print-file-name=libgfortran.so' ...Yes ('/usr/lib/gcc/x86_64-linux-gnu/10/libgfortran.so').
... Looking for folder '/usr/lib/x86_64-linux-gnu' ...Yes.
... Executing command 'which gfortran' ...Yes ('/usr/bin/gfortran').
... Executing command 'gfortran -print-file-name=libgfortranbegin.a' ...Yes ('libgfortranbegin.a').
... Looking for folder 'libgfortranbegin.a' ...No.
Did not find installed compiler 'gfortran6-'.
Options file details
-------------------------------------------------------------------
	Compiler location: /usr/bin
	Options file: /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/mexopts/gfortran6.xml
	CMDLINE2 : /usr/bin/gfortran -pthread -shared -g -Wl,--version-script,/opt/hostedtoolcache/MATLAB/2025.1.999/x64/extern/lib/glnxa64/fortran_exportsmexfileversion.map /tmp/mex_1037477951999_9281/optimize.o /tmp/mex_1037477951999_9281/fortran_mexapi_version.o   -Wl,-rpath-link,/opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64  -L"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/sys/os/glnxa64/orig" -L"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64" "/opt/hostedtoolcache/MATLAB/2025.1.999/x64/sys/os/glnxa64/orig/libstdc++.so.6" -lmx -lmex -lmat -lm -L"/usr/lib/x86_64-linux-gnu" -lgfortran -z noexecstack -o optimize.mexa64
	FC : /usr/bin/gfortran
	DEFINES : -DMATLAB_DEFAULT_RELEASE=R2017b  -DUSE_MEX_CMD
	FFLAGS : -fexceptions -fbackslash -fPIC -fno-omit-frame-pointer -fallow-argument-mismatch -fdefault-integer-8
	INCLUDE : -I"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/extern/include" -I"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/simulink/include"
	FOPTIMFLAGS : -O2
	FDEBUGFLAGS : -g
	LDF : /usr/bin/gfortran
	LDFLAGS : -pthread
	LDTYPE : -shared
	LINKEXPORT : -Wl,--version-script,/opt/hostedtoolcache/MATLAB/2025.1.999/x64/extern/lib/glnxa64/fexport.map
	LINKEXPORTVER : -Wl,--version-script,/opt/hostedtoolcache/MATLAB/2025.1.999/x64/extern/lib/glnxa64/fortran_exportsmexfileversion.map
	MWCPPLIB : "/opt/hostedtoolcache/MATLAB/2025.1.999/x64/sys/os/glnxa64/orig/libstdc++.so.6"
	LINKLIBS : -Wl,-rpath-link,/opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64  -L"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/sys/os/glnxa64/orig" -L"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64" "/opt/hostedtoolcache/MATLAB/2025.1.999/x64/sys/os/glnxa64/orig/libstdc++.so.6" -lmx -lmex -lmat -lm -L"/usr/lib/x86_64-linux-gnu" -lgfortran
	LDOPTIMFLAGS : -O
	LDDEBUGFLAGS : -g
	MW_GLIBC_SHIM : $MW_GLIBC_SHIM
	LDEXECSTACK : -z noexecstack
	OBJEXT : .o
	LDEXT : .mexa64
	SETENV : FC="/usr/bin/gfortran"
                FFLAGS="-fexceptions -fbackslash -fPIC -fno-omit-frame-pointer -fallow-argument-mismatch -fdefault-integer-8 -DMATLAB_DEFAULT_RELEASE=R2017b  -DUSE_MEX_CMD   "
                FOPTIMFLAGS="-O2"
                FDEBUGFLAGS="-g"
                LD="/usr/bin/gfortran"
                LDFLAGS="-pthread -shared -Wl,-rpath-link,/opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64  -L"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/sys/os/glnxa64/orig" -L"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64" "/opt/hostedtoolcache/MATLAB/2025.1.999/x64/sys/os/glnxa64/orig/libstdc++.so.6" -lmx -lmex -lmat -lm -L"/usr/lib/x86_64-linux-gnu" -lgfortran -Wl,--version-script,/opt/hostedtoolcache/MATLAB/2025.1.999/x64/extern/lib/glnxa64/fexport.map"
                LDDEBUGFLAGS="-g"
	GFORTRAN_INSTALLDIR : /usr/bin
	GFORTRAN_EXECUTABLE : /usr/bin/gfortran
	GFORTRAN_LIBDIR : /usr/lib/x86_64-linux-gnu
	GFORTRAN_VERSION : 10
	MATLABROOT : /opt/hostedtoolcache/MATLAB/2025.1.999/x64
	ARCH : glnxa64
	SRC : "/home/runner/work/test_matlab/test_matlab/segfault_2025a/optimize.F90";"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/extern/version/fortran_mexapi_version.F"
	OBJ : /tmp/mex_1037477951999_9281/optimize.o;/tmp/mex_1037477951999_9281/fortran_mexapi_version.o
	OBJS : /tmp/mex_1037477951999_9281/optimize.o /tmp/mex_1037477951999_9281/fortran_mexapi_version.o
	SRCROOT : /home/runner/work/test_matlab/test_matlab/segfault_2025a/optimize
	DEF : /tmp/mex_1037477951999_9281/optimize.def
	EXP : "optimize.exp"
	LIB : "optimize.lib"
	EXE : optimize.mexa64
	ILK : "optimize.ilk"
	TEMPNAME : optimize
	EXEDIR :
	EXENAME : optimize
	MANIFEST : "optimize.mexa64.manifest"
	OPTIM : -g
	LINKOPTIM : -g
	CMDLINE1_0 : /usr/bin/gfortran -c -DMATLAB_DEFAULT_RELEASE=R2017b  -DUSE_MEX_CMD    -I"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/extern/include" -I"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/simulink/include" -fexceptions -fbackslash -fPIC -fno-omit-frame-pointer -fallow-argument-mismatch -fdefault-integer-8 -g "/home/runner/work/test_matlab/test_matlab/segfault_2025a/optimize.F90" -o /tmp/mex_1037477951999_9281/optimize.o
	CMDLINE1_1 : /usr/bin/gfortran -c -DMATLAB_DEFAULT_RELEASE=R2017b  -DUSE_MEX_CMD    -I"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/extern/include" -I"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/simulink/include" -fexceptions -fbackslash -fPIC -fno-omit-frame-pointer -fallow-argument-mismatch -fdefault-integer-8 -g "/opt/hostedtoolcache/MATLAB/2025.1.999/x64/extern/version/fortran_mexapi_version.F" -o /tmp/mex_1037477951999_9281/fortran_mexapi_version.o
-------------------------------------------------------------------
Building with 'gfortran'.
/usr/bin/gfortran -c -DMATLAB_DEFAULT_RELEASE=R2017b  -DUSE_MEX_CMD    -I"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/extern/include" -I"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/simulink/include" -fexceptions -fbackslash -fPIC -fno-omit-frame-pointer -fallow-argument-mismatch -fdefault-integer-8 -g "/home/runner/work/test_matlab/test_matlab/segfault_2025a/optimize.F90" -o /tmp/mex_1037477951999_9281/optimize.o
f951: Warning: Nonexistent include directory /opt/hostedtoolcache/MATLAB/2025.1.999/x64/simulink/include [-Wmissing-include-dirs]

/usr/bin/gfortran -c -DMATLAB_DEFAULT_RELEASE=R2017b  -DUSE_MEX_CMD    -I"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/extern/include" -I"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/simulink/include" -fexceptions -fbackslash -fPIC -fno-omit-frame-pointer -fallow-argument-mismatch -fdefault-integer-8 -g "/opt/hostedtoolcache/MATLAB/2025.1.999/x64/extern/version/fortran_mexapi_version.F" -o /tmp/mex_1037477951999_9281/fortran_mexapi_version.o
f951: Warning: Nonexistent include directory /opt/hostedtoolcache/MATLAB/2025.1.999/x64/simulink/include [-Wmissing-include-dirs]

{
  "bundle.symbolic_name" : "be8e5504-e0f7-492e-b08a-03d11430c8f2",
  "mw" :
  {
      "mex" :
      {
          "apiVersion" : 0,
          "release" : "R2025a",
          "threadpoolSafe" : 0
      }
  }
}


/opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/usResourceCompiler3 --manifest-add /tmp/mex_1037477951999_9281//mw_mex_tempmex_manifest.json --bundle-name mexVersioning --out-file /tmp/mex_1037477951999_9281//mw_mex_tempmex_bundle.zip

/usr/bin/gfortran -pthread -shared -g -Wl,--version-script,/opt/hostedtoolcache/MATLAB/2025.1.999/x64/extern/lib/glnxa64/fortran_exportsmexfileversion.map /tmp/mex_1037477951999_9281/optimize.o /tmp/mex_1037477951999_9281/fortran_mexapi_version.o   -Wl,-rpath-link,/opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64  -L"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/sys/os/glnxa64/orig" -L"/opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64" "/opt/hostedtoolcache/MATLAB/2025.1.999/x64/sys/os/glnxa64/orig/libstdc++.so.6" -lmx -lmex -lmat -lm -L"/usr/lib/x86_64-linux-gnu" -lgfortran -z noexecstack -o optimize.mexa64 -Wl,--format=binary -Wl,/tmp/mex_1037477951999_9281//mw_mex_tempmex_bundle.zip -Wl,--format=default
MEX completed successfully.

--------------------------------------------------------------------------------
          Segmentation violation detected at 2025-07-11 16:58:56 +0000
--------------------------------------------------------------------------------

Configuration:
  Crash Decoding           : Disabled - No sandbox or build area path
  Crash Mode               : continue (default)
  Default Encoding         : UTF-8
  Deployed                 : false
  GNU C Library            : 2.39 stable
  Graphics Driver          : Uninitialized software
  Graphics card 1          : 0x1414 ( 0x1414 ) 0x5353 Version 0.0.0.0 (0-0-0)
  MATLAB Architecture      : glnxa64
  MATLAB Entitlement ID    : 11373431
  MATLAB Root              : /opt/hostedtoolcache/MATLAB/2025.1.999/x64
  MATLAB Version           : 25.1.0.2943329 (R2025a)
  OpenGL                   : software
  Operating System         : Ubuntu 24.04.2 LTS
  Process ID               : 9281
  Processor ID             : x86 Family 25 Model 1 Stepping 1, AuthenticAMD
  Session Key              : 40xq29adxbsbdw85fpki4ykis
  Window System            : No active display

Fault Count: 1


Abnormal termination:
Segmentation violation

Current Thread: 'MCR 0 interpret' id 140534882498240

Register State (from fault):
  RAX = 00007fd0d3bf873c  RBX = 00007fd0d3bf8910
  RCX = 00007fd0ca49f11c  RDX = 00007fd0d3bf8774
  RSP = 00007fd0d3bf8718  RBP = 00007fd0d3bf8740
  RSI = 00007fd0d3bf873c  RDI = 00007fd0ca4a0000

   R8 = 00007fd0d3bf8a00   R9 = 0000000000000000
  R10 = 00007fd0d3bf8770  R11 = 0000000000000246
  R12 = 00007fd0d3bf8900  R13 = 0000000000000000
  R14 = 00007fd0d3bf8a00  R15 = 00007fd0d3bf8970

  RIP = 00007fd0d3bf8774  EFL = 0000000000010202

   CS = 0033   FS = 0000   GS = 0000

Stack Trace (from fault):
[  0] 0x00007fd0d3bf8774                                   <unknown-module>+00000000
[  1] 0x00007fd0ca49f1d2 /home/runner/work/test_matlab/test_matlab/segfault_2025a/optimize.mexa64+00004562 mexfunction_+00000132
[  2] 0x00007fd12df672d2 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmex.so+00975570
[  3] 0x00007fd12df67358 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmex.so+00975704
[  4] 0x00007fd12df67015 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmex.so+00974869
[  5] 0x00007fd12df681a4 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmex.so+00979364
[  6] 0x00007fd12df524fa /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmex.so+00890106
[  7] 0x00007fd12e77a4fe /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_dispatcher.so+01549566 _ZN8Mfh_file20dispatch_file_commonEMS_FviPP11mxArray_tagiS2_EiS2_iS2_+00000142
[  8] 0x00007fd12e77bc9a /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_dispatcher.so+01555610
[  9] 0x00007fd12e77c04e /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_dispatcher.so+01556558 _ZN8Mfh_file8dispatchEiPSt10unique_ptrI11mxArray_tagN6matrix6detail17mxDestroy_deleterEEiPPS1_+00000030
[ 10] 0x00007fd12d8757a7 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwlxemainservices.so+02578343
[ 11] 0x00007fd120762fd0 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+11939792
[ 12] 0x00007fd1207566da /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+11888346
[ 13] 0x00007fd1206d9fd1 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+11378641
[ 14] 0x00007fd1203c86cb /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08160971
[ 15] 0x00007fd1203ca41c /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08168476
[ 16] 0x00007fd1203c71ff /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08155647
[ 17] 0x00007fd1203d8c55 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08227925
[ 18] 0x00007fd1203d94a9 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08230057
[ 19] 0x00007fd1203c6ff4 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08155124
[ 20] 0x00007fd1203c70ff /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08155391
[ 21] 0x00007fd12053583b /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+09656379
[ 22] 0x00007fd12053a7e4 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+09676772
[ 23] 0x00007fd12da0b9b4 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwlxemainservices.so+04241844
[ 24] 0x00007fd12d863683 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwlxemainservices.so+02504323
[ 25] 0x00007fd12d865c05 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwlxemainservices.so+02513925
[ 26] 0x00007fd12e77a4fe /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_dispatcher.so+01549566 _ZN8Mfh_file20dispatch_file_commonEMS_FviPP11mxArray_tagiS2_EiS2_iS2_+00000142
[ 27] 0x00007fd12e77bc9a /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_dispatcher.so+01555610
[ 28] 0x00007fd12e77c04e /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_dispatcher.so+01556558 _ZN8Mfh_file8dispatchEiPSt10unique_ptrI11mxArray_tagN6matrix6detail17mxDestroy_deleterEEiPPS1_+00000030
[ 29] 0x00007fd12d8757a7 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwlxemainservices.so+02578343
[ 30] 0x00007fd120762fd0 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+11939792
[ 31] 0x00007fd1207566da /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+11888346
[ 32] 0x00007fd1206d9fd1 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+11378641
[ 33] 0x00007fd1203c86cb /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08160971
[ 34] 0x00007fd1203ca41c /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08168476
[ 35] 0x00007fd1203c71ff /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08155647
[ 36] 0x00007fd1203d8c55 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08227925
[ 37] 0x00007fd1203d94a9 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08230057
[ 38] 0x00007fd1203c6ff4 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08155124
[ 39] 0x00007fd1203c70ff /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+08155391
[ 40] 0x00007fd12053583b /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+09656379
[ 41] 0x00007fd12053a7e4 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_lxe.so+09676772
[ 42] 0x00007fd12da0b9b4 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwlxemainservices.so+04241844
[ 43] 0x00007fd12d8df311 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwlxemainservices.so+03011345
[ 44] 0x00007fd12d8df50d /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwlxemainservices.so+03011853
[ 45] 0x00007fd12d9ac31d /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwlxemainservices.so+03851037
[ 46] 0x00007fd12d9ac54e /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwlxemainservices.so+03851598
[ 47] 0x00007fd12e356f0f /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwm_interpreter.so+01404687 _Z51inEvalCmdWithLocalReturnInDesiredWSAndPublishEventsRKNSt7__cxx1112basic_stringIDsSt11char_traitsIDsESaIDsEEEPibbP15inWorkSpace_tagN9MathWorks3lxe10EvalSourceE+00000063
[ 48] 0x00007fd12eadeecc /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwiqm.so+00974540 _ZNK3iqm18InternalEvalPlugin24inEvalCmdWithLocalReturnERKNSt7__cxx1112basic_stringIDsSt11char_traitsIDsESaIDsEEEP15inWorkSpace_tag+00000108
[ 49] 0x00007fd12eadff35 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwiqm.so+00978741 _ZN3iqm18InternalEvalPlugin7executeEP15inWorkSpace_tag+00000469
[ 50] 0x00007fd12eac7716 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwiqm.so+00878358
[ 51] 0x00007fd12ea8c228 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwiqm.so+00635432
[ 52] 0x00007fd12ea8c571 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwiqm.so+00636273
[ 53] 0x00007fd13bf4954e /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwmlutil.so+09737550 _ZNK14cmddistributor16IIPRunNowMessage7deliverERKN10foundation7msg_svc8exchange7RoutingE+00000030
[ 54] 0x00007fd13d3629cc /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwms.so+03549644 _ZN10foundation7msg_svc8exchange12MessageQueue7deliverERKN7mwboost10shared_ptrIKNS1_8EnvelopeEEE+00000252
[ 55] 0x00007fd13d36467f /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwms.so+03556991
[ 56] 0x00007fd13d349f6d /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwms.so+03448685
[ 57] 0x00007fd13d34ee74 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwms.so+03468916
[ 58] 0x00007fd13d34911f /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwms.so+03445023
[ 59] 0x00007fd13be86452 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwmlutil.so+08938578
[ 60] 0x00007fd13be8d3d1 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwmlutil.so+08967121
[ 61] 0x00007fd13ed2531e /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwrcf_framework.so+00312094 _ZN7mwboost6detail17shared_state_base13wait_internalERNS_11unique_lockINS_5mutexEEEb+00000222
[ 62] 0x00007fd12e93c612 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwmcr.so+00706066 _ZN7mwboost6futureIvE3getEv+00000098
[ 63] 0x00007fd12e92ac0b /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwmcr.so+00633867
[ 64] 0x00007fd13e347897 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwmvm.so+03438743 _ZN14cmddistributor15PackagedTaskIIP10invokeFuncIN7mwboost8functionIFvvEEEEENS2_10shared_ptrINS2_6futureIDTclfp_EEEEEERKT_+00000071
[ 65] 0x00007fd13e347bc8 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwmvm.so+03439560 _ZNSt17_Function_handlerIFN7mwboost3anyEvEZN14cmddistributor15PackagedTaskIIP10createFuncINS0_8functionIFvvEEEEESt8functionIS2_ET_EUlvE_E9_M_invokeERKSt9_Any_data+00000024
[ 66] 0x00007fd12eae9e3b /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwiqm.so+01019451 _ZN3iqm18PackagedTaskPlugin7executeEP15inWorkSpace_tag+00000091
[ 67] 0x00007fd12eac7716 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwiqm.so+00878358
[ 68] 0x00007fd12ea934f9 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwiqm.so+00664825
[ 69] 0x00007fd12e4ac0e9 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwbridge.so+00499945
[ 70] 0x00007fd12e4ac5c3 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwbridge.so+00501187
[ 71] 0x00007fd12e4c84ea /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwbridge.so+00615658 _Z22mnGetCommandLineBufferbRbN7mwboost8optionalIKP15inWorkSpace_tagEEbRKNS0_9function2IN6mlutil14cmddistributor17inExecutionStatusERKNSt7__cxx1112basic_stringIDsSt11char_traitsIDsESaIDsEEES4_EE+00000218
[ 72] 0x00007fd12e4c8881 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwbridge.so+00616577 _Z8mnParserv+00000513
[ 73] 0x00007fd12e964350 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwmcr.so+00869200
[ 74] 0x00007fd13e347897 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwmvm.so+03438743 _ZN14cmddistributor15PackagedTaskIIP10invokeFuncIN7mwboost8functionIFvvEEEEENS2_10shared_ptrINS2_6futureIDTclfp_EEEEEERKT_+00000071
[ 75] 0x00007fd13e347bc8 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwmvm.so+03439560 _ZNSt17_Function_handlerIFN7mwboost3anyEvEZN14cmddistributor15PackagedTaskIIP10createFuncINS0_8functionIFvvEEEEESt8functionIS2_ET_EUlvE_E9_M_invokeERKSt9_Any_data+00000024
[ 76] 0x00007fd12eae9e3b /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwiqm.so+01019451 _ZN3iqm18PackagedTaskPlugin7executeEP15inWorkSpace_tag+00000091
[ 77] 0x00007fd12eac7716 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwiqm.so+00878358
[ 78] 0x00007fd12ea918b2 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwiqm.so+00657586
[ 79] 0x00007fd12ea9267d /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwiqm.so+00661117
[ 80] 0x00007fd12ea92994 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwiqm.so+00661908
[ 81] 0x00007fd12e94bd07 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwmcr.so+00769287
[ 82] 0x00007fd12e94c3ce /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwmcr.so+00771022
[ 83] 0x00007fd12e94c69d /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwmcr.so+00771741
[ 84] 0x00007fd13ea0db17 /opt/hostedtoolcache/MATLAB/2025.1.999/x64/bin/glnxa64/libmwboost_thread.so.1.81.0+00043799
[ 85] 0x00007fd13f09caa4                    /lib/x86_64-linux-gnu/libc.so.6+00641700
[ 86] 0x00007fd13f129c3c                    /lib/x86_64-linux-gnu/libc.so.6+01219644


This error was detected while a MEX-file was running. If the MEX-file
is not an official MathWorks function, please examine its source code
for errors. Please consult the External Interfaces Guide for information
on debugging MEX-files.


MATLAB is exiting because of fatal error
exit status 255
```

If you are using an earlier version, the test should complete without errors.

See https://github.com/zequipe/test_matlab/actions/runs/16096537922 for a GitHub Actions run that
reproduces the issue.

## [Bug confirmation from MathWorks](./mathworks.png)

```plaintext
---------- Forwarded message ---------
From: Esther Yi <support@mathworks.cn>
Date: Mon, Jul 14, 2025 at 7:14 PM
Subject: Re: Bug in MATLAB R2025a MEX: internal subroutines cause segfault [ ref:!00Di00Ha1u.!500UU0SYwr4:ref ]
To: zaikunzhang@gmail.com <zaikunzhang@gmail.com>


Dear Zaikun,

I am writing in reference to your Technical Support Case 07931486 regarding 'Bug in MATLAB R2025a MEX: internal subroutines cause segfault'.

Thank you for bringing this issue to our attention. We have confirmed that this is a bug and have reported it to our development team. I have attached your case to our internal records, so you will be notified by email once a fix is available.

Please note that while this service request will be closed, your case will remain open in our database for our developers to address.

In the meantime, the only available workaround is to use an earlier release or to work on Windows.

If you have any further questions, please let me know.

If you have a new technical support question, please submit a new request here:
http://www.mathworks.com/support/servicerequests/create.html

Sincerely,
Esther Yi
MathWorks Technical Support Team

Self-Service: http://www.mathworks.com/support
File Exchange and MATLAB Answers: http://www.mathworks.com/matlabcentral/
```
