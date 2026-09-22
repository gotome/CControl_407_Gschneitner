######################################################
#                                                    #
# Automatic generated Makefile for Visual Components #
#                                                    #
#                  Do NOT edit!                      #
#                                                    #
######################################################

VCC:=@'$(AS_BIN_PATH)/br.vc.pc.exe'
LINK:=@'$(AS_BIN_PATH)/BR.VC.Link.exe'
MODGEN:=@'$(AS_BIN_PATH)/BR.VC.ModGen.exe'
VCPL:=@'$(AS_BIN_PATH)/BR.VC.PL.exe'
VCHWPP:=@'$(AS_BIN_PATH)/BR.VC.HWPP.exe'
VCDEP:=@'$(AS_BIN_PATH)/BR.VC.Depend.exe'
VCFLGEN:=@'$(AS_BIN_PATH)/BR.VC.lfgen.exe'
VCREFHANDLER:=@'$(AS_BIN_PATH)/BR.VC.CrossReferenceHandler.exe'
VCXREFEXTENDER:=@'$(AS_BIN_PATH)/BR.AS.CrossRefVCExtender.exe'
RM=CMD /C DEL
PALFILE_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Palette.vcr
VCCFLAGS_Visu4Z=-server -proj Visu4Z -vc '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/VCObject.vc' -prj_path '$(AS_PROJECT_PATH)' -temp_path '$(AS_TEMP_PATH)' -cfg $(AS_CONFIGURATION) -plc $(AS_PLC) -plctemp $(AS_TEMP_PLC) -cpu_path '$(AS_CPU_PATH)'
VCFIRMWARE=4.73.5
VCFIRMWAREPATH=$(AS_VC_PATH)/Firmware/V4.73.5/SG4
VCOBJECT_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/VCObject.vc
VCSTARTUP='vcstart.br'
VCLOD='vclod.br'
VCSTPOST='vcstpost.br'
TARGET_FILE_Visu4Z=$(AS_CPU_PATH)/Visu4Z.br
OBJ_SCOPE_Visu4Z=Visualisierung
PRJ_PATH_Visu4Z=$(AS_PROJECT_PATH)
SRC_PATH_Visu4Z=$(AS_PROJECT_PATH)/Logical/$(OBJ_SCOPE_Visu4Z)/Visu4Z
TEMP_PATH_Visu4Z=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu4Z
TEMP_PATH_Shared=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared
TEMP_PATH_ROOT_Visu4Z=$(AS_TEMP_PATH)
VC_LIBRARY_LIST_Visu4Z=$(TEMP_PATH_Visu4Z)/libraries.vci
VC_XREF_BUILDFILE_Visu4Z=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.build
VC_XREF_CLEANFILE=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.clean
VC_LANGUAGES_Visu4Z=$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr
CPUHWC='$(TEMP_PATH_Visu4Z)/cpuhwc.vci'
VC_STATIC_OPTIONS_Visu4Z='$(TEMP_PATH_Visu4Z)/vcStaticOptions.xml'
VC_STATIC_OPTIONS_Shared='$(TEMP_PATH_Shared)/vcStaticOptions.xml'

DSOFLAGS=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)'
LIB_SHARED=$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/vcshared.vca

#
# Shared Runtime Options
#
VCRS_OBJECT=$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/vcrt_s.vco
VCRS_SOURCE=$(AS_PROJECT_PATH)/Logical/VCShared/Package.vcp

# All Shared Source Objects
VCR_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr 

TXTGRP_SHARED_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmEvent.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmState.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/DateTimeFormats.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/httpURL_SDM.txtgrp 

VCUG_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Length.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Mass.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Volume.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Power.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Memory.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Pressure.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Temperatures.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Energy.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_GradC_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_GradC_1.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_MWh.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Memory.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_MinutenMilli_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_MinutenSekunden_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Minuten_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Pascal_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Prozent100_1.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Prozent_1.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_ProzentProMin_1.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Prozent_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_SekundenMilli_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_SekundenMilli_1.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_SekundenProStunde_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_SekundenZehntel_1.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Sekunden_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Sekunden_1.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_StundenMinuten_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Stunden_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_GrammProKubik_1.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Bar_1.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_mmH2O_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_MeterProSekunde_1.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_KubikmeterProH_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_LuftmengeBox.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Quadratmeter_1.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Meter_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Quadratmeter_0.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Kilowattstunden_1.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Kilowatt_1.vcug 

