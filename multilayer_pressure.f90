      subroutine multilayer_pressure(nx,ny,nz,Z,missing_val,rho,pres)

      implicit none

      integer, intent(in) :: nx, ny, nz

      real,intent(in) :: rho(nx,ny,nz), Z(nz), missing_val

      real, intent(out) :: pres(nx,ny,nz-1)

      real, parameter :: g = 9.80665

      real :: f0(nx,ny,nz), gred(nx,ny,nz-1), eta(nx,ny,nz)

      integer :: i, j, k, l, msk(nx,ny,nz), outmsk(nx,ny,nz-1), msk2d(nx,ny)

      msk = 0
      where(rho.ne.missing_val)
        msk = 1
      end where

      outmsk = 0.5*(msk(:,:,1:nz-1)+msk(:,:,2:nz))

      msk2d = sum(outmsk,3)

      f0 = rho

      where(f0.eq.missing_val)
        f0 = 0
      end where

      gred = g*(f0(:,:,2:nz)-f0(:,:,1:nz-1))*outmsk

      pres = gred

      where(outmsk.eq.0)  
        pres = missing_val
      end where

      !OMP PARALLEL DO
        do k = 1,nz
          eta(:,:,k) = Z(nz)-Z(k)
        end do
      !OMP END PARALLEL DO  

      !OMP PARALLEL DO
        do k = 1,nz-1
          pres(:,:,k) = sum(gred(:,:,1:k)*eta(:,:,1:k),3)
        end do
      !OMP END PARALLEL DO        

       where(outmsk.eq.0)
         pres = missing_val
       end where

      end subroutine
