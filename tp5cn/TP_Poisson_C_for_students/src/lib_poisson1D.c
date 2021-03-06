/**********************************************/
/* lib_poisson1D.c                            */
/* Numerical library developed to solve 1D    */ 
/* Poisson problem (Heat equation)            */
/**********************************************/
#include "lib_poisson1D.h"

void set_GB_operator_rowMajor_poisson1D(double* AB, int *lab, int *la){
  int ii, jj , kk ;

  //On parcours ldab donc leading dimension càd row
  for ( ii = 0; ii <(*la) ; ii++ )
  {
    //On calcule la longueur d'une ligne 
    //kk = jj*(*la);
    if(*lab>3)
    {
      for ( jj = 0 ; jj < (*lab % 3) ; jj ++)
            AB[(jj)*(*la)+ii]= 0;
      
        AB[(jj)*(*la)+ii]=-1.0;
        AB[(jj+1)*(*la)+ii]=2.0;
        AB[(jj+2)*(*la)+ii]=-1.0;  

        AB[jj*(*la)]=0.0;

        AB[(jj+3)*(*la)-1]=0.0;      

    }else {
          AB[ii]=-1.0;
        AB[(1*(*la))+ii]=2.0;
        AB[(2*(*la))+ii]=-1.0;  
        AB[0]=0.0;

        AB[(3)*(*la)-1]=0.0;
    } 

  }



}
void set_GB_operator_colMajor_poisson1D(double* AB, int *lab, int *la, int *kv){
  int ii, jj, kk;
  for (jj=0;jj<(*la);jj++){
    kk = jj*(*lab);
    if (*kv>=0){
      for (ii=0;ii< *kv;ii++){
	        AB[kk+ii]=0.0;
      }
    }
    AB[kk+ *kv]=-1.0;
    AB[kk+ *kv+1]=2.0;
    AB[kk+ *kv+2]=-1.0;
  }
  AB[0]=0.0;
  if (*kv == 1) {AB[1]=0;}
  
  AB[(*lab)*(*la)-1]=0.0;
}

void set_GB_operator_colMajor_poisson1D_Id(double* AB, int *lab, int *la, int *kv){
  int ii, jj, kk;
  for (jj=0;jj<(*la);jj++){
    kk = jj*(*lab);
    if (*kv>=0){
      for (ii=0;ii< *kv;ii++){
	AB[kk+ii]=0.0;
      }
    }
    AB[kk+ *kv]=0.0;
    AB[kk+ *kv+1]=1.0;
    AB[kk+ *kv+2]=0.0;
  }
  AB[1]=0.0;
  AB[(*lab)*(*la)-1]=0.0;
}

void set_dense_RHS_DBC_1D(double* RHS, int* la, double* BC0, double* BC1){
  int jj;
  RHS[0]= *BC0;
  RHS[(*la)-1]= *BC1;
  for (jj=1;jj<(*la)-1;jj++){
    RHS[jj]=0.0;
  }
}  

void set_dense_RHS_x_1D(double* RHS, int* la, double x)
{
  int jj;
  for (jj=0;jj<(*la);jj++){
    RHS[jj]=x;
  }
}  

void set_analytical_solution_DBC_1D(double* EX_SOL, double* X, int* la, double* BC0, double* BC1){
  int jj;
  double h, DELTA_T;
  DELTA_T=(*BC1)-(*BC0);
  for (jj=0;jj<(*la);jj++){
    EX_SOL[jj] = (*BC0) + X[jj]*DELTA_T;
  }
}  

void set_grid_points_1D(double* x, int* la){
  int jj;
  double h;
  h=1.0/(1.0*((*la)+1));
  for (jj=0;jj<(*la);jj++){
    x[jj]=(jj+1)*h;
  }
}

void write_GB_operator_rowMajor_poisson1D(double* AB, int* lab, int* la, char* filename){
  FILE * file;
  int ii,jj;
  file = fopen(filename, "w");
  //Numbering from 1 to la
  if (file != NULL){
    for (ii=0;ii<(*lab);ii++){
      for (jj=0;jj<(*la);jj++){
	fprintf(file,"%lf\t",AB[ii*(*la)+jj]);
      }
      fprintf(file,"\n");
    }
    fclose(file);
  }
  else{
    perror(filename);
  }
}

