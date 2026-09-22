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
PALFILE_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Palette.vcr
VCCFLAGS_Visu=-server -proj Visu -vc '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/VCObject.vc' -prj_path '$(AS_PROJECT_PATH)' -temp_path '$(AS_TEMP_PATH)' -cfg $(AS_CONFIGURATION) -plc $(AS_PLC) -plctemp $(AS_TEMP_PLC) -cpu_path '$(AS_CPU_PATH)'
VCFIRMWARE=4.73.5
VCFIRMWAREPATH=$(AS_VC_PATH)/Firmware/V4.73.5/SG4
VCOBJECT_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/VCObject.vc
VCSTARTUP='vcstart.br'
VCLOD='vclod.br'
VCSTPOST='vcstpost.br'
TARGET_FILE_Visu=$(AS_CPU_PATH)/Visu.br
OBJ_SCOPE_Visu=Visualisierung
PRJ_PATH_Visu=$(AS_PROJECT_PATH)
SRC_PATH_Visu=$(AS_PROJECT_PATH)/Logical/$(OBJ_SCOPE_Visu)/Visu
TEMP_PATH_Visu=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu
TEMP_PATH_Shared=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared
TEMP_PATH_ROOT_Visu=$(AS_TEMP_PATH)
VC_LIBRARY_LIST_Visu=$(TEMP_PATH_Visu)/libraries.vci
VC_XREF_BUILDFILE_Visu=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.build
VC_XREF_CLEANFILE=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.clean
VC_LANGUAGES_Visu=$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr
CPUHWC='$(TEMP_PATH_Visu)/cpuhwc.vci'
VC_STATIC_OPTIONS_Visu='$(TEMP_PATH_Visu)/vcStaticOptions.xml'
VC_STATIC_OPTIONS_Shared='$(TEMP_PATH_Shared)/vcStaticOptions.xml'
# include Shared and Font Makefile (only once)
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCFntDat/Font_Visu.mak
ifneq ($(VCINC),1)
	VCINC=1
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/VCShared.mak
endif

DEPENDENCIES_Visu=-d vcgclass -profile 'False'
DEFAULT_STYLE_SHEET_Visu='Source[local].StyleSheet[Color]'
SHARED_MODULE=$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcshared.br
LFNTFLAGS_Visu=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)'
BDRFLAGS_Visu=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)'

# Local Libs
LIB_LOCAL_OBJ_Visu=$(TEMP_PATH_Visu)/localobj.vca

# Hardware sources
PANEL_HW_OBJECT_Visu=$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu/dis.Hardware.vco
PANEL_HW_VCI_Visu=$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu/dis.Hardware.vci
PANEL_HW_SOURCE_Visu=C:/SharedFolder/CControl_407_Gschneitner/Physical/4_07/Hardware.hw 
DIS_OBJECTS_Visu=$(PANEL_HW_OBJECT_Visu) $(KEYMAP_OBJECTS_Visu)

# KeyMapping flags
$(TEMP_PATH_Visu)/dis.PS2-Keyboard.vco: $(AS_PROJECT_PATH)/Physical/4_07/4PPC30_0702_21B/VC/PS2-Keyboard.dis $(PANEL_HW_SOURCE_Visu)
	$(VCHWPP) -f '$(PANEL_HW_SOURCE_Visu)' -o '$(subst .vco,.vci,$(TEMP_PATH_Visu)/dis.PS2-Keyboard.vco)' -n Visu -d Visu -pal '$(PALFILE_Visu)' -c '$(AS_CONFIGURATION)' -p '$(AS_PLC)' -ptemp '$(AS_TEMP_PLC)' -B 'S4.93' -L 'visapi: V*' -hw '$(CPUHWC)' -warninglevel 2 -so $(VC_STATIC_OPTIONS_Visu) -sos $(VC_STATIC_OPTIONS_Shared) -keyboard '$(AS_PROJECT_PATH)/Physical/4_07/4PPC30_0702_21B/VC/PS2-Keyboard.dis' -fp '$(AS_VC_PATH)/Firmware/V4.73.5/SG4' -prj '$(AS_PROJECT_PATH)' -apj 'CControl_Gschneitner' -sfas -vcob '$(VCOBJECT_Visu)'
	$(VCC) -f '$(subst .vco,.vci,$@)' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -k '$(VCVK_SOURCES_Visu)' $(VCCFLAGS_Visu) -p Visu -sfas

KEYMAP_SOURCES_Visu=$(AS_PROJECT_PATH)/Physical/4_07/4PPC30_0702_21B/VC/4PPC30_0702_21B.dis $(AS_PROJECT_PATH)/Physical/4_07/4PPC30_0702_21B/VC/PS2-Keyboard.dis 
KEYMAP_OBJECTS_Visu=$(TEMP_PATH_Visu)/dis.PS2-Keyboard.vco 

# All Source Objects
TXTGRP_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_AlarmeGruppe.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_DropdownSprachen.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_EinAus.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_KlappenBoxen.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_PwEbene.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_Status.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_Zusatzmeldungen.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_FrischlDachluft.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_UeberschriftWloSho.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_ParameterUmschaltpunkt.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_ButtonUmschaltklappen.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_ButtonAbluftvent.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_ButtonAbluftklappe.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_LaufRestBox.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_NameSteuerung.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_Trockengut.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_SensorGrenzwert.txtgrp 

FNINFO_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial10pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial10px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial11pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial12px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial14pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial14px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial16pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial16px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial18pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial20pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial22pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial24pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial26pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial30pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial6px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial7px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial8pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial8px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial9pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial9pxValue.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial9px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/DefaultFont.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial12pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Fonts/Arial20px.fninfo 

