exec('./functions/jacobi.sci')
// Création matrice poisson1d

A = zeros(5,5)

A(1,1) = 2
A(1,2) = -1
A(5,5) = 2
A(5,4) = -1
for i=2:4
    A(i,i) = 2
    A(i,i+1) = -1
    A(i,i-1) = -1
end

//b = rand(5,1)

//x = rand(1,100)

//B = A*x

//B = rand (100,100)
//
b = rand(5,1)

xex = A\b
 
x = jacobi(A,b)

 
//x2 = jacobi2(A,b)

disp(A)
disp(xex)
disp(x)
//disp(x2)

//disp(B)
//disp(A)

//[L,U] = lu(A)

//disp(L)
//disp(U)
