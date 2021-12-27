exec('./functions/jacobi.sci')
exec('./functions/richardson.sce')
// Création matrice poisson1d
//b = rand(5,1)

//x = rand(1,100)

//B = A*x

//B = rand (100,100)
//

//xex = A\b
 
//[x,sp] = jacobi(A,b)
//[x2,sp2] = richardson(C,b)

//x2 = jacobi2(A,b)


x1= []
x2= []
x3 = []
x4 = []
x5 = []
x6 = []
x7 = []
x8 = []
x9 = []
x10 = []
y = [3 5 10 100]// 1000]
n = 3
avg = 0
avg_2 = 0
avg_toc = 0
avg_toc_2 = 0 
avg_ar_j = 0
avg_av_j = 0 
avg_ar_r = 0
avg_av_r = 0 
for j=1 : 10
    A = zeros(n,n)
    
    A(1,1) = 2
    A(1,2) = -1
    A(n,n) = 2
    A(n,n-1) = -1
    for i=2:n-1
        A(i,i) = 2
        A(i,i+1) = -1
        A(i,i-1) = -1
    end    
    b = rand(n,1)    
    C = A
    xex = A\b
    tic()
    [xj,sp] = richardson(A,b)
    avg_toc = avg_toc + toc()
    avg_ar_r = avg_ar_r+ (norm(xex-xj)/norm(xex))
    avg_av_r = avg_av_r+ (norm(b-A*xj)/norm(A)*norm(xj) )      
    tic()
    [xj,sp] = jacobi(C,b) 
    avg_toc_2 = avg_toc_2 + toc()
    avg_ar_j = avg_ar_j+ norm(xex-xj)/norm(xex)
    avg_av_j = avg_av_j+ norm(b-A*xj)/norm(A)*norm(xj)   
    avg_2 = avg_2 +sp        
end
x1($+1) = avg/10
x3($+1) = avg_toc/10
x4($+1) = avg_toc_2/10
x2($+1) = avg_2/10
x6($+1) = avg_ar_r/10
x7($+1) = avg_av_r/10
x8($+1) = avg_ar_j/10
x9($+1) = avg_av_j/10
n = 5
avg = 0
avg_2 = 0
avg_toc = 0
avg_toc_2 = 0 
avg_ar_j = 0
avg_av_j = 0 
avg_ar_r = 0
avg_av_r = 0 
for j=1 : 10
    A = zeros(n,n)
    
    A(1,1) = 2
    A(1,2) = -1
    A(n,n) = 2
    A(n,n-1) = -1
    for i=2:n-1
        A(i,i) = 2
        A(i,i+1) = -1
        A(i,i-1) = -1
    end    
    b = rand(n,1)    
    C = A
    xex = A\b    
    tic()
    [xj,sp] = richardson(A,b)
    avg_toc = avg_toc + toc()
    avg = avg +sp     
    avg_ar_r = avg_ar_r+ (norm(xex-xj)/norm(xex))
    avg_av_r = avg_av_r+ norm(b-A*xj)/norm(A)*norm(xj)       
    tic()
    [xj,sp] = jacobi(C,b) 
    avg_toc_2 = avg_toc_2 + toc()
    avg_ar_j = avg_ar_j+ norm(xex-xj)/norm(xex)
    avg_av_j = avg_av_j+ norm(b-A*xj)/norm(A)*norm(xj)   
    avg_2 = avg_2 +sp        
end
x1($+1) = avg/10
x3($+1) = avg_toc/10
x4($+1) = avg_toc_2/10
x2($+1) = avg_2/10
x6($+1) = avg_ar_r/10
x7($+1) = avg_av_r/10
x8($+1) = avg_ar_j/10
x9($+1) = avg_av_j/10

n = 10
avg = 0
avg_2 = 0
avg_toc = 0
avg_toc_2 = 0 
avg_ar_j = 0
avg_av_j = 0 
avg_ar_r = 0
avg_av_r = 0 
for j=1 : 10
    A = zeros(n,n)
    
    A(1,1) = 2
    A(1,2) = -1
    A(n,n) = 2
    A(n,n-1) = -1
    for i=2:n-1
        A(i,i) = 2
        A(i,i+1) = -1
        A(i,i-1) = -1
    end    
    b = rand(n,1)    
    C = A
    xex = A\b    
    tic()
    [xj,sp] = richardson(A,b)
    avg_toc = avg_toc + toc()
    avg = avg +sp     
    avg_ar_r = avg_ar_r+ norm(xex-xj)/norm(xex)
    avg_av_r = avg_av_r+ norm(b-A*xj)/norm(A)*norm(xj)       
    tic()
    [xj,sp] = jacobi(C,b) 
    avg_toc_2 = avg_toc_2 + toc()
    avg_ar_j = avg_ar_j+ norm(xex-xj)/norm(xex)
    avg_av_j = avg_av_j+ norm(b-A*xj)/norm(A)*norm(xj)   
    avg_2 = avg_2 +sp        
