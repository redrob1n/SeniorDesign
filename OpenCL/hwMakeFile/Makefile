###############################################################################
#
#Senior Design Genetic Algorithm Build Script
#
###############################################################################



#######################################################
# Altera OCL Flags and Install Directories
#######################################################
AOCL_COMPILE_CONFIG=$(shell aocl compile-config)
LINKFLGS=$(shell aocl link-config)
OCLINSTALL	:= /opt/altera16.1/hld


#######################################################
# INTEL and NVIDIA OCL Flags and Install Directoreis
#######################################################
#LINKFLGS	:= -lOpenCL
LINKFLGS := -g -lOpenCL -lstdc++ -L/opt/altera16.1/hld/board/terasic/de5net/linux64/lib -L/opt/altera16.1/hld/host/linux64/lib -Wl,--no-as-needed -lalteracl -lacl_emulator_kernel_rt  -lalterahalmmd -lelf -lrt -ldl

#######################################################
# Add source files here
#######################################################
EXECUTABLE	:= tspHwExe
# C/C++ source files (compiled with gcc / c++)
CCFILES		:= hostProgram_hw.cpp

#######################################################
# Rules and Targets
include /usr/local/OpenCL/OpenCL_altera/common/common_opencl.mk













































