#include "fintrf.h"

      subroutine mexFunction(nlhs, plhs, nrhs, prhs)

      integer, intent(in) :: nlhs, nrhs
      mwPointer, intent(in) :: prhs(*)
      mwPointer, intent(inout) :: plhs(*)

      if (nrhs /= 2) then
          call mexErrMsgIdAndTxt('Fortune:invalidNumInputs',            &
     &                           'Two input arguments required.')
      end if

      if (nlhs > 1) then
          call mexErrMsgIdAndTxt('Fortune:invalidNumOutputs',           &
     &                           'One output argument required.')
      end if

      if (0 /= mexCallMATLAB(1, plhs, 2, prhs, 'feval')) then
          call mexErrMsgIdAndTxt('Fortune:UnsuccessfulCall',            &
     &                           'Call failed.')
      end if

      return
      end subroutine mexFunction
