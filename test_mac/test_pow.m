function y = test_pow(x)

mex('-setup', 'Fortran');
mex('-v', 'LDFLAGSVER=$(echo $LDFLAGSVER | sed "s/-undefined\s*error/-undefined dynamic_lookup/g")', 'pow.F');
y = pow(x);
%assert(y == x^int64(x), 'pow failed')
