!----------------------------------------------------------------------!
! optim.f90: a simple program that calls an optimization solver to
! optimize a simple parameterized objective function.
!----------------------------------------------------------------------!


!----------------------------------------------------------------------!
! solver_mod: a module defining an optimization solver
module solver_mod

implicit none
private
public:: solver

! OBJ: an abstract interface for an objective function
abstract interface
    subroutine OBJ(x, y)
    real, intent(in):: x
    real, intent(out):: y
    end subroutine OBJ
end interface

contains

! solver: a doing-nothing solver for demonstration. It is provided by a
! third library,  so  we CANNOT change its  interface to accept a hyper-
! parameter for `objective`.
subroutine solver(objective)
procedure(OBJ):: objective
real f
call objective(0.0, f)
end subroutine solver

end module solver_mod
!----------------------------------------------------------------------!


!----------------------------------------------------------------------!
program optimize

use solver_mod, only: solver
implicit none

! `hyper_parameter`: a hyperparameter for the objective function. In
! real applications, this parameter is not a constant, but a variable
! that cannot be predicted before the optimization starts.
real hyper_parameter
hyper_parameter = 42.0

call solver(objective)

contains

!--------------------------------------------------------------!
! objective: a simple objective function for demonstration.
! F2008 allows to pass internal procedures as actual arguments.
! See Note 12.18 on page 290 of WD 1539-1 J3/10-007r1 (F2008
! Working Document). We implement `objective` internally so that
! `hyper_parameter` is visible to it. We choose not to pass the
! parameter by a module variable, which is thread-unsafe.
subroutine objective(x, y)
real, intent(in):: x
real, intent(out):: y
y = (x+hyper_parameter)**2
end subroutine objective
!--------------------------------------------------------------!

end program optimize
!----------------------------------------------------------------------!
