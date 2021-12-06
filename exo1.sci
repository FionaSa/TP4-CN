exec('./functions/ldlt.sci')
exec('./functions/ldlt2.sci')
exec('./functions/ldlt3.sci')
//A = rand(3,3)
//A = sparse(A)

A =[9,-1,2;-1,8,-5;2,-5,7]

//A = toeplitz(rand(5,1))
disp('A est donc')
disp(A)

[L,U] = lu(A)
[A2,L2] = ldlt(A) 
//disp('AOK')
//disp(A)
//[A3,L3] = ldlt2(A) 
//[A4,L4] = ldlt3(A) 
disp('L=')
disp(L)
disp('L2 = ')
disp(L2)

disp(A-((tril(A2,-1)+eye(A2))*(tril(A2,-1)-tril(A2,-1)')*tril(A2)'))
disp('L4 = ')
/*disp(L4)
disp(A-((tril(A4,-1)+eye(A4))*(tril(A4,-1)-tril(A4,-1)')*tril(A4)'))
//disp('L3 = ')
//disp(L3)
disp('A2 = ')
disp(A2)
disp('A4 = ')
disp(A4)

