  
  /******************************************/
/* tp2_poisson1D_direct.c                 */
/* This file contains the main function   */
/* to solve the Poisson 1D problem        */
/******************************************/
#include "lib_poisson1D.h"
int main()
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
  kv=1;
  ku=1;
  kl=1;
  lab=kv+kl+ku+1;
  AB = (double *) malloc(sizeof(double)*lab*la);

  printf("--------- Poisson 1D ---------\n\n");
  RHS=(double *) malloc(sizeof(double)*la);
  EX_SOL=(double *) malloc(sizeof(double)*la);
  X=(double *) malloc(sizeof(double)*la);

  set_grid_points_1D(X, &la);
  set_dense_RHS_DBC_1D(RHS,&la,&T0,&T1);
  set_analytical_solution_DBC_1D(EX_SOL, X, &la, &T0, &T1);
  

  int row = 0;
  // DGBMV
  

  if (row == 1){ // LAPACK_ROW_MAJOR

      set_GB_operator_rowMajor_poisson1D(AB, &lab, &la);



    write_GB_operator_rowMajor_poisson1D(AB, &lab, &la, "GB_row.dat");

      mylu_rowMajor(AB,  &lab, &la);

    write_GB_operator_rowMajor_poisson1D(AB, &lab, &la, "MyLu_row.dat");

 
  } 
  else { // LAPACK_COL_MAJOR

    set_GB_operator_colMajor_poisson1D(AB, &lab, &la, &kv);

    write_GB_operator_colMajor_poisson1D(AB, &lab, &la, "GB_col.dat");

      mylu_colMajor(AB,  &lab, &la, &kv);

    write_GB_operator_colMajor_poisson1D(AB, &lab, &la, "MyLu_col.dat");
  }    
}