function y = test_pow(x)

mex('-setup', '-v', 'Fortran');
%mex('-v', 'pow.F');
mex -v LDFLAGS='$LDFLAGS -Wl,-undefined,dynamic_lookup' pow.F
y = pow(x);
assert(y == x^int64(x), 'pow failed')
