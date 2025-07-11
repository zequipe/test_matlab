!----------------------------------------------------------------------!
! optimize.F90: a Fortran MEX file demonstrating a bug of MATLAB R2025a.
! To test, do the following in the MATLAB command window:
!
! mex-g optimize.F90; optimize(); 
!
! In MATLAB R2025a under Ubuntu 24.04 with gfortran 13.3.0, this causes
! a segmentation fault. In earlier versions of MATLAB, it works fine.
!----------------------------------------------------------------------!


#include "fintrf.h"


module problem_mod

implicit none
private
public:: OBJ, PROB_T

abstract interface
! OBJ: an abstract interface for an objective function
subroutine OBJ(x, y)
real, intent(in):: x
real, intent(out):: y
end subroutine OBJ
end interface


type PROB_T
    real hyper_parameter
    contains
        procedure:: objective
end type PROB_T

contains

    subroutine objective(self, x, y)
        class(PROB_T), intent(in):: self
        real, intent(in):: x
        real, intent(out):: y
        ! A simple objective function for demonstration.
        y = (x+self%hyper_parameter)**2
    end subroutine objective


end module problem_mod


!----------------------------------------------------------------------!
! solver_mod: a module defining an optimization solver
module solver_mod

use problem_mod, only: OBJ
implicit none
private
public:: solver


contains


! solver: a doing-nothing solver for demonstration. Its interface CANNOT
! be changed, e.g., to accept a hyper-parameter for `objective`.
subroutine solver(objective)
procedure(OBJ):: objective
real f
! The following line causes a segmentation fault in MATLAB R2025a when
! `solver(objective)` is called from `mexFunction`.
call objective(0.0, f)
end subroutine solver

end module solver_mod
!----------------------------------------------------------------------!


!----------------------------------------------------------------------!
! mexFunction: the entry point for the MEX function `optimize`, which
! calls `solver` from solver_mod to optimize `objective`.
subroutine mexFunction(nlhs, plhs, nrhs, prhs)

use problem_mod, only: PROB_T
use solver_mod, only: solver
implicit none
integer nlhs, nrhs
mwPointer plhs(*), prhs(*)
type(PROB_T):: prob

! `hyper_parameter`: a hyper-parameter for the objective function. In
! real applications, this parameter is not a constant, but a variable
! depending on the input arguments of `mexFunction`.
real hyper_parameter, f
hyper_parameter = 42
prob%hyper_parameter = hyper_parameter

! The following line works fine.
call prob%objective(0.0, f)

! The following line causes a segmentation fault in MATLAB R2025a.
call solver(prob%objective)

!contains

!!--------------------------------------------------------------!
!! objective: a simple objective function for demonstration.
!! F2008 allows to pass internal procedures as actual arguments.
!! See Note 12.18 on page 290 of WD 1539-1 J3/10-007r1 (F2008
!! Working Document). We implement `objective` internally so that
!! `hyper_parameter` is visible to it. Do NOT pass this parameter
!! by a module variable, which is thread-unsafe.
!subroutine objective(x, y)
!real, intent(in):: x
!real, intent(out):: y
!y = (x+hyper_parameter)**2
!end subroutine objective
!!--------------------------------------------------------------!

end subroutine mexFunction
!----------------------------------------------------------------------!
