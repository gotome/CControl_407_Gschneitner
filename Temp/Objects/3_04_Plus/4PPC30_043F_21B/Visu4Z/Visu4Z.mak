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
# include Shared and Font Makefile (only once)
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCFntDat/Font_Visu4Z.mak
ifneq ($(VCINC),1)
	VCINC=1
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/VCShared.mak
endif

DEPENDENCIES_Visu4Z=-d vcgclass -profile 'False'
DEFAULT_STYLE_SHEET_Visu4Z='Source[local].StyleSheet[Color]'
SHARED_MODULE=$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcshared.br
LFNTFLAGS_Visu4Z=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)'
BDRFLAGS_Visu4Z=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)'

# Local Libs
LIB_LOCAL_OBJ_Visu4Z=$(TEMP_PATH_Visu4Z)/localobj.vca

# Hardware sources
PANEL_HW_OBJECT_Visu4Z=$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu4Z/dis.Hardware.vco
PANEL_HW_VCI_Visu4Z=$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu4Z/dis.Hardware.vci
PANEL_HW_SOURCE_Visu4Z=C:/SharedFolder/CControl/Physical/3_04_Plus/Hardware.hw 
DIS_OBJECTS_Visu4Z=$(PANEL_HW_OBJECT_Visu4Z) $(KEYMAP_OBJECTS_Visu4Z)

# KeyMapping flags
$(TEMP_PATH_Visu4Z)/dis.PS2-Keyboard.vco: $(AS_PROJECT_PATH)/Physical/3_04_Plus/4PPC30_043F_21B/VC/PS2-Keyboard.dis $(PANEL_HW_SOURCE_Visu4Z)
	$(VCHWPP) -f '$(PANEL_HW_SOURCE_Visu4Z)' -o '$(subst .vco,.vci,$(TEMP_PATH_Visu4Z)/dis.PS2-Keyboard.vco)' -n Visu4Z -d Visu4Z -pal '$(PALFILE_Visu4Z)' -c '$(AS_CONFIGURATION)' -p '$(AS_PLC)' -ptemp '$(AS_TEMP_PLC)' -B 'S4.93' -L 'visapi: V*' -hw '$(CPUHWC)' -warninglevel 2 -so $(VC_STATIC_OPTIONS_Visu4Z) -sos $(VC_STATIC_OPTIONS_Shared) -keyboard '$(AS_PROJECT_PATH)/Physical/3_04_Plus/4PPC30_043F_21B/VC/PS2-Keyboard.dis' -fp '$(AS_VC_PATH)/Firmware/V4.73.5/SG4' -prj '$(AS_PROJECT_PATH)' -apj 'CControl' -sfas -vcob '$(VCOBJECT_Visu4Z)'
	$(VCC) -f '$(subst .vco,.vci,$@)' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -k '$(VCVK_SOURCES_Visu4Z)' $(VCCFLAGS_Visu4Z) -p Visu4Z -sfas

KEYMAP_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Physical/3_04_Plus/4PPC30_043F_21B/VC/4PPC30_043F_21B.dis $(AS_PROJECT_PATH)/Physical/3_04_Plus/4PPC30_043F_21B/VC/PS2-Keyboard.dis 
KEYMAP_OBJECTS_Visu4Z=$(TEMP_PATH_Visu4Z)/dis.PS2-Keyboard.vco 

# All Source Objects
TXTGRP_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_DropdownSprachen.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_EinAus.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_KlappenBoxen.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_PwEbene.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_Status.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_Zusatzmeldungen.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_AlarmeGruppe.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_ButtonAbluftklappe.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_ButtonAbluftvent.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_ButtonUmschaltklappen.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_FrischlDachluft.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_LaufRestBox.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_NameSteuerung.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_ParameterUmschaltpunkt.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_Trockengut.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_UeberschriftWloSho.txtgrp 

FNINFO_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial10pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial10px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial11pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial12pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial12px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial14pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial14px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial16pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial16px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial18pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial20pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial20px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial22pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial24pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial26pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial30pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial6px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial7px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial8pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial8px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial9pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial9pxValue.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/Arial9px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Fonts/DefaultFont.fninfo 

BMINFO_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA3.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadVGA_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA2_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA3_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA1_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadVGA.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/NumPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/NumPad.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AcknowledgeReset.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmActive.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmBypassOFF.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmBypassON.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmInactive.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmLatched.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmNotQuit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmQuit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/Reset.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ResetAcknowledge.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/Triggered.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ListPadHor.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ListPadVer.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/backward_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/backward_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/global_area_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/global_area_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/forward_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/forward_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/control_button_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/control_button_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/right_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/right_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/left_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/left_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/up_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/down_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/multi_up_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/multi_up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/multi_down_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/multi_down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ProgressBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/down_active_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/down_pressed_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/up_active_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/global_area_gradient_upside.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/global_area_gradient_downside.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/frame_header.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/up_pressed_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/EditPadVGA.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/EditPadVGA_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneNumPad_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneListPadVer_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPad_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPadQVGA1_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPadQVGA1_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPadQVGA2_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPadQVGA3_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneEditpadQVGA2_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneEditPadQVGA3_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneEditPadVga_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneEditPadVga_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneListPadHor_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneNumPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb1_Dklgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb1_Schwarz.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb2_Dklgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb2_Schwarz.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb35.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb35_Dklgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb35_Schwarz.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr1_Dklgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr1_Schwarz.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr2_Dklgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr2_Schwarz.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr35.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr35_Dklgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Ohne_Dlkgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Ohne_Gelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NavigationAlarme.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NavigationHome.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NavigationIstwerte.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NavigationSettings.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconFehler.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconWarnung.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HintergrundGedimmt.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteAb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteAuf.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_RundballenGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Sanduhr_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_SattDefizit_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Stoppuhr_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Stoppuhr_2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TempFeuchte_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconAustritt.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconEintritt.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconHochdruck.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconLuftmengeKlein.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconNiederdruck.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TachoKlein.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Haus.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconKanaldruck.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Tacho.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconLuftmenge.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Loginscreen.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_LuefterGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_LuefterGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_LuefterGrossRot.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_EntfeuchterGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_EntfeuchterGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_EntfeuchterRot.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeizregisterGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeizregisterGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeizregisterRot.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconAbtauung.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_OfenGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_OfenGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_OfenRot.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconsKlappen.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconsSensoren.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Sanduhr_2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TempFeuchte_2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Trocknungsbilanz.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteSlider01.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteSlider02.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaLowerPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaLowerReleased.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaNumberPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaNumberReleased.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaUpperPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaUpperReleased.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NumPad4Z_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NumPad4Z_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteAbKlein.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteAufKlein.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteRefresh.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeuGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeuGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HolzGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HolzGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HopfenGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HopfenGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_KraeuterGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_KraeuterGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_MaisGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_MaisGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_RundballenGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_WeizenGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_WeizenGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeuMittelGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeuMittelGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HolzMittelGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HolzMittelGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HopfenMittelGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HopfenMittelGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_KraeuterMittelGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_KraeuterMittelGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_MaisMittelGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_MaisMittelGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_RundballenMittelGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_RundballenMittelGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_WeizenMittelGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_WeizenMittelGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconCheckmarkGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconCheckmarkGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteEinGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteEinGesperrt.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteEinGrau.bminfo 