end
x1($+1) = avg/10
x3($+1) = avg_toc/10
x4($+1) = avg_toc_2/10
x2($+1) = avg_2/10
x6($+1) = avg_ar_r/10
x7($+1) = avg_av_r/10
x8($+1) = avg_ar_j/10
x9($+1) = avg_av_j/10

n = 100
avg = 0
avg_2 = 0
avg_toc = 0
avg_toc_2 = 0 
avg_ar_j = 0
avg_av_j = 0 
avg_ar_r = 0
avg_av_r = 0 
for j=1 : 10
    A = zeros(n,n)
    
    A(1,1) = 2
    A(1,2) = -1
    A(n,n) = 2
    A(n,n-1) = -1
    for i=2:n-1
        A(i,i) = 2
        A(i,i+1) = -1
        A(i,i-1) = -1
    end    
    b = rand(n,1)    
    C = A
    xex = A\b    
    tic()
    [xj,sp] = richardson(A,b)
    avg_toc = avg_toc + toc()
    avg = avg +sp     
    avg_ar_r = avg_ar_r+ norm(xex-xj)/norm(xex)
    avg_av_r = avg_av_r+ norm(b-A*xj)/norm(A)*norm(xj)       
    tic()
    [xj,sp] = jacobi(C,b) 
    avg_toc_2 = avg_toc_2 + toc()
    avg_ar_j = avg_ar_j+ norm(xex-xj)/norm(xex)
    avg_av_j = avg_av_j+ norm(b-A*xj)/norm(A)*norm(xj)   
    avg_2 = avg_2 +sp        
end
x1($+1) = avg/10
x3($+1) = avg_toc/10
x4($+1) = avg_toc_2/10
x2($+1) = avg_2/10
x6($+1) = avg_ar_r/10
x7($+1) = avg_av_r/10
x8($+1) = avg_ar_j/10
x9($+1) = avg_av_j/10


scf(1);
plot(y,x3,'r')
plot(y,x4,'g')
xgrid
xlabel('Nbre matrices')
ylabel('Temps d execution')
legend('Richardson','Jacobi',2)
xs2pdf(gcf(),'execution');

scf(2);
plot(y,x8,'g')
xgrid
xlabel('Nbre matrices')
ylabel('Erreur arrière')
legend('Jacobi',2)
xs2pdf(gcf(),'erreur_ar_j');

scf(4);
plot(y,x6,'r')
xgrid
xlabel('Nbre matrices')
ylabel('Erreur arrière')
legend('Richardson',2)
xs2pdf(gcf(),'erreur_ar_r');

scf(3);
plot(y,x7,'r')
xgrid
xlabel('Nbre matrices')
ylabel('Erreur avant')
legend('Richardson',2)
xs2pdf(gcf(),'erreur_av_r');

scf(5);
plot(y,x9,'g')
xgrid
xlabel('Nbre matrices')
ylabel('Erreur avant')
legend('Jacobi',2)
xs2pdf(gcf(),'erreur_av_j');
/*
scf(0);
plot([3 5 10 100],x2,'r')
plot([3 5 10 100],x3,'g')
plot([3 5 10 100],x4,'B')
xgrid
xlabel('Nbre matrices')
ylabel('Temps execution')
legend('LDLT','MyLu1b','LDLT_cours',2)
xs2pdf(gcf(),'MyLuLdLtpetit');*/
/*
n = 1000
avg = 0
avg_2 = 0
avg_toc = 0
avg_toc_2 = 0 
for j=1 : 10
    A = zeros(n,n)
    
    A(1,1) = 2
    A(1,2) = -1
    A(n,n) = 2
    A(n,n-1) = -1
    for i=2:n-1
        A(i,i) = 2
        A(i,i+1) = -1
        A(i,i-1) = -1
    end    
    b = rand(n,1)    
    C = A
    tic()
    [xr,sp] = richardson(A,b)
    avg_toc = avg_toc + toc()
    avg = avg +sp     
    tic()
    [xj,sp] = jacobi(C,b) 
    avg_toc_2 = avg_toc_2 + toc()
    avg_2 = avg_2 +sp  
    tic()       
end
x1($+1) = avg/10
x3($+1) = avg_toc/10
x4($+1) = avg_toc_2/10
x2($+1) = avg_2/10
*/
/*
scf(0);
plot(y,x1,'r')
plot(y,x2,'g')
xgrid
xlabel('Nbre matrices')
ylabel('Convergence')
legend('Richardson','Jacobi',2)
xs2pdf(gcf(),'convergence');

scf(1);
plot(y,x3,'r')
plot(y,x4,'g')
xgrid
xlabel('Nbre matrices')
ylabel('Temps d execution')
legend('Richardson','Jacobi',2)
xs2pdf(gcf(),'execution');

disp("cest finis")
