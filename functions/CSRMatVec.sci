function [B] = CSRMatVec(AA,JA,IA,v)
    //n = size(IA)
    B = zeros(size(AA,'c'),1)
    n = size(IA,'c')-1
    for i = 1:n
        disp('---')
        disp(IA(i))
        disp(IA(i+1))
        disp('---')        
        for j = IA(i):IA(i+1)-1
            disp('JA')
            disp(j)
            //C = v(JA(j))
             B(i)=B(i)+(AA(JA(j))*v(JA(j))) 
        end
    end

endfunction
