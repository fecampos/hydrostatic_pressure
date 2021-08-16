# fortran Hydrostatic Pressure from a stratified fluid
This library contains Fortran scripts to compute pressure using density and the hydrostatic approximation.

**References**

Vallis, G. K. (2017). Atmospheric and oceanic fluid dynamics. Cambridge University Press. (3.3 Multi-layer shallow water equations)

**Getting Started**

1. Open *param.f90* and modify line 5,7,8,9,10 and 12 with your netcdf file (file_in), time (t_NAME), lon (x_NAME), lat (y_NAME), depth (z_NAME) and variable (rho_NAME):
```
      character(len=*),parameter :: file_in = "in.nc"
     
      character(len=*),parameter :: t_NAME = "time"
      
      character(len=*),parameter :: x_NAME = "longitude"
      
      character(len=*),parameter :: y_NAME = "latitude"
      
      character(len=*),parameter :: z_NAME = "depth"

      character(len=*),parameter :: rho_NAME = "rhopoto"
```
also modify line 14 and 20 with your lon grid number (nx), lat grid number (ny), deptth grid number (nz), time steps (nt), missing_val , scale factor (sf_sla) and add offset (af_sla):
```
      integer, parameter :: nx = 361, ny = 26, nz = 50, nt = 1
      
      real, parameter :: missing_val = -32767, sf_sla = 1, af_sla = 0
```
2. Open *jobcomp* and modify NETCDFLIB and NETCDFINC path with your netcdf path
3. Run **./jobcomp**
