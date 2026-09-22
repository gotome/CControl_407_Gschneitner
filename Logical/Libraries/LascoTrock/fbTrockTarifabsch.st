
(* Funktionsbaustein Tarifabschaltung *)
FUNCTION_BLOCK fbTrockTarifabsch
	
	
	IF (Freigabe = TRUE) THEN
		
	
		//Zeitfenster 1 ****************************************************************************************************************************
		
		StartZeit1	:= (StartStd1 * 100) + StartMin1;
		StoppZeit1	:= (StoppStd1 * 100) + StoppMin1;
		
		//Vorlaufzeit Luftaufbereitung berechnen
		loc_StdVorlaufzeitREAL 	:= VorlaufzeitLuftaufbMin / 60;
		loc_StdVorlaufzeit		:= TRUNC(loc_StdVorlaufzeitREAL);
		
		loc_MinVorlaufzeit	:= VorlaufzeitLuftaufbMin - (loc_StdVorlaufzeit * 60);
	
		loc_ZwischenergStartStd	:= StartStd1 - loc_StdVorlaufzeit;
		IF (loc_ZwischenergStartStd < 0) THEN
			loc_StartStdLuftaufb	:= 24 + loc_ZwischenergStartStd;
		ELSE
			loc_StartStdLuftaufb	:= loc_ZwischenergStartStd;
		END_IF
	
		loc_ZwischenergStartMin := StartMin1 - loc_MinVorlaufzeit;
		IF loc_ZwischenergStartMin < 0 THEN
			loc_StartMinLuftaufb	:= 60 + loc_ZwischenergStartMin;
			loc_StartStdLuftaufb	:= loc_StartStdLuftaufb - 1;
			IF (loc_StartStdLuftaufb < 0) THEN
				loc_StartStdLuftaufb	:= 24 + loc_StartStdLuftaufb;
			END_IF
		ELSE
			loc_StartMinLuftaufb	:= loc_ZwischenergStartMin;
		END_IF

		StartZeitLuftaufb1	:= (loc_StartStdLuftaufb * 100) + loc_StartMinLuftaufb;
		
	
		//Freigabe Zeitfenster 1
		FreigZeitfenster1	:= FALSE;
		IF (StartZeit1 > StoppZeit1) THEN
			IF (AktZeit >= StartZeit1) OR (AktZeit < StoppZeit1) THEN
				FreigZeitfenster1 	:= TRUE;
			END_IF
		ELSE
			IF (AktZeit >= StartZeit1) AND (AktZeit < StoppZeit1) THEN
				FreigZeitfenster1	:= TRUE;
			END_IF
		END_IF
		
		//Freigabe Zeitfenster Luftaufbereitung 1
		FreigabeZeitfensterLuftaufb1	:= FALSE;
		IF (StartZeit1 <> 0) AND (StoppZeit1 <> 0) THEN
			IF (StartZeitLuftaufb1 > StoppZeit1) THEN
				IF (AktZeit >= StartZeitLuftaufb1) OR (AktZeit < StoppZeit1) THEN
					FreigabeZeitfensterLuftaufb1	:= TRUE;
				END_IF
			ELSE
				IF (AktZeit >= StartZeitLuftaufb1) AND (AktZeit < StoppZeit1) THEN
					FreigabeZeitfensterLuftaufb1	:= TRUE;
				END_IF
			END_IF
		END_IF
		
		
		//Zeitfenster 2 ****************************************************************************************************************************
	
		StartZeit2	:= (StartStd2 * 100) + StartMin2;
		StoppZeit2	:= (StoppStd2 * 100) + StoppMin2;
		
		//Vorlaufzeit Luftaufbereitung berechnen
		loc_StdVorlaufzeitREAL 	:= VorlaufzeitLuftaufbMin / 60;
		loc_StdVorlaufzeit		:= TRUNC(loc_StdVorlaufzeitREAL);
		
		loc_MinVorlaufzeit	:= VorlaufzeitLuftaufbMin - (loc_StdVorlaufzeit * 60);
	
		loc_ZwischenergStartStd	:= StartStd2 - loc_StdVorlaufzeit;
		IF (loc_ZwischenergStartStd < 0) THEN
			loc_StartStdLuftaufb	:= 24 + loc_ZwischenergStartStd;
		ELSE
			loc_StartStdLuftaufb	:= loc_ZwischenergStartStd;
		END_IF
	
		loc_ZwischenergStartMin := StartMin2 - loc_MinVorlaufzeit;
		IF loc_ZwischenergStartMin < 0 THEN
			loc_StartMinLuftaufb	:= 60 + loc_ZwischenergStartMin;
			loc_StartStdLuftaufb	:= loc_StartStdLuftaufb - 1;
			IF (loc_StartStdLuftaufb < 0) THEN
				loc_StartStdLuftaufb	:= 24 + loc_StartStdLuftaufb;
			END_IF
		ELSE
			loc_StartMinLuftaufb	:= loc_ZwischenergStartMin;
		END_IF

		StartZeitLuftaufb2	:= (loc_StartStdLuftaufb * 100) + loc_StartMinLuftaufb;
		
	
		//Freigabe Zeitfenster 2
		FreigZeitfenster2	:= FALSE;
		IF (StartZeit2 > StoppZeit2) THEN
			IF (AktZeit >= StartZeit2) OR (AktZeit < StoppZeit2) THEN
				FreigZeitfenster2 	:= TRUE;
			END_IF
		ELSE
			IF (AktZeit >= StartZeit2) AND (AktZeit < StoppZeit2) THEN
				FreigZeitfenster2	:= TRUE;
			END_IF
		END_IF
		
		//Freigabe Zeitfenster Luftaufbereitung 2
		FreigabeZeitfensterLuftaufb2	:= FALSE;
		IF (StartZeit2 <> 0) AND (StoppZeit2 <> 0) THEN
			IF (StartZeitLuftaufb2 > StoppZeit2) THEN
				IF (AktZeit >= StartZeitLuftaufb2) OR (AktZeit < StoppZeit2) THEN
					FreigabeZeitfensterLuftaufb2	:= TRUE;
				END_IF
			ELSE
				IF (AktZeit >= StartZeitLuftaufb2) AND (AktZeit < StoppZeit2) THEN
					FreigabeZeitfensterLuftaufb2	:= TRUE;
				END_IF
			END_IF
		END_IF
		
		
		//Zeitfenster 3 ****************************************************************************************************************************
		
		StartZeit3	:= (StartStd3 * 100) + StartMin3;
		StoppZeit3	:= (StoppStd3 * 100) + StoppMin3;
		
		//Vorlaufzeit Luftaufbereitung berechnen
		loc_StdVorlaufzeitREAL 	:= VorlaufzeitLuftaufbMin / 60;
		loc_StdVorlaufzeit		:= TRUNC(loc_StdVorlaufzeitREAL);
		
		loc_MinVorlaufzeit	:= VorlaufzeitLuftaufbMin - (loc_StdVorlaufzeit * 60);
	
		loc_ZwischenergStartStd	:= StartStd3 - loc_StdVorlaufzeit;
		IF (loc_ZwischenergStartStd < 0) THEN
			loc_StartStdLuftaufb	:= 24 + loc_ZwischenergStartStd;
		ELSE
			loc_StartStdLuftaufb	:= loc_ZwischenergStartStd;
		END_IF
	
		loc_ZwischenergStartMin := StartMin3 - loc_MinVorlaufzeit;
		IF loc_ZwischenergStartMin < 0 THEN
			loc_StartMinLuftaufb	:= 60 + loc_ZwischenergStartMin;
			loc_StartStdLuftaufb	:= loc_StartStdLuftaufb - 1;
			IF (loc_StartStdLuftaufb < 0) THEN
				loc_StartStdLuftaufb	:= 24 + loc_StartStdLuftaufb;
			END_IF
		ELSE
			loc_StartMinLuftaufb	:= loc_ZwischenergStartMin;
		END_IF

		StartZeitLuftaufb3	:= (loc_StartStdLuftaufb * 100) + loc_StartMinLuftaufb;
		
	
		//Freigabe Zeitfenster 3
		FreigZeitfenster3	:= FALSE;
		IF (StartZeit3 > StoppZeit3) THEN
			IF (AktZeit >= StartZeit3) OR (AktZeit < StoppZeit3) THEN
				FreigZeitfenster3 	:= TRUE;
			END_IF
		ELSE
			IF (AktZeit >= StartZeit3) AND (AktZeit < StoppZeit3) THEN
				FreigZeitfenster3	:= TRUE;
			END_IF
		END_IF
		
		//Freigabe Zeitfenster Luftaufbereitung 3
		FreigabeZeitfensterLuftaufb3	:= FALSE;
		IF (StartZeit3 <> 0) AND (StoppZeit3 <> 0) THEN
			IF (StartZeitLuftaufb3 > StoppZeit3) THEN
				IF (AktZeit >= StartZeitLuftaufb3) OR (AktZeit < StoppZeit3) THEN
					FreigabeZeitfensterLuftaufb3	:= TRUE;
				END_IF
			ELSE
				IF (AktZeit >= StartZeitLuftaufb3) AND (AktZeit < StoppZeit3) THEN
					FreigabeZeitfensterLuftaufb3	:= TRUE;
				END_IF
			END_IF
		END_IF
		
	
		TarifabschaltungEin			:= FreigZeitfenster1 OR FreigZeitfenster2 OR FreigZeitfenster3;
		TarifabschaltungLuftaufbEin	:= FreigabeZeitfensterLuftaufb1 OR FreigabeZeitfensterLuftaufb2 OR FreigabeZeitfensterLuftaufb3;
		
	ELSE
		
		FreigZeitfenster1				:= FALSE;
		FreigZeitfenster2				:= FALSE;
		FreigZeitfenster3				:= FALSE;
		FreigabeZeitfensterLuftaufb1	:= FALSE;
		FreigabeZeitfensterLuftaufb2	:= FALSE;
		FreigabeZeitfensterLuftaufb3	:= FALSE;
		TarifabschaltungEin				:= FALSE;
		TarifabschaltungLuftaufbEin		:= FALSE;
		loc_MinVorlaufzeit				:= 0;
		loc_StartMinLuftaufb			:= 0;
		loc_StartStdLuftaufb			:= 0;
		loc_StdVorlaufzeit				:= 0;
		loc_StdVorlaufzeitREAL			:= 0;
		loc_ZwischenergStartMin			:= 0;
		loc_ZwischenergStartStd			:= 0;
		
	END_IF
	
	
	
END_FUNCTION_BLOCK