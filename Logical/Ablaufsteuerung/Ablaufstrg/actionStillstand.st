
ACTION actionStillstand: 
	
	gStatusAnlage.Aktor[AKTOR_SCHRITTKETTE]	:= STATUS_STILLSTAND;
	
	//Notstromaggregat anfordern, wenn Notbetrieb Ventilatoren noch aktiv
	Aktoren.Notstromaggregat.NotstromaggregatAngefordert := (Boxen.NotbetriebVentilator1 OR Boxen.NotbetriebVentilator2) AND
	Betriebsparameter.Ausstattung.Notstromaggregat;
	
	//Ölsumpfheizungen Ein, wenn Entfeuchter in Ausstattung vorhanden
	Aktoren.OelsumpfheizungModul1.Freigabe			:= Betriebsparameter.Ausstattung.Entfeuchter;
	Aktoren.OelsumpfheizungModul2.Freigabe			:= Betriebsparameter.Ausstattung.Entfeuchter AND gModul2Vorhanden;
	
	//Luftentfeuchter AUS
	Aktoren.KompressorModul1.Freigabe			:= FALSE;
	Aktoren.KompressorModul1.Dauerbetrieb		:= FALSE;
	Aktoren.KompressorModul1.Automatik			:= FALSE;
	Aktoren.KompressorModul1.DrehzahlvorgabeFU	:= gCmdAnlage.Leistung.DrehzahlKompressorModul1;
	Aktoren.KompressorModul2.Freigabe			:= FALSE;
	Aktoren.KompressorModul2.Dauerbetrieb		:= FALSE;
	Aktoren.KompressorModul2.Automatik			:= FALSE;
	Aktoren.KompressorModul2.DrehzahlvorgabeFU	:= gCmdAnlage.Leistung.DrehzahlKompressorModul2;
	
	//Entfeuchter Fremdgerät AUS
	Aktoren.EntfeuchterFremd.Freigabe		:= FALSE;
	Aktoren.EntfeuchterFremd.Dauerbetrieb	:= FALSE;
	Aktoren.EntfeuchterFremd.Automatik		:= FALSE;
	
	//Ventilatoren 1 freigeben bei Notbetrieb (Trocknungsgeräte noch aktiv)
	IF (Aktoren.Notstromaggregat.NotstromBereitOut OR (NOT Betriebsparameter.Ausstattung.Notstromaggregat)) THEN
		Aktoren.VentUndKlappen.AnforderungVentilator1	:= Boxen.NotbetriebVentilator1;
		Aktoren.VentUndKlappen.DrehzahlVent1Betrieb		:= gCmdAnlage.Leistung.DrehzahlVentilator1;
	END_IF
	
	//Ventilatoren 2 freigeben bei Notbetrieb (Trocknungsgeräte noch aktiv)
	IF (Aktoren.Notstromaggregat.NotstromBereitOut OR (NOT Betriebsparameter.Ausstattung.Notstromaggregat)) THEN
		Aktoren.VentUndKlappen.AnforderungVentilator2	:= Boxen.NotbetriebVentilator2;
		Aktoren.VentUndKlappen.DrehzahlVent2Betrieb		:= gCmdAnlage.Leistung.DrehzahlVentilator2;
	END_IF

	//Warmluftofen AUS
	Aktoren.Warmluftofen.Freigabe			:= Betriebsparameter.Ausstattung.Warmluftofen;
	Aktoren.Warmluftofen.Automatikbetrieb	:= FALSE;
	Aktoren.Warmluftofen.Dauerbetrieb		:= FALSE;
	
	//Heizregister AUS
	Aktoren.Heizregister.Freigabe					:= Betriebsparameter.Ausstattung.Heizregister;
	Aktoren.Heizregister.Automatikbetrieb			:= FALSE;
	Aktoren.Heizregister.Dauerbetrieb				:= FALSE;
	Aktoren.Heizregister.DrehzahlHeizregisterSoll	:= gCmdAnlage.Leistung.DrehzahlHeizregister;
	
	//Abluftklappe Handbetrieb
	Aktoren.Abluftklappe.Freigabe			:= Betriebsparameter.Ausstattung.Abluftklappe;
	Aktoren.Abluftklappe.Automatik			:= FALSE;
	Aktoren.Abluftklappe.Oeffnen			:= Betriebsparameter.Abluftklappe.Oeffnen;
	Aktoren.Abluftklappe.Schliessen			:= Betriebsparameter.Abluftklappe.Schliessen;
	
	//Abluftventilator ein, wenn Ventilator noch in Betrieb
	Aktoren.Abluftventilator.Freigabe		:= Betriebsparameter.Ausstattung.Abluftventilator AND 
	(Aktoren.VentUndKlappen.Ventilator1InBetrieb OR Aktoren.VentUndKlappen.Ventilator2InBetrieb);
	Aktoren.Abluftventilator.Automatik		:= Betriebsparameter.Abluftventilator.Automatik;
	Aktoren.Abluftventilator.Ein			:= Betriebsparameter.Abluftventilator.Ein;
	Aktoren.Abluftventilator.DrehzahlSoll	:= gCmdAnlage.Leistung.DrehzahlAbluftventilator;
	
	//Brandschutzklappe freigeben, wenn in Ausstattung vorhanden und WLO/SHO in Betrieb
	Aktoren.Brandschutzklappe.Oeffnen		:= Betriebsparameter.Ausstattung.Brandschutzklappe AND 
	(Aktoren.Warmluftofen.WarmluftofenAktiv OR Aktoren.Scheitholzofen.ScheitholzofenAktiv);
	Aktoren.Brandschutzklappe.Schliessen	:= NOT Aktoren.Brandschutzklappe.Oeffnen;
	
	//Bypassklappe Handbetrieb
	Aktoren.VentUndKlappen.BypassklappeOeffnen		:= Betriebsparameter.Ausstattung.Bypassklappe AND 
	(Betriebsparameter.Bypassklappe.Automatik OR Betriebsparameter.Bypassklappe.Oeffnen);
	Aktoren.VentUndKlappen.BypassklappeSchliessen	:= Betriebsparameter.Ausstattung.Bypassklappe AND Betriebsparameter.Bypassklappe.Schliessen;
	
	//Umschaltklappen Handbetrieb
	IF Betriebsparameter.Ausstattung.Umschaltklappe1 OR Betriebsparameter.Ausstattung.Umschaltklappe2 THEN
		//Stellung Umluftklappen je nach Einstellung im Ausstattungsmenü
		IF Betriebsparameter.Umschaltklappen.Automatik THEN
			Aktoren.VentUndKlappen.Umschaltkl1Schliessen	:= Betriebsparameter.Ausstattung.Umschaltklappe1 AND Betriebsparameter.Ausstattung.StellungUmluftklappe1Stillstand;
			Aktoren.VentUndKlappen.Umschaltkl2Schliessen	:= Betriebsparameter.Ausstattung.Umschaltklappe2 AND Betriebsparameter.Ausstattung.StellungUmluftklappe2Stillstand;
			Aktoren.VentUndKlappen.Umschaltkl1Oeffnen		:= Betriebsparameter.Ausstattung.Umschaltklappe1 AND NOT Betriebsparameter.Ausstattung.StellungUmluftklappe1Stillstand;
			Aktoren.VentUndKlappen.Umschaltkl2Oeffnen		:= Betriebsparameter.Ausstattung.Umschaltklappe2 AND NOT Betriebsparameter.Ausstattung.StellungUmluftklappe2Stillstand;
		ELSIF Betriebsparameter.Umschaltklappen.Frischluft THEN
			Aktoren.VentUndKlappen.Umschaltkl1Schliessen	:= Betriebsparameter.Ausstattung.Umschaltklappe1;
			Aktoren.VentUndKlappen.Umschaltkl2Schliessen	:= Betriebsparameter.Ausstattung.Umschaltklappe2;
			Aktoren.VentUndKlappen.Umschaltkl1Oeffnen		:= FALSE;
			Aktoren.VentUndKlappen.Umschaltkl2Oeffnen		:= FALSE;
		ELSIF Betriebsparameter.Umschaltklappen.Umluft THEN
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
