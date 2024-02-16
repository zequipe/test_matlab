function y = test_pow(x)

mex('-setup', '-v', 'Fortran');
mex -v LDFLAGSVER='-Wl,-undefined,dynamic_lookup' pow.F
y = pow(x);
%assert(y == x^int64(x), 'pow failed')
