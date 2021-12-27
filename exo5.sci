exec('./functions/CSRMatVec.sci')

AA=[1 2 3]
JA=[1 2 3]
IA=[1 2 3 4]

v=[2 2 2]

B = CSRMatVec(AA,JA,IA,v)
disp(size(IA,'c'))
disp('----')
disp(B)
/*
AA=[1 2 3 4 5 6 7 8 9 10 11 12]
JA=[1 4 1 2 4 1 3 4 5 3 4 5]
IA=[1 3 6 10 12 13]

v=[2 2 2 2 2 2 2 2 2 2 2 2]
