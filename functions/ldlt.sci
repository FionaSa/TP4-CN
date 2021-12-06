function [A,L]=ldlt(A)
    [n,m] = size(A)
    v = []
    for j= 1 : n
        v(j) = (A(j,j)- A(j,1:j-1).^2 * v(1:j-1));
        A(j,j) = v(j);
        A(j+1:n,j) = (A(j+1:n,j) - A(j+1:n,1:j-1).*A(j,1:j-1) *v(1:j-1))/v(j);
    end
    
    L = tril(A)
endfunction

