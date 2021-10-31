# Pigasus Releases

## Pigasus 2.0
Pigasus 2.0 made the following main updates:
* Disaggregate Pigasus 1.0 into smaller component with natural boundary. 
* Standardize the interfaces between components to allow easier composition.
* Parameterization for different performance-resource tradeoff.
* Leaverage the reduced-version of Fluid framework to easily recompose Pigasus designs at Python lelvel. 
* Support FPGA-FPGA networked connection with credit-based flow control. Enable multi-FPGA scaling. 
* Redesign rule reduction logic to facilitate automation through Python template.
* Fix several corner case bugs. 

## Pigasus 1.0
Pigasus 1.0 is released at https://github.com/cmu-snap/pigasus. 
Following are key updates since the release of Pigasus 1.0. 
* Optimize the multiplication operations. After optimization, DSPs utilization becomes 0 and the LUTs ultilzation almost stays the same. (Credits to Dr. Moein Khazraee)
* Support production MX dev board with part number 1SM21BHU2F53E1VG. 
* Add a sample rule for the sample input packet trace. 
* Fix bugs of Flow reassembly race conditions.  

