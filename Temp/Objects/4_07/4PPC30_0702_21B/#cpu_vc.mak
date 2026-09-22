export AS_BUILD_MODE := Rebuild
export AS_SYSTEM_PATH := C:/Program\ Files/BRAutomation4/AS/System
export AS_BIN_PATH := C:/Program Files/BRAutomation4/AS412/Bin-en
export AS_INSTALL_PATH := C:/Program\ Files/BRAutomation4/AS412
export AS_PATH := C:/Program Files/BRAutomation4/AS412
export AS_VC_PATH := C:/Program\ Files/BRAutomation4/AS412/AS/VC
export AS_GNU_INST_PATH := C:/Program\ Files/BRAutomation4/AS412/AS/gnuinst/V4.1.2
export AS_STATIC_ARCHIVES_PATH := C:/SharedFolder/CControl_407_Gschneitner/Temp/Archives/4_07/4PPC30_0702_21B
export AS_CPU_PATH := C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B
export AS_CPU_PATH_2 := C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B
export AS_TEMP_PATH := C:/SharedFolder/CControl_407_Gschneitner/Temp
export AS_BINARIES_PATH := C:/SharedFolder/CControl_407_Gschneitner/Binaries
export AS_PROJECT_CPU_PATH := C:/SharedFolder/CControl_407_Gschneitner/Physical/4_07/4PPC30_0702_21B
export AS_PROJECT_CONFIG_PATH := C:/SharedFolder/CControl_407_Gschneitner/Physical/4_07
export AS_PROJECT_PATH := C:/SharedFolder/CControl_407_Gschneitner
export AS_PROJECT_NAME := CControl_Gschneitner
export AS_PLC := 4PPC30_0702_21B
export AS_TEMP_PLC := 4PPC30_0702_21B
export AS_USER_NAME := gries
export AS_CONFIGURATION := 4_07
export AS_COMPANY_NAME := \ 
export AS_VERSION := 4.12.9.18\ SP
export AS_WORKINGVERSION := 4.12


default: \
	$(AS_CPU_PATH)/Visu.br \



include $(AS_CPU_PATH)/Visu/Visu.mak
