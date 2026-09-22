
ACTION actionBetrieb: 
	
	gStatusAnlage.Aktor[AKTOR_SCHRITTKETTE]	:= STATUS_ANLAGE_IN_BETRIEB;
	
	//Notstromaggregat anfordern, wenn in Box in Betrieb und in Ausstattung vorhanden
	Aktoren.Notstromaggregat.NotstromaggregatAngefordert := (Boxen.Box1Out.BoxAktiv OR Boxen.Box2Out.BoxAktiv OR Boxen.Box3Out.BoxAktiv OR 
	Boxen.Box4Out.BoxAktiv OR Boxen.Box5Out.BoxAktiv OR Boxen.Box6Out.BoxAktiv OR Boxen.NotbetriebBox1 OR Boxen.NotbetriebBox2 OR
	Boxen.NotbetriebBox3 OR Boxen.NotbetriebBox4 OR Boxen.NotbetriebBox5 OR Boxen.NotbetriebBox6 OR Boxen.NotbetriebVentilator1 OR Boxen.NotbetriebVentilator2)
	AND Betriebsparameter.Ausstattung.Notstromaggregat;
	
	//Ölsumpfheizungen Ein, wenn Kompressoren nicht in Betrieb (und Entfeuchter in Ausstattung vorhanden)
	Aktoren.OelsumpfheizungModul1.Freigabe			:= Betriebsparameter.Ausstattung.Entfeuchter AND NOT Aktoren.KompressorModul1.FreigabeKompressorOut;
	Aktoren.OelsumpfheizungModul2.Freigabe			:= Betriebsparameter.Ausstattung.Entfeuchter AND NOT Aktoren.KompressorModul2.FreigabeKompressorOut;
	
	//Luftentfeuchter freigeben, wenn von Boxen angefordert und Mindestlaufzeit Ölsumpfheizung abgelaufen und Notstromaggregat bereit und Ventilator bereit
	IF (gMindestlaufzOelsumpfOk OR ((hmiStatus.CurUserLevel > 2) AND (Nutzungsdaten.BstGes.Kompressor1Std < CONST_ZEIT_TESTPHASE))) AND
		(Aktoren.Notstromaggregat.NotstromBereitOut OR (NOT Betriebsparameter.Ausstattung.Notstromaggregat)) THEN	
		
		Aktoren.KompressorModul1.Freigabe			:= Betriebsparameter.Ausstattung.Entfeuchter AND (Boxen.FreigabeLuftentfeuchter OR Boxen.FreigabeEntfeuchterInselbetrieb) AND
		((Boxen.EntfeuchterVonVent1Abhaengig AND Boxen.FreigabeVentilator1 (*Aktoren.VentUndKlappen.FreigabeVentilator1Out*) AND NOT Aktoren.VentUndKlappen.FehlerFuVentilator1) OR 
		(Boxen.EntfeuchterVonVent2Abhaengig AND Boxen.FreigabeVentilator2 (*Aktoren.VentUndKlappen.FreigabeVentilator2Out*) AND NOT Aktoren.VentUndKlappen.FehlerFuVentilator2) OR 
		(Boxen.FreigabeEntfeuchterInselbetrieb AND Aktoren.VentUndKlappen.Ventilator1InBetrieb)) AND NOT 
		gCmdAnlage.FehlerModul1 AND (gStatusAnlage.UmluftbetriebAktiv OR (NOT Betriebsparameter.Ausstattung.EntfeuchterNurImUmluftbetrieb)) AND NOT 
		Tarifabschaltung.TarifabschaltungLuftaufbEin;
		Aktoren.KompressorModul1.Dauerbetrieb		:= Betriebsparameter.Entfeuchter.Dauerbetrieb OR Boxen.FreigabeEntfeuchterInselbetrieb;
		Aktoren.KompressorModul1.Automatik			:= Betriebsparameter.Entfeuchter.Automatikbetrieb AND NOT Boxen.FreigabeEntfeuchterInselbetrieb;
		Aktoren.KompressorModul1.DrehzahlvorgabeFU	:= gCmdAnlage.Leistung.DrehzahlKompressorModul1;
		
		Aktoren.KompressorModul2.Freigabe			:= (Betriebsparameter.Ausstattung.Entfeuchter AND gModul2Vorhanden) AND (Boxen.FreigabeLuftentfeuchter OR Boxen.FreigabeEntfeuchterInselbetrieb) AND
		((Boxen.EntfeuchterVonVent1Abhaengig AND Boxen.FreigabeVentilator1 (*Aktoren.VentUndKlappen.FreigabeVentilator1Out*) AND NOT Aktoren.VentUndKlappen.FehlerFuVentilator1) OR
		(Boxen.EntfeuchterVonVent2Abhaengig AND Boxen.FreigabeVentilator2 (*Aktoren.VentUndKlappen.FreigabeVentilator2Out*) AND NOT Aktoren.VentUndKlappen.FehlerFuVentilator2) OR
		(Boxen.FreigabeEntfeuchterInselbetrieb AND Aktoren.VentUndKlappen.Ventilator1InBetrieb)) AND NOT 
		gCmdAnlage.FehlerModul2 AND (gStatusAnlage.UmluftbetriebAktiv OR (NOT Betriebsparameter.Ausstattung.EntfeuchterNurImUmluftbetrieb)) AND NOT 
		Tarifabschaltung.TarifabschaltungLuftaufbEin;;
		Aktoren.KompressorModul2.Dauerbetrieb		:= Betriebsparameter.Entfeuchter.Dauerbetrieb OR Boxen.FreigabeEntfeuchterInselbetrieb;
		Aktoren.KompressorModul2.Automatik			:= Betriebsparameter.Entfeuchter.Automatikbetrieb AND NOT Boxen.FreigabeEntfeuchterInselbetrieb;
		Aktoren.KompressorModul2.DrehzahlvorgabeFU	:= gCmdAnlage.Leistung.DrehzahlKompressorModul2;
	END_IF
	
	
	//Entfeuchter Fremdgerät freigeben, wenn Notstromaggregat bereit (oder kein Notstromaggregat vorhanden)
	IF (Aktoren.Notstromaggregat.NotstromBereitOut OR (NOT Betriebsparameter.Ausstattung.Notstromaggregat)) THEN
		Aktoren.EntfeuchterFremd.Freigabe			:= (Boxen.FreigabeLuftentfeuchter OR Boxen.FreigabeEntfeuchterInselbetrieb) AND
		((Boxen.EntfeuchterVonVent1Abhaengig AND Boxen.FreigabeVentilator1 AND NOT Aktoren.VentUndKlappen.FehlerFuVentilator1) OR 
		(Boxen.EntfeuchterVonVent2Abhaengig AND Boxen.FreigabeVentilator2 AND NOT Aktoren.VentUndKlappen.FehlerFuVentilator2) OR 
		(Boxen.FreigabeEntfeuchterInselbetrieb AND Aktoren.VentUndKlappen.Ventilator1InBetrieb)) AND NOT 
		gCmdAnlage.FehlerModul1 AND (gStatusAnlage.UmluftbetriebAktiv OR (NOT Betriebsparameter.Ausstattung.EntfeuchterNurImUmluftbetrieb)) AND NOT 
		Tarifabschaltung.TarifabschaltungLuftaufbEin;
		Aktoren.EntfeuchterFremd.Dauerbetrieb		:= Betriebsparameter.Entfeuchter.Dauerbetrieb OR Boxen.FreigabeEntfeuchterInselbetrieb;
		Aktoren.EntfeuchterFremd.Automatik			:= Betriebsparameter.Entfeuchter.Automatikbetrieb AND NOT Boxen.FreigabeEntfeuchterInselbetrieb;
	ELSE
		Aktoren.EntfeuchterFremd.Freigabe		:= FALSE;
		Aktoren.EntfeuchterFremd.Dauerbetrieb	:= FALSE;
		Aktoren.EntfeuchterFremd.Automatik		:= FALSE;
	END_IF
		
	
	//Ventilatoren 1 freigeben, wenn von Boxen angefordert und keine Tarifabschaltung (ausgenommen bei Notbetrieb wenn Trocknungsgeräte noch aktiv) 
	IF (Aktoren.Notstromaggregat.NotstromBereitOut OR (NOT Betriebsparameter.Ausstattung.Notstromaggregat)) THEN
		Aktoren.VentUndKlappen.AnforderungVentilator1	:= (Boxen.FreigabeVentilator1 OR Boxen.NotbetriebVentilator1) AND NOT 
		(Tarifabschaltung.TarifabschaltungEin AND NOT Boxen.NotbetriebVentilator1);
		Aktoren.VentUndKlappen.DrehzahlVent1Betrieb		:= gCmdAnlage.Leistung.DrehzahlVentilator1;
	ELSE
		Aktoren.VentUndKlappen.AnforderungVentilator1	:= FALSE;
	END_IF
	
	//Ventilatoren 2 freigeben, wenn von Boxen angefordert und keine Tarifabschaltung (ausgenommen bei Notbetrieb wenn Trocknungsgeräte noch aktiv) 
	IF (Aktoren.Notstromaggregat.NotstromBereitOut OR (NOT Betriebsparameter.Ausstattung.Notstromaggregat)) THEN
		Aktoren.VentUndKlappen.AnforderungVentilator2	:= (Boxen.FreigabeVentilator2 OR Boxen.NotbetriebVentilator2) AND NOT 
		(Tarifabschaltung.TarifabschaltungEin AND NOT Boxen.NotbetriebVentilator2);
		Aktoren.VentUndKlappen.DrehzahlVent2Betrieb		:= gCmdAnlage.Leistung.DrehzahlVentilator2;
	ELSE
		Aktoren.VentUndKlappen.AnforderungVentilator2	:= FALSE;
	END_IF

	//Warmluftofen freigeben, wenn von Boxen angefordert und Ventilator in Betrieb
	Aktoren.Warmluftofen.Freigabe			:= Betriebsparameter.Ausstattung.Warmluftofen AND Boxen.FreigabeWarmluftofen AND
	((Boxen.WarmluftofenVonVent1Abhaengig AND Aktoren.VentUndKlappen.FreigabeVentilator1Out AND NOT Aktoren.VentUndKlappen.FehlerFuVentilator1) OR 
	(Boxen.WarmluftofenVonVent2Abhaengig AND Aktoren.VentUndKlappen.FreigabeVentilator2Out AND NOT Aktoren.VentUndKlappen.FehlerFuVentilator2)) AND NOT 
	Tarifabschaltung.TarifabschaltungLuftaufbEin;
	Aktoren.Warmluftofen.Automatikbetrieb	:= Betriebsparameter.Warmluftofen.AutomatikbetriebEin;
	Aktoren.Warmluftofen.Dauerbetrieb		:= Betriebsparameter.Warmluftofen.DauerbetriebEin;
	
	//Heizregister freigeben, wenn von Boxen angefordert und zuständiger Ventilator aktiv
	Aktoren.Heizregister.Freigabe					:= Betriebsparameter.Ausstattung.Heizregister AND Boxen.FreigabeHeizregister  AND
	((Boxen.HeizregisterVonVent1Abhaengig AND Aktoren.VentUndKlappen.FreigabeVentilator1Out AND NOT Aktoren.VentUndKlappen.FehlerFuVentilator1) OR
	(Boxen.HeizregisterVonVent2Abhaengig AND Aktoren.VentUndKlappen.FreigabeVentilator2Out AND NOT Aktoren.VentUndKlappen.FehlerFuVentilator2)) AND NOT 
	Tarifabschaltung.TarifabschaltungLuftaufbEin;
	Aktoren.Heizregister.Automatikbetrieb			:= Betriebsparameter.Heizregister.AutomatikbetriebEin;
	Aktoren.Heizregister.Dauerbetrieb				:= Betriebsparameter.Heizregister.DauerbetriebEin;
	Aktoren.Heizregister.DrehzahlHeizregisterSoll	:= gCmdAnlage.Leistung.DrehzahlHeizregister;
	
	//Abluftklappe freigeben, wenn in Ausstattung vorhanden
	Aktoren.Abluftklappe.Freigabe			:= Betriebsparameter.Ausstattung.Abluftklappe;
	Aktoren.Abluftklappe.Automatik			:= Betriebsparameter.Abluftklappe.Automatik AND NOT 
	(gStatusAnlage.FrischluftbetriebAktiv AND Betriebsparameter.Ausstattung.AbluftklImFrischlbetrImmerOffen);
	Aktoren.Abluftklappe.Oeffnen			:= Betriebsparameter.Abluftklappe.Oeffnen OR
	(gStatusAnlage.FrischluftbetriebAktiv AND Betriebsparameter.Ausstattung.AbluftklImFrischlbetrImmerOffen AND NOT Betriebsparameter.Abluftklappe.Schliessen);
	Aktoren.Abluftklappe.Schliessen			:= Betriebsparameter.Abluftklappe.Schliessen;
	
	//Abluftventilator freigeben, wenn in Ausstattung vorhanden
	Aktoren.Abluftventilator.Freigabe		:= Betriebsparameter.Ausstattung.Abluftventilator;
	Aktoren.Abluftventilator.Automatik		:= Betriebsparameter.Abluftventilator.Automatik AND (Boxen.Box1Out.BoxAktiv OR Boxen.Box2Out.BoxAktiv OR
	Boxen.Box3Out.BoxAktiv OR Boxen.Box4Out.BoxAktiv OR Boxen.Box5Out.BoxAktiv OR Boxen.Box6Out.BoxAktiv) AND NOT 
	(gStatusAnlage.FrischluftbetriebAktiv AND Betriebsparameter.Ausstattung.AbluftklImFrischlbetrImmerOffen);
	Aktoren.Abluftventilator.Ein			:= Betriebsparameter.Abluftventilator.Ein OR 
	(gStatusAnlage.FrischluftbetriebAktiv AND Betriebsparameter.Ausstattung.AbluftklImFrischlbetrImmerOffen AND (Boxen.Box1Out.BoxAktiv OR Boxen.Box2Out.BoxAktiv OR
	Boxen.Box3Out.BoxAktiv OR Boxen.Box4Out.BoxAktiv OR Boxen.Box5Out.BoxAktiv OR Boxen.Box6Out.BoxAktiv));
	Aktoren.Abluftventilator.DrehzahlSoll	:= gCmdAnlage.Leistung.DrehzahlAbluftventilator;
	
	//Brandschutzklappe freigeben, wenn in Ausstattung vorhanden und WLO/SHO in Betrieb
	Aktoren.Brandschutzklappe.Oeffnen		:= Betriebsparameter.Ausstattung.Brandschutzklappe AND 
	(Aktoren.Warmluftofen.WarmluftofenAktiv OR Aktoren.Scheitholzofen.ScheitholzofenAktiv);
	Aktoren.Brandschutzklappe.Schliessen	:= NOT Aktoren.Brandschutzklappe.Oeffnen;
	
	
	//Bypassklappe freigeben, wenn in Ausstattung vorhanden
	IF Betriebsparameter.Bypassklappe.Automatik AND Betriebsparameter.Ausstattung.Bypassklappe AND NOT Betriebsparameter.Ausstattung.EntfeuchterFremd THEN
		IF NOT Aktoren.KompressorModul1.Freigabe AND NOT Aktoren.KompressorModul2.Freigabe THEN
			Aktoren.VentUndKlappen.BypassklappeOeffnen		:= TRUE;
			Aktoren.VentUndKlappen.BypassklappeSchliessen	:= FALSE;
		ELSE
			Aktoren.VentUndKlappen.BypassklappeOeffnen		:=  NOT Aktoren.KompressorModul1.loc_StatusFeuchteOk AND NOT Aktoren.KompressorModul2.loc_StatusFeuchteOk;
			Aktoren.VentUndKlappen.BypassklappeSchliessen	:= Aktoren.KompressorModul1.loc_StatusFeuchteOk OR Aktoren.KompressorModul2.loc_StatusFeuchteOk;
		END_IF
	//Ausstattung mit Entfeuchter Fremdgerät
	ELSIF Betriebsparameter.Bypassklappe.Automatik AND Betriebsparameter.Ausstattung.Bypassklappe THEN
		IF NOT Aktoren.EntfeuchterFremd.Freigabe THEN
			Aktoren.VentUndKlappen.BypassklappeOeffnen		:= TRUE;
			Aktoren.VentUndKlappen.BypassklappeSchliessen	:= FALSE;
		ELSE
			Aktoren.VentUndKlappen.BypassklappeOeffnen		:=  NOT Aktoren.EntfeuchterFremd.WitterungIstSchlecht;
			Aktoren.VentUndKlappen.BypassklappeSchliessen	:= Aktoren.EntfeuchterFremd.WitterungIstSchlecht;
		END_IF
	ELSE
		Aktoren.VentUndKlappen.BypassklappeOeffnen		:= Betriebsparameter.Ausstattung.Bypassklappe AND Betriebsparameter.Bypassklappe.Oeffnen;
		Aktoren.VentUndKlappen.BypassklappeSchliessen	:= Betriebsparameter.Ausstattung.Bypassklappe AND Betriebsparameter.Bypassklappe.Schliessen;
	END_IF
	(*
	Aktoren.VentUndKlappen.BypassklappeOeffnen		:= Betriebsparameter.Ausstattung.Bypassklappe AND (Betriebsparameter.Bypassklappe.Oeffnen OR 
	(Betriebsparameter.Bypassklappe.Automatik AND NOT Aktoren.KompressorModul1.loc_StatusFeuchteOk AND NOT Aktoren.KompressorModul2.loc_StatusFeuchteOk));
	Aktoren.VentUndKlappen.BypassklappeSchliessen	:= Betriebsparameter.Ausstattung.Bypassklappe AND (Betriebsparameter.Bypassklappe.Schliessen OR 
	(Betriebsparameter.Bypassklappe.Automatik AND (Aktoren.KompressorModul1.loc_StatusFeuchteOk OR Aktoren.KompressorModul2.loc_StatusFeuchteOk)));
	*)
	
	//Umschaltklappen je nach Betriebsart umschalten
	IF Betriebsparameter.Ausstattung.Umschaltklappe1 OR Betriebsparameter.Ausstattung.Umschaltklappe2 THEN
		//Konfiguration HB3000 und HB4000 -> Umschaltklappen nach Witterung umschalten (Kein eigener Schaltpunkt)
		IF (hmiStatus.NameSteuerung = 4) OR (hmiStatus.NameSteuerung = 5) THEN
			IF Betriebsparameter.Umschaltklappen.Frischluft OR (Betriebsparameter.Umschaltklappen.Automatik AND NOT gStatusAnlage.WetterIstSchlecht) THEN
				Aktoren.VentUndKlappen.Umschaltkl1Schliessen	:= Betriebsparameter.Ausstattung.Umschaltklappe1;
				Aktoren.VentUndKlappen.Umschaltkl2Schliessen	:= Betriebsparameter.Ausstattung.Umschaltklappe2;
				Aktoren.VentUndKlappen.Umschaltkl1Oeffnen		:= FALSE;
				Aktoren.VentUndKlappen.Umschaltkl2Oeffnen		:= FALSE;
			ELSIF Betriebsparameter.Umschaltklappen.Umluft OR (Betriebsparameter.Umschaltklappen.Automatik AND gStatusAnlage.WetterIstSchlecht) THEN
				Aktoren.VentUndKlappen.Umschaltkl1Schliessen	:= FALSE;
				Aktoren.VentUndKlappen.Umschaltkl2Schliessen	:= FALSE;
				Aktoren.VentUndKlappen.Umschaltkl1Oeffnen		:= Betriebsparameter.Ausstattung.Umschaltklappe1;
				Aktoren.VentUndKlappen.Umschaltkl2Oeffnen		:= Betriebsparameter.Ausstattung.Umschaltklappe2;
			END_IF
		ELSIF Betriebsparameter.Umschaltklappen.Frischluft OR (Betriebsparameter.Umschaltklappen.Automatik AND gStatusAnlage.FrischluftbetriebAktiv) THEN
			Aktoren.VentUndKlappen.Umschaltkl1Schliessen	:= Betriebsparameter.Ausstattung.Umschaltklappe1;
			Aktoren.VentUndKlappen.Umschaltkl2Schliessen	:= Betriebsparameter.Ausstattung.Umschaltklappe2;
			Aktoren.VentUndKlappen.Umschaltkl1Oeffnen		:= FALSE;
			Aktoren.VentUndKlappen.Umschaltkl2Oeffnen		:= FALSE;
		ELSIF Betriebsparameter.Umschaltklappen.Umluft OR (Betriebsparameter.Umschaltklappen.Automatik AND gStatusAnlage.UmluftbetriebAktiv) THEN
			Aktoren.VentUndKlappen.Umschaltkl1Schliessen	:= FALSE;
			Aktoren.VentUndKlappen.Umschaltkl2Schliessen	:= FALSE;
			Aktoren.VentUndKlappen.Umschaltkl1Oeffnen		:= Betriebsparameter.Ausstattung.Umschaltklappe1;
			Aktoren.VentUndKlappen.Umschaltkl2Oeffnen		:= Betriebsparameter.Ausstattung.Umschaltklappe2;
		END_IF
	ELSE
		Aktoren.VentUndKlappen.Umschaltkl1Schliessen		:= FALSE;
		Aktoren.VentUndKlappen.Umschaltkl2Schliessen		:= FALSE;
		Aktoren.VentUndKlappen.Umschaltkl1Oeffnen			:= FALSE;
		Aktoren.VentUndKlappen.Umschaltkl2Oeffnen			:= FALSE;
	END_IF
	
	
END_ACTION