BMINFO_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA3.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadVGA_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA2_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA3_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA1_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadVGA.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/NumPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/NumPad.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AcknowledgeReset.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmActive.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassOFF.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassON.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmInactive.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmLatched.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmNotQuit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmQuit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Reset.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ResetAcknowledge.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Triggered.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ProgressBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_upside.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_downside.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/frame_header.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA2_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA3_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditpadQVGA2_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadQVGA3_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassOFF_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassOFF_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassON_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassON_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmInactive_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmInactive_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmLatched_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmLatched_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmNotQuit_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmNotQuit_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmQuit_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmQuit_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadVGA_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/BMP_IconFehler.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/BMP_IconWarnungGross.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/BMP_IconWarnung.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/NumPad_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/NumPad_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadLowerPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadLower.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadNumberPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadNumber.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadUpperPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadUpper.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconBetriebsstunden.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconTestbetrieb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NavigationAlarme.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NavigationIstwerte.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NavigationSettings.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NumPad.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NumPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteAbKlein.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteAb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteAufKlein.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteAuf.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteGelb75px.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteGrau75px.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteLinks.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteLoadFromUsb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteLoadParameters.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteNewFile.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteRechts.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteRefresh.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteSlider01.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteSlider02.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ProgressBorder_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ProgressBorder_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ResetAcknowledge_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ResetAcknowledge_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Reset_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Reset_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Triggered_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Triggered_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_active_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_active_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_active_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_active_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_control_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_control_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_control_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_control_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_active_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_active_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/frame_header_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/frame_header_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_active_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_active_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_downside_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_downside_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_upside_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_upside_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_active_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_active_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_active_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_active_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_active_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_active_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_active_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_active_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_control_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_control_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_control_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_control_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_released_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_released_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA2_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA2_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA3_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA3_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_released_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_released_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadQVGA3_released_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadQVGA3_released_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_released_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_released_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditpadQVGA2_released_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditpadQVGA2_released_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_released_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_released_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_released_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_released_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_released_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_released_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NavigationHome.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HintergrundGedimmt.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb1_Dklgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb1_Schwarz.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb2_Dklgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb2_Schwarz.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb35.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb35_Dklgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb35_Schwarz.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr1_Dklgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr2_Dklgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr2_Schwarz.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr35.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr35_Dklgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Ohne_Dlkgr.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Ohne_Gelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_SattDefizit_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TempFeuchte_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_ZeitRest_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Stoppuhr_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Sanduhr_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeuGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeuGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeuKleinGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeuKleinGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenKleinGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenKleinGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenMittelGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenMittelGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_ZeitRest_2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterGrossRot.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterKleinGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterKleinGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterKleinRot.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_EntfeuchterGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_EntfeuchterGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_EntfeuchterRot.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeizregisterGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeizregisterGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeizregisterRot.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_OfenGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_OfenGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_OfenRot.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconLuftmenge.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Tacho.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconAbtauung.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconAustritt.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconEintritt.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconHochdruck.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconLuftmengeKlein.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconNiederdruck.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TachoKlein.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Haus.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconKanaldruck.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconsKlappen.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconsSensoren.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Stoppuhr_2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr1_Schwarz.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TempFeuchte_2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Trocknungsbilanz.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Loginscreen.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Sanduhr_2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisKleinGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisKleinGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisMittelGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisMittelGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenKleinGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenKleinGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenMittelGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenMittelGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteCursor.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteScrollAb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteScrollAuf.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteScrollLinks.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteScrollRechts.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteZoomIn.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteZoomOut.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenKleinGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenKleinGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenMittelGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenMittelGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterKleinGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterKleinGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterMittelGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterMittelGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzGrossGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzGrossGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzKleinGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzKleinGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzMittelGelb.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzMittelGrau.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconFehler.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconWarnung.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconWitterungSchlecht.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconWitterungGut.bminfo 

BMGRP_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/SliderAusEin.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/AcknowledgeState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/AlarmEvent.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/AlarmState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/AlphaPadC307Zoll.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/AlphaPadQVGA.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/AlphaPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/Borders.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BypassState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/NavigationPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/NumPadC30_7ZollNeu.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/NumPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_TastenLeer75px.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_TrockengutGross.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_TrockengutMittel.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_TrockengutKlein.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_IconRestzeit.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_LuefterGross.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_LuefterKlein.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_Entfeuchter.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_Ofen.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_Heizregister.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_Witterung.bmgrp 

PAGE_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_000_HM_Init.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_001_HM_Login.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_730_SET_KonfigBoxen01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_731_SET_KonfigBoxen02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_100_AL_Aktuelle.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_101_AL_Historie.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_402_IW_Istwerte03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_610_SYS_Anmeldung.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_620_SET_AllgemeineEinst.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_650_SET_DisplayUhrzeit.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_640_SET_Netzwerk01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_641_SET_Netzwerk02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_732_SET_Parameter.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_660_SET_Datenaufzeichnung.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_700_SET_UebersichtServiceber.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_710_SET_Ausstattung01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_720_SET_Sensoren01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_740_SET_Ventilatoren01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_790_SET_Verzoegerungen01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_800_TEST_Uebersicht.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_810_TEST_Ventilatoren01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_812_TEST_Ventilatoren03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_820_TEST_Klappen01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_825_TEST_Klappen06.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_830_TEST_Warmluftofen01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_832_TEST_Warmluftofen03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_842_TEST_Entfeuchter03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_850_TEST_Sensorik01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_852_TEST_Sensorik03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_860_TEST_Absicherung01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_861_TEST_Absicherung02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_010_HM_Uebersicht.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_600_SYS_Uebersicht.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_630_SET_EinstTrocknungsboxen01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_631_SET_EinstTrocknungsboxen02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_632_SET_EinstTrocknungsboxen03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_711_SET_Ausstattung02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_712_SET_Ausstattung03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_713_SET_Ausstattung04.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_721_SET_Sensoren02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_722_SET_Sensoren03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_723_SET_Sensoren04.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_724_SET_Sensoren05.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_741_SET_Ventilatoren02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_750_SET_Klappen01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_751_SET_Klappen02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_752_SET_Klappen03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_760_SET_WarmluftScheitholz.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_770_SET_Heizregister.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_780_SET_Entfeuchter01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_714_SET_Ausstattung05.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_715_SET_Ausstattung06.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_716_SET_Ausstattung07.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_717_SET_Ausstattung08.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_781_SET_Entfeuchter02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_782_SET_Entfeuchter03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_783_SET_Entfeuchter04.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_742_SET_Ventilatoren03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_821_TEST_Klappen02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_811_TEST_Ventilatoren02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_822_TEST_Klappen03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_823_TEST_Klappen04.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_824_TEST_Klappen05.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_840_TEST_Entfeuchter01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_831_TEST_Warmluftofen02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_841_TEST_Entfeuchter02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_851_TEST_Sensorik02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_400_IW_Istwerte01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_401_IW_Istwerte02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_403_IW_Istwerte04.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_404_IW_Istwerte05.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_670_SET_Witterung01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_671_SET_Witterung02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_791_SET_Verzoegerungen02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_870_TEST_EntfeuchterFremd01.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_871_TEST_EntfeuchterFremd02.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_672_SET_Witterung03.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_673_SET_Witterung04.page \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_718_SET_Ausstattung09.page 

LAYER_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/HintergrundAb.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/HintergrundAufAb.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/HintergrundAuf.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/MessageDatumFalsch.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/NavigationAlarme.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/NavigationHome.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/NavigationIstwerte.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/NavigationSettings.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/SrvcUhrzeit.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gEinVentilator.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gEineBox.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gZeitfenster.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsBox.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gZweiBoxen.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gZweiVentilatoren.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsVentilatoren.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsEntfeuchter.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsOfen.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsHeizregister.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsKlappen.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsSensoren.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/HintergrundOhne.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gFehler.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gWarnung.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDreiBoxen.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gVierBoxen.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gMldgStockkontrolle.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gTrocknungsbilanz.layer \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsEntfeuchterFremd.layer 

VCS_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/StyleSheets/Color.vcs \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/StyleSheets/Gray.vcs 

BDR_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Bump.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Etched.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Flat_black1.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Flat_black.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Flat_grey.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb1Dklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb1Schwarz.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb2Dklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb2Schwarz.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb35Dklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb35Schwarz.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr1Dklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr2Dklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr2Schwarz.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr35Dklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameOhneDklgr.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameOhneGelb.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/RaisedInner.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Raised.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/SliderAusKlein1.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/SliderEinKlein1.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/SunkenOuter.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Sunken.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/BackwardActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/BackwardPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ControlActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ControlPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/DownActiveControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/DownPressedControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ForwardActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ForwardPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHeader.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/GlobalAreaActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/GlobalAreaPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/MultiScrollDownActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/MultiScrollDownPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/MultiScrollUpActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/MultiScrollUpPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ProgressBarBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollDownActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollDownPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollLeftActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollLeftPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollRightActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollRightPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollUpActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollUpPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/UpActiveControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/UpPressedControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb1.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb2.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb35.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr1.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr2.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr35.bdr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr1Schwarz.bdr 