void write_GB_operator_colMajor_poisson1D(double* AB, int* lab, int* la, char* filename){
  FILE * file;
  int ii,jj;
  file = fopen(filename, "w");

  if (file != NULL){
    for (jj=0;jj<(*la);jj++){
      for (ii=0;ii<(*lab);ii++){
	      fprintf(file,"%lf\t",AB[jj*(*lab)+ii]);
      }
      fprintf(file,"\n");
    }
    fclose(file);
  }
  else{
    perror(filename);
  }    
  
  
}

void write_vec(double* vec, int* la, char* filename){
  int jj;
  FILE * file;
  file = fopen(filename, "w");
  // Numbering from 1 to la
  if (file != NULL){
    for (jj=0;jj<(*la);jj++){
      fprintf(file,"%lf\n",vec[jj]);
    }
    fclose(file);
  }
  else{
    perror(filename);
  } 
}  

void write_xy(double* vec, double* x, int* la, char* filename){
  int jj;
  FILE * file;
  file = fopen(filename, "w");
  // Numbering from 1 to la
  if (file != NULL){
    for (jj=0;jj<(*la);jj++){
      fprintf(file,"%lf\t%lf\n",x[jj],vec[jj]);
    }
    fclose(file);
  }
  else{
    perror(filename);
  } 
}  

void eig_poisson1D(double* eigval, int *la){
  int ii;
  double scal;
  for (ii=0; ii< *la; ii++){
    scal=(1.0*ii+1.0)*M_PI_2*(1.0/(*la+1));
    eigval[ii]=sin(scal);
    eigval[ii]=4*eigval[ii]*eigval[ii];
  } 
}

double eigmax_poisson1D(int *la){
  double eigmax;
  eigmax=sin(*la *M_PI_2*(1.0/(*la+1)));
  eigmax=4*eigmax*eigmax;
  return eigmax;
}

double eigmin_poisson1D(int *la){
  double eigmin;
  eigmin=sin(M_PI_2*(1.0/(*la+1)));
  eigmin=4*eigmin*eigmin;
  return eigmin;
}

double richardson_alpha_opt(int *la){
  //TODO
}

void richardson_alpha(double *AB, double *RHS, double *X, double *alpha_rich, int *lab, int *la,int *ku, int*kl, double *tol, int *maxit){
  //TODO
}
void mylu_rowMajor(double *AB, int* lab, int *la){

   int ii, jj , kk ;

   jj = *lab%3;

   //Cas 0
    if(*lab>3)
    {  

                                            //A reste le même
                                            //B reste le même
        AB[(jj+2)*(*la)]/=AB[(jj+1)*(*la)]; //C = c/b

    }else {

        AB[(2*(*la))]/=AB[(1*(*la))];  
    }  

  //On parcours ldab donc leading dimension càd row
  for ( ii = 1; ii <(*la) ; ii++ )
  {
    //On calcule la longueur d'une ligne 
    //kk = jj*(*la);
    if(*lab>3)
    {    
                                                              //A reste le même
        AB[(jj+1)*(*la)+ii]-=AB[(jj)*(*la)+ii]*AB[(jj+2)*(*la)+(ii-1)]; //Bk = Bk - Ak * Ck-1 
        AB[(jj+2)*(*la)+ii]/=AB[(jj+1)*(*la)+ii]; //Ck = Ck/Bk

    }else {
          AB[ii]=-1.0;
        AB[(1*(*la))+ii]-=AB[ii]*AB[(2*(*la))+(ii-1)];
        AB[(2*(*la))+ii]/=AB[(1*(*la))+ii];

    } 

  }
}

void mylu_colMajor(double* AB, int *lab, int *la, int *kv){
  int ii, jj, kk,k1 = 3;


    if (*kv>=0){
      k1 = 4;
      for (ii=0;ii< *kv;ii++){
	        AB[ii]=0.0;
      }
    }
    AB[*kv+2]/=AB[ *kv+1];
  

  for (jj=1;jj<(*la);jj++){
    kk = jj*(*lab);
    if (*kv>=0){
      for (ii=0;ii< *kv;ii++){
	        AB[kk+ii]=0.0;
      }
    }

    printf("kv+2 = %lf\n",AB[(kk-3)+ *kv+2]);

    AB[kk+ *kv+1]-=AB[kk+ *kv]*AB[(kk-k1)+ *kv+2];
    AB[kk+ *kv+2]/=AB[kk+ *kv+1];
  }

}  


 

