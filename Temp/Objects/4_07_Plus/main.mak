SHELL := cmd.exe
CYGWIN=nontsec
export PATH := C:\Program Files (x86)\STMicroelectronics\stlink_server;C:\ST\STM32CubeCLT_1.21.0;C:\ST\STM32CubeCLT_1.21.0\CMake\bin;C:\ST\STM32CubeCLT_1.21.0\st-arm-clang\bin;C:\ST\STM32CubeCLT_1.21.0\Ninja\bin;C:\ST\STM32CubeCLT_1.21.0\GNU-tools-for-STM32\bin;C:\ST\STM32CubeCLT_1.21.0\STLink-gdb-server\bin;C:\ST\STM32CubeCLT_1.21.0\STM32CubeProgrammer\bin;C:\Python314\Scripts\;C:\Python314\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files\dotnet\;C:\Program Files\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\;C:\Program Files\PuTTY\;C:\Program Files\Git\cmd;C:\Program Files\nodejs\;C:\ProgramData\chocolatey\bin;C:\Program Files\TortoiseGit\bin;C:\Users\gries\AppData\Local\Programs\Python\Python313\Scripts\;C:\Users\gries\AppData\Local\Programs\Python\Python313\;C:\Users\gries\AppData\Local\Microsoft\WindowsApps;C:\Users\gries\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\gries\AppData\Roaming\Programs\Zero Install;C:\Users\gries\AppData\Roaming\npm;C:\Users\gries\AppData\Local\Microsoft\WinGet\Links;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\gries\AppData\Local\Microsoft\WinGet\Packages\oschwartz10612.Poppler_Microsoft.Winget.Source_8wekyb3d8bbwe\poppler-25.07.0\Library\bin;C:\Users\gries\AppData\Local\Programs\Python\Python313\Scripts\;C:\Users\gries\AppData\Local\Programs\Python\Python313\;C:\Users\gries\AppData\Local\Microsoft\WindowsApps;C:\Users\gries\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\gries\AppData\Roaming\Programs\Zero Install;C:\Users\gries\AppData\Roaming\npm;C:\Users\gries\AppData\Local\Microsoft\WinGet\Links;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\gries\AppData\Local\Microsoft\WinGet\Packages\oschwartz10612.Poppler_Microsoft.Winget.Source_8wekyb3d8bbwe\poppler-25.07.0\Library\bin
export AS_BUILD_MODE := Build
export AS_VERSION := 4.7.7.74 SP
export AS_COMPANY_NAME :=  
export AS_USER_NAME := gries
export AS_PATH := C:/BRAutomation/AS47
export AS_BIN_PATH := C:/BRAutomation/AS47/Bin-en
export AS_PROJECT_PATH := C:/SharedFolder/CControl
export AS_PROJECT_NAME := CControl
export AS_SYSTEM_PATH := C:/BRAutomation/AS/System
export AS_VC_PATH := C:/BRAutomation/AS47/AS/VC
export AS_TEMP_PATH := C:/SharedFolder/CControl/Temp
export AS_CONFIGURATION := 4_07_Plus
export AS_BINARIES_PATH := C:/SharedFolder/CControl/Binaries
export AS_GNU_INST_PATH := C:/BRAutomation/AS47/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH := $(AS_GNU_INST_PATH)/bin
export AS_GNU_INST_PATH_SUB_MAKE := C:/BRAutomation/AS47/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH_SUB_MAKE := $(AS_GNU_INST_PATH_SUB_MAKE)/bin
export AS_INSTALL_PATH := C:/BRAutomation/AS47
export WIN32_AS_PATH := "C:\BRAutomation\AS47"
export WIN32_AS_BIN_PATH := "C:\BRAutomation\AS47\Bin-en"
export WIN32_AS_PROJECT_PATH := "C:\SharedFolder\CControl"
export WIN32_AS_SYSTEM_PATH := "C:\BRAutomation\AS\System"
export WIN32_AS_VC_PATH := "C:\BRAutomation\AS47\AS\VC"
export WIN32_AS_TEMP_PATH := "C:\SharedFolder\CControl\Temp"
export WIN32_AS_BINARIES_PATH := "C:\SharedFolder\CControl\Binaries"
export WIN32_AS_GNU_INST_PATH := "C:\BRAutomation\AS47\AS\GnuInst\V4.1.2"
export WIN32_AS_GNU_BIN_PATH := "$(WIN32_AS_GNU_INST_PATH)\\bin" 
export WIN32_AS_INSTALL_PATH := "C:\BRAutomation\AS47"

.suffixes:

ProjectMakeFile:

	@'$(AS_BIN_PATH)/BR.AS.AnalyseProject.exe' '$(AS_PROJECT_PATH)/CControl.apj' -t '$(AS_TEMP_PATH)' -c '$(AS_CONFIGURATION)' -o '$(AS_BINARIES_PATH)'   -sfas -buildMode 'Build'   