TPR_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/AlphaPadC307Zoll.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/AlphaPadQVGA.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/AlphaPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/EditPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/NavigationPad_hor.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/NavigationPad_ver.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/NumPadC307Zoll.tpr \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/NumPad.tpr 

TDC_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/TrendData.tdc 

TRD_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/FrischluftTemp.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/FrischluftFeuchte.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/DachluftTemp.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/DachluftFeuchte.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/TrockenluftTemp.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/TrockenluftFeuchte.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/AbluftTemp.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/AbluftFeuchte.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/Luftgeschw.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/Kanaldruck.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/EintrittTemp.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/EintrittFeuchte.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/AustrittTemp.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/AustrittFeuchte.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/Niederdruck.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/Hochdruck.trd \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/LeistungAktuell.trd 

TRE_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/Trendkurve01.tre \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/Trendkurve02.tre \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/TrendLeistung.tre 

CLM_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/Ampel.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/GelbGrau.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/GrauGelb.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/GrauGruenNumeric.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/GrauGruen.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/RotGruen.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/TastenKonfigKlappen.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/Textfarbe.clm \
	$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/TextfarbeBackgSw.clm 

VCVK_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/VirtualKeys.vcvk 

VCR_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Palette.vcr 

# Runtime Object sources
VCR_OBJECT_Visu=$(TEMP_PATH_Visu)/vcrt.vco
VCR_SOURCE_Visu=$(SRC_PATH_Visu)/package.vcp
# All Source Objects END

#Panel Hardware
$(PANEL_HW_VCI_Visu): $(PANEL_HW_SOURCE_Visu) $(VC_LIBRARY_LIST_Visu) $(KEYMAP_SOURCES_Visu) $(PALFILE_Visu)
	$(VCHWPP) -f '$<' -o '$@' -n Visu -d Visu -pal '$(PALFILE_Visu)' -c '$(AS_CONFIGURATION)' -p '$(AS_PLC)' -ptemp '$(AS_TEMP_PLC)' -B 'S4.93' -L 'visapi: V*' -verbose 'False' -profile 'False' -hw '$(CPUHWC)' -warninglevel 2 -so $(VC_STATIC_OPTIONS_Visu) -sos $(VC_STATIC_OPTIONS_Shared) -fp '$(AS_VC_PATH)/Firmware/V4.73.5/SG4' -sfas -prj '$(AS_PROJECT_PATH)' -apj 'CControl_Gschneitner' -vcob '$(VCOBJECT_Visu)'

$(PANEL_HW_OBJECT_Visu): $(PANEL_HW_VCI_Visu) $(VC_LIBRARY_LIST_Visu)
	$(VCC) -f '$(subst .vco,.vci,$@)' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -k '$(VCVK_SOURCES_Visu)' $(VCCFLAGS_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


# Pages
PAGE_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/page., $(notdir $(PAGE_SOURCES_Visu:.page=.vco)))

$(TEMP_PATH_Visu)/page._000_HM_Init.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_000_HM_Init.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._001_HM_Login.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_001_HM_Login.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._730_SET_KonfigBoxen01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_730_SET_KonfigBoxen01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._731_SET_KonfigBoxen02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_731_SET_KonfigBoxen02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._100_AL_Aktuelle.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_100_AL_Aktuelle.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._101_AL_Historie.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_101_AL_Historie.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._402_IW_Istwerte03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_402_IW_Istwerte03.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._610_SYS_Anmeldung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_610_SYS_Anmeldung.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._620_SET_AllgemeineEinst.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_620_SET_AllgemeineEinst.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._650_SET_DisplayUhrzeit.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_650_SET_DisplayUhrzeit.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._640_SET_Netzwerk01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_640_SET_Netzwerk01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._641_SET_Netzwerk02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_641_SET_Netzwerk02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._732_SET_Parameter.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_732_SET_Parameter.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._660_SET_Datenaufzeichnung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_660_SET_Datenaufzeichnung.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._700_SET_UebersichtServiceber.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_700_SET_UebersichtServiceber.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._710_SET_Ausstattung01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_710_SET_Ausstattung01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._720_SET_Sensoren01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_720_SET_Sensoren01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._740_SET_Ventilatoren01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_740_SET_Ventilatoren01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._790_SET_Verzoegerungen01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_790_SET_Verzoegerungen01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._800_TEST_Uebersicht.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_800_TEST_Uebersicht.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._810_TEST_Ventilatoren01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_810_TEST_Ventilatoren01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._812_TEST_Ventilatoren03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_812_TEST_Ventilatoren03.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._820_TEST_Klappen01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_820_TEST_Klappen01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._825_TEST_Klappen06.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_825_TEST_Klappen06.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._830_TEST_Warmluftofen01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_830_TEST_Warmluftofen01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._832_TEST_Warmluftofen03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_832_TEST_Warmluftofen03.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._842_TEST_Entfeuchter03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_842_TEST_Entfeuchter03.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._850_TEST_Sensorik01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_850_TEST_Sensorik01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._852_TEST_Sensorik03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_852_TEST_Sensorik03.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._860_TEST_Absicherung01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_860_TEST_Absicherung01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._861_TEST_Absicherung02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_861_TEST_Absicherung02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._010_HM_Uebersicht.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_010_HM_Uebersicht.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._600_SYS_Uebersicht.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_600_SYS_Uebersicht.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._630_SET_EinstTrocknungsboxen01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_630_SET_EinstTrocknungsboxen01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._631_SET_EinstTrocknungsboxen02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_631_SET_EinstTrocknungsboxen02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._632_SET_EinstTrocknungsboxen03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_632_SET_EinstTrocknungsboxen03.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._711_SET_Ausstattung02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_711_SET_Ausstattung02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._712_SET_Ausstattung03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_712_SET_Ausstattung03.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._713_SET_Ausstattung04.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_713_SET_Ausstattung04.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._721_SET_Sensoren02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_721_SET_Sensoren02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._722_SET_Sensoren03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_722_SET_Sensoren03.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._723_SET_Sensoren04.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_723_SET_Sensoren04.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._724_SET_Sensoren05.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_724_SET_Sensoren05.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._741_SET_Ventilatoren02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_741_SET_Ventilatoren02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._750_SET_Klappen01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_750_SET_Klappen01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._751_SET_Klappen02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_751_SET_Klappen02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._752_SET_Klappen03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_752_SET_Klappen03.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._760_SET_WarmluftScheitholz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_760_SET_WarmluftScheitholz.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._770_SET_Heizregister.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_770_SET_Heizregister.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._780_SET_Entfeuchter01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_780_SET_Entfeuchter01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._714_SET_Ausstattung05.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_714_SET_Ausstattung05.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._715_SET_Ausstattung06.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_715_SET_Ausstattung06.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._716_SET_Ausstattung07.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_716_SET_Ausstattung07.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._717_SET_Ausstattung08.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_717_SET_Ausstattung08.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._781_SET_Entfeuchter02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_781_SET_Entfeuchter02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._782_SET_Entfeuchter03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_782_SET_Entfeuchter03.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._783_SET_Entfeuchter04.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_783_SET_Entfeuchter04.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._742_SET_Ventilatoren03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_742_SET_Ventilatoren03.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._821_TEST_Klappen02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_821_TEST_Klappen02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._811_TEST_Ventilatoren02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_811_TEST_Ventilatoren02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._822_TEST_Klappen03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_822_TEST_Klappen03.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._823_TEST_Klappen04.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_823_TEST_Klappen04.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._824_TEST_Klappen05.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_824_TEST_Klappen05.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._840_TEST_Entfeuchter01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_840_TEST_Entfeuchter01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._831_TEST_Warmluftofen02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_831_TEST_Warmluftofen02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._841_TEST_Entfeuchter02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_841_TEST_Entfeuchter02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._851_TEST_Sensorik02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_851_TEST_Sensorik02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._400_IW_Istwerte01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_400_IW_Istwerte01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._401_IW_Istwerte02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_401_IW_Istwerte02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._403_IW_Istwerte04.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_403_IW_Istwerte04.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._404_IW_Istwerte05.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_404_IW_Istwerte05.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._670_SET_Witterung01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_670_SET_Witterung01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._671_SET_Witterung02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_671_SET_Witterung02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._791_SET_Verzoegerungen02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_791_SET_Verzoegerungen02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._870_TEST_EntfeuchterFremd01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_870_TEST_EntfeuchterFremd01.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._871_TEST_EntfeuchterFremd02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_871_TEST_EntfeuchterFremd02.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._672_SET_Witterung03.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_672_SET_Witterung03.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._673_SET_Witterung04.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_673_SET_Witterung04.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/page._718_SET_Ausstattung09.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Pages/_718_SET_Ausstattung09.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Color.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


