function y = test_pow(x)

mex('-setup', 'Fortran');
linker_options = 'LDFLAGSVER=$(echo $LDFLAGSVER | sed "s/-undefined error/-undefined dynamic_lookup/g")';
mex('-v', linker_options, 'pow.F');
y = pow(x);
%assert(y == x^int64(x), 'pow failed')
