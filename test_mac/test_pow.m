function y = test_pow(x)

mex('-setup', '-v', 'Fortran');
mex('-v', 'pow.F');
y = pow(x);
assert(y == x^x, 'pow failed')