#Pages END




# Stylesheets
VCS_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/vcs., $(notdir $(VCS_SOURCES_Visu:.vcs=.vco)))

$(TEMP_PATH_Visu)/vcs.Color.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/StyleSheets/Color.vcs
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/vcs.Gray.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/StyleSheets/Gray.vcs
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


#Stylesheets END




# Layers
LAYER_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/layer., $(notdir $(LAYER_SOURCES_Visu:.layer=.vco)))

$(TEMP_PATH_Visu)/layer.HintergrundAb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/HintergrundAb.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.HintergrundAufAb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/HintergrundAufAb.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.HintergrundAuf.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/HintergrundAuf.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.MessageDatumFalsch.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/MessageDatumFalsch.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.NavigationAlarme.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/NavigationAlarme.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.NavigationHome.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/NavigationHome.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.NavigationIstwerte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/NavigationIstwerte.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.NavigationSettings.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/NavigationSettings.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.SrvcUhrzeit.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/SrvcUhrzeit.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gEinVentilator.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gEinVentilator.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gEineBox.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gEineBox.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gZeitfenster.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gZeitfenster.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gDetailsBox.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsBox.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gZweiBoxen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gZweiBoxen.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gZweiVentilatoren.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gZweiVentilatoren.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gDetailsVentilatoren.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsVentilatoren.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gDetailsEntfeuchter.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsEntfeuchter.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gDetailsOfen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsOfen.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gDetailsHeizregister.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsHeizregister.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gDetailsKlappen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsKlappen.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gDetailsSensoren.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsSensoren.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.HintergrundOhne.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/HintergrundOhne.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gFehler.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gFehler.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gWarnung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gWarnung.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gDreiBoxen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDreiBoxen.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gVierBoxen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gVierBoxen.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gMldgStockkontrolle.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gMldgStockkontrolle.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gTrocknungsbilanz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gTrocknungsbilanz.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/layer.gDetailsEntfeuchterFremd.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Layers/gDetailsEntfeuchterFremd.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


#Layers END




# Virtual Keys
VCVK_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/vcvk., $(notdir $(VCVK_SOURCES_Visu:.vcvk=.vco)))

$(TEMP_PATH_Visu)/vcvk.VirtualKeys.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/VirtualKeys.vcvk
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas

$(VCVK_OBJECTS_Visu): $(VC_LANGUAGES_Visu)

#Virtual Keys END




# Touch Pads
TPR_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/tpr., $(notdir $(TPR_SOURCES_Visu:.tpr=.vco)))

$(TEMP_PATH_Visu)/tpr.AlphaPadC307Zoll.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/AlphaPadC307Zoll.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'C:/SharedFolder/CControl_407_Gschneitner/Logical/Visualisierung/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/tpr.AlphaPadQVGA.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/AlphaPadQVGA.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'C:/SharedFolder/CControl_407_Gschneitner/Logical/Visualisierung/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/tpr.AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/AlphaPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'C:/SharedFolder/CControl_407_Gschneitner/Logical/Visualisierung/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/tpr.EditPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/EditPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'C:/SharedFolder/CControl_407_Gschneitner/Logical/Visualisierung/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/tpr.NavigationPad_hor.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/NavigationPad_hor.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'C:/SharedFolder/CControl_407_Gschneitner/Logical/Visualisierung/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/tpr.NavigationPad_ver.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/NavigationPad_ver.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'C:/SharedFolder/CControl_407_Gschneitner/Logical/Visualisierung/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/tpr.NumPadC307Zoll.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/NumPadC307Zoll.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'C:/SharedFolder/CControl_407_Gschneitner/Logical/Visualisierung/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/tpr.NumPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TouchPads/NumPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'C:/SharedFolder/CControl_407_Gschneitner/Logical/Visualisierung/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


#Touch Pads END




# Text Groups
TXTGRP_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/txtgrp., $(notdir $(TXTGRP_SOURCES_Visu:.txtgrp=.vco)))

$(TEMP_PATH_Visu)/txtgrp.TXT_AlarmeGruppe.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_AlarmeGruppe.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_DropdownSprachen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_DropdownSprachen.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_EinAus.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_EinAus.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_KlappenBoxen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_KlappenBoxen.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_PwEbene.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_PwEbene.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_Status.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_Status.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_Zusatzmeldungen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_Zusatzmeldungen.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_FrischlDachluft.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_FrischlDachluft.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_UeberschriftWloSho.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_UeberschriftWloSho.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_ParameterUmschaltpunkt.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_ParameterUmschaltpunkt.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_ButtonUmschaltklappen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_ButtonUmschaltklappen.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_ButtonAbluftvent.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_ButtonAbluftvent.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_ButtonAbluftklappe.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_ButtonAbluftklappe.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_LaufRestBox.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_LaufRestBox.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_NameSteuerung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_NameSteuerung.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_Trockengut.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_Trockengut.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/txtgrp.TXT_SensorGrenzwert.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/TextGroups/TXT_SensorGrenzwert.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


#Text Groups END




# BitmapGroups
BMGRP_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/bmgrp., $(notdir $(BMGRP_SOURCES_Visu:.bmgrp=.vco)))

