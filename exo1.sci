exec('./functions/ldlt.sci')
exec('./functions/mylu.sci')
//exec('./functions/ldlt2.sci')
//exec('./functions/ldlt3.sci')
//A = rand(3,3)
//A = sparse(A)

A =[9,-1,2;-1,8,-5;2,-5,7]

//A = toeplitz(rand(5,1))
disp('A est donc')
disp(A)

n = 3
avg = 0
avg_toc = 0
for j=1 : 10
    A = toeplitz(rand(n,1))
    [L,U] = lu(A)
    tic()
    [L2,D] = ldlt(A) 
    avg_toc = avg_toc + toc()
    Dt = zeros(n,n)
    for i = 1 : n
        Dt(i,i) = D(i)
    end
    avg = avg +norm(A-((L2)*(Dt)*L2'))
    
end
disp(avg/10)
disp(avg_toc/10)
n = 5
avg = 0
avg_toc = 0
for j=1 : 10
    A = toeplitz(rand(n,1))
    [L,U] = lu(A)
    tic()
    [L2,D] = ldlt(A) 
    avg_toc = avg_toc + toc()
    Dt = zeros(n,n)
   // disp(D)
    for i = 1 : n
        Dt(i,i) = D(i)
    end
    avg = avg +norm(A-((L2)*(Dt)*L2'))
    
end
disp(avg/10)
disp(avg_toc/10)

n = 10
avg = 0
avg_toc = 0
for j=1 : 10
    A = toeplitz(rand(n,1))
    [L,U] = lu(A)
    tic()
    [L2,D] = ldlt(A) 
    avg_toc = avg_toc + toc()
    Dt = zeros(n,n)
    for i = 1 : n
        Dt(i,i) = D(i)
    end
    avg = avg +norm(A-((L2)*(Dt)*L2'))
    
end
disp(avg/10)
disp(avg_toc/10)

n = 100
avg = 0
avg_toc = 0
for j=1 : 10
    A = toeplitz(rand(n,1))
    [L,U] = lu(A)
    tic()
    [L2,D] = ldlt(A) 
    avg_toc = avg_toc + toc()
    Dt = zeros(n,n)
    for i = 1 : n
        Dt(i,i) = D(i)
    end
    avg = avg +norm(A-((L2)*(Dt)*L2'))
end
disp(avg/10)
disp(avg_toc/10)
