exec('./jacobi.sci')

atomsInstall("scibench")
//A = zeros (100,100)

A = scibench_poissonA(100);

x = rand(1,100)

//B = A*x

B = rand (100,100)
 
xex = jacobi(B)

disp(xex(100))

//disp(B)
//disp(A)

//[L,U] = lu(A)

//disp(L)
//disp(U)
