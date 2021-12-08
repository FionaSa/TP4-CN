function [L,U,P] = mylu1b(A)

    n = size(A,'r')
    //Initialisation de row ( le pivot)
    for i = 1 : n 
      row(1,i) = i
    end

    for k = 1 : n - 1
        //Pivot partiel
        [piv,ind] = max(abs(A(k : n,k)))
        ind = k -1 + ind 
        q = row(1,ind)
        if ind ~= k then
            new = A(ind,:) 
            A(ind,:) = A(k,:)
            row(1,ind) = row(1,k)
            row(1,k) = q
            A(k,:) = new 
        end           
        //MyLu
        A((k+1):n,k) = A ((k+1):n,k)/A(k,k)
        A((k+1):n,(k+1):n) = A((k+1):n,(k+1):n) - A((k+1):n,k) * A(k,(k+1):n) 
    end
    U = triu(A)
    L = tril(A,-1)+eye(U)
    P = row
endfunction