BMGRP_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/AlphaPadQVGA.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/AlphaPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/AlarmEvent.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/AlarmState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/AcknowledgeState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/AlphaPadC304Zoll.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_Entfeuchter.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_Heizregister.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_IconRestzeit.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_LuefterGross.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_LuefterKlein.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_Ofen.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_TastenLeer75px.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_TrockengutGross.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_TrockengutKlein.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_TrockengutMittel.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/Borders.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BypassState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/NavigationPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/NumPadC30_4Zoll.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/NumPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/SliderAusEin.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_TasteEinAusLuftentf.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_Checkmark.bmgrp 

PAGE_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_000_HM_Init.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_001_HM_Login.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_010_HM_Uebersicht.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_100_AL_Aktuelle.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_101_AL_Historie.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_400_IW_Istwerte01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_401_IW_Istwerte02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_402_IW_Istwerte03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_403_IW_Istwerte04.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_404_IW_Istwerte05.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_600_SYS_Uebersicht.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_610_SYS_Anmeldung.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_620_SET_AllgemeineEinst.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_630_SET_EinstTrocknungsboxen01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_631_SET_EinstTrocknungsboxen02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_632_SET_EinstTrocknungsboxen03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_640_SET_Netzwerk01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_641_SET_Netzwerk02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_650_SET_DisplayUhrzeit.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_660_SET_Datenaufzeichnung.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_700_SET_UebersichtServiceber.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_710_SET_Ausstattung01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_711_SET_Ausstattung02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_712_SET_Ausstattung03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_713_SET_Ausstattung04.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_714_SET_Ausstattung05.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_715_SET_Ausstattung06.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_716_SET_Ausstattung07.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_720_SET_Sensoren01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_721_SET_Sensoren02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_722_SET_Sensoren03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_723_SET_Sensoren04.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_724_SET_Sensoren05.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_730_SET_KonfigBoxen01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_731_SET_KonfigBoxen02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_732_SET_Parameter.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_740_SET_Ventilatoren01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_741_SET_Ventilatoren02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_742_SET_Ventilatoren03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_750_SET_Klappen01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_751_SET_Klappen02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_752_SET_Klappen03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_760_SET_WarmluftScheitholz.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_770_SET_Heizregister.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_780_SET_Entfeuchter01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_782_SET_Entfeuchter03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_783_SET_Entfeuchter04.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_790_SET_Verzoegerungen01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_800_TEST_Uebersicht.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_810_TEST_Ventilatoren01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_811_TEST_Ventilatoren02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_812_TEST_Ventilatoren03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_820_TEST_Klappen01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_821_TEST_Klappen02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_822_TEST_Klappen03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_823_TEST_Klappen04.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_824_TEST_Klappen05.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_830_TEST_Warmluftofen01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_831_TEST_Warmluftofen02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_832_TEST_Warmluftofen03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_840_TEST_Entfeuchter01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_841_TEST_Entfeuchter02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_843_TEST_Entfeuchter04.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_850_TEST_Sensorik01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_851_TEST_Sensorik02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_852_TEST_Sensorik03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_860_TEST_Absicherung01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_861_TEST_Absicherung02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_781_SET_Entfeuchter02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_784_SET_Entfeuchter05.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_785_SET_Entfeuchter06.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_786_SET_Entfeuchter07.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_791_SET_Verzoegerungen02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_842_TEST_Entfeuchter03.page 

LAYER_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/HintergrundAb.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/HintergrundAufAb.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/HintergrundAuf.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/HintergrundOhne.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsBox.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsSensoren.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDreiBoxen.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gEinVentilator.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gEineBox.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gTrocknungsbilanz.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gVierBoxen.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gZeitfenster.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gZweiBoxen.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gZweiVentilatoren.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsEntfeuchter.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsHeizregister.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsKlappen.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsOfen.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsVentilatoren.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/MessageDatumFalsch.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/NavigationAlarme.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/NavigationHome.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/NavigationIstwerte.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/NavigationSettings.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/SrvcUhrzeit.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gMldgStockkontrolle.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gInselbetrieb.layer 

VCS_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/StyleSheets/Color.vcs \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/StyleSheets/Gray.vcs 

BDR_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/BackwardActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/BackwardPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Bump.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ControlActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ControlPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/DownActiveControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/DownPressedControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Etched.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Flat_black1.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Flat_black.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Flat_grey.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ForwardActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ForwardPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb1Dklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb1Schwarz.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb1.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb2Dklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb2Schwarz.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb2.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb35Dklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb35Schwarz.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb35.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHeader.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr1Dklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr1Schwarz.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr1.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr2Dklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr2Schwarz.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr2.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr35Dklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr35.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameOhneDklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameOhneGelb.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/GlobalAreaActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/GlobalAreaPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/MultiScrollDownActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/MultiScrollDownPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/MultiScrollUpActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/MultiScrollUpPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ProgressBarBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/RaisedInner.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Raised.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollDownActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollDownPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollLeftActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollLeftPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollRightActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollRightPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollUpActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollUpPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/SliderAusKlein1.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/SliderEinKlein1.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/SunkenOuter.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Sunken.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/UpActiveControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/UpPressedControl.bdr 

TPR_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/AlphaPadC307Zoll.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/AlphaPadQVGA.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/AlphaPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/EditPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/NavigationPad_hor.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/NavigationPad_ver.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/NumPadC307Zoll.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/NumPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/NumPad4Zoll.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/AlphaPad4Zoll.tpr 

TDC_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/TrendData.tdc 

TRD_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/AbluftFeuchte.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/AbluftTemp.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/AustrittFeuchte.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/AustrittTemp.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/DachluftFeuchte.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/DachluftTemp.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/EintrittFeuchte.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/EintrittTemp.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/FrischluftFeuchte.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/FrischluftTemp.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/Hochdruck.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/Kanaldruck.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/LeistungAktuell.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/Luftgeschw.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/Niederdruck.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/TrockenluftFeuchte.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/TrockenluftTemp.trd 

TRE_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/TrendLeistung.tre \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/Trendkurve01.tre \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/Trendkurve02.tre 

CLM_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/Ampel.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/GelbGrau.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/GrauGelb.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/GrauGruenNumeric.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/GrauGruen.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/RotGruen.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/TastenKonfigKlappen.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/TextfarbeBackgSw.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/Textfarbe.clm 

VCVK_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/VirtualKeys.vcvk 

VCR_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Palette.vcr 

