function [x,sp] = richardson(A,b)
    [n,n] = size(A)
    epsilon = 1.e-10
     M = diag(diag(A)) 
     N = M-A
     B = inv(M)* N  
     sp = []  
     //sp = max(abs(spec(B)))
         x= zeros(n,1)   
         
   while (norm(b-A*x)>epsilon)
             for i = 1:n
                 C = (A(i,i)*x(i))
                 x(i) = x(i) + (1/A(i,i))*(b(i)-( ( A(i,1:n)*x )- C))
            end
   end    
    
endfunction
