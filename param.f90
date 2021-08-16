      module param

      implicit none

      character(len=*),parameter :: file_in = "in.nc"
     
      character(len=*),parameter :: t_NAME = "time"
      character(len=*),parameter :: x_NAME = "longitude"
      character(len=*),parameter :: y_NAME = "latitude"
      character(len=*),parameter :: z_NAME = "depth"

      character(len=*),parameter :: rho_NAME = "rhopoto"

      integer, parameter :: nx = 361, ny = 26, nz = 50, nt = 1

      integer :: i, j

      real, parameter :: pi = 3.1415927, g = 9.80665

      real, parameter :: missing_val = -32767, sf_sla = 1, af_sla = 0

      real :: T(nt), X(nx), Y(ny), Z(nz), pres(nx,ny,nz-1,nt), rho(nx,ny,nz,nt)

      integer :: ncid, retval, tvarid, xvarid, yvarid, zvarid, rhovarid, presvarid

      end module