# Runtime Object sources
VCR_OBJECT_Visu4Z=$(TEMP_PATH_Visu4Z)/vcrt.vco
VCR_SOURCE_Visu4Z=$(SRC_PATH_Visu4Z)/package.vcp
# All Source Objects END

#Panel Hardware
$(PANEL_HW_VCI_Visu4Z): $(PANEL_HW_SOURCE_Visu4Z) $(VC_LIBRARY_LIST_Visu4Z) $(KEYMAP_SOURCES_Visu4Z) $(PALFILE_Visu4Z)
	$(VCHWPP) -f '$<' -o '$@' -n Visu4Z -d Visu4Z -pal '$(PALFILE_Visu4Z)' -c '$(AS_CONFIGURATION)' -p '$(AS_PLC)' -ptemp '$(AS_TEMP_PLC)' -B 'S4.93' -L 'visapi: V*' -verbose 'False' -profile 'False' -hw '$(CPUHWC)' -warninglevel 2 -so $(VC_STATIC_OPTIONS_Visu4Z) -sos $(VC_STATIC_OPTIONS_Shared) -fp '$(AS_VC_PATH)/Firmware/V4.73.5/SG4' -sfas -prj '$(AS_PROJECT_PATH)' -apj 'CControl' -vcob '$(VCOBJECT_Visu4Z)'

$(PANEL_HW_OBJECT_Visu4Z): $(PANEL_HW_VCI_Visu4Z) $(VC_LIBRARY_LIST_Visu4Z)
	$(VCC) -f '$(subst .vco,.vci,$@)' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -k '$(VCVK_SOURCES_Visu4Z)' $(VCCFLAGS_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


# Pages
PAGE_OBJECTS_Visu4Z = $(addprefix $(TEMP_PATH_Visu4Z)/page., $(notdir $(PAGE_SOURCES_Visu4Z:.page=.vco)))

$(TEMP_PATH_Visu4Z)/page._000_HM_Init.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_000_HM_Init.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._001_HM_Login.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_001_HM_Login.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._010_HM_Uebersicht.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_010_HM_Uebersicht.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._100_AL_Aktuelle.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_100_AL_Aktuelle.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._101_AL_Historie.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_101_AL_Historie.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._400_IW_Istwerte01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_400_IW_Istwerte01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._401_IW_Istwerte02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_401_IW_Istwerte02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._402_IW_Istwerte03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_402_IW_Istwerte03.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._403_IW_Istwerte04.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_403_IW_Istwerte04.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._404_IW_Istwerte05.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_404_IW_Istwerte05.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._600_SYS_Uebersicht.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_600_SYS_Uebersicht.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._610_SYS_Anmeldung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_610_SYS_Anmeldung.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._620_SET_AllgemeineEinst.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_620_SET_AllgemeineEinst.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._630_SET_EinstTrocknungsboxen01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_630_SET_EinstTrocknungsboxen01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._631_SET_EinstTrocknungsboxen02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_631_SET_EinstTrocknungsboxen02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._632_SET_EinstTrocknungsboxen03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_632_SET_EinstTrocknungsboxen03.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._640_SET_Netzwerk01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_640_SET_Netzwerk01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._641_SET_Netzwerk02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_641_SET_Netzwerk02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._650_SET_DisplayUhrzeit.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_650_SET_DisplayUhrzeit.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._660_SET_Datenaufzeichnung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_660_SET_Datenaufzeichnung.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._700_SET_UebersichtServiceber.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_700_SET_UebersichtServiceber.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._710_SET_Ausstattung01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_710_SET_Ausstattung01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._711_SET_Ausstattung02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_711_SET_Ausstattung02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._712_SET_Ausstattung03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_712_SET_Ausstattung03.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._713_SET_Ausstattung04.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_713_SET_Ausstattung04.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._714_SET_Ausstattung05.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_714_SET_Ausstattung05.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._715_SET_Ausstattung06.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_715_SET_Ausstattung06.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._716_SET_Ausstattung07.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_716_SET_Ausstattung07.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._720_SET_Sensoren01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_720_SET_Sensoren01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._721_SET_Sensoren02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_721_SET_Sensoren02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._722_SET_Sensoren03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_722_SET_Sensoren03.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._723_SET_Sensoren04.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_723_SET_Sensoren04.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._724_SET_Sensoren05.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_724_SET_Sensoren05.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._730_SET_KonfigBoxen01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_730_SET_KonfigBoxen01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._731_SET_KonfigBoxen02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_731_SET_KonfigBoxen02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._732_SET_Parameter.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_732_SET_Parameter.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._740_SET_Ventilatoren01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_740_SET_Ventilatoren01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._741_SET_Ventilatoren02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_741_SET_Ventilatoren02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._742_SET_Ventilatoren03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_742_SET_Ventilatoren03.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._750_SET_Klappen01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_750_SET_Klappen01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._751_SET_Klappen02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_751_SET_Klappen02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._752_SET_Klappen03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_752_SET_Klappen03.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._760_SET_WarmluftScheitholz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_760_SET_WarmluftScheitholz.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._770_SET_Heizregister.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_770_SET_Heizregister.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._780_SET_Entfeuchter01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_780_SET_Entfeuchter01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._782_SET_Entfeuchter03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_782_SET_Entfeuchter03.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._783_SET_Entfeuchter04.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_783_SET_Entfeuchter04.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._790_SET_Verzoegerungen01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_790_SET_Verzoegerungen01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._800_TEST_Uebersicht.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_800_TEST_Uebersicht.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._810_TEST_Ventilatoren01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_810_TEST_Ventilatoren01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._811_TEST_Ventilatoren02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_811_TEST_Ventilatoren02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._812_TEST_Ventilatoren03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_812_TEST_Ventilatoren03.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._820_TEST_Klappen01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_820_TEST_Klappen01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._821_TEST_Klappen02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_821_TEST_Klappen02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._822_TEST_Klappen03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_822_TEST_Klappen03.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._823_TEST_Klappen04.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_823_TEST_Klappen04.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._824_TEST_Klappen05.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_824_TEST_Klappen05.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._830_TEST_Warmluftofen01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_830_TEST_Warmluftofen01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._831_TEST_Warmluftofen02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_831_TEST_Warmluftofen02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._832_TEST_Warmluftofen03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_832_TEST_Warmluftofen03.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._840_TEST_Entfeuchter01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_840_TEST_Entfeuchter01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._841_TEST_Entfeuchter02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_841_TEST_Entfeuchter02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._843_TEST_Entfeuchter04.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_843_TEST_Entfeuchter04.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._850_TEST_Sensorik01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_850_TEST_Sensorik01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._851_TEST_Sensorik02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_851_TEST_Sensorik02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._852_TEST_Sensorik03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_852_TEST_Sensorik03.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._860_TEST_Absicherung01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_860_TEST_Absicherung01.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._861_TEST_Absicherung02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_861_TEST_Absicherung02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._781_SET_Entfeuchter02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_781_SET_Entfeuchter02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._784_SET_Entfeuchter05.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_784_SET_Entfeuchter05.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._785_SET_Entfeuchter06.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_785_SET_Entfeuchter06.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._786_SET_Entfeuchter07.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_786_SET_Entfeuchter07.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._791_SET_Verzoegerungen02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_791_SET_Verzoegerungen02.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/page._842_TEST_Entfeuchter03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Pages/_842_TEST_Entfeuchter03.page $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu4Z)/StyleSheets/Color.vcs' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#Pages END




