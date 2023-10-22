function test_copyfile()

system('rm -rf folder*; mkdir folder1; cd folder1; touch a b c d e f g; ln -s d dlink; rm d; cd ..');

success = copyfile('folder1','folder2');
assert(success);

fprintf('\nfolder1:\n');
dir('folder1')

fprintf('\nfolder2:\n');
dir('folder2')

assert(isequal({dir('folder1').name}, {dir('folder2').name}));

return
