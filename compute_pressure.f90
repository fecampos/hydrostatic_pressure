      program compute_pressure

      use netcdf

      use param

      implicit none

      retval = nf90_open(file_in, NF90_NOWRITE, ncid)

      retval = nf90_inq_varid(ncid, t_NAME, tvarid)
      retval = nf90_inq_varid(ncid, x_NAME, xvarid)
      retval = nf90_inq_varid(ncid, y_NAME, yvarid)
      retval = nf90_inq_varid(ncid, z_NAME, zvarid)

      retval = nf90_get_var(ncid, tvarid, T)
      retval = nf90_get_var(ncid, xvarid, X)
      retval = nf90_get_var(ncid, yvarid, Y)
      retval = nf90_get_var(ncid, zvarid, Z)

      retval = nf90_inq_varid(ncid, rho_NAME, rhovarid)
      retval = nf90_get_var(ncid, rhovarid, rho)

      retval = nf90_close(ncid)
     
      where(rho.ne.missing_val) 
        rho = rho-1000
      end where
    
      call multilayer_pressure(nx,ny,nz,Z,missing_val,rho,pres) 

      call write_pressure(nx,ny,nz-1,nt,X,Y,0.5*(Z(1:nz-1)+Z(2:nz)),T, &
           & missing_val,pres)

      end program