# Stylesheets
VCS_OBJECTS_Visu4Z = $(addprefix $(TEMP_PATH_Visu4Z)/vcs., $(notdir $(VCS_SOURCES_Visu4Z:.vcs=.vco)))

$(TEMP_PATH_Visu4Z)/vcs.Color.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/StyleSheets/Color.vcs
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/vcs.Gray.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/StyleSheets/Gray.vcs
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -P '$(AS_PROJECT_PATH)' -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#Stylesheets END




# Layers
LAYER_OBJECTS_Visu4Z = $(addprefix $(TEMP_PATH_Visu4Z)/layer., $(notdir $(LAYER_SOURCES_Visu4Z:.layer=.vco)))

$(TEMP_PATH_Visu4Z)/layer.HintergrundAb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/HintergrundAb.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.HintergrundAufAb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/HintergrundAufAb.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.HintergrundAuf.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/HintergrundAuf.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.HintergrundOhne.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/HintergrundOhne.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gDetailsBox.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsBox.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gDetailsSensoren.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsSensoren.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gDreiBoxen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDreiBoxen.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gEinVentilator.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gEinVentilator.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gEineBox.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gEineBox.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gTrocknungsbilanz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gTrocknungsbilanz.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gVierBoxen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gVierBoxen.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gZeitfenster.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gZeitfenster.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gZweiBoxen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gZweiBoxen.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gZweiVentilatoren.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gZweiVentilatoren.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gDetailsEntfeuchter.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsEntfeuchter.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gDetailsHeizregister.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsHeizregister.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gDetailsKlappen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsKlappen.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gDetailsOfen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsOfen.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gDetailsVentilatoren.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gDetailsVentilatoren.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.MessageDatumFalsch.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/MessageDatumFalsch.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.NavigationAlarme.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/NavigationAlarme.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.NavigationHome.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/NavigationHome.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.NavigationIstwerte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/NavigationIstwerte.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.NavigationSettings.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/NavigationSettings.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.SrvcUhrzeit.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/SrvcUhrzeit.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gMldgStockkontrolle.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gMldgStockkontrolle.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/layer.gInselbetrieb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Layers/gInselbetrieb.layer $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -ds $(DEFAULT_STYLE_SHEET_Visu4Z) -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#Layers END




# Virtual Keys
VCVK_OBJECTS_Visu4Z = $(addprefix $(TEMP_PATH_Visu4Z)/vcvk., $(notdir $(VCVK_SOURCES_Visu4Z:.vcvk=.vco)))

$(TEMP_PATH_Visu4Z)/vcvk.VirtualKeys.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/VirtualKeys.vcvk
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas

$(VCVK_OBJECTS_Visu4Z): $(VC_LANGUAGES_Visu4Z)

#Virtual Keys END




# Touch Pads
TPR_OBJECTS_Visu4Z = $(addprefix $(TEMP_PATH_Visu4Z)/tpr., $(notdir $(TPR_SOURCES_Visu4Z:.tpr=.vco)))

$(TEMP_PATH_Visu4Z)/tpr.AlphaPadC307Zoll.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/AlphaPadC307Zoll.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -prj 'C:/SharedFolder/CControl/Logical/Visualisierung/Visu4Z' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/tpr.AlphaPadQVGA.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/AlphaPadQVGA.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -prj 'C:/SharedFolder/CControl/Logical/Visualisierung/Visu4Z' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/tpr.AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/AlphaPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -prj 'C:/SharedFolder/CControl/Logical/Visualisierung/Visu4Z' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/tpr.EditPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/EditPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -prj 'C:/SharedFolder/CControl/Logical/Visualisierung/Visu4Z' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/tpr.NavigationPad_hor.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/NavigationPad_hor.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -prj 'C:/SharedFolder/CControl/Logical/Visualisierung/Visu4Z' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/tpr.NavigationPad_ver.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/NavigationPad_ver.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -prj 'C:/SharedFolder/CControl/Logical/Visualisierung/Visu4Z' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/tpr.NumPadC307Zoll.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/NumPadC307Zoll.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -prj 'C:/SharedFolder/CControl/Logical/Visualisierung/Visu4Z' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/tpr.NumPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/NumPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -prj 'C:/SharedFolder/CControl/Logical/Visualisierung/Visu4Z' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/tpr.NumPad4Zoll.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/NumPad4Zoll.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -prj 'C:/SharedFolder/CControl/Logical/Visualisierung/Visu4Z' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/tpr.AlphaPad4Zoll.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TouchPads/AlphaPad4Zoll.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z) -prj 'C:/SharedFolder/CControl/Logical/Visualisierung/Visu4Z' -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#Touch Pads END




# Text Groups
TXTGRP_OBJECTS_Visu4Z = $(addprefix $(TEMP_PATH_Visu4Z)/txtgrp., $(notdir $(TXTGRP_SOURCES_Visu4Z:.txtgrp=.vco)))

$(TEMP_PATH_Visu4Z)/txtgrp.TXT_DropdownSprachen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_DropdownSprachen.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_EinAus.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_EinAus.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_KlappenBoxen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_KlappenBoxen.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_PwEbene.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_PwEbene.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_Status.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_Status.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_Zusatzmeldungen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_Zusatzmeldungen.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_AlarmeGruppe.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_AlarmeGruppe.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_ButtonAbluftklappe.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_ButtonAbluftklappe.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_ButtonAbluftvent.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_ButtonAbluftvent.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_ButtonUmschaltklappen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_ButtonUmschaltklappen.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_FrischlDachluft.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_FrischlDachluft.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_LaufRestBox.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_LaufRestBox.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_NameSteuerung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_NameSteuerung.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_ParameterUmschaltpunkt.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_ParameterUmschaltpunkt.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_Trockengut.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_Trockengut.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/txtgrp.TXT_UeberschriftWloSho.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/TextGroups/TXT_UeberschriftWloSho.txtgrp $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#Text Groups END




# BitmapGroups
BMGRP_OBJECTS_Visu4Z = $(addprefix $(TEMP_PATH_Visu4Z)/bmgrp., $(notdir $(BMGRP_SOURCES_Visu4Z:.bmgrp=.vco)))

