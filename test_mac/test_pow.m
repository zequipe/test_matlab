function y = test_pow(x)

mex('-setup', 'Fortran');

% The following works without any issue.
%linker_options = 'LDFLAGSVER=$(echo $LDFLAGSVER | sed "s/-undefined error//g") -undefined dynamic_lookup'; % This fixes the failure
%linker_options = 'LDFLAGSVER="$LDFLAGSVER -undefined dynamic_lookup"'; 
%linker_options = 'LINKFLAGS="$LINKFLAGS -Wl,-undefined,dynamic_lookup"'; % This does not work
mex('-v', linker_options, 'pow.F');
y = pow(x)
assert(y == x^int64(x), 'pow failed');

% The following fails due to undefined symbols. 
%mex('-v', 'pow.F');
y = pow(x)
assert(y == x^int64(x), 'pow failed');