$(TEMP_PATH_Visu)/bmgrp.SliderAusEin.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/SliderAusEin.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.AcknowledgeState.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/AcknowledgeState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.AlarmEvent.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/AlarmEvent.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.AlarmState.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/AlarmState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.AlphaPadC307Zoll.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/AlphaPadC307Zoll.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.AlphaPadQVGA.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/AlphaPadQVGA.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/AlphaPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.Borders.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/Borders.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.BypassState.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BypassState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.NavigationPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/NavigationPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.NumPadC30_7ZollNeu.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/NumPadC30_7ZollNeu.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.NumPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/NumPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.BMG_TastenLeer75px.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_TastenLeer75px.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.BMG_TrockengutGross.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_TrockengutGross.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.BMG_TrockengutMittel.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_TrockengutMittel.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.BMG_TrockengutKlein.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_TrockengutKlein.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.BMG_IconRestzeit.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_IconRestzeit.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.BMG_LuefterGross.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_LuefterGross.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.BMG_LuefterKlein.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_LuefterKlein.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.BMG_Entfeuchter.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_Entfeuchter.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.BMG_Ofen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_Ofen.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.BMG_Heizregister.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_Heizregister.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bmgrp.BMG_Witterung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/BitmapGroups/BMG_Witterung.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


#BitmapGroups END




# Bitmaps
BMINFO_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/bminfo., $(notdir $(BMINFO_SOURCES_Visu:.bminfo=.vco)))