$(TEMP_PATH_Visu4Z)/bmgrp.AlphaPadQVGA.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/AlphaPadQVGA.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/AlphaPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.AlarmEvent.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/AlarmEvent.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.AlarmState.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/AlarmState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.AcknowledgeState.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/AcknowledgeState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.AlphaPadC304Zoll.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/AlphaPadC304Zoll.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.BMG_Entfeuchter.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_Entfeuchter.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.BMG_Heizregister.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_Heizregister.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.BMG_IconRestzeit.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_IconRestzeit.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.BMG_LuefterGross.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_LuefterGross.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.BMG_LuefterKlein.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_LuefterKlein.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.BMG_Ofen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_Ofen.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.BMG_TastenLeer75px.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_TastenLeer75px.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.BMG_TrockengutGross.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_TrockengutGross.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.BMG_TrockengutKlein.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_TrockengutKlein.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.BMG_TrockengutMittel.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_TrockengutMittel.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.Borders.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/Borders.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.BypassState.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BypassState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.NavigationPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/NavigationPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.NumPadC30_4Zoll.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/NumPadC30_4Zoll.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.NumPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/NumPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.SliderAusEin.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/SliderAusEin.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.BMG_TasteEinAusLuftentf.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_TasteEinAusLuftentf.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bmgrp.BMG_Checkmark.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/BitmapGroups/BMG_Checkmark.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#BitmapGroups END




# Bitmaps
BMINFO_OBJECTS_Visu4Z = $(addprefix $(TEMP_PATH_Visu4Z)/bminfo., $(notdir $(BMINFO_SOURCES_Visu4Z:.bminfo=.vco)))

$(TEMP_PATH_Visu4Z)/bminfo.AlphaPadQVGA1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlphaPadQVGA2.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA2.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA2.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlphaPadQVGA3.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA3.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA3.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlphaPadVGA_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadVGA_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadVGA_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlphaPadQVGA2_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA2_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA2_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlphaPadQVGA3_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA3_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA3_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlphaPadQVGA1_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA1_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadQVGA1_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlphaPadVGA.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadVGA.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlphaPadVGA.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.NumPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/NumPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/NumPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.NumPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/NumPad.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/NumPad.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AcknowledgeReset.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AcknowledgeReset.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AcknowledgeReset.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlarmActive.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmActive.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmActive.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlarmBypassOFF.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmBypassOFF.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmBypassOFF.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlarmBypassON.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmBypassON.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmBypassON.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlarmInactive.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmInactive.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmInactive.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlarmLatched.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmLatched.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmLatched.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlarmNotQuit.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmNotQuit.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmNotQuit.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.AlarmQuit.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmQuit.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/AlarmQuit.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.Reset.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/Reset.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/Reset.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.ResetAcknowledge.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ResetAcknowledge.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ResetAcknowledge.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.Triggered.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/Triggered.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/Triggered.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.ListPadHor.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ListPadHor.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ListPadHor.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.ListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ListPadHor_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.ListPadVer.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ListPadVer.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ListPadVer.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.ListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ListPadVer_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.backward_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/backward_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/backward_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.backward_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/backward_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/backward_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.global_area_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/global_area_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/global_area_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.global_area_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/global_area_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/global_area_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.forward_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/forward_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/forward_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.forward_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/forward_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/forward_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.control_button_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/control_button_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/control_button_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.control_button_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/control_button_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/control_button_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.right_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/right_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/right_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.right_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/right_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/right_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.left_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/left_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/left_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.left_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/left_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/left_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.up_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/up_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/up_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.up_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/up_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.down_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/down_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/down_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.down_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/down_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.multi_up_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/multi_up_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/multi_up_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.multi_up_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/multi_up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/multi_up_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.multi_down_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/multi_down_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/multi_down_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.multi_down_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/multi_down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/multi_down_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.ProgressBorder.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ProgressBorder.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/ProgressBorder.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.down_active_control.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/down_active_control.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/down_active_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.down_pressed_control.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/down_pressed_control.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/down_pressed_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.up_active_control.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/up_active_control.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/up_active_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.global_area_gradient_upside.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/global_area_gradient_upside.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/global_area_gradient_upside.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.global_area_gradient_downside.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/global_area_gradient_downside.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/global_area_gradient_downside.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.frame_header.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/frame_header.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/frame_header.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.up_pressed_control.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/up_pressed_control.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/up_pressed_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.EditPadVGA.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/EditPadVGA.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/EditPadVGA.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.EditPadVGA_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/EditPadVGA_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/EditPadVGA_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneNumPad_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneNumPad_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneNumPad_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneListPadVer_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneListPadVer_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneListPadVer_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneAlphaPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneAlphaPad_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPad_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPad_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneAlphaPadQVGA1_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPadQVGA1_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPadQVGA1_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneAlphaPadQVGA1_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPadQVGA1_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPadQVGA1_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneAlphaPadQVGA2_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPadQVGA2_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPadQVGA2_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneAlphaPadQVGA3_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPadQVGA3_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneAlphaPadQVGA3_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneEditpadQVGA2_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneEditpadQVGA2_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneEditpadQVGA2_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneEditPadQVGA3_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneEditPadQVGA3_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneEditPadQVGA3_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneEditPadVga_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneEditPadVga_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneEditPadVga_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneEditPadVga_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneEditPadVga_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneEditPadVga_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneListPadHor_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneListPadHor_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneListPadHor_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneListPadHor_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneListPadVer_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.zuneNumPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneNumPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/zuneNumPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Gelb1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Gelb1_Dklgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb1_Dklgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb1_Dklgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Gelb1_Schwarz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb1_Schwarz.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb1_Schwarz.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Gelb2.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb2.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Gelb2_Dklgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb2_Dklgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb2_Dklgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Gelb2_Schwarz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb2_Schwarz.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb2_Schwarz.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Gelb35.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb35.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb35.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Gelb35_Dklgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb35_Dklgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb35_Dklgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Gelb35_Schwarz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb35_Schwarz.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Gelb35_Schwarz.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Hellgr1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Hellgr1_Dklgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr1_Dklgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr1_Dklgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Hellgr1_Schwarz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr1_Schwarz.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr1_Schwarz.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Hellgr2.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr2.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Hellgr2_Dklgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr2_Dklgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr2_Dklgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Hellgr2_Schwarz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr2_Schwarz.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr2_Schwarz.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Hellgr35.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr35.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr35.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Hellgr35_Dklgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr35_Dklgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Hellgr35_Dklgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Ohne_Dlkgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Ohne_Dlkgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Ohne_Dlkgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Frame_Ohne_Gelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Ohne_Gelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Frame_Ohne_Gelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_NavigationAlarme.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NavigationAlarme.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NavigationAlarme.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_NavigationHome.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NavigationHome.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NavigationHome.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_NavigationIstwerte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NavigationIstwerte.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NavigationIstwerte.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_NavigationSettings.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NavigationSettings.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NavigationSettings.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconFehler.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconFehler.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconFehler.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconWarnung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconWarnung.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconWarnung.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HintergrundGedimmt.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HintergrundGedimmt.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HintergrundGedimmt.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_TasteAb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteAb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteAb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_TasteAuf.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteAuf.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteAuf.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_RundballenGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_RundballenGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_RundballenGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Sanduhr_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Sanduhr_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Sanduhr_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_SattDefizit_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_SattDefizit_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_SattDefizit_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Stoppuhr_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Stoppuhr_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Stoppuhr_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Stoppuhr_2.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Stoppuhr_2.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Stoppuhr_2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_TempFeuchte_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TempFeuchte_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TempFeuchte_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconAustritt.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconAustritt.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconAustritt.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconEintritt.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconEintritt.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconEintritt.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconHochdruck.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconHochdruck.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconHochdruck.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconLuftmengeKlein.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconLuftmengeKlein.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconLuftmengeKlein.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconNiederdruck.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconNiederdruck.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconNiederdruck.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_TachoKlein.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TachoKlein.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TachoKlein.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Haus.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Haus.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Haus.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconKanaldruck.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconKanaldruck.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconKanaldruck.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Tacho.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Tacho.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Tacho.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconLuftmenge.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconLuftmenge.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconLuftmenge.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Loginscreen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Loginscreen.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Loginscreen.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_LuefterGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_LuefterGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_LuefterGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_LuefterGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_LuefterGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_LuefterGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_LuefterGrossRot.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_LuefterGrossRot.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_LuefterGrossRot.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_EntfeuchterGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_EntfeuchterGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_EntfeuchterGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_EntfeuchterGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_EntfeuchterGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_EntfeuchterGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_EntfeuchterRot.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_EntfeuchterRot.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_EntfeuchterRot.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HeizregisterGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeizregisterGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeizregisterGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HeizregisterGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeizregisterGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeizregisterGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HeizregisterRot.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeizregisterRot.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeizregisterRot.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconAbtauung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconAbtauung.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconAbtauung.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_OfenGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_OfenGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_OfenGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_OfenGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_OfenGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_OfenGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_OfenRot.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_OfenRot.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_OfenRot.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconsKlappen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconsKlappen.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconsKlappen.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconsSensoren.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconsSensoren.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconsSensoren.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Sanduhr_2.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Sanduhr_2.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Sanduhr_2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_TempFeuchte_2.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TempFeuchte_2.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TempFeuchte_2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_Trocknungsbilanz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Trocknungsbilanz.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_Trocknungsbilanz.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_TasteSlider01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteSlider01.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteSlider01.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_TasteSlider02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteSlider02.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteSlider02.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_AlphaLowerPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaLowerPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaLowerPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_AlphaLowerReleased.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaLowerReleased.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaLowerReleased.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_AlphaNumberPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaNumberPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaNumberPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_AlphaNumberReleased.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaNumberReleased.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaNumberReleased.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_AlphaUpperPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaUpperPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaUpperPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_AlphaUpperReleased.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaUpperReleased.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_AlphaUpperReleased.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_NumPad4Z_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NumPad4Z_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NumPad4Z_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_NumPad4Z_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NumPad4Z_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_NumPad4Z_released.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_TasteAbKlein.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteAbKlein.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteAbKlein.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_TasteAufKlein.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteAufKlein.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteAufKlein.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_TasteRefresh.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteRefresh.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteRefresh.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HeuGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeuGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeuGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HeuGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeuGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeuGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HolzGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HolzGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HolzGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HolzGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HolzGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HolzGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HopfenGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HopfenGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HopfenGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HopfenGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HopfenGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HopfenGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_KraeuterGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_KraeuterGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_KraeuterGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_KraeuterGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_KraeuterGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_KraeuterGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_MaisGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_MaisGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_MaisGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_MaisGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_MaisGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_MaisGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_RundballenGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_RundballenGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_RundballenGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_WeizenGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_WeizenGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_WeizenGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_WeizenGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_WeizenGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_WeizenGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HeuMittelGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeuMittelGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeuMittelGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HeuMittelGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeuMittelGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HeuMittelGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HolzMittelGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HolzMittelGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HolzMittelGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HolzMittelGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HolzMittelGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HolzMittelGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HopfenMittelGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HopfenMittelGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HopfenMittelGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_HopfenMittelGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HopfenMittelGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_HopfenMittelGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_KraeuterMittelGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_KraeuterMittelGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_KraeuterMittelGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_KraeuterMittelGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_KraeuterMittelGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_KraeuterMittelGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_MaisMittelGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_MaisMittelGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_MaisMittelGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_MaisMittelGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_MaisMittelGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_MaisMittelGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_RundballenMittelGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_RundballenMittelGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_RundballenMittelGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_RundballenMittelGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_RundballenMittelGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_RundballenMittelGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_WeizenMittelGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_WeizenMittelGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_WeizenMittelGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_WeizenMittelGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_WeizenMittelGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_WeizenMittelGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconCheckmarkGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconCheckmarkGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconCheckmarkGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_IconCheckmarkGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconCheckmarkGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_IconCheckmarkGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_TasteEinGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteEinGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteEinGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_TasteEinGesperrt.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteEinGesperrt.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteEinGesperrt.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/bminfo.PNG_TasteEinGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteEinGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Bitmaps/PNG_TasteEinGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#Bitmaps END