ALCFG_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/AlarmSystem.alcfg 

ALGRP_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/SystemAlarms.algrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/Fehler.algrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/System.algrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/Warnung.algrp 

DSO_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Internal.dso \
	$(AS_PROJECT_PATH)/Logical/VCShared/DataSources/DataSource.dso 

CVINFO_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo 



# UnitGroups
VCUG_OBJECTS_Visu4Z = $(addprefix $(AS_CPU_PATH)/VCShared/vcug., $(notdir $(VCUG_SOURCES_Visu4Z:.vcug=.vco)))

$(AS_CPU_PATH)/VCShared/vcug.Length.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Length.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Mass.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Mass.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Volume.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Volume.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Power.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Power.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Memory.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Memory.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Pressure.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Pressure.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Temperatures.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Temperatures.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Energy.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Energy.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_GradC_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_GradC_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_GradC_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_GradC_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_MWh.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_MWh.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Memory.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Memory.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_MinutenMilli_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_MinutenMilli_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_MinutenSekunden_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_MinutenSekunden_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Minuten_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Minuten_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Pascal_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Pascal_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Prozent100_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Prozent100_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Prozent_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Prozent_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_ProzentProMin_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_ProzentProMin_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Prozent_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Prozent_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_SekundenMilli_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_SekundenMilli_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_SekundenMilli_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_SekundenMilli_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_SekundenProStunde_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_SekundenProStunde_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_SekundenZehntel_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_SekundenZehntel_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Sekunden_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Sekunden_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Sekunden_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Sekunden_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_StundenMinuten_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_StundenMinuten_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Stunden_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Stunden_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_GrammProKubik_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_GrammProKubik_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Bar_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Bar_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_mmH2O_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_mmH2O_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_MeterProSekunde_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_MeterProSekunde_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_KubikmeterProH_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_KubikmeterProH_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_LuftmengeBox.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_LuftmengeBox.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Quadratmeter_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Quadratmeter_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Meter_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Meter_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Quadratmeter_0.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Quadratmeter_0.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Kilowattstunden_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Kilowattstunden_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/vcug.UG_Kilowatt_1.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/UG_Kilowatt_1.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#UnitGroups END




# AlarmGroups
ALGRP_OBJECTS_Visu4Z = $(addprefix $(AS_CPU_PATH)/VCShared/algrp., $(notdir $(ALGRP_SOURCES_Visu4Z:.algrp=.vco)))

$(AS_CPU_PATH)/VCShared/algrp.SystemAlarms.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/SystemAlarms.algrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/algrp.Fehler.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/Fehler.algrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/algrp.System.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/System.algrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/algrp.Warnung.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/Warnung.algrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#AlarmGroups END




# AlarmSystem
ALCFG_OBJECTS_Visu4Z = $(addprefix $(AS_CPU_PATH)/VCShared/alcfg., $(notdir $(ALCFG_SOURCES_Visu4Z:.alcfg=.vco)))

$(AS_CPU_PATH)/VCShared/alcfg.AlarmSystem.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/AlarmSystem.alcfg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#AlarmSystem END




# Text Groups
TXTGRP_SHARED_OBJECTS_Visu4Z = $(addprefix $(AS_CPU_PATH)/VCShared/txtgrp., $(notdir $(TXTGRP_SHARED_SOURCES_Visu4Z:.txtgrp=.vco)))

$(AS_CPU_PATH)/VCShared/txtgrp.AlarmEvent.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmEvent.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/txtgrp.AlarmState.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmState.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/txtgrp.DateTimeFormats.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/DateTimeFormats.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(AS_CPU_PATH)/VCShared/txtgrp.httpURL_SDM.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/httpURL_SDM.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#Text Groups END


