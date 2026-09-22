
PROGRAM _INIT

	 
END_PROGRAM


PROGRAM _CYCLIC
	
	
	//Zeitticks generieren
	fbLascoZdxx_0(IN 	:= Echtzeit.Sekunde);
	sekTick				:= fbLascoZdxx_0.Q;
	
	//Modul 2 bei Entfeuchter-Typen 7, 8, 9 und 10 (10 ist Reserve, eigene Einstellungen möglich)
	gModul2Vorhanden	:= (Betriebsparameter.Entfeuchter.IndexType = 7) OR (Betriebsparameter.Entfeuchter.IndexType = 8) OR (Betriebsparameter.Entfeuchter.IndexType = 9) OR 
	(Betriebsparameter.Entfeuchter.IndexType = 10);
	

	
	//Ölsumpheizung Modul 1 **********************************************************************************************************************************************************************

	//Eingänge
	Aktoren.OelsumpfheizungModul1.EintrittTemp					:= aiEintrittTemperatur;
	Aktoren.OelsumpfheizungModul1.StatusSensorEintrittOk		:= NOT alarmFehler[FEHLER_SENSOR_EINTRITT];
	
	//GUI-Parameter
	Aktoren.OelsumpfheizungModul1.parTempOelsumpfheizungEin		:= 0.0;
	Aktoren.OelsumpfheizungModul1.parTempOelsumpfheizungAus		:= 0.0;
	
	//Ausgänge
	doOelsumpfheizungEinModul1									:= Aktoren.OelsumpfheizungModul1.OelsumpfheizungEin;
	
	//Status
	IF  doOelsumpfheizungEinModul1 THEN
		gStatusAnlage.Aktor[AKTOR_OELSUMPFHEIZUNG_MOD1]	:= STATUS_AKTIV;
	ELSE
		gStatusAnlage.Aktor[AKTOR_OELSUMPFHEIZUNG_MOD1]	:= STATUS_NICHT_AKTIV;
	END_IF
	
	
	//Ölsumpheizung Modul 2 **********************************************************************************************************************************************************************

	//Eingänge
	Aktoren.OelsumpfheizungModul2.EintrittTemp					:= aiEintrittTemperatur;
	Aktoren.OelsumpfheizungModul2.StatusSensorEintrittOk		:= NOT alarmFehler[FEHLER_SENSOR_EINTRITT];
	
	//GUI-Parameter
	Aktoren.OelsumpfheizungModul2.parTempOelsumpfheizungEin		:= 0.0;
	Aktoren.OelsumpfheizungModul2.parTempOelsumpfheizungAus		:= 0.0;
	
	//Ausgänge
	doOelsumpfheizungEinModul2										:= Aktoren.OelsumpfheizungModul2.OelsumpfheizungEin;

	
	//Status
	IF  doOelsumpfheizungEinModul2 THEN
		gStatusAnlage.Aktor[AKTOR_OELSUMPFHEIZUNG_MOD2]	:= STATUS_AKTIV;
	ELSE
		gStatusAnlage.Aktor[AKTOR_OELSUMPFHEIZUNG_MOD2]	:= STATUS_NICHT_AKTIV;
	END_IF
	
	
	//Kompressor Modul 1 **********************************************************************************************************************************************************************

	//Eingänge
	Aktoren.KompressorModul1.EintrittFeuchte			:= aiEintrittFeuchte;
	Aktoren.KompressorModul1.Niederdruck				:= aiNiederdruckModul1;
	Aktoren.KompressorModul1.Hochdruck					:= aiHochdruckModul1;
	Aktoren.KompressorModul1.KlappenumschaltungAkiv		:= Aktoren.VentUndKlappen.UmschaltungAktiv OR Strombegrenzung.StrombegrenzungEin OR 
	(diDrehzahlbegrVentilator1 AND Boxen.EntfeuchterVonVent1Abhaengig) OR (diDrehzahlbegrVentilator2 AND Boxen.EntfeuchterVonVent2Abhaengig);
	Aktoren.KompressorModul1.BetriebsmldgVentilator		:= (doVentilator1Ein AND Boxen.EntfeuchterVonVent1Abhaengig) OR
	(doVentilator2Ein AND Boxen.EntfeuchterVonVent2Abhaengig) OR (diVentilator1InBetrieb AND Boxen.EntfeuchterInselbetrieb);
	Aktoren.KompressorModul1.BetriebsmldgKompressor		:= diBetriebsmldgKompressorModul1;
	Aktoren.KompressorModul1.StatusSensorEintrittOk		:= NOT alarmFehler[FEHLER_SENSOR_EINTRITT];
	Aktoren.KompressorModul1.StatusSensorNiederdruckOk	:= NOT alarmFehler[FEHLER_SENSOR_NIEDERDRUCK_MOD1];
	Aktoren.KompressorModul1.diHochdruckOk				:= diHochdruckOkModul1;
	Aktoren.KompressorModul1.diNiederdruckOk			:= diNiederdruckOkModul1;
	Aktoren.KompressorModul1.SicherheitOk				:= NOT alarmFehler[FEHLER_HOCHDRUCK_MODUL1] AND NOT alarmFehler[FEHLER_NIEDERDRUCK_MODUL1] AND NOT alarmFehler[FEHLER_VOLLSCHUTZ_KOMPR_MOD1] AND NOT
	alarmFehler[FEHLER_OELDRUCK_KOMPR_MOD1] AND NOT alarmFehler[FEHLER_EINTRITT_TEMP_ZU_HOCH] AND NOT alarmFehler[FEHLER_EINTRITT_TEMP_ZU_NIEDRIG];
	
	//GUI-Parameter
	Aktoren.KompressorModul1.QuitFehler						:= hmiButtons.QuitFehler;
	Aktoren.KompressorModul1.parEinschaltverzAbtau			:= Betriebsparameter.Entfeuchter.EinschaltverzAbtau;
	Aktoren.KompressorModul1.parAusschaltverzAbtau			:= Betriebsparameter.Entfeuchter.AusschaltverzAbtau;
	Aktoren.KompressorModul1.parEinschaltverzKompressor		:= Betriebsparameter.Entfeuchter.EinschaltverzKompressor;
	Aktoren.KompressorModul1.parEinschaltverzMagnetventil	:= Betriebsparameter.Kompressor1.EinschaltverzMagnetventil;
	Aktoren.KompressorModul1.parFeuchteEin					:= Betriebsparameter.Entfeuchter.EintrittFeuchteEin;
	Aktoren.KompressorModul1.parFeuchteAus					:= Betriebsparameter.Entfeuchter.EintrittFeuchteAus;
	Aktoren.KompressorModul1.parNiederdruckMin				:= Betriebsparameter.Kompressor1.NiederdruckMin;
	Aktoren.KompressorModul1.parNiederdruckMax				:= Betriebsparameter.Kompressor1.NiederdruckMax;
	Aktoren.KompressorModul1.parNiederdruckPumpdown			:= Betriebsparameter.Kompressor1.NiederdruckPumpDown;
	Aktoren.KompressorModul1.parHochdruckMax				:= Betriebsparameter.Kompressor1.HochdruckMax;
	Aktoren.KompressorModul1.parVerzStandbyBeiKlappenumsch	:= Betriebsparameter.Entfeuchter.VerzStandbyHochdruckMax;
	Aktoren.KompressorModul1.DrehzahlMin					:= Betriebsparameter.Kompressor1.DrehzahlMin;
	Aktoren.KompressorModul1.DrehzahlMax					:= Betriebsparameter.Kompressor1.DrehzahlMax;
	Aktoren.KompressorModul1.RampeUp						:= Betriebsparameter.Kompressor1.RampeUp;
	Aktoren.KompressorModul1.RampeDown						:= Betriebsparameter.Kompressor1.RampeDown;

	//Ausgänge
	doKompressorEinModul1									:= Aktoren.KompressorModul1.FreigabeKompressorOut AND diHochdruckOkModul1 AND diNiederdruckOkModul1;
	aoDrehzahlvorgKompressorModul1							:= Aktoren.KompressorModul1.DrehzahlOut;
	doMagnetventilEinModul1									:= Aktoren.KompressorModul1.MagnetventilOut;

	//Status
	IF doKompressorEinModul1 THEN
		gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD1]			:= STATUS_AKTIV;
	ELSIF Aktoren.KompressorModul1.StoerungOut THEN
		gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD1]			:= STATUS_STOERUNG;	
	ELSIF (Aktoren.KompressorModul1.Automatik OR Aktoren.KompressorModul1.Dauerbetrieb) AND Boxen.FreigabeLuftentfeuchter AND NOT doKompressorEinModul1 THEN
		gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD1]			:= STATUS_ENTF_STANDBY;
	ELSIF Aktoren.KompressorModul1.AbtauungAktiv THEN
		gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD1]			:= STATUS_ENTF_ABTAUUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD1]			:= STATUS_NICHT_AKTIV;
	END_IF
	
	//Status
	IF  doMagnetventilEinModul1 THEN
		gStatusAnlage.Aktor[AKTOR_MAGNETVENTIL_MOD1]		:= STATUS_AKTIV;
	ELSE
		gStatusAnlage.Aktor[AKTOR_MAGNETVENTIL_MOD1]		:= STATUS_NICHT_AKTIV;
	END_IF
	
	
	//Kompressor Modul 2 **********************************************************************************************************************************************************************

	//Eingänge
	Aktoren.KompressorModul2.EintrittFeuchte			:= aiEintrittFeuchte;
	Aktoren.KompressorModul2.Niederdruck				:= aiNiederdruckModul2;
	Aktoren.KompressorModul2.Hochdruck					:= aiHochdruckModul2;
	Aktoren.KompressorModul2.KlappenumschaltungAkiv		:= Aktoren.VentUndKlappen.UmschaltungAktiv OR Strombegrenzung.StrombegrenzungEin OR 
	(diDrehzahlbegrVentilator1 AND Boxen.EntfeuchterVonVent1Abhaengig) OR (diDrehzahlbegrVentilator2 AND Boxen.EntfeuchterVonVent2Abhaengig);
	Aktoren.KompressorModul2.BetriebsmldgVentilator		:= (doVentilator1Ein AND Boxen.EntfeuchterVonVent1Abhaengig) OR
	(doVentilator2Ein AND Boxen.EntfeuchterVonVent2Abhaengig) OR (diVentilator1InBetrieb AND Boxen.EntfeuchterInselbetrieb);
	Aktoren.KompressorModul2.BetriebsmldgKompressor		:= diBetriebsmldgKompressorModul2;
	Aktoren.KompressorModul2.StatusSensorEintrittOk		:= NOT alarmFehler[FEHLER_SENSOR_EINTRITT];
	Aktoren.KompressorModul2.StatusSensorNiederdruckOk	:= NOT alarmFehler[FEHLER_SENSOR_NIEDERDRUCK_MOD2];
	Aktoren.KompressorModul2.diHochdruckOk				:= diHochdruckOkModul2;
	Aktoren.KompressorModul2.diNiederdruckOk			:= diNiederdruckOkModul2;
	Aktoren.KompressorModul2.SicherheitOk				:= NOT alarmFehler[FEHLER_HOCHDRUCK_MODUL2] AND NOT alarmFehler[FEHLER_NIEDERDRUCK_MODUL2] AND NOT alarmFehler[FEHLER_VOLLSCHUTZ_KOMPR_MOD2] AND NOT
	alarmFehler[FEHLER_OELDRUCK_KOMPR_MOD2] AND NOT alarmFehler[FEHLER_EINTRITT_TEMP_ZU_HOCH] AND NOT alarmFehler[FEHLER_EINTRITT_TEMP_ZU_NIEDRIG];

	//GUI-Parameter
	Aktoren.KompressorModul2.QuitFehler						:= hmiButtons.QuitFehler;
	Aktoren.KompressorModul2.parEinschaltverzAbtau			:= Betriebsparameter.Entfeuchter.EinschaltverzAbtau;
	Aktoren.KompressorModul2.parAusschaltverzAbtau			:= Betriebsparameter.Entfeuchter.AusschaltverzAbtau;
	Aktoren.KompressorModul2.parEinschaltverzKompressor		:= Betriebsparameter.Entfeuchter.EinschaltverzKompressor + Betriebsparameter.Entfeuchter.AnlaufverzModul2;
	Aktoren.KompressorModul2.parEinschaltverzMagnetventil	:= Betriebsparameter.Kompressor1.EinschaltverzMagnetventil;
	Aktoren.KompressorModul2.parFeuchteEin					:= Betriebsparameter.Entfeuchter.EintrittFeuchteEin;
	Aktoren.KompressorModul2.parFeuchteAus					:= Betriebsparameter.Entfeuchter.EintrittFeuchteAus;
	Aktoren.KompressorModul2.parNiederdruckMin				:= Betriebsparameter.Kompressor1.NiederdruckMin;
	Aktoren.KompressorModul2.parNiederdruckMax				:= Betriebsparameter.Kompressor1.NiederdruckMax;
	Aktoren.KompressorModul2.parNiederdruckPumpdown			:= Betriebsparameter.Kompressor1.NiederdruckPumpDown;
	Aktoren.KompressorModul2.parHochdruckMax				:= Betriebsparameter.Kompressor1.HochdruckMax;
	Aktoren.KompressorModul2.parVerzStandbyBeiKlappenumsch	:= Betriebsparameter.Entfeuchter.VerzStandbyHochdruckMax;
	Aktoren.KompressorModul2.DrehzahlMin					:= Betriebsparameter.Kompressor2.DrehzahlMin;
	Aktoren.KompressorModul2.DrehzahlMax					:= Betriebsparameter.Kompressor2.DrehzahlMax;
	Aktoren.KompressorModul2.RampeUp						:= Betriebsparameter.Kompressor2.RampeUp;
	Aktoren.KompressorModul2.RampeDown						:= Betriebsparameter.Kompressor2.RampeDown;
	
	//Ausgänge
	doKompressorEinModul2									:= Aktoren.KompressorModul2.FreigabeKompressorOut AND diHochdruckOkModul2 AND diNiederdruckOkModul2;
	aoDrehzahlvorgKompressorModul2							:= Aktoren.KompressorModul2.DrehzahlOut;
	doMagnetventilEinModul2									:= Aktoren.KompressorModul2.MagnetventilOut;

	//Status
	IF doKompressorEinModul2 THEN
		gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD2]			:= STATUS_AKTIV;
	ELSIF Aktoren.KompressorModul2.StoerungOut THEN
		gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD2]			:= STATUS_STOERUNG;	
	ELSIF (Aktoren.KompressorModul2.Automatik OR Aktoren.KompressorModul2.Dauerbetrieb) AND Boxen.FreigabeLuftentfeuchter AND NOT doKompressorEinModul2 THEN
		gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD2]			:= STATUS_ENTF_STANDBY;
	ELSIF Aktoren.KompressorModul2.AbtauungAktiv THEN
		gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD2]			:= STATUS_ENTF_ABTAUUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD2]			:= STATUS_NICHT_AKTIV;
	END_IF
	
	//Status
	IF  doMagnetventilEinModul2 THEN
		gStatusAnlage.Aktor[AKTOR_MAGNETVENTIL_MOD2]		:= STATUS_AKTIV;
	ELSE
		gStatusAnlage.Aktor[AKTOR_MAGNETVENTIL_MOD2]		:= STATUS_NICHT_AKTIV;
	END_IF
	
	
	//Entfeuchter Fremdgerät **********************************************************************************************************************************************************************

	//Eingänge
	Aktoren.EntfeuchterFremd.BetriebsmldgEntfeuchter	:= diEntfeuchterFremdInBetrieb;
	Aktoren.EntfeuchterFremd.BetriebsmldgVentilator		:= diVentilator1InBetrieb;
	
	Aktoren.EntfeuchterFremd.WitterungIstSchlecht		:= (fbSchlechtwetterBox1.WetterIstSchlecht AND Betriebsparameter.Boxen[1].Luftentfeuchter AND Boxen.Box1Out.BoxAktiv) OR
	(fbSchlechtwetterBox2.WetterIstSchlecht AND Betriebsparameter.Boxen[2].Luftentfeuchter AND Boxen.Box2Out.BoxAktiv) OR 
	(fbSchlechtwetterBox3.WetterIstSchlecht AND Betriebsparameter.Boxen[3].Luftentfeuchter AND Boxen.Box3Out.BoxAktiv) OR
	(fbSchlechtwetterBox4.WetterIstSchlecht AND Betriebsparameter.Boxen[4].Luftentfeuchter AND Boxen.Box4Out.BoxAktiv) OR
	(fbSchlechtwetterBox5.WetterIstSchlecht AND Betriebsparameter.Boxen[5].Luftentfeuchter AND Boxen.Box5Out.BoxAktiv) OR
	(fbSchlechtwetterBox6.WetterIstSchlecht AND Betriebsparameter.Boxen[6].Luftentfeuchter AND Boxen.Box6Out.BoxAktiv);
	Aktoren.EntfeuchterFremd.StoerungIn					:= diEntfeuchterFremdStoerung;

	//GUI-Parameter
	Aktoren.EntfeuchterFremd.parEinschaltverzKompressor	:= Betriebsparameter.Entfeuchter.EinschaltverzKompressor;
	Aktoren.EntfeuchterFremd.parVerzBetriebEntfeuchter	:= Betriebsparameter.Entfeuchter.VerzBetriebsmeldung;
	Aktoren.EntfeuchterFremd.parVerzStoerung			:= REAL_TO_UDINT(Betriebsparameter.Allgemein.VerzoegerungFehler * 1000);
	Aktoren.EntfeuchterFremd.QuitFehler					:= hmiButtons.QuitFehler;

	//Ausgänge
	doEntfFremdFreigabe									:= Aktoren.EntfeuchterFremd.FreigabeKompressorOut;

	//Status
	IF doEntfFremdFreigabe THEN
		IF diEntfeuchterFremdInBetrieb THEN
			gStatusAnlage.Aktor[AKTOR_ENTFEUCHTER_FREMD]		:= STATUS_AKTIV;
		ELSE
			gStatusAnlage.Aktor[AKTOR_ENTFEUCHTER_FREMD]		:= STATUS_ENTF_STANDBY;
		END_IF
	ELSIF Aktoren.EntfeuchterFremd.StoerungOut THEN
		gStatusAnlage.Aktor[AKTOR_ENTFEUCHTER_FREMD]		:= STATUS_STOERUNG;	
	ELSE
		gStatusAnlage.Aktor[AKTOR_ENTFEUCHTER_FREMD]		:= STATUS_NICHT_AKTIV;
	END_IF
	
	
	
	//Abluftklappe **********************************************************************************************************************************************************************

	//Eingänge
	Aktoren.Abluftklappe.AbluftFeuchteIst			:= aiAbluftFeuchte;
	Aktoren.Abluftklappe.EndlageOffen				:= diAbluftklappeOffen;
	Aktoren.Abluftklappe.EndlageGeschl				:= diAbluftklappeGeschl;
	
	//GUI-Parameter
	Aktoren.Abluftklappe.AbluftFeuchteSoll			:= Betriebsparameter.Abluftklappe.AbluftfeuchteMax;
	Aktoren.Abluftklappe.Hysterese					:= Betriebsparameter.Abluftklappe.Hysterese;
	Aktoren.Abluftklappe.Laufzeit					:= Betriebsparameter.Abluftklappe.Laufzeit;
	Aktoren.Abluftklappe.Quit						:= hmiButtons.QuitFehler;

	//Ausgänge
	doAbluftklappeFreigabe							:= Aktoren.Abluftklappe.OeffnenOut AND NOT Aktoren.Abluftklappe.SchliessenOut;
	doAbluftklappeOeffnen							:= Aktoren.Abluftklappe.OeffnenOut;
	doAbluftklappeSchliessen						:= Aktoren.Abluftklappe.SchliessenOut;

	//Status
	IF doAbluftklappeFreigabe AND NOT diAbluftklappeOffen AND (Betriebsparameter.Abluftklappe.Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_ABLUFTKLAPPE]			:= STATUS_AKTIV;
	ELSIF (NOT doAbluftklappeFreigabe) AND NOT diAbluftklappeGeschl AND (Betriebsparameter.Abluftklappe.Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_ABLUFTKLAPPE]			:= STATUS_AKTIV;
	ELSIF Aktoren.Abluftklappe.FehlerLaufzeit THEN
		gStatusAnlage.Aktor[AKTOR_ABLUFTKLAPPE]			:= STATUS_STOERUNG;	
	ELSIF doAbluftklappeFreigabe AND (diAbluftklappeOffen OR (Betriebsparameter.Abluftklappe.Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_ABLUFTKLAPPE]			:= STATUS_OFFEN;
	ELSIF (NOT doAbluftklappeFreigabe) AND (diAbluftklappeGeschl OR (Betriebsparameter.Abluftklappe.Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_ABLUFTKLAPPE]			:= STATUS_GESCHLOSSEN;
	ELSE
		gStatusAnlage.Aktor[AKTOR_ABLUFTKLAPPE]			:= STATUS_NICHT_AKTIV;
	END_IF

	
	//Abluftventilator **********************************************************************************************************************************************************************

	//Eingänge
	Aktoren.Abluftventilator.AbluftFeuchteIst		:= aiAbluftFeuchte;
	Aktoren.Abluftventilator.VentilatorInBetrieb	:= diAbluftventInBetrieb;
	Aktoren.Abluftventilator.RampeUp				:= 10;
	Aktoren.Abluftventilator.RampeDown				:= 10;
	
	//GUI-Parameter
	Aktoren.Abluftventilator.DrehzahlMin			:= Betriebsparameter.Abluftventilator.DrehzahlMin;
	Aktoren.Abluftventilator.DrehzahlMax			:= Betriebsparameter.Abluftventilator.DrehzahlMax;
	Aktoren.Abluftventilator.AbluftFeuchteSoll		:= Betriebsparameter.Abluftventilator.AbluftfeuchteMax;
	Aktoren.Abluftventilator.Hysterese				:= Betriebsparameter.Abluftventilator.Hysterese;
	Aktoren.Abluftventilator.QuitFehler				:= hmiButtons.QuitFehler;

	//Ausgänge
	doAbluftventilatorEin							:= Aktoren.Abluftventilator.FreigabeVentilatorOut;
	aoDrehzahlvorgAbluftventilator					:= Aktoren.Abluftventilator.DrehzahlVentilatorOut;


	//Status
	IF doAbluftventilatorEin THEN
		gStatusAnlage.Aktor[AKTOR_ABLUFTVENTILATOR]		:= STATUS_AKTIV;
	ELSIF Aktoren.Abluftventilator.FehlerOut THEN
		gStatusAnlage.Aktor[AKTOR_ABLUFTVENTILATOR]		:= STATUS_STOERUNG;	
	ELSE
		gStatusAnlage.Aktor[AKTOR_ABLUFTVENTILATOR]		:= STATUS_NICHT_AKTIV;
	END_IF
	
	
	//Ventilatoren, Bypassklappe, Umschaltklappen und Klappen für Boxen **********************************************************************************************************************

	//Eingänge
	Aktoren.VentUndKlappen.Freigabe						:= TRUE;
	Aktoren.VentUndKlappen.BypassklVonVent1Abhaengig	:= Boxen.BypassklVonVent1Abhaengig;
	Aktoren.VentUndKlappen.BypassklVonVent2Abhaengig	:= Boxen.BypassklVonVent2Abhaengig;
	Aktoren.VentUndKlappen.Boxenkl1VonVent1Abhaengig	:= Boxen.Boxenkl1VonVent1Abhaengig;
	Aktoren.VentUndKlappen.Boxenkl2VonVent1Abhaengig	:= Boxen.Boxenkl2VonVent1Abhaengig;
	Aktoren.VentUndKlappen.Boxenkl3VonVent1Abhaengig	:= Boxen.Boxenkl3VonVent1Abhaengig;
	Aktoren.VentUndKlappen.Boxenkl4VonVent1Abhaengig	:= Boxen.Boxenkl4VonVent1Abhaengig;
	Aktoren.VentUndKlappen.Boxenkl5VonVent1Abhaengig	:= Boxen.Boxenkl5VonVent1Abhaengig;
	Aktoren.VentUndKlappen.Boxenkl6VonVent1Abhaengig	:= Boxen.Boxenkl6VonVent1Abhaengig;
	Aktoren.VentUndKlappen.Boxenkl1VonVent2Abhaengig	:= Boxen.Boxenkl1VonVent2Abhaengig;
	Aktoren.VentUndKlappen.Boxenkl2VonVent2Abhaengig	:= Boxen.Boxenkl2VonVent2Abhaengig;
	Aktoren.VentUndKlappen.Boxenkl3VonVent2Abhaengig	:= Boxen.Boxenkl3VonVent2Abhaengig;
	Aktoren.VentUndKlappen.Boxenkl4VonVent2Abhaengig	:= Boxen.Boxenkl4VonVent2Abhaengig;
	Aktoren.VentUndKlappen.Boxenkl5VonVent2Abhaengig	:= Boxen.Boxenkl5VonVent2Abhaengig;
	Aktoren.VentUndKlappen.Boxenkl6VonVent2Abhaengig	:= Boxen.Boxenkl6VonVent2Abhaengig;
	//Kunde Gschneitner: die Umluftklappen sind die Warmluft-/Kaltluftumschaltung und werden vom Bediener direkt geschaltet.
	//Eine Ventilatorabschaltung waehrend der Klappenumschaltung ist dabei nicht erwuenscht -> Abhaengigkeit fest deaktiviert.
	//Original: := Betriebsparameter.Ausstattung.Vent1AusWennUmschUmluftkl; bzw. Vent2AusWennUmschUmluftkl;
	Aktoren.VentUndKlappen.UmluftklVonVent1Abhaengig	:= FALSE;
	Aktoren.VentUndKlappen.UmluftklVonVent2Abhaengig	:= FALSE;
	Aktoren.VentUndKlappen.EndlBoxenklappe1Geschl		:= diBox1Geschl;
	Aktoren.VentUndKlappen.EndlBoxenklappe1Offen		:= diBox1Offen;
	Aktoren.VentUndKlappen.EndlBoxenklappe2Geschl		:= diBox2Geschl;
	Aktoren.VentUndKlappen.EndlBoxenklappe2Offen		:= diBox2Offen;
	Aktoren.VentUndKlappen.EndlBoxenklappe3Geschl		:= diBox3Geschl;
	Aktoren.VentUndKlappen.EndlBoxenklappe3Offen		:= diBox3Offen;
	Aktoren.VentUndKlappen.EndlBoxenklappe4Geschl		:= diBox4Geschl;
	Aktoren.VentUndKlappen.EndlBoxenklappe4Offen		:= diBox4Offen;
	Aktoren.VentUndKlappen.EndlBoxenklappe5Geschl		:= diBox5Geschl;
	Aktoren.VentUndKlappen.EndlBoxenklappe5Offen		:= diBox5Offen;
	Aktoren.VentUndKlappen.EndlBoxenklappe6Geschl		:= diBox6Geschl;
	Aktoren.VentUndKlappen.EndlBoxenklappe6Offen		:= diBox6Offen;
	Aktoren.VentUndKlappen.EndlBypassGeschl				:= diBypassklappeGeschl;
	Aktoren.VentUndKlappen.EndlBypassOffen				:= diBypassklappeOffen;
	Aktoren.VentUndKlappen.EndlBypassGeschl				:= diBypassklappeGeschl;
	Aktoren.VentUndKlappen.EndlBypassOffen				:= diBypassklappeOffen;
	Aktoren.VentUndKlappen.EndlUmschaltkl1Geschl		:= diUmschaltklappe1Geschl;
	Aktoren.VentUndKlappen.EndlUmschaltkl1Offen			:= diUmschaltklappe1Offen;
	Aktoren.VentUndKlappen.EndlUmschaltkl2Geschl		:= diUmschaltklappe2Geschl;
	Aktoren.VentUndKlappen.EndlUmschaltkl2Offen			:= diUmschaltklappe2Offen;
	Aktoren.VentUndKlappen.LuftaufbereitungInBetrieb	:= doKompressorEinModul1 OR doKompressorEinModul2 OR Aktoren.Warmluftofen.WarmluftofenAktiv OR
	Aktoren.Scheitholzofen.ScheitholzofenAktiv OR doHeizregisterEin;
	Aktoren.VentUndKlappen.Ventilator1InBetrieb			:= diVentilator1InBetrieb;
	Aktoren.VentUndKlappen.Ventilator2InBetrieb			:= diVentilator2InBetrieb;
	Aktoren.VentUndKlappen.Boxenklappe1Vorhanden		:= (Betriebsparameter.Boxen[1].StellungKlappe1 <> FBBOX_NICHT_VERWENDET) OR 
	(Betriebsparameter.Boxen[2].StellungKlappe1 <> FBBOX_NICHT_VERWENDET) OR (Betriebsparameter.Boxen[3].StellungKlappe1 <> FBBOX_NICHT_VERWENDET) OR
	(Betriebsparameter.Boxen[4].StellungKlappe1 <> FBBOX_NICHT_VERWENDET) OR (Betriebsparameter.Boxen[5].StellungKlappe1 <> FBBOX_NICHT_VERWENDET) OR
	(Betriebsparameter.Boxen[6].StellungKlappe1 <> FBBOX_NICHT_VERWENDET);
	Aktoren.VentUndKlappen.Boxenklappe2Vorhanden		:= (Betriebsparameter.Boxen[1].StellungKlappe2 <> FBBOX_NICHT_VERWENDET) OR 
	(Betriebsparameter.Boxen[2].StellungKlappe2 <> FBBOX_NICHT_VERWENDET) OR (Betriebsparameter.Boxen[3].StellungKlappe2 <> FBBOX_NICHT_VERWENDET) OR
	(Betriebsparameter.Boxen[4].StellungKlappe2 <> FBBOX_NICHT_VERWENDET) OR (Betriebsparameter.Boxen[5].StellungKlappe2 <> FBBOX_NICHT_VERWENDET) OR
	(Betriebsparameter.Boxen[6].StellungKlappe2 <> FBBOX_NICHT_VERWENDET);
	Aktoren.VentUndKlappen.Boxenklappe3Vorhanden		:= (Betriebsparameter.Boxen[1].StellungKlappe3 <> FBBOX_NICHT_VERWENDET) OR 
	(Betriebsparameter.Boxen[2].StellungKlappe3 <> FBBOX_NICHT_VERWENDET) OR (Betriebsparameter.Boxen[3].StellungKlappe3 <> FBBOX_NICHT_VERWENDET) OR
	(Betriebsparameter.Boxen[4].StellungKlappe3 <> FBBOX_NICHT_VERWENDET) OR (Betriebsparameter.Boxen[5].StellungKlappe3 <> FBBOX_NICHT_VERWENDET) OR
	(Betriebsparameter.Boxen[6].StellungKlappe3 <> FBBOX_NICHT_VERWENDET);
	Aktoren.VentUndKlappen.Boxenklappe4Vorhanden		:= (Betriebsparameter.Boxen[1].StellungKlappe4 <> FBBOX_NICHT_VERWENDET) OR 
	(Betriebsparameter.Boxen[2].StellungKlappe4 <> FBBOX_NICHT_VERWENDET) OR (Betriebsparameter.Boxen[3].StellungKlappe4 <> FBBOX_NICHT_VERWENDET) OR
	(Betriebsparameter.Boxen[4].StellungKlappe4 <> FBBOX_NICHT_VERWENDET) OR (Betriebsparameter.Boxen[5].StellungKlappe4 <> FBBOX_NICHT_VERWENDET) OR
	(Betriebsparameter.Boxen[6].StellungKlappe4 <> FBBOX_NICHT_VERWENDET);
	Aktoren.VentUndKlappen.Boxenklappe5Vorhanden		:= (Betriebsparameter.Boxen[1].StellungKlappe5 <> FBBOX_NICHT_VERWENDET) OR 
	(Betriebsparameter.Boxen[2].StellungKlappe5 <> FBBOX_NICHT_VERWENDET) OR (Betriebsparameter.Boxen[3].StellungKlappe5 <> FBBOX_NICHT_VERWENDET) OR
	(Betriebsparameter.Boxen[4].StellungKlappe5 <> FBBOX_NICHT_VERWENDET) OR (Betriebsparameter.Boxen[5].StellungKlappe5 <> FBBOX_NICHT_VERWENDET) OR
	(Betriebsparameter.Boxen[6].StellungKlappe5 <> FBBOX_NICHT_VERWENDET);
	Aktoren.VentUndKlappen.Boxenklappe6Vorhanden		:= (Betriebsparameter.Boxen[1].StellungKlappe6 <> FBBOX_NICHT_VERWENDET) OR 
	(Betriebsparameter.Boxen[2].StellungKlappe6 <> FBBOX_NICHT_VERWENDET) OR (Betriebsparameter.Boxen[3].StellungKlappe6 <> FBBOX_NICHT_VERWENDET) OR
	(Betriebsparameter.Boxen[4].StellungKlappe6 <> FBBOX_NICHT_VERWENDET) OR (Betriebsparameter.Boxen[5].StellungKlappe6 <> FBBOX_NICHT_VERWENDET) OR
	(Betriebsparameter.Boxen[6].StellungKlappe6 <> FBBOX_NICHT_VERWENDET);
	
	//GUI-Parameter
	Aktoren.VentUndKlappen.QuitFehler					:= hmiButtons.QuitFehler;
	Aktoren.VentUndKlappen.AnlaufverzZweiterVent		:= Betriebsparameter.Schrittkette.AnlaufverzZweiterVentilator;
	Aktoren.VentUndKlappen.DrehzahlVent1Min				:= Betriebsparameter.Ventilator1.DrehzahlMin;
	Aktoren.VentUndKlappen.DrehzahlVent1Max				:= Betriebsparameter.Ventilator1.DrehzahlMax;
	Aktoren.VentUndKlappen.RampeVent1Up					:= Betriebsparameter.Ventilator1.ZeitRampeUp;
	Aktoren.VentUndKlappen.RampeVent1Down				:= Betriebsparameter.Ventilator1.ZeitRampeDown;
	Aktoren.VentUndKlappen.DrehzahlVent1Umsch			:= Betriebsparameter.Ventilator1.DrzUmschaltung;
	Aktoren.VentUndKlappen.DrzVent1UmschMitLuftaufb		:= Betriebsparameter.Ventilator1.DrzUmschaltungMitLuftaufb;
	Aktoren.VentUndKlappen.DrehzahlVent2Min				:= Betriebsparameter.Ventilator2.DrehzahlMin;
	Aktoren.VentUndKlappen.DrehzahlVent2Max				:= Betriebsparameter.Ventilator2.DrehzahlMax;
	Aktoren.VentUndKlappen.RampeVent2Up					:= Betriebsparameter.Ventilator2.ZeitRampeUp;
	Aktoren.VentUndKlappen.RampeVent2Down				:= Betriebsparameter.Ventilator2.ZeitRampeDown;
	Aktoren.VentUndKlappen.DrehzahlVent2Umsch			:= Betriebsparameter.Ventilator2.DrzUmschaltung;
	Aktoren.VentUndKlappen.DrzVent2UmschMitLuftaufb		:= Betriebsparameter.Ventilator2.DrzUmschaltungMitLuftaufb;
	Aktoren.VentUndKlappen.LaufzeitBypassklappe			:= Betriebsparameter.Bypassklappe.Laufzeit;
	Aktoren.VentUndKlappen.LaufzeitBoxenklappe1			:= Betriebsparameter.KlappenBoxen[1].Laufzeit;
	Aktoren.VentUndKlappen.LaufzeitBoxenklappe2			:= Betriebsparameter.KlappenBoxen[2].Laufzeit;
	Aktoren.VentUndKlappen.LaufzeitBoxenklappe3			:= Betriebsparameter.KlappenBoxen[3].Laufzeit;
	Aktoren.VentUndKlappen.LaufzeitBoxenklappe4			:= Betriebsparameter.KlappenBoxen[4].Laufzeit;
	Aktoren.VentUndKlappen.LaufzeitBoxenklappe5			:= Betriebsparameter.KlappenBoxen[5].Laufzeit;
	Aktoren.VentUndKlappen.LaufzeitBoxenklappe6			:= Betriebsparameter.KlappenBoxen[6].Laufzeit;
	Aktoren.VentUndKlappen.LaufzeitUmschaltklappe1		:= Betriebsparameter.Umschaltklappen.LaufzeitKlappe1;
	Aktoren.VentUndKlappen.LaufzeitUmschaltklappe2		:= Betriebsparameter.Umschaltklappen.LaufzeitKlappe2;
	Aktoren.VentUndKlappen.EndlagenVhdBoxenklappe1		:= Betriebsparameter.Ausstattung.EndlagenVhdBoxenklappe1;
	Aktoren.VentUndKlappen.EndlagenVhdBoxenklappe2		:= Betriebsparameter.Ausstattung.EndlagenVhdBoxenklappe2;
	Aktoren.VentUndKlappen.EndlagenVhdBoxenklappe3		:= Betriebsparameter.Ausstattung.EndlagenVhdBoxenklappe3;
	Aktoren.VentUndKlappen.EndlagenVhdBoxenklappe4		:= Betriebsparameter.Ausstattung.EndlagenVhdBoxenklappe4;
	Aktoren.VentUndKlappen.EndlagenVhdBoxenklappe5		:= Betriebsparameter.Ausstattung.EndlagenVhdBoxenklappe5;
	Aktoren.VentUndKlappen.EndlagenVhdBoxenklappe6		:= Betriebsparameter.Ausstattung.EndlagenVhdBoxenklappe6;
	Aktoren.VentUndKlappen.EndlagenVhdUmschaltklappe1	:= Betriebsparameter.Ausstattung.EndlagenVhdUmschaltklappe1;
	Aktoren.VentUndKlappen.EndlagenVhdUmschaltklappe2	:= Betriebsparameter.Ausstattung.EndlagenVhdUmschaltklappe1;//Option Endlagen Umschaltklappen nur für beide Klappen gleich einstellbar
	Aktoren.VentUndKlappen.EndlagenVhdBypassklappe		:= Betriebsparameter.Ausstattung.EndlagenVhdBypassklappe;	

	
	//Ausgänge
	doVentilator1Ein									:= Aktoren.VentUndKlappen.FreigabeVentilator1Out;
	doVentilator2Ein									:= Aktoren.VentUndKlappen.FreigabeVentilator2Out;
	aoDrehzahlvorgVentilator1							:= Aktoren.VentUndKlappen.DrehzahlVent1Out;
	aoDrehzahlvorgVentilator2							:= Aktoren.VentUndKlappen.DrehzahlVent2Out;
	doBypassklappeOeffnen								:= Aktoren.VentUndKlappen.BypassOeffnenOut;
	doBypassklappeSchliessen							:= Aktoren.VentUndKlappen.BypassSchliessenOut;
	doUmluftklappe1Freigabe								:= hmiButtons.changeWarmluftVent1; //Kunde Gschneitner, Klappe von HMI aus bedienen //Aktoren.VentUndKlappen.Umschaltkl1OeffnenOut;
	doUmluftklappe1Oeffnen								:= Aktoren.VentUndKlappen.Umschaltkl1OeffnenOut;
	doUmluftklappe1Schliessen							:= Aktoren.VentUndKlappen.Umschaltkl1SchliessenOut;
	doUmluftklappe2Freigabe								:= hmiButtons.changeWarmluftVent2; //Kunde Gschneitner, Klappe von HMI aus bedienen //Aktoren.VentUndKlappen.Umschaltkl2OeffnenOut;
	doUmluftklappe2Oeffnen								:= Aktoren.VentUndKlappen.Umschaltkl2OeffnenOut;
	doUmluftklappe2Schliessen							:= Aktoren.VentUndKlappen.Umschaltkl2SchliessenOut;
	doFreigabeBox1										:= Aktoren.VentUndKlappen.Boxenklappe1OeffnenOut;
	doFreigabeBox2										:= Aktoren.VentUndKlappen.Boxenklappe2OeffnenOut;
	doFreigabeBox3										:= Aktoren.VentUndKlappen.Boxenklappe3OeffnenOut;
	doFreigabeBox4										:= Aktoren.VentUndKlappen.Boxenklappe4OeffnenOut;
	doFreigabeBox5										:= Aktoren.VentUndKlappen.Boxenklappe5OeffnenOut;
	doFreigabeBox6										:= Aktoren.VentUndKlappen.Boxenklappe6OeffnenOut;
	
	//Status ***********************************************************************************************
	
	//Ventilator 1
	IF Aktoren.VentUndKlappen.FreigabeVentilator1Out THEN
		gStatusAnlage.Aktor[AKTOR_VENTILATOR_1]		:= STATUS_AKTIV;
	ELSIF Aktoren.VentUndKlappen.FehlerFuVentilator1 THEN
		gStatusAnlage.Aktor[AKTOR_VENTILATOR_1]		:= STATUS_STOERUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_VENTILATOR_1]		:= STATUS_NICHT_AKTIV;
	END_IF
	
	//Ventilator 2
	IF Aktoren.VentUndKlappen.FreigabeVentilator2Out THEN
		gStatusAnlage.Aktor[AKTOR_VENTILATOR_2]		:= STATUS_AKTIV;
	ELSIF Aktoren.VentUndKlappen.FehlerFuVentilator2 THEN
		gStatusAnlage.Aktor[AKTOR_VENTILATOR_2]		:= STATUS_STOERUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_VENTILATOR_2]		:= STATUS_NICHT_AKTIV;
	END_IF
	
	
	//Bypassklappe
	IF doBypassklappeOeffnen AND NOT (diBypassklappeOffen OR Aktoren.VentUndKlappen.BypassklappeIstOffen) AND (Betriebsparameter.Bypassklappe.Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_BYPASSKLAPPE]	:= STATUS_AKTIV;
	ELSIF (NOT doBypassklappeOeffnen) AND NOT (diBypassklappeGeschl OR Aktoren.VentUndKlappen.BypassklappeIstGeschl) AND (Betriebsparameter.Bypassklappe.Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_BYPASSKLAPPE]	:= STATUS_AKTIV;
	ELSIF doBypassklappeOeffnen AND ((diBypassklappeOffen OR Aktoren.VentUndKlappen.BypassklappeIstOffen) OR (Betriebsparameter.Bypassklappe.Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_BYPASSKLAPPE]	:= STATUS_OFFEN;
	ELSIF (NOT doBypassklappeOeffnen) AND ((diBypassklappeGeschl OR Aktoren.VentUndKlappen.BypassklappeIstGeschl) OR (Betriebsparameter.Bypassklappe.Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_BYPASSKLAPPE]	:= STATUS_GESCHLOSSEN;
	ELSIF Aktoren.VentUndKlappen.FehlerLaufzeitBypass THEN
		gStatusAnlage.Aktor[AKTOR_BYPASSKLAPPE]	:= STATUS_STOERUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_BYPASSKLAPPE]	:= STATUS_NICHT_AKTIV;
	END_IF
	
	//Umluftklappe 1
	IF doUmluftklappe1Freigabe AND NOT (diUmschaltklappe1Offen OR Aktoren.VentUndKlappen.Umschaltklappe1IstOffen) AND (Betriebsparameter.Umschaltklappen.LaufzeitKlappe1 <> 0) AND Betriebsparameter.Ausstattung.Umschaltklappe1 THEN
		gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_1]	:= STATUS_AKTIV;
	ELSIF (NOT doUmluftklappe1Freigabe) AND NOT (diUmschaltklappe1Geschl OR Aktoren.VentUndKlappen.Umschaltklappe1IstGeschl) AND (Betriebsparameter.Umschaltklappen.LaufzeitKlappe1 <> 0) AND Betriebsparameter.Ausstattung.Umschaltklappe1 THEN
		gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_1]	:= STATUS_AKTIV;
	ELSIF doUmluftklappe1Freigabe AND ((diUmschaltklappe1Offen OR Aktoren.VentUndKlappen.Umschaltklappe1IstOffen) OR (Betriebsparameter.Umschaltklappen.LaufzeitKlappe1 = 0)) AND Betriebsparameter.Ausstattung.Umschaltklappe1 THEN
		gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_1]	:= STATUS_OFFEN;
	ELSIF (NOT doUmluftklappe1Freigabe) AND ((diUmschaltklappe1Geschl OR Aktoren.VentUndKlappen.Umschaltklappe1IstGeschl) OR (Betriebsparameter.Umschaltklappen.LaufzeitKlappe1 = 0)) AND Betriebsparameter.Ausstattung.Umschaltklappe1 THEN
		gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_1]	:= STATUS_GESCHLOSSEN;
	ELSIF Aktoren.VentUndKlappen.FehlerLaufzeitUmschaltkl1 AND Betriebsparameter.Ausstattung.Umschaltklappe1 THEN
		gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_1]	:= STATUS_STOERUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_1]	:= STATUS_NICHT_AKTIV;
	END_IF

	//Umluftklappe 2
	IF doUmluftklappe2Freigabe AND NOT (diUmschaltklappe2Offen OR Aktoren.VentUndKlappen.Umschaltklappe2IstOffen) AND (Betriebsparameter.Umschaltklappen.LaufzeitKlappe2 <> 0) AND Betriebsparameter.Ausstattung.Umschaltklappe2 THEN
		gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_2]	:= STATUS_AKTIV;
	ELSIF (NOT doUmluftklappe2Freigabe) AND NOT (diUmschaltklappe2Geschl OR Aktoren.VentUndKlappen.Umschaltklappe2IstGeschl) AND (Betriebsparameter.Umschaltklappen.LaufzeitKlappe2 <> 0) AND Betriebsparameter.Ausstattung.Umschaltklappe2 THEN
		gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_2]	:= STATUS_AKTIV;
	ELSIF doUmluftklappe2Freigabe AND ((diUmschaltklappe2Offen OR Aktoren.VentUndKlappen.Umschaltklappe2IstOffen) OR (Betriebsparameter.Umschaltklappen.LaufzeitKlappe2 = 0)) AND Betriebsparameter.Ausstattung.Umschaltklappe2 THEN
		gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_2]	:= STATUS_OFFEN;
	ELSIF (NOT doUmluftklappe2Freigabe) AND ((diUmschaltklappe2Geschl OR Aktoren.VentUndKlappen.Umschaltklappe2IstGeschl) OR (Betriebsparameter.Umschaltklappen.LaufzeitKlappe2 = 0)) AND Betriebsparameter.Ausstattung.Umschaltklappe2 THEN
		gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_2]	:= STATUS_GESCHLOSSEN;
	ELSIF Aktoren.VentUndKlappen.FehlerLaufzeitUmschaltkl2 AND Betriebsparameter.Ausstattung.Umschaltklappe2 THEN
		gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_2]	:= STATUS_STOERUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_2]	:= STATUS_NICHT_AKTIV;
	END_IF

	//Boxenklappe 1
	IF doFreigabeBox1 AND NOT (diBox1Offen OR Aktoren.VentUndKlappen.Boxenklappe1IstOffen) AND (Betriebsparameter.KlappenBoxen[1].Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_1]	:= STATUS_AKTIV;
	ELSIF (NOT doFreigabeBox1) AND NOT (diBox1Geschl OR Aktoren.VentUndKlappen.Boxenklappe1IstGeschl) AND (Betriebsparameter.KlappenBoxen[1].Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_1]	:= STATUS_AKTIV;
	ELSIF doFreigabeBox1 AND ((diBox1Offen OR Aktoren.VentUndKlappen.Boxenklappe1IstOffen) OR (Betriebsparameter.KlappenBoxen[1].Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_1]	:= STATUS_OFFEN;
	ELSIF (NOT doFreigabeBox1) AND ((diBox1Geschl OR Aktoren.VentUndKlappen.Boxenklappe1IstGeschl) OR (Betriebsparameter.KlappenBoxen[1].Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_1]	:= STATUS_GESCHLOSSEN;
	ELSIF Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox1 THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_1]	:= STATUS_STOERUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_1]	:= STATUS_NICHT_AKTIV;
	END_IF
	
	//Boxenklappe 2
	IF doFreigabeBox2 AND NOT (diBox2Offen OR Aktoren.VentUndKlappen.Boxenklappe2IstOffen) AND (Betriebsparameter.KlappenBoxen[2].Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_2]	:= STATUS_AKTIV;
	ELSIF (NOT doFreigabeBox2) AND NOT (diBox2Geschl OR Aktoren.VentUndKlappen.Boxenklappe2IstGeschl) AND (Betriebsparameter.KlappenBoxen[2].Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_2]	:= STATUS_AKTIV;
	ELSIF doFreigabeBox2 AND ((diBox2Offen OR Aktoren.VentUndKlappen.Boxenklappe2IstOffen) OR (Betriebsparameter.KlappenBoxen[2].Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_2]	:= STATUS_OFFEN;
	ELSIF (NOT doFreigabeBox2) AND ((diBox2Geschl OR Aktoren.VentUndKlappen.Boxenklappe2IstGeschl) OR (Betriebsparameter.KlappenBoxen[2].Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_2]	:= STATUS_GESCHLOSSEN;
	ELSIF Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox2 THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_2]	:= STATUS_STOERUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_2]	:= STATUS_NICHT_AKTIV;
	END_IF

	//Boxenklappe 3
	IF doFreigabeBox3 AND NOT (diBox3Offen OR Aktoren.VentUndKlappen.Boxenklappe3IstOffen) AND (Betriebsparameter.KlappenBoxen[3].Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_3]	:= STATUS_AKTIV;
	ELSIF (NOT doFreigabeBox3) AND NOT (diBox3Geschl OR Aktoren.VentUndKlappen.Boxenklappe3IstGeschl) AND (Betriebsparameter.KlappenBoxen[3].Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_3]	:= STATUS_AKTIV;
	ELSIF doFreigabeBox3 AND ((diBox3Offen OR Aktoren.VentUndKlappen.Boxenklappe3IstOffen) OR (Betriebsparameter.KlappenBoxen[3].Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_3]	:= STATUS_OFFEN;
	ELSIF (NOT doFreigabeBox3) AND ((diBox3Geschl OR Aktoren.VentUndKlappen.Boxenklappe3IstGeschl) OR (Betriebsparameter.KlappenBoxen[3].Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_3]	:= STATUS_GESCHLOSSEN;
	ELSIF Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox3 THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_3]	:= STATUS_STOERUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_3]	:= STATUS_NICHT_AKTIV;
	END_IF
	
	//Boxenklappe 4
	IF doFreigabeBox4 AND NOT (diBox4Offen OR Aktoren.VentUndKlappen.Boxenklappe4IstOffen) AND (Betriebsparameter.KlappenBoxen[4].Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_4]	:= STATUS_AKTIV;
	ELSIF (NOT doFreigabeBox4) AND NOT (diBox4Geschl OR Aktoren.VentUndKlappen.Boxenklappe4IstGeschl) AND (Betriebsparameter.KlappenBoxen[4].Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_4]	:= STATUS_AKTIV;
	ELSIF doFreigabeBox4 AND ((diBox4Offen OR Aktoren.VentUndKlappen.Boxenklappe4IstOffen) OR (Betriebsparameter.KlappenBoxen[4].Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_4]	:= STATUS_OFFEN;
	ELSIF (NOT doFreigabeBox4) AND ((diBox4Geschl OR Aktoren.VentUndKlappen.Boxenklappe4IstGeschl) OR (Betriebsparameter.KlappenBoxen[4].Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_4]	:= STATUS_GESCHLOSSEN;
	ELSIF Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox4 THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_4]	:= STATUS_STOERUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_4]	:= STATUS_NICHT_AKTIV;
	END_IF
	
	//Boxenklappe 5
	IF doFreigabeBox5 AND NOT (diBox5Offen OR Aktoren.VentUndKlappen.Boxenklappe5IstOffen) AND (Betriebsparameter.KlappenBoxen[5].Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_5]	:= STATUS_AKTIV;
	ELSIF (NOT doFreigabeBox5) AND NOT (diBox5Geschl OR Aktoren.VentUndKlappen.Boxenklappe5IstGeschl) AND (Betriebsparameter.KlappenBoxen[5].Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_5]	:= STATUS_AKTIV;
	ELSIF doFreigabeBox5 AND ((diBox5Offen OR Aktoren.VentUndKlappen.Boxenklappe5IstOffen) OR (Betriebsparameter.KlappenBoxen[5].Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_5]	:= STATUS_OFFEN;
	ELSIF (NOT doFreigabeBox5) AND ((diBox5Geschl OR Aktoren.VentUndKlappen.Boxenklappe5IstGeschl) OR (Betriebsparameter.KlappenBoxen[5].Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_5]	:= STATUS_GESCHLOSSEN;
	ELSIF Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox5 THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_5]	:= STATUS_STOERUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_5]	:= STATUS_NICHT_AKTIV;
	END_IF
	
	//Boxenklappe 6
	IF doFreigabeBox6 AND NOT (diBox6Offen OR Aktoren.VentUndKlappen.Boxenklappe6IstOffen) AND (Betriebsparameter.KlappenBoxen[6].Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_6]	:= STATUS_AKTIV;
	ELSIF (NOT doFreigabeBox6) AND NOT (diBox6Geschl OR Aktoren.VentUndKlappen.Boxenklappe6IstGeschl) AND (Betriebsparameter.KlappenBoxen[6].Laufzeit <> 0) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_6]	:= STATUS_AKTIV;
	ELSIF doFreigabeBox6 AND ((diBox6Offen OR Aktoren.VentUndKlappen.Boxenklappe6IstOffen) OR (Betriebsparameter.KlappenBoxen[6].Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_6]	:= STATUS_OFFEN;
	ELSIF (NOT doFreigabeBox6) AND ((diBox6Geschl OR Aktoren.VentUndKlappen.Boxenklappe6IstGeschl) OR (Betriebsparameter.KlappenBoxen[6].Laufzeit = 0)) THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_6]	:= STATUS_GESCHLOSSEN;
	ELSIF Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox6 THEN
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_6]	:= STATUS_STOERUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_KLAPPE_BOX_6]	:= STATUS_NICHT_AKTIV;
	END_IF
	
	
	
	//Warmluftofen **********************************************************************************************************************************************************************
	//Steuerungsvariante <> HB4000/HB3000
	IF (hmiStatus.NameSteuerung <> 4) AND (hmiStatus.NameSteuerung <> 5) THEN
		
		//Eingänge
		Aktoren.Warmluftofen.BetriebsmeldungWarmluftofen	:= diWarmluftofenInBetrieb;
		Aktoren.Warmluftofen.FehlerSensorAussenluft			:= alarmFehler[FEHLER_SENSOR_FRISCHLUFT];
		Aktoren.Warmluftofen.FrischluftSattDefizitIst		:= gStatusAnlage.Berechnungen.FrischluftSattDefizit;
	
		//GUI-Parameter
		Aktoren.Warmluftofen.Auskuehlzeit					:= Betriebsparameter.Warmluftofen.Auskuehlzeit;
		Aktoren.Warmluftofen.FrischluftSattDefizitSoll		:= Betriebsparameter.Warmluftofen.SaettigungFrischlEin;
		Aktoren.Warmluftofen.Hysterese						:= Betriebsparameter.Warmluftofen.Hysterese;
		Aktoren.Warmluftofen.OptionBetriebsmldgVhd			:= Betriebsparameter.Ausstattung.WarmluftofenBetriebsmldg;
		Aktoren.Warmluftofen.QuitFehler						:= hmiButtons.QuitFehler;
		Aktoren.Warmluftofen.UmschaltverzWitterung			:= Betriebsparameter.Warmluftofen.VerzWetterwechsel;
		Aktoren.Warmluftofen.VerzBetriebsmeldung			:= Betriebsparameter.Warmluftofen.VerzBetriebsmeldung;
		Aktoren.Warmluftofen.WarmlufttemperaturVorgabe		:= Betriebsparameter.Warmluftofen.WarmlufttempVorgabeSoll;
		
	//HB4000/HB3000
	ELSE
		
		//Eingänge
		Aktoren.Warmluftofen.BetriebsmeldungWarmluftofen	:= diWarmluftofenInBetrieb;
		Aktoren.Warmluftofen.FehlerSensorAussenluft			:= FALSE;
		Aktoren.Warmluftofen.WetterIstSchlecht				:= gStatusAnlage.WetterIstSchlecht;
	
		//GUI-Parameter
		Aktoren.Warmluftofen.Auskuehlzeit					:= Betriebsparameter.Warmluftofen.Auskuehlzeit;
		Aktoren.Warmluftofen.OptionBetriebsmldgVhd			:= Betriebsparameter.Ausstattung.WarmluftofenBetriebsmldg;
		Aktoren.Warmluftofen.QuitFehler						:= hmiButtons.QuitFehler;
		Aktoren.Warmluftofen.VerzBetriebsmeldung			:= Betriebsparameter.Warmluftofen.VerzBetriebsmeldung;
		
	END_IF
	
	//Ausgänge
	doWarmluftofenEin									:= Aktoren.Warmluftofen.FreigabeWarmluftofenOut;
	aoTemperaturvorgWarmluftofen						:= Aktoren.Warmluftofen.WarmlufttempSollOut;

	//Status
	IF doWarmluftofenEin THEN
		gStatusAnlage.Aktor[AKTOR_WARMLUFTOFEN]		:= STATUS_AKTIV;
	ELSIF Aktoren.Warmluftofen.WarmluftofenAktiv THEN
		gStatusAnlage.Aktor[AKTOR_WARMLUFTOFEN]		:= STATUS_AUSKUEHLPHASE;
	ELSIF Aktoren.Warmluftofen.FehlerBetriebsmeldungOut OR Aktoren.Warmluftofen.FehlerSensorAussenluftOut THEN
		gStatusAnlage.Aktor[AKTOR_WARMLUFTOFEN]		:= STATUS_STOERUNG;	
	ELSE
		gStatusAnlage.Aktor[AKTOR_WARMLUFTOFEN]		:= STATUS_NICHT_AKTIV;
	END_IF
	
	
	
	//Heizregister **********************************************************************************************************************************************************************
	//Steuerungsvariante <> HB4000/HB3000
	IF (hmiStatus.NameSteuerung <> 4) AND (hmiStatus.NameSteuerung <> 5) THEN
		
		//Eingänge
		Aktoren.Heizregister.FehlerSensorAussenluft			:= alarmFehler[FEHLER_SENSOR_FRISCHLUFT];
		Aktoren.Heizregister.FrischluftSattDefizitIst		:= gStatusAnlage.Berechnungen.FrischluftSattDefizit;
	
		//GUI-Parameter
		Aktoren.Heizregister.DrehzahlHeizregisterSoll		:= gCmdAnlage.Leistung.DrehzahlHeizregister;
		Aktoren.Heizregister.FrischluftSattDefizitSoll		:= Betriebsparameter.Heizregister.SaettigungFrischlEin;
		Aktoren.Heizregister.Hysterese						:= Betriebsparameter.Heizregister.Hysterese;
		Aktoren.Heizregister.QuitFehler						:= hmiButtons.QuitFehler;
		Aktoren.Heizregister.UmschaltverzWitterung			:= Betriebsparameter.Heizregister.VerzWetterwechsel;

		//Abfrage Frostschutz aktivieren
		IF (diHeizregisterFrostschutz) THEN
			//Frostschutz aktiv Heizregister Freigabe ein und volle Leistung
			doHeizregisterEin									:= TRUE;
			aoLeistungsvorgHeizregister							:= 100.0;
		//Kunde Gschneitner: steht kein laufender Ventilator auf Warmluft, darf das Heizregister weder Freigabe
		//noch ein 0-10V Signal bekommen. Der Baustein Aktoren.Heizregister wird dafuer in Ablaufstrg/actionBetrieb
		//bereits wie im Stillstand versorgt; diese Abfrage klemmt die Ausgaenge zusaetzlich unabhaengig davon ab.
		ELSIF NOT gStatusAnlage.WarmluftAnforderung THEN
			doHeizregisterEin									:= FALSE;
			aoLeistungsvorgHeizregister							:= 0.0;
		ELSE
			//Normalbetrieb - Ausgaenge von Regler uebernehmen
			doHeizregisterEin									:= Aktoren.Heizregister.FreigabeHeizregisterOut;
			aoLeistungsvorgHeizregister							:= Aktoren.Heizregister.DrehzahlHeizregisterOut;		
		END_IF
		
			
		//HB4000/HB3000
	ELSE
		//Eingänge
		Aktoren.Heizregister.FehlerSensorAussenluft			:= FALSE;
		Aktoren.Heizregister.WetterIstSchlecht				:= gStatusAnlage.WetterIstSchlecht;
	
		//GUI-Parameter
		Aktoren.Heizregister.QuitFehler						:= hmiButtons.QuitFehler;

		//Ausgänge
		doHeizregisterEin									:= Aktoren.Heizregister.FreigabeHeizregisterOut;
	END_IF
	
	//Status
	IF doHeizregisterEin THEN
		gStatusAnlage.Aktor[AKTOR_HEIZREGISTER]		:= STATUS_AKTIV;
	ELSIF Aktoren.Heizregister.FehlerOut THEN
		gStatusAnlage.Aktor[AKTOR_HEIZREGISTER]		:= STATUS_STOERUNG;	
	ELSE
		gStatusAnlage.Aktor[AKTOR_HEIZREGISTER]		:= STATUS_NICHT_AKTIV;
	END_IF
	
	
	//Scheitholzofen **********************************************************************************************************************************************************************

	//Eingänge
	Aktoren.Scheitholzofen.Betriebsmeldung		:= diScheitholzofenInBetrieb;
	
	//GUI-Parameter
	Aktoren.Scheitholzofen.Freigabe				:= Betriebsparameter.Ausstattung.Scheitholzofen;
	Aktoren.Scheitholzofen.Auskuehlzeit			:= Betriebsparameter.Scheitholzofen.Auskuehlzeit;

	//Ausgänge

	//Status
	IF diScheitholzofenInBetrieb THEN
		gStatusAnlage.Aktor[AKTOR_SCHEITHOLZOFEN]	:= STATUS_AKTIV;
	ELSIF Aktoren.Scheitholzofen.ScheitholzofenAktiv THEN
		gStatusAnlage.Aktor[AKTOR_SCHEITHOLZOFEN]	:= STATUS_AUSKUEHLPHASE;
	ELSE
		gStatusAnlage.Aktor[AKTOR_SCHEITHOLZOFEN]	:= STATUS_NICHT_AKTIV;
	END_IF
	
	
	//Notstromaggregat **********************************************************************************************************************************************************************

	//Eingänge
	Aktoren.Notstromaggregat.BetriebsmldgNotstromaggregat	:= diNotstromaggregatInBetrieb;
	
	//GUI-Parameter
	Aktoren.Notstromaggregat.Freigabe						:= Betriebsparameter.Ausstattung.Notstromaggregat;
	Aktoren.Notstromaggregat.QuitFehler						:= hmiButtons.QuitFehler;
	Aktoren.Notstromaggregat.VerzBetriebsmeldung			:= Betriebsparameter.Notstromaggregat.VerzBetriebsmeldung;
	Aktoren.Notstromaggregat.Vorlaufzeit					:= Betriebsparameter.Notstromaggregat.Vorlaufzeit;
	Aktoren.Notstromaggregat.Nachlaufzeit					:= Betriebsparameter.Notstromaggregat.Nachlaufzeit;

	//Ausgänge
	doNotstromaggregatEin									:= Aktoren.Notstromaggregat.FreigabeNotstromaggregatOut;

	//Status
	IF Aktoren.Notstromaggregat.NotstromBereitOut THEN
		gStatusAnlage.Aktor[AKTOR_NOTSTROMAGGREGAT]		:= STATUS_BEREIT;
	ELSIF doNotstromaggregatEin THEN
		gStatusAnlage.Aktor[AKTOR_NOTSTROMAGGREGAT]		:= STATUS_AKTIV;
	ELSIF Aktoren.Notstromaggregat.FehlerOut THEN
		gStatusAnlage.Aktor[AKTOR_NOTSTROMAGGREGAT]		:= STATUS_STOERUNG;
	ELSE
		gStatusAnlage.Aktor[AKTOR_NOTSTROMAGGREGAT]		:= STATUS_NICHT_AKTIV;
	END_IF

	
	//Brandschutzklappe **********************************************************************************************************************************************************************

	//Eingänge
	Aktoren.Brandschutzklappe.EndlageOffen					:= FALSE;
	Aktoren.Brandschutzklappe.EndlageGeschl					:= FALSE;
	Aktoren.Brandschutzklappe.LaufzeitOeffnen				:= 0;
	Aktoren.Brandschutzklappe.LaufzeitSchliessen			:= 0;
	Aktoren.Brandschutzklappe.Stoerung						:= FALSE;
	
	//GUI-Parameter
	Aktoren.Brandschutzklappe.QuitFehler					:= hmiButtons.QuitFehler;

	//Ausgänge
	doBrandschutzklappeAuf									:= Aktoren.Brandschutzklappe.OeffnenOut;

	//Status
	IF Aktoren.Brandschutzklappe.OeffnenOut THEN
		gStatusAnlage.Aktor[AKTOR_BRANDSCHUTZKLAPPE]	:= STATUS_OFFEN;
	ELSIF Betriebsparameter.Ausstattung.Brandschutzklappe THEN
		gStatusAnlage.Aktor[AKTOR_BRANDSCHUTZKLAPPE]	:= STATUS_GESCHLOSSEN;
	ELSE
		gStatusAnlage.Aktor[AKTOR_BRANDSCHUTZKLAPPE]	:= STATUS_NICHT_VERFUEGBAR;
	END_IF
	

	
END_PROGRAM