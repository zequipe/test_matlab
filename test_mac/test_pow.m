function y = test_pow(x)

mex('-setup', '-v', 'Fortran');
mex('-v', 'LDFLAGSVER="${LDFLAGSVER/error/dynamic_lookup}"', 'pow.F');
y = pow(x);
%assert(y == x^int64(x), 'pow failed')