#
# Datapoint Objects
#
$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/dso.Internal.vco: $(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Internal.dso 
	 $(VCC) -f '$<' -o '$@' $(DSOFLAGS) $(VCCFLAGS_Visu4Z) -p Visu4Z -vcr 4735 -sfas

$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/dso.DataSource.vco: $(AS_PROJECT_PATH)/Logical/VCShared/DataSources/DataSource.dso 
	 $(VCC) -f '$<' -o '$@' $(DSOFLAGS) $(VCCFLAGS_Visu4Z) -p Visu4Z -vcr 4735 -sfas

DPT_OBJECTS = $(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/dpt.DataPointList.vco
DSO_OBJECTS_Visu4Z=$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/dso.Internal.vco $(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/dso.DataSource.vco 
$(DSO_OBJECTS_Visu4Z): $(DSO_SOURCES_Visu4Z)


#
# Building the Shared Runtime Options
#
$(VCRS_OBJECT) : $(VCRS_SOURCE)
	$(VCC) -f '$<' -o '$@' -ct shared -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -sl  $(VCCFLAGS_Visu4Z) -p Visu4Z -vcr 4735 -sfas

#
# The Shared Module
#
SHARED_MODULE=$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcshared.br
SHARED_CCF=$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/vcshared.ccf
DEL_SHARED_CCF=$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/vcshared.ccf.lfl

$(SHARED_MODULE) : $(SHARED_CCF)
	 $(MODGEN) -so $(VC_STATIC_OPTIONS_Shared) -fw '$(VCFIRMWAREPATH)' -m $(VCSTARTUP) -v V1.00.0 -vc '$(VCOBJECT_Visu4Z)' -f '$<' -o '$@' -d vcgclass -profile 'False'

$(VCUG_OBJECTS_Visu4Z): $(VC_LANGUAGES_Visu4Z)
$(TXTGRP_SHARED_OBJECTS_Visu4Z): $(VC_LANGUAGES_Visu4Z)
$(ALGRP_OBJECTS_Visu4Z): $(VC_LANGUAGES_Visu4Z)
$(ALCFG_OBJECTS_Visu4Z): $(VC_LANGUAGES_Visu4Z)

$(SHARED_CCF): $(VCRS_OBJECT) $(VCR_OBJECTS_Visu4Z) $(VCUG_OBJECTS_Visu4Z) $(ALGRP_OBJECTS_Visu4Z) $(ALCFG_OBJECTS_Visu4Z) $(DSO_OBJECTS_Visu4Z) $(TXTGRP_SHARED_OBJECTS_Visu4Z) $(CVINFO_OBJECTS_Visu4Z)
	-@CMD /Q /C if exist "$(DEL_SHARED_CCF)" DEL /F /Q "$(DEL_SHARED_CCF)" 2>nul
	 @$(VCFLGEN) '$@.lfl' '$(VCR_OBJECTS_Visu4Z:.vco=.vco|)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)'
	 @$(VCFLGEN) '$@.lfl' -mask .vcug -vcp '$(AS_PROJECT_PATH)/Logical/VCShared/Package.vcp' -temp '$(TEMP_PATH_Shared)' -prj '$(PRJ_PATH_Visu4Z)'
	 @$(VCFLGEN) '$@.lfl' -mask .algrp -vcp '$(AS_PROJECT_PATH)/Logical/VCShared/Package.vcp' -temp '$(TEMP_PATH_Shared)' -prj '$(PRJ_PATH_Visu4Z)'
	 @$(VCFLGEN) '$@.lfl' '$(ALCFG_OBJECTS_Visu4Z:.vco=.vco|)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)'
	 @$(VCFLGEN) '$@.lfl' -mask .txtgrp -vcp '$(AS_PROJECT_PATH)/Logical/VCShared/Package.vcp' -temp '$(TEMP_PATH_Shared)' -prj '$(PRJ_PATH_Visu4Z)'
	 @$(VCFLGEN) '$@.lfl' '$(DSO_OBJECTS_Visu4Z:.vco=.vco|)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)'
	 @$(VCFLGEN) '$@.lfl' '$(DPT_OBJECTS:.vco=.vco|)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)'
	 @$(VCFLGEN) '$@.lfl' '$(VCRS_OBJECT)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)'
	 $(LINK) '$@.lfl' -o '$@' -lib '$(LIB_SHARED)' -P '$(AS_PROJECT_PATH)' -m 'shared resources' -profile 'False' -warningLevel2 -name Visu4Z -vcr 4735 -sfas


$(LIB_SHARED): $(SHARED_CCF)
