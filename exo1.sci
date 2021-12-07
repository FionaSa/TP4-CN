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
x1= []
x2= []
x3 = []

y = [3 5 10 100]
n = 3
avg = 0
avg_toc = 0
avg_toc_lu = 0
for j=1 : 10
    A = toeplitz(rand(n,1))
    tic()
    [L,U] = mylu1b(A)
    avg_toc_lu = avg_toc_lu + toc()
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
disp(avg_toc_lu/10)
x1($+1) = avg/10
x2($+1) = avg_toc/10
x3($+1) = avg_toc_lu/10
n = 5
avg = 0
avg_toc = 0
avg_toc_lu = 0
for j=1 : 10
    A = toeplitz(rand(n,1))
    tic()
    [L,U] = mylu1b(A)
    avg_toc_lu = avg_toc_lu + toc()
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
disp(avg_toc_lu/10)
x1($+1) = avg/10
x2($+1) = avg_toc/10
x3($+1) = avg_toc_lu/10

n = 10
avg = 0
avg_toc = 0
avg_toc_lu = 0
for j=1 : 10
    A = toeplitz(rand(n,1))
    tic()
    [L,U] = mylu1b(A)
    avg_toc_lu = avg_toc_lu + toc()
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
disp(avg_toc_lu/10)
x1($+1) = avg/10
x2($+1) = avg_toc/10
x3($+1) = avg_toc_lu/10

n = 100
avg = 0
avg_toc = 0
avg_toc_lu = 0
for j=1 : 10
    A = toeplitz(rand(n,1))
    tic()
    [L,U] = mylu1b(A)
    avg_toc_lu = avg_toc_lu + toc()
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
disp(avg_toc_lu/10)
x1($+1) = avg/10
x2($+1) = avg_toc/10
x3($+1) = avg_toc_lu/10

scf(0);
plot(y,x2,'r')
plot(y,x3,'g')
xgrid
xlabel('Nbre matrices')
ylabel('Temps execution')
legend('LDLT','MyLu1b',2)
xs2pdf(gcf(),'MyLuLdLt');

scf(1);
plot(y,x2,'g')
xgrid
xlabel('Nbre matrices')
ylabel('norme(erreur)')
xs2pdf(gcf(),'Ldlt_erreur');