# Trend Configuration
TRE_OBJECTS_Visu4Z = $(addprefix $(TEMP_PATH_Visu4Z)/tre., $(notdir $(TRE_SOURCES_Visu4Z:.tre=.vco)))

$(TEMP_PATH_Visu4Z)/tre.TrendLeistung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/TrendLeistung.tre
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/tre.Trendkurve01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/Trendkurve01.tre
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/tre.Trendkurve02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/Trendkurve02.tre
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#Trend Configuration END




# Trend Data
TRD_OBJECTS_Visu4Z = $(addprefix $(TEMP_PATH_Visu4Z)/trd., $(notdir $(TRD_SOURCES_Visu4Z:.trd=.vco)))

$(TEMP_PATH_Visu4Z)/trd.AbluftFeuchte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/AbluftFeuchte.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.AbluftTemp.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/AbluftTemp.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.AustrittFeuchte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/AustrittFeuchte.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.AustrittTemp.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/AustrittTemp.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.DachluftFeuchte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/DachluftFeuchte.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.DachluftTemp.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/DachluftTemp.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.EintrittFeuchte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/EintrittFeuchte.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.EintrittTemp.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/EintrittTemp.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.FrischluftFeuchte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/FrischluftFeuchte.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.FrischluftTemp.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/FrischluftTemp.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.Hochdruck.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/Hochdruck.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.Kanaldruck.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/Kanaldruck.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.LeistungAktuell.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/LeistungAktuell.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.Luftgeschw.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/Luftgeschw.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.Niederdruck.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/Niederdruck.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.TrockenluftFeuchte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/TrockenluftFeuchte.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/trd.TrockenluftTemp.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/TrockenluftTemp.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#Trend Data END




# Trend Data Configuration
TDC_OBJECTS_Visu4Z = $(addprefix $(TEMP_PATH_Visu4Z)/tdc., $(notdir $(TDC_SOURCES_Visu4Z:.tdc=.vco)))

