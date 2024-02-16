function y = test_pow(x)

mex('-setup', '-v', 'Fortran');
getenv('LDFLAGSVER');
setenv('LDFLAGSVER', '-Wl,-undefined,dynamic_lookup');
mex('-v', 'pow.F');
y = pow(x);
%assert(y == x^int64(x), 'pow failed')
