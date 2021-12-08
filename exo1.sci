exec('./functions/ldlt.sci')
exec('./functions/mylu.sci')
exec('./functions/ldlt2.sci')
//exec('./functions/ldlt3.sci')
//A = rand(3,3)
//A = sparse(A)

A =[9,-1,2;-1,8,-5;2,-5,7]
[A] = ldlt2(A) 
disp(A)
A =[9,-1,2;-1,8,-5;2,-5,7]
[L2,D] = ldlt(A) 

disp(L2)
disp(D)
//A = toeplitz(rand(5,1))
//disp('A est donc')
//disp(A)
x1= []
x2= []
x3 = []
x4 = []
x5 = []
x6 = []

y = [3 5 10 100 1000]
n = 3
avg = 0
avg_toc = 0
avg_toc_lu = 0
avg_toc_2 = 0
avg_2 = 0
avg_3 = 0 
for j=1 : 10
    A = toeplitz(rand(n,1))
    tic()
    [L,U] = mylu1b(A)
    avg_toc_lu = avg_toc_lu + toc()
    avg_2 = avg_2 +norm(A-((L)*(U)))      
    tic()
    [L2,D] = ldlt(A) 
    avg_toc = avg_toc + toc()
    Dt = zeros(n,n)
    for i = 1 : n
        Dt(i,i) = D(i)
    end
    avg = avg +norm(A-((L2)*(Dt)*L2'))
    tic()    
    [A1] = ldlt2(A) 
    avg_toc_2 = avg_toc_2 + toc()    
    B = zeros(n,n)
    for c = 1 : n
        B(c,c) = diag(A1)(c)
    end  
    avg_3 = avg_3 +norm(A-((tril(A1,-1)+eye(A))*(B)*(tril(A1,-1)+eye(A))'))    
end
disp(avg/10)
disp(avg_toc/10)
disp(avg_toc_lu/10)
x1($+1) = avg/10
x2($+1) = avg_toc/10
x3($+1) = avg_toc_lu/10
x4($+1) = avg_toc_2/10
x5($+1) = avg_2/10
x6($+1) = avg_3/10

n = 5
avg = 0
avg_toc = 0
avg_toc_lu = 0
avg_toc_2 = 0
avg_2 = 0
avg_3 = 0 
for j=1 : 10
    A = toeplitz(rand(n,1))
    tic()
    [L,U] = mylu1b(A)
    avg_toc_lu = avg_toc_lu + toc()
    avg_2 = avg_2 +norm(A-((L)*(U)))      
    tic()
    [L2,D] = ldlt(A) 
    avg_toc = avg_toc + toc()
    Dt = zeros(n,n)
   // disp(D)
    for i = 1 : n
        Dt(i,i) = D(i)
    end
    avg = avg +norm(A-((L2)*(Dt)*L2'))
    tic()    
    [A1] = ldlt2(A) 
    avg_toc_2 = avg_toc_2 + toc()     
    B = zeros(n,n)
    for c = 1 : n
        B(c,c) = diag(A1)(c)
    end  
    avg_3 = avg_3 +norm(A-((tril(A1,-1)+eye(A))*(B)*(tril(A1,-1)+eye(A))'))   
end
disp(avg/10)
disp(avg_toc/10)
disp(avg_toc_lu/10)
x1($+1) = avg/10
x2($+1) = avg_toc/10
x3($+1) = avg_toc_lu/10
x4($+1) = avg_toc_2/10
x5($+1) = avg_2/10
x6($+1) = avg_3/10

n = 10
avg = 0
avg_toc = 0
avg_toc_lu = 0
avg_toc_2 = 0
avg_2 = 0
avg_3 = 0 
for j=1 : 10
    A = toeplitz(rand(n,1))
    tic()
    [L,U] = mylu1b(A)
    avg_toc_lu = avg_toc_lu + toc()
    avg_2 = avg_2 +norm(A-((L)*(U)))      
    tic()
    [L2,D] = ldlt(A) 
    avg_toc = avg_toc + toc()
    Dt = zeros(n,n)
    for i = 1 : n
        Dt(i,i) = D(i)
    end
    avg = avg +norm(A-((L2)*(Dt)*L2'))
    tic()    
    [A1] = ldlt2(A) 
    avg_toc_2 = avg_toc_2 + toc()    
    B = zeros(n,n)
    for c = 1 : n
        B(c,c) = diag(A1)(c)
    end  
    avg_3 = avg_3 +norm(A-((tril(A1,-1)+eye(A))*(B)*(tril(A1,-1)+eye(A))'))   
end
disp(avg/10)
disp(avg_toc/10)
disp(avg_toc_lu/10)
x1($+1) = avg/10
x2($+1) = avg_toc/10
x3($+1) = avg_toc_lu/10
x4($+1) = avg_toc_2/10
x5($+1) = avg_2/10
x6($+1) = avg_3/10

n = 100
avg = 0
avg_toc = 0
avg_toc_lu = 0
avg_toc_2 = 0
avg_2 = 0
avg_3 = 0 
for j=1 : 10
    A = toeplitz(rand(n,1))
    tic()
    [L,U] = mylu1b(A)
    avg_toc_lu = avg_toc_lu + toc()
    avg_2 = avg_2 +norm(A-((L)*(U)))      
    tic()
    [L2,D] = ldlt(A) 
    avg_toc = avg_toc + toc()
    Dt = zeros(n,n)
    for i = 1 : n
        Dt(i,i) = D(i)
    end
    avg = avg +norm(A-((L2)*(Dt)*L2'))
    tic()    
    [A1] = ldlt2(A) 
    avg_toc_2 = avg_toc_2 + toc()   
    B = zeros(n,n)
    for c = 1 : n
        B(c,c) = diag(A1)(c)
    end  
    avg_3 = avg_3 +norm(A-((tril(A1,-1)+eye(A))*(B)*(tril(A1,-1)+eye(A))'))   
end
disp(avg/10)
disp(avg_toc/10)
disp(avg_toc_lu/10)
x1($+1) = avg/10
x2($+1) = avg_toc/10
x3($+1) = avg_toc_lu/10
x4($+1) = avg_toc_2/10
x5($+1) = avg_2/10
x6($+1) = avg_3/10

scf(0);
plot([3 5 10 100],x2,'r')
plot([3 5 10 100],x3,'g')
plot([3 5 10 100],x4,'B')
xgrid
xlabel('Nbre matrices')
ylabel('Temps execution')
legend('LDLT','MyLu1b','LDLT_cours',2)
xs2pdf(gcf(),'MyLuLdLtpetit');

n = 1000
avg = 0
avg_toc = 0
avg_toc_lu = 0
avg_toc_2 = 0
avg_2 = 0
avg_3 = 0 
for j=1 : 10
    A = toeplitz(rand(n,1))
    tic()
    [L,U] = mylu1b(A)
    avg_toc_lu = avg_toc_lu + toc()
    avg_2 = avg_2 +norm(A-((L)*(U)))      
    tic()
    [L2,D] = ldlt(A) 
    avg_toc = avg_toc + toc()
    Dt = zeros(n,n)
    for i = 1 : n
        Dt(i,i) = D(i)
    end
    avg = avg +norm(A-((L2)*(Dt)*L2'))
    tic()    
    [A1] = ldlt2(A) 
    avg_toc_2 = avg_toc_2 + toc()  
    B = zeros(n,n)
    for c = 1 : n
        B(c,c) = diag(A1)(c)
    end  
    avg_3 = avg_3 +norm(A-((tril(A1,-1)+eye(A))*(B)*(tril(A1,-1)+eye(A))'))   
end
disp(avg/10)
disp(avg_toc/10)
disp(avg_toc_lu/10)
x1($+1) = avg/10
x2($+1) = avg_toc/10
x3($+1) = avg_toc_lu/10
x4($+1) = avg_toc_2/10
x5($+1) = avg_2/10
x6($+1) = avg_3/10

scf(0);
plot(y,x2,'r')
plot(y,x3,'g')
plot(y,x4,'b')
xgrid
xlabel('Nbre matrices')
ylabel('Temps execution')
legend('LDLT','MyLu1b','LDLT_cours',2)
xs2pdf(gcf(),'MyLuLdLt');

scf(1);
plot(y,x2,'r')
plot(y,x5,'g')
plot(y,x6,'b')
xgrid
xlabel('Nbre matrices')
ylabel('norme(erreur)')
legend('LDLT','MyLu1b','LDLT_cours',2)
xs2pdf(gcf(),'Ldlt_erreur');
