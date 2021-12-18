function [x]=jacobi(A)
    [n,n] = A
    x = zeros(n,1)
    D = diag(A)
    
    b = rand(n,1)
    
    D = D'
    
    x(1)= A\b
    
    for i = 1:n
        x(i+1) = 1/A(i,i)*(b(i) - A(i,1:n)*x(1:n)
    end
    
endfunction