$(TEMP_PATH_Visu4Z)/tdc.TrendData.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Trends/TrendData.tdc
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#Trend Data Configuration END




# ColorMap Table
CLM_OBJECTS_Visu4Z = $(addprefix $(TEMP_PATH_Visu4Z)/clm., $(notdir $(CLM_SOURCES_Visu4Z:.clm=.vco)))

$(TEMP_PATH_Visu4Z)/clm.Ampel.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/Ampel.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/clm.GelbGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/GelbGrau.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/clm.GrauGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/GrauGelb.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/clm.GrauGruenNumeric.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/GrauGruenNumeric.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/clm.GrauGruen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/GrauGruen.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/clm.RotGruen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/RotGruen.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/clm.TastenKonfigKlappen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/TastenKonfigKlappen.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/clm.TextfarbeBackgSw.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/TextfarbeBackgSw.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


$(TEMP_PATH_Visu4Z)/clm.Textfarbe.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/ColorMaps/Textfarbe.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu4Z)' $(VCCFLAGS_Visu4Z)  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas


#ColorMap Table END


#
# Borders
#
BDR_SOURCES_Visu4Z=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/BackwardActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/BackwardPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Bump.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ControlActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ControlPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/DownActiveControl.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/DownPressedControl.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Etched.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Flat_black1.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Flat_black.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Flat_grey.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ForwardActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ForwardPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb1Dklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb1Schwarz.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb1.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb2Dklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb2Schwarz.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb2.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb35Dklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb35Schwarz.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameGelb35.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHeader.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr1Dklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr1Schwarz.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr1.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr2Dklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr2Schwarz.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr2.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr35Dklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameHellgr35.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameOhneDklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/FrameOhneGelb.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/GlobalAreaActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/GlobalAreaPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/MultiScrollDownActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/MultiScrollDownPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/MultiScrollUpActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/MultiScrollUpPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ProgressBarBorder.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/RaisedInner.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Raised.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollDownActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollDownPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollLeftActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollLeftPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollRightActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollRightPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollUpActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/ScrollUpPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/SliderAusKlein1.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/SliderEinKlein1.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/SunkenOuter.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/Sunken.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/UpActiveControl.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Borders/UpPressedControl.bdr 
BDR_OBJECTS_Visu4Z=$(TEMP_PATH_Visu4Z)/bdr.Bordermanager.vco
$(TEMP_PATH_Visu4Z)/bdr.Bordermanager.vco: $(BDR_SOURCES_Visu4Z)
	$(VCC) -f '$<' -o '$@' -pkg '$(SRC_PATH_Visu4Z)' $(BDRFLAGS_Visu4Z) $(VCCFLAGS_Visu4Z) -p Visu4Z$(SRC_PATH_Visu4Z)
#
# Logical fonts
#
$(TEMP_PATH_Visu4Z)/lfnt.fr.vco: $(TEMP_PATH_Visu4Z)/fr.lfnt $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu4Z) $(VCCFLAGS_Visu4Z) -p Visu4Z -sfas
$(TEMP_PATH_Visu4Z)/lfnt.nl-BE.vco: $(TEMP_PATH_Visu4Z)/nl-BE.lfnt $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu4Z) $(VCCFLAGS_Visu4Z) -p Visu4Z -sfas
$(TEMP_PATH_Visu4Z)/lfnt.sl.vco: $(TEMP_PATH_Visu4Z)/sl.lfnt $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu4Z) $(VCCFLAGS_Visu4Z) -p Visu4Z -sfas
$(TEMP_PATH_Visu4Z)/lfnt.de.vco: $(TEMP_PATH_Visu4Z)/de.lfnt $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu4Z) $(VCCFLAGS_Visu4Z) -p Visu4Z -sfas
$(TEMP_PATH_Visu4Z)/lfnt.es.vco: $(TEMP_PATH_Visu4Z)/es.lfnt $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu4Z) $(VCCFLAGS_Visu4Z) -p Visu4Z -sfas
$(TEMP_PATH_Visu4Z)/lfnt.en.vco: $(TEMP_PATH_Visu4Z)/en.lfnt $(VC_LANGUAGES_Visu4Z)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu4Z) $(VCCFLAGS_Visu4Z) -p Visu4Z -sfas
LFNT_OBJECTS_Visu4Z=$(TEMP_PATH_Visu4Z)/lfnt.fr.vco $(TEMP_PATH_Visu4Z)/lfnt.nl-BE.vco $(TEMP_PATH_Visu4Z)/lfnt.sl.vco $(TEMP_PATH_Visu4Z)/lfnt.de.vco $(TEMP_PATH_Visu4Z)/lfnt.es.vco $(TEMP_PATH_Visu4Z)/lfnt.en.vco 

#Runtime Object
$(VCR_OBJECT_Visu4Z) : $(VCR_SOURCE_Visu4Z)
	$(VCC) -f '$<' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -sl en $(VCCFLAGS_Visu4Z) -rt  -p Visu4Z -so $(VC_STATIC_OPTIONS_Visu4Z) -vcr 4735 -sfas
# Local resources Library rules
LIB_LOCAL_RES_Visu4Z=$(TEMP_PATH_Visu4Z)/localres.vca
$(LIB_LOCAL_RES_Visu4Z) : $(TEMP_PATH_Visu4Z)/Visu4Z02.ccf

# Bitmap Library rules
LIB_BMP_RES_Visu4Z=$(TEMP_PATH_Visu4Z)/bmpres.vca
$(LIB_BMP_RES_Visu4Z) : $(TEMP_PATH_Visu4Z)/Visu4Z03.ccf
$(BMGRP_OBJECTS_Visu4Z) : $(PALFILE_Visu4Z) $(VC_LANGUAGES_Visu4Z)
$(BMINFO_OBJECTS_Visu4Z) : $(PALFILE_Visu4Z)

BUILD_FILE_Visu4Z=$(TEMP_PATH_Visu4Z)/BuildFiles.arg
$(BUILD_FILE_Visu4Z) : BUILD_FILE_CLEAN_Visu4Z $(BUILD_SOURCES_Visu4Z)
BUILD_FILE_CLEAN_Visu4Z:
	$(RM) /F /Q '$(BUILD_FILE_Visu4Z)' 2>nul
#All Modules depending to this project
PROJECT_MODULES_Visu4Z=$(AS_CPU_PATH)/Visu4Z01.br $(AS_CPU_PATH)/Visu4Z02.br $(AS_CPU_PATH)/Visu4Z03.br $(FONT_MODULES_Visu4Z) $(SHARED_MODULE)

# General Build rules

$(TARGET_FILE_Visu4Z): $(PROJECT_MODULES_Visu4Z) $(TEMP_PATH_Visu4Z)/Visu4Z.prj
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu4Z) -fw '$(VCFIRMWAREPATH)' -m $(VCSTPOST) -v V1.00.0 -f '$(TEMP_PATH_Visu4Z)/Visu4Z.prj' -o '$@' -vc '$(VCOBJECT_Visu4Z)' $(DEPENDENCIES_Visu4Z) $(addprefix -d ,$(notdir $(PROJECT_MODULES_Visu4Z:.br=)))

