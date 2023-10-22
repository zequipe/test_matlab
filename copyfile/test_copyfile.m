function test_copyfile()

system('rm folder* -rf; mkdir folder1; cd folder1; touch a; touch b; touch c; ln -s b blink; rm b; cd ..');

success = copyfile('folder1','folder2');
assert(success);

fprintf('\nfolder1:\n');
dir('folder1')

fprintf('\nfolder1:\n');
dir('folder2')

assert(isequal({dir('folder1').name}, {dir('folder2').name}));

return
