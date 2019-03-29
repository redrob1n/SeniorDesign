OpenCL

When running the make script, use the "-n" flag to see what commands will be run

The kernel.bsh file is the script that compiles the kernel, this script takes a long time to compile [on the order of hours]

To launch the program run "./ga_tsp"

////////////////////////////////////////////////////////////
When adding .cl files:
	-add the name of the ".cl" file to the end of the aocl compile line in the kernel.bsh script
	-the file name after the -o option in the build script will be the name of the fpga image file (.aocx)
////////////////////////////////////////////////////////////


In order to view fpga usage, run the aoc compile command with "-c" {this stops the compilation before creating the .aocx} followed by --report