$(TEMP_PATH_Visu)/bminfo.AlphaPadQVGA1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlphaPadQVGA2.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA2.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA2.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlphaPadQVGA3.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA3.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA3.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlphaPadVGA_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadVGA_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadVGA_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlphaPadQVGA2_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA2_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA2_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlphaPadQVGA3_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA3_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA3_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlphaPadQVGA1_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA1_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadQVGA1_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlphaPadVGA.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadVGA.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadVGA.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.NumPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/NumPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/NumPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.NumPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/NumPad.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/NumPad.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AcknowledgeReset.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AcknowledgeReset.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AcknowledgeReset.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmActive.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmActive.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmActive.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmBypassOFF.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassOFF.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassOFF.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmBypassON.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassON.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassON.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmInactive.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmInactive.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmInactive.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmLatched.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmLatched.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmLatched.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmNotQuit.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmNotQuit.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmNotQuit.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmQuit.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmQuit.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmQuit.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.Reset.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Reset.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Reset.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ResetAcknowledge.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ResetAcknowledge.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ResetAcknowledge.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.Triggered.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Triggered.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Triggered.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ListPadHor.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ListPadVer.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.backward_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.backward_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.global_area_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.global_area_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.forward_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.forward_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.control_button_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.control_button_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.right_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.right_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.left_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.left_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.up_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.up_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.down_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.down_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.multi_up_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.multi_up_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.multi_down_active.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_active.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.multi_down_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ProgressBorder.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ProgressBorder.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ProgressBorder.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.down_active_control.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_control.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.down_pressed_control.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_control.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.up_active_control.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_control.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.global_area_gradient_upside.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_upside.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_upside.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.global_area_gradient_downside.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_downside.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_downside.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.frame_header.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/frame_header.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/frame_header.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.up_pressed_control.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_control.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.EditPadVGA.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.EditPadVGA_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneNumPad_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneListPadVer_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPad_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPadQVGA1_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPadQVGA1_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPadQVGA2_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA2_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA2_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPadQVGA3_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA3_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA3_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneEditpadQVGA2_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditpadQVGA2_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditpadQVGA2_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneEditPadQVGA3_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadQVGA3_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadQVGA3_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneEditPadVga_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneEditPadVga_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneListPadHor_released.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_released.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneNumPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmBypassOFF_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassOFF_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassOFF_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmBypassOFF_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassOFF_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassOFF_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmBypassON_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassON_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassON_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmBypassON_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassON_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmBypassON_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmInactive_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmInactive_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmInactive_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmInactive_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmInactive_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmInactive_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmLatched_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmLatched_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmLatched_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmLatched_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmLatched_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmLatched_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmNotQuit_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmNotQuit_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmNotQuit_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmNotQuit_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmNotQuit_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmNotQuit_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmQuit_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmQuit_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmQuit_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlarmQuit_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmQuit_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlarmQuit_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.AlphaPadVGA_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadVGA_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/AlphaPadVGA_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.BMP_IconFehler.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/BMP_IconFehler.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/BMP_IconFehler.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.BMP_IconWarnungGross.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/BMP_IconWarnungGross.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/BMP_IconWarnungGross.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.BMP_IconWarnung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/BMP_IconWarnung.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/BMP_IconWarnung.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.EditPadVGA_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.EditPadVGA_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.EditPadVGA_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.EditPadVGA_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/EditPadVGA_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ListPadHor_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ListPadHor_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ListPadHor_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ListPadHor_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadHor_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ListPadVer_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ListPadVer_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ListPadVer_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ListPadVer_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ListPadVer_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.NumPad_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/NumPad_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/NumPad_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.NumPad_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/NumPad_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/NumPad_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_AlphaPadLowerPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadLowerPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadLowerPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_AlphaPadLower.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadLower.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadLower.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_AlphaPadNumberPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadNumberPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadNumberPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_AlphaPadNumber.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadNumber.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadNumber.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_AlphaPadUpperPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadUpperPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadUpperPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_AlphaPadUpper.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadUpper.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_AlphaPadUpper.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconBetriebsstunden.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconBetriebsstunden.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconBetriebsstunden.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconTestbetrieb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconTestbetrieb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconTestbetrieb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_NavigationAlarme.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NavigationAlarme.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NavigationAlarme.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_NavigationIstwerte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NavigationIstwerte.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NavigationIstwerte.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_NavigationSettings.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NavigationSettings.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NavigationSettings.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_NumPad.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NumPad.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NumPad.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_NumPressed.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NumPressed.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NumPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteAbKlein.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteAbKlein.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteAbKlein.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteAb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteAb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteAb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteAufKlein.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteAufKlein.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteAufKlein.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteAuf.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteAuf.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteAuf.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteGelb75px.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteGelb75px.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteGelb75px.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteGrau75px.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteGrau75px.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteGrau75px.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteLinks.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteLinks.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteLinks.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteLoadFromUsb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteLoadFromUsb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteLoadFromUsb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteLoadParameters.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteLoadParameters.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteLoadParameters.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteNewFile.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteNewFile.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteNewFile.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteRechts.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteRechts.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteRechts.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteRefresh.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteRefresh.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteRefresh.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteSlider01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteSlider01.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteSlider01.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteSlider02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteSlider02.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteSlider02.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ProgressBorder_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ProgressBorder_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ProgressBorder_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ProgressBorder_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ProgressBorder_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ProgressBorder_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ResetAcknowledge_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ResetAcknowledge_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ResetAcknowledge_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.ResetAcknowledge_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ResetAcknowledge_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/ResetAcknowledge_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.Reset_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Reset_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Reset_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.Reset_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Reset_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Reset_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.Triggered_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Triggered_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Triggered_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.Triggered_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Triggered_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/Triggered_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.backward_active_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_active_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_active_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.backward_active_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_active_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_active_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.backward_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.backward_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/backward_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.control_button_active_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_active_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_active_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.control_button_active_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_active_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_active_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.control_button_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.control_button_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/control_button_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.down_active_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.down_active_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.down_active_control_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_control_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_control_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.down_active_control_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_control_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_active_control_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.down_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.down_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.down_pressed_control_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_control_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_control_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.down_pressed_control_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_control_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/down_pressed_control_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.forward_active_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_active_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_active_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.forward_active_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_active_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_active_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.forward_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.forward_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/forward_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.frame_header_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/frame_header_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/frame_header_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.frame_header_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/frame_header_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/frame_header_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.global_area_active_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_active_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_active_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.global_area_active_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_active_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_active_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.global_area_gradient_downside_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_downside_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_downside_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.global_area_gradient_downside_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_downside_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_downside_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.global_area_gradient_upside_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_upside_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_upside_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.global_area_gradient_upside_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_upside_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_gradient_upside_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.global_area_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.global_area_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/global_area_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.left_active_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_active_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_active_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.left_active_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_active_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_active_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.left_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.left_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/left_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.multi_down_active_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_active_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_active_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.multi_down_active_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_active_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_active_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.multi_down_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.multi_down_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_down_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.multi_up_active_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_active_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_active_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.multi_up_active_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_active_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_active_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.multi_up_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.multi_up_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/multi_up_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.right_active_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_active_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_active_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.right_active_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_active_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_active_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.right_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.right_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/right_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.up_active_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.up_active_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.up_active_control_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_control_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_control_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.up_active_control_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_control_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_active_control_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.up_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.up_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.up_pressed_control_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_control_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_control_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.up_pressed_control_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_control_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/up_pressed_control_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPadQVGA1_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPadQVGA1_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPadQVGA1_released_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_released_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_released_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPadQVGA1_released_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_released_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA1_released_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPadQVGA2_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA2_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA2_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPadQVGA2_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA2_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA2_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPadQVGA3_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA3_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA3_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPadQVGA3_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA3_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPadQVGA3_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPad_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPad_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPad_released_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_released_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_released_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneAlphaPad_released_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_released_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneAlphaPad_released_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneEditPadQVGA3_released_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadQVGA3_released_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadQVGA3_released_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneEditPadQVGA3_released_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadQVGA3_released_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadQVGA3_released_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneEditPadVga_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneEditPadVga_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneEditPadVga_released_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_released_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_released_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneEditPadVga_released_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_released_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditPadVga_released_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneEditpadQVGA2_released_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditpadQVGA2_released_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditpadQVGA2_released_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneEditpadQVGA2_released_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditpadQVGA2_released_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneEditpadQVGA2_released_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneListPadHor_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneListPadHor_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneListPadHor_released_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_released_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_released_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneListPadHor_released_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_released_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadHor_released_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneListPadVer_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneListPadVer_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneListPadVer_released_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_released_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_released_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneListPadVer_released_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_released_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneListPadVer_released_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneNumPad_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_pressed_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneNumPad_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_pressed_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneNumPad_released_0.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_released_0.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_released_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.zuneNumPad_released_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_released_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/zuneNumPad_released_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_NavigationHome.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NavigationHome.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_NavigationHome.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HintergrundGedimmt.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HintergrundGedimmt.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HintergrundGedimmt.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Gelb1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Gelb1_Dklgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb1_Dklgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb1_Dklgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Gelb1_Schwarz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb1_Schwarz.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb1_Schwarz.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Gelb2.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb2.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Gelb2_Dklgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb2_Dklgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb2_Dklgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Gelb2_Schwarz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb2_Schwarz.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb2_Schwarz.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Gelb35.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb35.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb35.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Gelb35_Dklgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb35_Dklgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb35_Dklgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Gelb35_Schwarz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb35_Schwarz.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Gelb35_Schwarz.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Hellgr1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Hellgr1_Dklgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr1_Dklgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr1_Dklgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Hellgr2.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr2.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Hellgr2_Dklgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr2_Dklgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr2_Dklgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Hellgr2_Schwarz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr2_Schwarz.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr2_Schwarz.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Hellgr35.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr35.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr35.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Hellgr35_Dklgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr35_Dklgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr35_Dklgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Ohne_Dlkgr.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Ohne_Dlkgr.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Ohne_Dlkgr.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Ohne_Gelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Ohne_Gelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Ohne_Gelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_SattDefizit_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_SattDefizit_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_SattDefizit_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TempFeuchte_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TempFeuchte_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TempFeuchte_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_ZeitRest_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_ZeitRest_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_ZeitRest_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Stoppuhr_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Stoppuhr_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Stoppuhr_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Sanduhr_1.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Sanduhr_1.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Sanduhr_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HeuGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeuGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeuGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HeuGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeuGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeuGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HeuKleinGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeuKleinGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeuKleinGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HeuKleinGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeuKleinGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeuKleinGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_RundballenGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_RundballenGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_RundballenKleinGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenKleinGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenKleinGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_RundballenKleinGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenKleinGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenKleinGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_RundballenMittelGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenMittelGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenMittelGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_RundballenMittelGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenMittelGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_RundballenMittelGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_ZeitRest_2.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_ZeitRest_2.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_ZeitRest_2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_LuefterGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_LuefterGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_LuefterGrossRot.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterGrossRot.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterGrossRot.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_LuefterKleinGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterKleinGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterKleinGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_LuefterKleinGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterKleinGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterKleinGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_LuefterKleinRot.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterKleinRot.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_LuefterKleinRot.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_EntfeuchterGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_EntfeuchterGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_EntfeuchterGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_EntfeuchterGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_EntfeuchterGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_EntfeuchterGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_EntfeuchterRot.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_EntfeuchterRot.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_EntfeuchterRot.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HeizregisterGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeizregisterGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeizregisterGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HeizregisterGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeizregisterGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeizregisterGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HeizregisterRot.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeizregisterRot.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HeizregisterRot.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_OfenGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_OfenGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_OfenGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_OfenGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_OfenGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_OfenGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_OfenRot.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_OfenRot.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_OfenRot.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconLuftmenge.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconLuftmenge.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconLuftmenge.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Tacho.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Tacho.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Tacho.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconAbtauung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconAbtauung.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconAbtauung.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconAustritt.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconAustritt.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconAustritt.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconEintritt.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconEintritt.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconEintritt.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconHochdruck.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconHochdruck.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconHochdruck.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconLuftmengeKlein.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconLuftmengeKlein.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconLuftmengeKlein.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconNiederdruck.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconNiederdruck.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconNiederdruck.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TachoKlein.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TachoKlein.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TachoKlein.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Haus.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Haus.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Haus.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconKanaldruck.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconKanaldruck.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconKanaldruck.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconsKlappen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconsKlappen.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconsKlappen.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconsSensoren.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconsSensoren.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconsSensoren.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Stoppuhr_2.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Stoppuhr_2.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Stoppuhr_2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Frame_Hellgr1_Schwarz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr1_Schwarz.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Frame_Hellgr1_Schwarz.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TempFeuchte_2.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TempFeuchte_2.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TempFeuchte_2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Trocknungsbilanz.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Trocknungsbilanz.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Trocknungsbilanz.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Loginscreen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Loginscreen.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Loginscreen.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_Sanduhr_2.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Sanduhr_2.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_Sanduhr_2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_MaisGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_MaisGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_MaisKleinGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisKleinGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisKleinGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_MaisKleinGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisKleinGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisKleinGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_MaisMittelGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisMittelGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisMittelGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_MaisMittelGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisMittelGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_MaisMittelGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_WeizenGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_WeizenGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_WeizenKleinGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenKleinGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenKleinGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_WeizenKleinGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenKleinGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenKleinGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_WeizenMittelGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenMittelGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenMittelGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_WeizenMittelGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenMittelGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_WeizenMittelGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteCursor.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteCursor.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteCursor.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteScrollAb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteScrollAb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteScrollAb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteScrollAuf.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteScrollAuf.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteScrollAuf.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteScrollLinks.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteScrollLinks.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteScrollLinks.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteScrollRechts.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteScrollRechts.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteScrollRechts.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteZoomIn.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteZoomIn.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteZoomIn.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_TasteZoomOut.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteZoomOut.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_TasteZoomOut.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HopfenGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HopfenGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HopfenKleinGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenKleinGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenKleinGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HopfenKleinGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenKleinGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenKleinGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HopfenMittelGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenMittelGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenMittelGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HopfenMittelGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenMittelGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HopfenMittelGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_KraeuterGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_KraeuterGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_KraeuterKleinGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterKleinGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterKleinGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_KraeuterKleinGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterKleinGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterKleinGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_KraeuterMittelGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterMittelGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterMittelGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_KraeuterMittelGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterMittelGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_KraeuterMittelGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HolzGrossGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzGrossGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzGrossGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HolzGrossGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzGrossGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzGrossGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HolzKleinGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzKleinGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzKleinGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HolzKleinGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzKleinGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzKleinGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HolzMittelGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzMittelGelb.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzMittelGelb.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_HolzMittelGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzMittelGrau.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_HolzMittelGrau.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconFehler.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconFehler.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconFehler.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconWarnung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconWarnung.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconWarnung.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconWitterungSchlecht.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconWitterungSchlecht.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconWitterungSchlecht.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/bminfo.PNG_IconWitterungGut.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconWitterungGut.bminfo $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Bitmaps/PNG_IconWitterungGut.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