$(AS_CPU_PATH)/Visu4Z01.br: $(TEMP_PATH_Visu4Z)/Visu4Z01.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu4Z) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_Visu4Z)' -f '$<' -o '$@' $(DEPENDENCIES_Visu4Z)

$(AS_CPU_PATH)/Visu4Z02.br: $(TEMP_PATH_Visu4Z)/Visu4Z02.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu4Z) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_Visu4Z)' -f '$<' -o '$@' $(DEPENDENCIES_Visu4Z)

$(AS_CPU_PATH)/Visu4Z03.br: $(TEMP_PATH_Visu4Z)/Visu4Z03.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu4Z) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_Visu4Z)' -f '$<' -o '$@' $(DEPENDENCIES_Visu4Z)

# General Build rules END
$(LIB_LOCAL_OBJ_Visu4Z) : $(TEMP_PATH_Visu4Z)/Visu4Z01.ccf

# Main Module
$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu4Z.vcm:
$(TEMP_PATH_Visu4Z)/Visu4Z.prj: $(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu4Z.vcm
	$(VCDEP) -m '$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu4Z.vcm' -s '$(AS_CPU_PATH)/VCShared/Shared.vcm' -p '$(AS_PATH)/AS/VC/Firmware' -c '$(AS_CPU_PATH)' -fw '$(VCFIRMWAREPATH)' -hw '$(CPUHWC)' -so $(VC_STATIC_OPTIONS_Visu4Z) -o Visu4Z -proj Visu4Z
	$(VCPL) $(notdir $(PROJECT_MODULES_Visu4Z:.br=,4)) Visu4Z,2 -o '$@' -p Visu4Z -vc 'Visu4Z' -verbose 'False' -fl '$(TEMP_PATH_ROOT_Visu4Z)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu4Z.vcm' -vcr '$(VCR_SOURCE_Visu4Z)' -prj '$(AS_PROJECT_PATH)' -warningLevel2 -sfas

# 01 Module

DEL_TARGET01_LFL_Visu4Z=$(TEMP_PATH_Visu4Z)\Visu4Z01.ccf.lfl
$(TEMP_PATH_Visu4Z)/Visu4Z01.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_Visu4Z) $(TEMP_PATH_Visu4Z)/Visu4Z03.ccf $(LIB_LOCAL_RES_Visu4Z) $(TEMP_PATH_Visu4Z)/Visu4Z02.ccf $(DIS_OBJECTS_Visu4Z) $(PAGE_OBJECTS_Visu4Z) $(VCS_OBJECTS_Visu4Z) $(VCVK_OBJECTS_Visu4Z) $(VCRT_OBJECTS_Visu4Z) $(TPR_OBJECTS_Visu4Z) $(TXTGRP_OBJECTS_Visu4Z) $(LAYER_OBJECTS_Visu4Z) $(VCR_OBJECT_Visu4Z) $(TDC_OBJECTS_Visu4Z) $(TRD_OBJECTS_Visu4Z) $(TRE_OBJECTS_Visu4Z) $(PRC_OBJECTS_Visu4Z) $(SCR_OBJECTS_Visu4Z)
	-@CMD /Q /C if exist "$(DEL_TARGET01_LFL_Visu4Z)" DEL /F /Q "$(DEL_TARGET01_LFL_Visu4Z)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_BMP_RES_Visu4Z)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_LOCAL_RES_Visu4Z)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(DIS_OBJECTS_Visu4Z:.vco=.vco|)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .page -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Package.vcp' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCS_OBJECTS_Visu4Z:.vco=.vco|)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .vcvk -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Package.vcp' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCRT_OBJECTS_Visu4Z:.vco=.vco|)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(TPR_OBJECTS_Visu4Z:.vco=.vco|)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .txtgrp -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Package.vcp' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .layer -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Package.vcp' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCR_OBJECT_Visu4Z:.vco=.vco|)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .tdc -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Package.vcp' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .trd -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Package.vcp' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(TEMP_PATH_Visu4Z)/tre.TrendLeistung.vco' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(TEMP_PATH_Visu4Z)/tre.Trendkurve01.vco' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(TEMP_PATH_Visu4Z)/tre.Trendkurve02.vco' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(SCR_OBJECTS_Visu4Z:.vco=.vco|)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p Visu4Z -lib '$(LIB_LOCAL_OBJ_Visu4Z)' -P '$(AS_PROJECT_PATH)' -m 'local objects' -profile 'False' -warningLevel2 -vcr 4735 -sfas
# 01 Module END

# 02 Module

DEL_TARGET02_LFL_Visu4Z=$(TEMP_PATH_Visu4Z)\Visu4Z02.ccf.lfl
$(TEMP_PATH_Visu4Z)/Visu4Z02.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_Visu4Z) $(TEMP_PATH_Visu4Z)/Visu4Z03.ccf $(BDR_OBJECTS_Visu4Z) $(LFNT_OBJECTS_Visu4Z) $(CLM_OBJECTS_Visu4Z)
	-@CMD /Q /C if exist "$(DEL_TARGET02_LFL_Visu4Z)" DEL /F /Q "$(DEL_TARGET02_LFL_Visu4Z)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_BMP_RES_Visu4Z)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(BDR_OBJECTS_Visu4Z:.vco=.vco|)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LFNT_OBJECTS_Visu4Z:.vco=.vco|)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(CLM_OBJECTS_Visu4Z:.vco=.vco|)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p Visu4Z -lib '$(LIB_LOCAL_RES_Visu4Z)' -P '$(AS_PROJECT_PATH)' -m 'local resources' -profile 'False' -warningLevel2 -vcr 4735 -sfas
# 02 Module END

# 03 Module

DEL_TARGET03_LFL_Visu4Z=$(TEMP_PATH_Visu4Z)\Visu4Z03.ccf.lfl
$(TEMP_PATH_Visu4Z)/Visu4Z03.ccf: $(LIB_SHARED) $(SHARED_CCF) $(BMGRP_OBJECTS_Visu4Z) $(BMINFO_OBJECTS_Visu4Z) $(PALFILE_Visu4Z)
	-@CMD /Q /C if exist "$(DEL_TARGET03_LFL_Visu4Z)" DEL /F /Q "$(DEL_TARGET03_LFL_Visu4Z)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .bmgrp -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Package.vcp' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .bminfo -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu4Z/Package.vcp' -temp '$(TEMP_PATH_Visu4Z)' -prj '$(PRJ_PATH_Visu4Z)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p Visu4Z -lib '$(LIB_BMP_RES_Visu4Z)' -P '$(AS_PROJECT_PATH)' -m 'bitmap resources' -profile 'False' -warningLevel2 -vcr 4735 -sfas
# 03 Module END

