function [A]=ldlt2(A)
    [n,n] = size(A)
    
    v(1) = A(1,1)*A(1,1)
   // A(1,1) = A(1,1) - A(1,1)*v(1)
   //A(2:n,1) = (A(2:n,1) -A(2:n,1) * v(1))/A(1,1)  
    A(2:n,1) = (A(2:n,1))/A(1,1)    
   // disp('Matrice = ')
    //disp(A)
  //  for i = 2:n
    //    A(1,1) = (A(i,1) -A(i,1) * v(1))/A(1,1)           
    //end

    for j = 2: n
        for i = 1 : j-1
            v(i) = A(j,i)* A(i,i)
         end
        
        A(j,j) = A(j,j) - A(j,1:j-1)*v(1:j-1)
        A(j+1:n,j) = (A(j+1:n,j) -A(j+1:n,1:j-1) * v(1:j-1))/A(j,j)
    end
endfunction