#Bitmaps END




# Trend Configuration
TRE_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/tre., $(notdir $(TRE_SOURCES_Visu:.tre=.vco)))

$(TEMP_PATH_Visu)/tre.Trendkurve01.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/Trendkurve01.tre
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/tre.Trendkurve02.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/Trendkurve02.tre
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/tre.TrendLeistung.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/TrendLeistung.tre
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


#Trend Configuration END




# Trend Data
TRD_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/trd., $(notdir $(TRD_SOURCES_Visu:.trd=.vco)))

$(TEMP_PATH_Visu)/trd.FrischluftTemp.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/FrischluftTemp.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.FrischluftFeuchte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/FrischluftFeuchte.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.DachluftTemp.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/DachluftTemp.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.DachluftFeuchte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/DachluftFeuchte.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.TrockenluftTemp.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/TrockenluftTemp.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.TrockenluftFeuchte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/TrockenluftFeuchte.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.AbluftTemp.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/AbluftTemp.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.AbluftFeuchte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/AbluftFeuchte.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.Luftgeschw.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/Luftgeschw.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.Kanaldruck.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/Kanaldruck.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.EintrittTemp.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/EintrittTemp.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.EintrittFeuchte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/EintrittFeuchte.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.AustrittTemp.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/AustrittTemp.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.AustrittFeuchte.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/AustrittFeuchte.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.Niederdruck.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/Niederdruck.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.Hochdruck.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/Hochdruck.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/trd.LeistungAktuell.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/LeistungAktuell.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


#Trend Data END




# Trend Data Configuration
TDC_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/tdc., $(notdir $(TDC_SOURCES_Visu:.tdc=.vco)))

$(TEMP_PATH_Visu)/tdc.TrendData.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Trends/TrendData.tdc
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


#Trend Data Configuration END




# ColorMap Table
CLM_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/clm., $(notdir $(CLM_SOURCES_Visu:.clm=.vco)))

$(TEMP_PATH_Visu)/clm.Ampel.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/Ampel.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/clm.GelbGrau.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/GelbGrau.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/clm.GrauGelb.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/GrauGelb.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/clm.GrauGruenNumeric.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/GrauGruenNumeric.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/clm.GrauGruen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/GrauGruen.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/clm.RotGruen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/RotGruen.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/clm.TastenKonfigKlappen.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/TastenKonfigKlappen.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/clm.Textfarbe.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/Textfarbe.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


$(TEMP_PATH_Visu)/clm.TextfarbeBackgSw.vco: $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/ColorMaps/TextfarbeBackgSw.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas


#ColorMap Table END


#
# Borders
#
BDR_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Bump.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Etched.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Flat_black1.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Flat_black.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Flat_grey.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb1Dklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb1Schwarz.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb2Dklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb2Schwarz.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb35Dklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb35Schwarz.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr1Dklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr2Dklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr2Schwarz.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr35Dklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameOhneDklgr.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameOhneGelb.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/RaisedInner.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Raised.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/SliderAusKlein1.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/SliderEinKlein1.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/SunkenOuter.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/Sunken.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/BackwardActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/BackwardPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ControlActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ControlPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/DownActiveControl.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/DownPressedControl.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ForwardActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ForwardPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHeader.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/GlobalAreaActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/GlobalAreaPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/MultiScrollDownActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/MultiScrollDownPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/MultiScrollUpActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/MultiScrollUpPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ProgressBarBorder.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollDownActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollDownPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollLeftActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollLeftPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollRightActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollRightPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollUpActive.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/ScrollUpPressed.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/UpActiveControl.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/UpPressedControl.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb1.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb2.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameGelb35.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr1.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr2.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr35.bdr $(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Borders/FrameHellgr1Schwarz.bdr 
BDR_OBJECTS_Visu=$(TEMP_PATH_Visu)/bdr.Bordermanager.vco
$(TEMP_PATH_Visu)/bdr.Bordermanager.vco: $(BDR_SOURCES_Visu)
	$(VCC) -f '$<' -o '$@' -pkg '$(SRC_PATH_Visu)' $(BDRFLAGS_Visu) $(VCCFLAGS_Visu) -p Visu$(SRC_PATH_Visu)
#
# Logical fonts
#
$(TEMP_PATH_Visu)/lfnt.fr.vco: $(TEMP_PATH_Visu)/fr.lfnt $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu) $(VCCFLAGS_Visu) -p Visu -sfas
$(TEMP_PATH_Visu)/lfnt.nl-BE.vco: $(TEMP_PATH_Visu)/nl-BE.lfnt $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu) $(VCCFLAGS_Visu) -p Visu -sfas
$(TEMP_PATH_Visu)/lfnt.sl.vco: $(TEMP_PATH_Visu)/sl.lfnt $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu) $(VCCFLAGS_Visu) -p Visu -sfas
$(TEMP_PATH_Visu)/lfnt.de.vco: $(TEMP_PATH_Visu)/de.lfnt $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu) $(VCCFLAGS_Visu) -p Visu -sfas
$(TEMP_PATH_Visu)/lfnt.es.vco: $(TEMP_PATH_Visu)/es.lfnt $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu) $(VCCFLAGS_Visu) -p Visu -sfas
$(TEMP_PATH_Visu)/lfnt.en.vco: $(TEMP_PATH_Visu)/en.lfnt $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu) $(VCCFLAGS_Visu) -p Visu -sfas
LFNT_OBJECTS_Visu=$(TEMP_PATH_Visu)/lfnt.fr.vco $(TEMP_PATH_Visu)/lfnt.nl-BE.vco $(TEMP_PATH_Visu)/lfnt.sl.vco $(TEMP_PATH_Visu)/lfnt.de.vco $(TEMP_PATH_Visu)/lfnt.es.vco $(TEMP_PATH_Visu)/lfnt.en.vco 

