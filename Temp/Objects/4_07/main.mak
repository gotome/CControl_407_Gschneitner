SHELL := cmd.exe
CYGWIN=nontsec
export PATH := C:\Program Files\Common Files\Siemens\Automation\Simatic OAM\bin;C:\Program Files (x86)\STMicroelectronics\stlink_server;C:\ST\STM32CubeCLT_1.21.0;C:\ST\STM32CubeCLT_1.21.0\CMake\bin;C:\ST\STM32CubeCLT_1.21.0\st-arm-clang\bin;C:\ST\STM32CubeCLT_1.21.0\Ninja\bin;C:\ST\STM32CubeCLT_1.21.0\GNU-tools-for-STM32\bin;C:\ST\STM32CubeCLT_1.21.0\STLink-gdb-server\bin;C:\ST\STM32CubeCLT_1.21.0\STM32CubeProgrammer\bin;C:\Python314\Scripts\;C:\Python314\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Program Files\dotnet\;C:\Program Files\Microsoft SQL Server\150\Tools\Binn\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\;C:\Program Files\PuTTY\;C:\Program Files\Git\cmd;C:\Program Files\nodejs\;C:\ProgramData\chocolatey\bin;C:\Program Files\TortoiseGit\bin;C:\Users\gries\AppData\Local\Programs\Python\Python313\Scripts\;C:\Users\gries\AppData\Local\Programs\Python\Python313\;C:\Users\gries\AppData\Local\Microsoft\WindowsApps;C:\Users\gries\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\gries\AppData\Roaming\Programs\Zero Install;C:\Users\gries\AppData\Roaming\npm;C:\Users\gries\AppData\Local\Microsoft\WinGet\Links;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\gries\AppData\Local\Microsoft\WinGet\Packages\oschwartz10612.Poppler_Microsoft.Winget.Source_8wekyb3d8bbwe\poppler-25.07.0\Library\bin;C:\Users\gries\AppData\Local\Programs\Python\Python313\Scripts\;C:\Users\gries\AppData\Local\Programs\Python\Python313\;C:\Users\gries\AppData\Local\Microsoft\WindowsApps;C:\Users\gries\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\gries\AppData\Roaming\Programs\Zero Install;C:\Users\gries\AppData\Roaming\npm;C:\Users\gries\AppData\Local\Microsoft\WinGet\Links;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\gries\AppData\Local\Microsoft\WinGet\Packages\oschwartz10612.Poppler_Microsoft.Winget.Source_8wekyb3d8bbwe\poppler-25.07.0\Library\bin;C:\Program Files\BRAutomation4\AS412\Bin-en\4.12;C:\Program Files\BRAutomation4\AS412\Bin-en\4.11;C:\Program Files\BRAutomation4\AS412\Bin-en\4.10;C:\Program Files\BRAutomation4\AS412\Bin-en\4.9;C:\Program Files\BRAutomation4\AS412\Bin-en\4.8;C:\Program Files\BRAutomation4\AS412\Bin-en\4.7;C:\Program Files\BRAutomation4\AS412\Bin-en\4.6;C:\Program Files\BRAutomation4\AS412\Bin-en\4.5;C:\Program Files\BRAutomation4\AS412\Bin-en\4.4;C:\Program Files\BRAutomation4\AS412\Bin-en\4.3;C:\Program Files\BRAutomation4\AS412\Bin-en\4.2;C:\Program Files\BRAutomation4\AS412\Bin-en\4.1;C:\Program Files\BRAutomation4\AS412\Bin-en\4.0;C:\Program Files\BRAutomation4\AS412\Bin-en
export AS_BUILD_MODE := BuildAndTransfer
export AS_VERSION := 4.12.9.18 SP
export AS_WORKINGVERSION := 4.12
export AS_COMPANY_NAME :=  
export AS_USER_NAME := gries
export AS_PATH := C:/Program Files/BRAutomation4/AS412
export AS_BIN_PATH := C:/Program Files/BRAutomation4/AS412/Bin-en
export AS_PROJECT_PATH := C:/SharedFolder/CControl_Gschneitner
export AS_PROJECT_NAME := CControl_Gschneitner
export AS_SYSTEM_PATH := C:/Program\ Files/BRAutomation4/AS/System
export AS_VC_PATH := C:/Program\ Files/BRAutomation4/AS412/AS/VC
export AS_TEMP_PATH := C:/SharedFolder/CControl_Gschneitner/Temp
export AS_CONFIGURATION := 4_07
export AS_BINARIES_PATH := C:/SharedFolder/CControl_Gschneitner/Binaries
export AS_GNU_INST_PATH := C:/Program\ Files/BRAutomation4/AS412/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH := C:/Program\ Files/BRAutomation4/AS412/AS/GnuInst/V4.1.2/4.9/bin
export AS_GNU_INST_PATH_SUB_MAKE := C:/Program Files/BRAutomation4/AS412/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH_SUB_MAKE := C:/Program Files/BRAutomation4/AS412/AS/GnuInst/V4.1.2/4.9/bin
export AS_INSTALL_PATH := C:/Program\ Files/BRAutomation4/AS412
export WIN32_AS_PATH := "C:\Program Files\BRAutomation4\AS412"
export WIN32_AS_BIN_PATH := "C:\Program Files\BRAutomation4\AS412\Bin-en"
export WIN32_AS_PROJECT_PATH := "C:\SharedFolder\CControl_Gschneitner"
export WIN32_AS_SYSTEM_PATH := "C:\Program Files\BRAutomation4\AS\System"
export WIN32_AS_VC_PATH := "C:\Program Files\BRAutomation4\AS412\AS\VC"
export WIN32_AS_TEMP_PATH := "C:\SharedFolder\CControl_Gschneitner\Temp"
export WIN32_AS_BINARIES_PATH := "C:\SharedFolder\CControl_Gschneitner\Binaries"
export WIN32_AS_GNU_INST_PATH := "C:\Program Files\BRAutomation4\AS412\AS\GnuInst\V4.1.2"
export WIN32_AS_GNU_BIN_PATH := "C:\Program Files\BRAutomation4\AS412\AS\GnuInst\V4.1.2\bin"
export WIN32_AS_INSTALL_PATH := "C:\Program Files\BRAutomation4\AS412"

.suffixes:

ProjectMakeFile:

	@'$(AS_BIN_PATH)/4.9/BR.AS.AnalyseProject.exe' '$(AS_PROJECT_PATH)/CControl_Gschneitner.apj' -t '$(AS_TEMP_PATH)' -c '$(AS_CONFIGURATION)' -o '$(AS_BINARIES_PATH)'   -sfas -buildMode 'BuildAndTransfer'   

