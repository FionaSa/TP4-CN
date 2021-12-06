function [L,D]=ldlt(A)
    [n,m] = size(A)
    v = []
    D = zeros(n,1)
    L = zeros(n,n)
    C = zeros(n,n)
    for i = 1:n
        L(i,i)=1;
        D(i)= 1;
    end
    
    D(1) = A(1,1);
    for i = 2:n
      L(i,1)=(A(i,1)-L(i,1)*L(1,1).*D(1))*(1/D(1));
     end
    for j= 2 : n
        D(j) = A(j,j)- L(j,1:j-1)^2*D(1:j-1);
        for i = j+1:n
            L(i,j)=(A(i,j)-L(i,1:j-1).*L(j,1:j-1)*D(1:j-1))*(1/D(j));
        end
    end
endfunction
