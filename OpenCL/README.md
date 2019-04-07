OpenCL
////////////////////////////////////////////////////////////
// Before compilation
////////////////////////////////////////////////////////////
(1) Must be shh'd into gpu2, doesn't work on gpu4
	--"$ssh -X gpu2"
(2) Set up altera environment
	--"$altera161"

////////////////////////////////////////////////////////////
// Compileing the OpenCl into .aoco and .aocx
////////////////////////////////////////////////////////////
There are two build scripts, one for building for an emulated environment and one for the actual hardware.The 
Makefiles for each are seperated into their respective folders. 
--The Makefiles ONLY compile the .cpp code for the projects. 
--The .cpp files are split into hostProgram_*_.cpp where * describes if the file is for the emulated environment or the hardware. 
--Each cpp file should be the same, with the exception of the name of the .aocx file used in the code. 
	--They were just split into two files for easier building.

--The hardware build has two scripts, one that builds both the .aocx and .cpp files. This one take many hours.
--The hw_compile_run_cpp.bsh is for strictly compiling the .cpp file, and then executing it

////////////////////////////////////////////////////////////
// Output of the builds
////////////////////////////////////////////////////////////
[EMULATED]
	--the .cpp file compiles to "tspEmulatedExe"
		--This is the file that is used to run the projecet "$./tspEmulatedExe"
	--the .cl file compiles to "emulated.aocx"

[HARDWARE]
	--the .cpp file compiles to "tspHwExe"
		--This is the file that is used to run the projecet "$./tspHwExe"
	--the .cl file compiles to "single_kernel.aoco" and "single_kernel.aocx"
		--the .cl compilation also creates a folder called "\single_kernel"
			--this is where all logs, and compilation info exist


When running the make script, use the "-n" flag to see what commands will be run
In order to view fpga usage, run the aoc compile command with "-c" {this stops the compilation before creating the .aocx} followed by --report