#Runtime Object
$(VCR_OBJECT_Visu) : $(VCR_SOURCE_Visu)
	$(VCC) -f '$<' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -sl de $(VCCFLAGS_Visu) -rt  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4735 -sfas
# Local resources Library rules
LIB_LOCAL_RES_Visu=$(TEMP_PATH_Visu)/localres.vca
$(LIB_LOCAL_RES_Visu) : $(TEMP_PATH_Visu)/Visu02.ccf

# Bitmap Library rules
LIB_BMP_RES_Visu=$(TEMP_PATH_Visu)/bmpres.vca
$(LIB_BMP_RES_Visu) : $(TEMP_PATH_Visu)/Visu03.ccf
$(BMGRP_OBJECTS_Visu) : $(PALFILE_Visu) $(VC_LANGUAGES_Visu)
$(BMINFO_OBJECTS_Visu) : $(PALFILE_Visu)

BUILD_FILE_Visu=$(TEMP_PATH_Visu)/BuildFiles.arg
$(BUILD_FILE_Visu) : BUILD_FILE_CLEAN_Visu $(BUILD_SOURCES_Visu)
BUILD_FILE_CLEAN_Visu:
	$(RM) /F /Q '$(BUILD_FILE_Visu)' 2>nul
#All Modules depending to this project
PROJECT_MODULES_Visu=$(AS_CPU_PATH)/Visu01.br $(AS_CPU_PATH)/Visu02.br $(AS_CPU_PATH)/Visu03.br $(FONT_MODULES_Visu) $(SHARED_MODULE)

# General Build rules

$(TARGET_FILE_Visu): $(PROJECT_MODULES_Visu) $(TEMP_PATH_Visu)/Visu.prj
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu) -fw '$(VCFIRMWAREPATH)' -m $(VCSTPOST) -v V1.00.0 -f '$(TEMP_PATH_Visu)/Visu.prj' -o '$@' -vc '$(VCOBJECT_Visu)' $(DEPENDENCIES_Visu) $(addprefix -d ,$(notdir $(PROJECT_MODULES_Visu:.br=)))

$(AS_CPU_PATH)/Visu01.br: $(TEMP_PATH_Visu)/Visu01.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_Visu)' -f '$<' -o '$@' $(DEPENDENCIES_Visu)

$(AS_CPU_PATH)/Visu02.br: $(TEMP_PATH_Visu)/Visu02.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_Visu)' -f '$<' -o '$@' $(DEPENDENCIES_Visu)

$(AS_CPU_PATH)/Visu03.br: $(TEMP_PATH_Visu)/Visu03.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_Visu)' -f '$<' -o '$@' $(DEPENDENCIES_Visu)

# General Build rules END
$(LIB_LOCAL_OBJ_Visu) : $(TEMP_PATH_Visu)/Visu01.ccf

# Main Module
$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu.vcm:
$(TEMP_PATH_Visu)/Visu.prj: $(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu.vcm
	$(VCDEP) -m '$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu.vcm' -s '$(AS_CPU_PATH)/VCShared/Shared.vcm' -p '$(AS_PATH)/AS/VC/Firmware' -c '$(AS_CPU_PATH)' -fw '$(VCFIRMWAREPATH)' -hw '$(CPUHWC)' -so $(VC_STATIC_OPTIONS_Visu) -o Visu -proj Visu
	$(VCPL) $(notdir $(PROJECT_MODULES_Visu:.br=,4)) Visu,2 -o '$@' -p Visu -vc 'Visu' -verbose 'False' -fl '$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu.vcm' -vcr '$(VCR_SOURCE_Visu)' -prj '$(AS_PROJECT_PATH)' -warningLevel2 -sfas

# 01 Module

DEL_TARGET01_LFL_Visu=$(TEMP_PATH_Visu)\Visu01.ccf.lfl
$(TEMP_PATH_Visu)/Visu01.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_Visu) $(TEMP_PATH_Visu)/Visu03.ccf $(LIB_LOCAL_RES_Visu) $(TEMP_PATH_Visu)/Visu02.ccf $(DIS_OBJECTS_Visu) $(PAGE_OBJECTS_Visu) $(VCS_OBJECTS_Visu) $(VCVK_OBJECTS_Visu) $(VCRT_OBJECTS_Visu) $(TPR_OBJECTS_Visu) $(TXTGRP_OBJECTS_Visu) $(LAYER_OBJECTS_Visu) $(VCR_OBJECT_Visu) $(TDC_OBJECTS_Visu) $(TRD_OBJECTS_Visu) $(TRE_OBJECTS_Visu) $(PRC_OBJECTS_Visu) $(SCR_OBJECTS_Visu)
	-@CMD /Q /C if exist "$(DEL_TARGET01_LFL_Visu)" DEL /F /Q "$(DEL_TARGET01_LFL_Visu)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_BMP_RES_Visu)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_LOCAL_RES_Visu)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(DIS_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .page -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCS_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .vcvk -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCRT_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(TPR_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .txtgrp -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .layer -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCR_OBJECT_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .tdc -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .trd -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(TEMP_PATH_Visu)/tre.Trendkurve01.vco' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(TEMP_PATH_Visu)/tre.Trendkurve02.vco' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(TEMP_PATH_Visu)/tre.TrendLeistung.vco' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(SCR_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p Visu -lib '$(LIB_LOCAL_OBJ_Visu)' -P '$(AS_PROJECT_PATH)' -m 'local objects' -profile 'False' -warningLevel2 -vcr 4735 -sfas
# 01 Module END

# 02 Module

DEL_TARGET02_LFL_Visu=$(TEMP_PATH_Visu)\Visu02.ccf.lfl
$(TEMP_PATH_Visu)/Visu02.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_Visu) $(TEMP_PATH_Visu)/Visu03.ccf $(BDR_OBJECTS_Visu) $(LFNT_OBJECTS_Visu) $(CLM_OBJECTS_Visu)
	-@CMD /Q /C if exist "$(DEL_TARGET02_LFL_Visu)" DEL /F /Q "$(DEL_TARGET02_LFL_Visu)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_BMP_RES_Visu)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(BDR_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LFNT_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(CLM_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p Visu -lib '$(LIB_LOCAL_RES_Visu)' -P '$(AS_PROJECT_PATH)' -m 'local resources' -profile 'False' -warningLevel2 -vcr 4735 -sfas
# 02 Module END

# 03 Module

DEL_TARGET03_LFL_Visu=$(TEMP_PATH_Visu)\Visu03.ccf.lfl
$(TEMP_PATH_Visu)/Visu03.ccf: $(LIB_SHARED) $(SHARED_CCF) $(BMGRP_OBJECTS_Visu) $(BMINFO_OBJECTS_Visu) $(PALFILE_Visu)
	-@CMD /Q /C if exist "$(DEL_TARGET03_LFL_Visu)" DEL /F /Q "$(DEL_TARGET03_LFL_Visu)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .bmgrp -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .bminfo -vcp '$(AS_PROJECT_PATH)/Logical/Visualisierung/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p Visu -lib '$(LIB_BMP_RES_Visu)' -P '$(AS_PROJECT_PATH)' -m 'bitmap resources' -profile 'False' -warningLevel2 -vcr 4735 -sfas
# 03 Module END

