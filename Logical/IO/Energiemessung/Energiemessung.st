

PROGRAM _INIT
	
	MEM_EnergieGesamt			:= 0.0;
	apModulEnergie.ClearEnergy	:= TRUE;

END_PROGRAM


PROGRAM _CYCLIC
	
	
	//Befehl für Löschen von Modulregister wieder zurücksetzen, sobald Register gelöscht ist
	IF apModulEnergie.RBClearEnergy THEN
		apModulEnergie.ClearEnergy	:= FALSE;
	END_IF
	
	
	//Zeitticks erzeugen
	fbLascoZdxx_1(IN 	:= Echtzeit.Minute);
	minTick				:= fbLascoZdxx_1.Q;
	
		
	
	//Energiemessung (X20AP3131) **************************************************************************************
	//***************************************************************************************************************************
	
	//Energiezähler starten, wenn Option in Ausstattung aktiviert
	apModulEnergie.EnabEnergy	:= Betriebsparameter.Ausstattung.Energiemessung;
	
	//Datenpunkte in REAL umwandeln, damit Nachkommastelle erhalten bleibt
	loc_LeistungAkt			:= INT_TO_REAL(apModulEnergie.PmeanT);
	loc_EnergieSchein		:= UDINT_TO_REAL(apModulEnergie.SAenergyT);
	
	//Berechnung aktuelle Leistungsaufnahme & Scheinenergie Gesamt
	hmiNutzungsdaten.Energiemessung.LeistungAktuell	:= (loc_LeistungAkt * 4) / 100;
	loc_EnergieGesamt								:= (loc_EnergieSchein / 360);
	
	//Tageszähler rücksetzbar
	IF hmiButtons.ResetEnergieverbrTag THEN
		hmiButtons.ResetEnergieverbrTag				:= FALSE;
		loc_EnergieMinute							:= 0.0;
		hmiNutzungsdaten.Energiemessung.EnergieTag		:= 0.0;
	ELSIF minTick THEN
		loc_EnergieMinute								:= loc_EnergieGesamt - MEM_EnergieGesamt;
		hmiNutzungsdaten.Energiemessung.EnergieTag		:= hmiNutzungsdaten.Energiemessung.EnergieTag + loc_EnergieMinute;
		hmiNutzungsdaten.Energiemessung.EnergieGesamt 	:= hmiNutzungsdaten.Energiemessung.EnergieGesamt + loc_EnergieMinute;
		MEM_EnergieGesamt								:= MEM_EnergieGesamt + loc_EnergieMinute;
	END_IF
		
	//Werte in Anlagenstatus übergeben (für CSV)
	gStatusAnlage.EnergieLeistungAkt				:= Nutzungsdaten.Energiemessung.LeistungAktuell;
	gStatusAnlage.EnergieverbrGes					:= Nutzungsdaten.Energiemessung.EnergieGesamt;
	gStatusAnlage.EnergieverbrTag					:= Nutzungsdaten.Energiemessung.EnergieTag;
	
	//Globale Variable für "Modul OK" erzeugen (wird in den IO-Mappings zur Fehlergenerierung verwendet)
	gEnergiemessungModulOk	:= apModulEnergie.ModulOk;
	
	
END_PROGRAM