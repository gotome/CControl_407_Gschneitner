
PROGRAM _INIT
	
	hmiParameter;
	MpRecipeXml_0.Enable		:= FALSE;
	MpRecipeXml_0();
	MpRecipeRegPar_0.Enable		:= FALSE;
	MpRecipeRegPar_0();
	MpRecipeUI_0.Enable			:= FALSE;
	MpRecipeUI_0();
	FileCopy_0.enable			:= FALSE;
	FileCopy_0();
	
	hmiStatus.ParameterFileNameAufUsb	:= 'FileNameAufUsb';
	
	//Standardparametersatz laden, wenn keine Parameter vorhanden (neues Display)
	IF (NOT Betriebsparameter.Allgemein.ParameterVorhanden) THEN
		gWerksparameterLaden	:= TRUE;
	END_IF
	
	
END_PROGRAM
      


PROGRAM _CYCLIC
	
	
	//Parametersatz-Verwaltung mittels mapp-Service im XML-Dateiformat
	//================================================================
	//Parametersätze können wahlweise von der USER-Partition am Display,
	//oder von einem USB-Stick geladen werden. 
	
	//Schreibschutz für StandardParametersätze
	IF (UIConnect.New.FileName = '207Werk') OR (UIConnect.New.FileName = '307Werk') OR (UIConnect.New.FileName = '407Werk') OR (UIConnect.New.FileName = '407PlusWerk') OR (UIConnect.New.FileName = '304Werk') OR
		(UIConnect.New.FileName = 'HB4000Werk') OR (UIConnect.New.FileName = 'HB3000Werk') OR (FileNameFromUSB = '207Werk') OR (FileNameFromUSB = '307Werk') OR (FileNameFromUSB = '407Werk') OR 
		(FileNameFromUSB = '407PlusWerk') OR (FileNameFromUSB = '304Werk') OR (FileNameFromUSB = 'HB4000Werk') OR (FileNameFromUSB = 'HB3000Werk') THEN
		loc_LockNewFile	:= TRUE;
	ELSE
		loc_LockNewFile	:= FALSE;
	END_IF


	//Schrittschaltwerk Parametersicherung
	//************************************
	
	CASE step OF
		
		
		//**********************************************************************************************************
		//DATEIVERWALTUNG VON BENUTZERPARTITION F:\
		0:
		
			//*** state entry ***
			IF stateEntry THEN
				stateEntry	:= FALSE;
				MpRecipeXml_0.Enable		:= FALSE;
				MpRecipeXml_0.ErrorReset	:= FALSE;
				MpRecipeXml_0();
				MpRecipeRegPar_0.Enable		:= FALSE;
				MpRecipeRegPar_0.ErrorReset	:= FALSE;
				MpRecipeRegPar_0();
				MpRecipeUI_0.Enable			:= FALSE;
				MpRecipeUI_0.ErrorReset		:= FALSE;
				MpRecipeUI_0();
				hmiButtons.ParameterAufUsbKopieren := FALSE;
				hmiButtons.ParameterVonUsbLaden := FALSE;
			END_IF
		
			//*** state during ***
			MpRecipeXml_0.Enable		:= TRUE;
			MpRecipeXml_0.MpLink		:= ADR(gMappRecipeLink);
			MpRecipeXml_0.DeviceName	:= ADR('CF');
			MpRecipeXml_0.FileName		:= ADR('407Werk');
			MpRecipeXml_0();
	
			MpRecipeRegPar_0.MpLink		:= ADR(gMappRecipeLink);
			MpRecipeRegPar_0.Enable		:= TRUE;
			MpRecipeRegPar_0.PVName		:= ADR('hmiParameter');
			MpRecipeRegPar_0();
		
			MpRecipeUI_0.MpLink			:= ADR(gMappRecipeLink);
			MpRecipeUI_0.Enable			:= TRUE;
			MpRecipeUI_0.UISetup		:= UISetup;
			MpRecipeUI_0.UIConnect		:= ADR(UIConnect);
			MpRecipeUI_0();
		
		
			//*** state exit ***
			//Parametersatz von USB laden
			IF hmiButtons.ParameterVonUsbLaden THEN
				stateEntry	:= TRUE;
				step		:= 1;
			//Ausgewählten Parametersatz auf USB-Stick kopieren
			ELSIF hmiButtons.ParameterAufUsbKopieren THEN
				stateEntry	:= TRUE;
				step		:= 3;
			//Keine Parameter vorhanden -> Werksparameter laden
			ELSIF gWerksparameterLaden THEN
				stateEntry	:= TRUE;
				step		:= 4;
				//Fehler -> Reset
			ELSIF MpRecipeXml_0.Error OR MpRecipeRegPar_0.Error OR MpRecipeUI_0.Error THEN
				stateEntry	:= TRUE;
				step		:= 255;
			END_IF
			
			
		//**********************************************************************************************************
		//DATEI VON USB-STICK LADEN
		1:
		
			//*** state entry ***
			IF stateEntry THEN
				stateEntry	:= FALSE;
				MpRecipeXml_0.Enable		:= FALSE;
				MpRecipeXml_0();
				MpRecipeRegPar_0.Enable		:= FALSE;
				MpRecipeRegPar_0();
				MpRecipeUI_0.Enable			:= FALSE;
				MpRecipeUI_0();
			END_IF
		
			//*** state during ***
			MpRecipeXml_0.Enable		:= TRUE;
			
			MpRecipeXml_0.MpLink		:= ADR(gMappRecipeLink);
			MpRecipeXml_0.DeviceName	:= ADR('usb_device');
			MpRecipeXml_0.FileName		:= ADR(hmiStatus.ParameterFileNameAufUsb);
			MpRecipeXml_0();
	
			MpRecipeRegPar_0.MpLink		:= ADR(gMappRecipeLink);
			MpRecipeRegPar_0.Enable		:= TRUE;
			MpRecipeRegPar_0.PVName		:= ADR('hmiParameter');
			MpRecipeRegPar_0();
		
			MpRecipeXml_0.Load			:= TRUE;
			
			
			//*** state exit ***
			//Parametersatz von USB fertig geladen -> Neuen Parametersatz mit selben Namen auf F:\ ablegen
			IF MpRecipeXml_0.CommandDone THEN
				MpRecipeXml_0.Load		:= FALSE;
				stateEntry				:= TRUE;
				step					:= 2;
			//Fehler -> Reset
			ELSIF MpRecipeXml_0.Error OR MpRecipeRegPar_0.Error OR MpRecipeUI_0.Error THEN
				stateEntry	:= TRUE;
				step		:= 255;
			END_IF
		
			
		//**********************************************************************************************************
		//DATEI VON USB-STICK AUF BENUTZERPARTITION SPEICHERN
		2:
			//*** state entry ***
			IF stateEntry THEN
				stateEntry	:= FALSE;
				MpRecipeXml_0.Enable		:= FALSE;
				MpRecipeXml_0();
				MpRecipeRegPar_0.Enable		:= FALSE;
				MpRecipeRegPar_0();
				MpRecipeUI_0.Enable			:= FALSE;
				MpRecipeUI_0();
			END_IF
			
			MpRecipeXml_0.Enable		:= TRUE;
			MpRecipeXml_0.MpLink		:= ADR(gMappRecipeLink);
			MpRecipeXml_0.DeviceName	:= ADR('CF');
			MpRecipeXml_0.FileName		:= ADR('407Werk');
			MpRecipeXml_0();
			
			MpRecipeRegPar_0.MpLink		:= ADR(gMappRecipeLink);
			MpRecipeRegPar_0.Enable		:= TRUE;
			MpRecipeRegPar_0.PVName		:= ADR('hmiParameter');
			MpRecipeRegPar_0();
			
			MpRecipeUI_0.MpLink			:= ADR(gMappRecipeLink);
			MpRecipeUI_0.Enable			:= TRUE;
			MpRecipeUI_0.UISetup		:= UISetup;
			MpRecipeUI_0.UIConnect		:= ADR(UIConnect);
			MpRecipeUI_0();
			
			UIConnect.New.FileName		:= hmiStatus.ParameterFileNameAufUsb;
			UIConnect.New.Create		:= TRUE;
			
			//*** state exit ***
			//Parametersatz abgespeichert
			IF MpRecipeXml_0.CommandDone THEN
				UIConnect.Recipe.Refresh	:= TRUE;
				stateEntry					:= TRUE;
				step						:= 0;
				//Fehler -> Reset
			ELSIF MpRecipeXml_0.Error OR MpRecipeRegPar_0.Error OR MpRecipeUI_0.Error THEN
				stateEntry	:= TRUE;
				step		:= 255;
			END_IF
			
			
			
		//**********************************************************************************************************
		//PARAMETERSATZ AUF USB-STICK KOPIEREN
		3:
		
			//*** state entry ***
			IF stateEntry THEN
				stateEntry	:= FALSE;
				MpRecipeXml_0.Enable		:= FALSE;
				MpRecipeXml_0();
				MpRecipeRegPar_0.Enable		:= FALSE;
				MpRecipeRegPar_0();
				MpRecipeUI_0.Enable			:= FALSE;
				MpRecipeUI_0();
				FileCopy_0.enable			:= FALSE;
				FileCopy_0();
			END_IF
		
			//*** state during ***
			loc_FileName	:= UIConnect.Recipe.List.Names[UIConnect.Recipe.List.SelectedIndex];
			
			FileCopy_0.enable 	:= TRUE;
			FileCopy_0.option	:= fiOVERWRITE;
			FileCopy_0.pDest	:= ADR(loc_FileName);
			FileCopy_0.pDestDev	:= ADR('usb_device');
			FileCopy_0.pSrc		:= ADR(loc_FileName);
			FileCopy_0.pSrcDev	:= ADR('CF');
			FileCopy_0();
			
			
			//*** state exit ***
			//Parametersatz auf USB kopiert
			IF FileCopy_0.status = 0 THEN
				stateEntry 	:= TRUE;
				step		:= 0;
			//Fehler
			ELSIF FileCopy_0.status <> ERR_FUB_BUSY THEN
				stateEntry	:= TRUE;
				step		:= 255;
			END_IF
			
			
			
		//**********************************************************************************************************
		//WERKSPARAMETER BEI NEUEM DISPLAY LADEN
		4:
		
			//*** state entry ***
			IF stateEntry THEN
				stateEntry	:= FALSE;
				MpRecipeXml_0.Enable		:= FALSE;
				MpRecipeXml_0();
				MpRecipeRegPar_0.Enable		:= FALSE;
				MpRecipeRegPar_0();
				MpRecipeUI_0.Enable			:= FALSE;
				MpRecipeUI_0();	
				gWerksparameterLaden		:= FALSE;
			END_IF
		
			//*** state during ***
			MpRecipeXml_0.Enable		:= TRUE;
			
			MpRecipeXml_0.MpLink		:= ADR(gMappRecipeLink);
			MpRecipeXml_0.DeviceName	:= ADR('CF');
			IF hmiStatus.NameSteuerung = 0 THEN
				MpRecipeXml_0.FileName		:= ADR('407Werk');
			ELSIF hmiStatus.NameSteuerung = 1 THEN
				MpRecipeXml_0.FileName		:= ADR('407PlusWerk');
			ELSIF hmiStatus.NameSteuerung = 2 THEN
				MpRecipeXml_0.FileName		:= ADR('307Werk');
			ELSIF hmiStatus.NameSteuerung = 3 THEN
				MpRecipeXml_0.FileName		:= ADR('304Werk');
			ELSIF hmiStatus.NameSteuerung = 4 THEN
				MpRecipeXml_0.FileName		:= ADR('HB4000Werk');
			ELSIF hmiStatus.NameSteuerung = 5 THEN
				MpRecipeXml_0.FileName		:= ADR('HB3000Werk');
			ELSIF hmiStatus.NameSteuerung = 6 THEN
				MpRecipeXml_0.FileName		:= ADR('207Werk');
			END_IF
			MpRecipeXml_0();
	
			MpRecipeRegPar_0.MpLink		:= ADR(gMappRecipeLink);
			MpRecipeRegPar_0.Enable		:= TRUE;
			MpRecipeRegPar_0.PVName		:= ADR('hmiParameter');
			MpRecipeRegPar_0();
		
			MpRecipeXml_0.Load			:= TRUE;
			
			
			//*** state exit ***
			//Parametersatz geladen
			IF MpRecipeXml_0.CommandDone THEN
				MpRecipeXml_0.Load		:= FALSE;
				stateEntry				:= TRUE;
				step					:= 0;
			//Fehler -> Reset
			ELSIF MpRecipeXml_0.Error OR MpRecipeRegPar_0.Error OR MpRecipeUI_0.Error THEN
				stateEntry	:= TRUE;
				step		:= 255;
			END_IF
			
			
			
		//**********************************************************************************************************
		//FEHLER
		255:
		
			//*** state entry ***
			IF stateEntry THEN
				stateEntry	:= FALSE;
			END_IF
			
			MpRecipeXml_0.ErrorReset	:= TRUE;
			MpRecipeXml_0();
			
			MpRecipeRegPar_0.ErrorReset	:= TRUE;
			MpRecipeRegPar_0();
			
			MpRecipeUI_0.ErrorReset		:= TRUE;
			MpRecipeUI_0();
			
		
			step:= 0;
			stateEntry := TRUE;
		
			
	END_CASE
	
	
	
END_PROGRAM


PROGRAM _EXIT
	
	MpRecipeXml_0.Enable		:= FALSE;
	MpRecipeXml_0();
	MpRecipeRegPar_0.Enable		:= FALSE;
	MpRecipeRegPar_0();
	MpRecipeUI_0.Enable			:= FALSE;
	MpRecipeUI_0();
	
END_PROGRAM
      