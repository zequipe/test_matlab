function y = test_pow(x)

mex('-setup', '-v', 'Fortran');
mex('-v', 'pow.F');
mex -v LDFLAGSVER='-Wl,-twolevel_namespace -Wl,-undefined,dynamic_link -mmacosx-version-min=$MACOSX_DEPLOYMENT_TARGET -Wl,-syslibroot,$ISYSROOT $LINKEXPORTVER $BUNDLEFLAG' pow.F
y = pow(x);
%assert(y == x^int64(x), 'pow failed')
