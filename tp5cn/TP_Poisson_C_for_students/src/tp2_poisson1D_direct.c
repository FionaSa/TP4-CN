/******************************************/
/* tp2_poisson1D_direct.c                 */
/* This file contains the main function   */
/* to solve the Poisson 1D problem        */
/******************************************/
#include "lib_poisson1D.h"
int main(int argc,char *argv[])
/* ** argc: Number of arguments */
/* ** argv: Values of arguments */
{
  int ierr;
  int jj;
  int nbpoints, la;
  int ku, kl, kv, lab;
  int *ipiv;
  int info;
  int NRHS;
  double T0, T1;
  double *RHS, *EX_SOL, *X;
  double *AB;

  double temp, relres;

  NRHS=1;
  nbpoints=102;
  la=nbpoints-2;
  T0=-5.0;
  T1=5.0;

  printf("--------- Poisson 1D ---------\n\n");
  RHS=(double *) malloc(sizeof(double)*la);
  EX_SOL=(double *) malloc(sizeof(double)*la);
  X=(double *) malloc(sizeof(double)*la);

  set_grid_points_1D(X, &la);
  set_dense_RHS_DBC_1D(RHS,&la,&T0,&T1);
  set_analytical_solution_DBC_1D(EX_SOL, X, &la, &T0, &T1);
  
  write_vec(RHS, &la, "RHS.dat");
  write_vec(EX_SOL, &la, "EX_SOL.dat");
  write_vec(X, &la, "X_grid.dat");

  kv=1;
  ku=1;
  kl=1;
  lab=kv+kl+ku+1;

  AB = (double *) malloc(sizeof(double)*lab*la);

  info=0;

  /* working array for pivot used by LU Factorization */
  ipiv = (int *) calloc(la, sizeof(int));

  int row = 0; //

  if (row == 1){ // LAPACK_ROW_MAJOR
  //lab = 3;
    set_GB_operator_rowMajor_poisson1D(AB, &lab, &la);
    write_GB_operator_rowMajor_poisson1D(AB, &lab, &la, "AB_row.dat");
    write_GB_operator_rowMajor_poisson1D(RHS, &lab, &la, "B_row.dat");

    info = LAPACKE_dgbsv(LAPACK_ROW_MAJOR,la, kl, ku, NRHS, AB, la, ipiv, RHS, NRHS);
    
    write_GB_operator_rowMajor_poisson1D(RHS, &lab, &la, "AB*x_row.dat");

   printf("\n PIVOT %d\n",ipiv);
 
  } 
  else { // LAPACK_COL_MAJOR
    set_GB_operator_colMajor_poisson1D(AB, &lab, &la, &kv);
    //write_GB_operator_colMajor_poisson1D(AB, &lab, &la, "AB_col.dat");
    write_GB_operator_colMajor_poisson1D(RHS, &lab, &la, "B_col.dat");

    info = LAPACKE_dgbsv(LAPACK_COL_MAJOR,la, kl, ku, NRHS, AB, lab, ipiv, RHS, la);
        write_GB_operator_colMajor_poisson1D(RHS, &lab, &la, "DGBSV_col.dat");

  }    

  
  printf("\n INFO DGBSV = %d\n",info);

  write_xy(RHS, X, &la, "SOL.dat");

  /* Relative residual */
  temp = cblas_ddot(la, RHS, 1, RHS,1);
  temp = sqrt(temp);
  cblas_daxpy(la, -1.0, RHS, 1, EX_SOL, 1);
  relres = cblas_ddot(la, EX_SOL, 1, EX_SOL,1);
  relres = sqrt(relres);
  relres = relres / temp;
  
  printf("\nThe relative residual error is relres = %e\n",relres);



  // DGBMV
  

   // set_dense_RHS_DBC_1D(RHS,&la,&T0,&T1);


  if (row == 1){ // LAPACK_ROW_MAJOR
    //set_GB_operator_rowMajor_poisson1D(AB, &lab, &la);
    /*kv = 0;
  lab = 3;*/
      set_GB_operator_rowMajor_poisson1D(AB, &lab, &la);

    //set_dense_RHS_DBC_1D(RHS,&la,&T0,&T1);
          set_dense_RHS_x_1D(RHS,&la,1);
      set_dense_RHS_x_1D(EX_SOL,&la,0);
    write_GB_operator_rowMajor_poisson1D(AB, &lab, &la, "AB-kv_row.dat");
    /*
      *
      */
    cblas_dgbmv(CblasRowMajor,111,lab,la,kl,ku,1.0,AB,la,RHS,1.0,0,EX_SOL,NRHS);
    
    write_GB_operator_rowMajor_poisson1D(EX_SOL, &lab, &la, "DGBMV_row.dat");

 
  } 
  else { // LAPACK_COL_MAJOR
  kv = 0;
  lab = 3;
   set_GB_operator_colMajor_poisson1D(AB, &lab, &la, &kv);
    set_dense_RHS_DBC_1D(RHS,&la,&T0,&T1);
    set_analytical_solution_DBC_1D(EX_SOL, X, &la, &T0, &T1);


    write_vec(EX_SOL, &la, "EX_SOL_dgbvm.dat");

    //write_GB_operator_colMajor_poisson1D(AB, &lab, &la, "AB_col.dat");
    // cblas_dgbmv(layout,111,
    write_GB_operator_colMajor_poisson1D(AB, &lab, &la, "AB-kv_col.dat");
    write_vec(RHS, &la, "B_dgbvm.dat");

    cblas_dgbmv(CblasColMajor,111,la,lab,kl,ku,-1.0,AB,la,EX_SOL,1.0,1.0,RHS,1.0);
    write_vec(RHS, &la, "RHS_dgbvm.dat");

   // info = LAPACKE_dgbsv(LAPACK_COL_MAJOR,la, kl, ku, NRHS, AB, lab, ipiv, RHS, la);
  }    


  free(RHS);
  free(EX_SOL);
  free(X);
  free(AB);
  free(ipiv);

  printf("\n\n--------- End -----------\n");
}
