function y = test_square(x)

mex('-setup', '-v', 'Fortran');
mex('-v', 'square.F');
y = square(x);
