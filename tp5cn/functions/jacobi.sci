function [x] = jacobi(A,b)
    [n,n] = size(A)
    
    x= zeros(n,1)
    
    epsilon = 1.e-10
    
    
   while (norm(b-A*x)>epsilon)
        for i = 1:n
             x(i) = -(1/A(i,i))*( ( A(i,1:n)*x )-(A(i,i)*x(i)))+(b(i)/A(i,i))

        end
   end    
    
endfunction
