
ACTION actionUpdateStatus: 
	
	//Sensoren *******************************************************************************************************************************************************************************
	gStatusAnlage.FrischluftTemperatur	:= aiFrischluftTemperatur;
	gStatusAnlage.FrischluftFeuchte		:= aiFrischluftFeuchte;
	gStatusAnlage.TrockenluftTemperatur	:= aiTrockenluftTemperatur;
	gStatusAnlage.TrockenluftFeuchte	:= aiTrockenluftFeuchte;
	gStatusAnlage.AbluftFeuchte			:= aiAbluftFeuchte;
	gStatusAnlage.AbluftTemperatur		:= aiAbluftTemperatur;
	gStatusAnlage.AustrittFeuchte		:= aiAustrittFeuchte;
	gStatusAnlage.AustrittTemperatur	:= aiAustrittTemperatur;
	gStatusAnlage.DachluftFeuchte		:= aiDachluftFeuchte;
	gStatusAnlage.DachluftTemperatur	:= aiDachluftTemperatur;
	gStatusAnlage.EintrittFeuchte		:= aiEintrittFeuchte;
	gStatusAnlage.EintrittTemperatur	:= aiEintrittTemperatur;
	gStatusAnlage.HochdruckModul1		:= aiHochdruckModul1;
	gStatusAnlage.HochdruckModul2		:= aiHochdruckModul2;
	gStatusAnlage.NiederdruckModul1		:= aiNiederdruckModul1;
	gStatusAnlage.NiederdruckModul2		:= aiNiederdruckModul2;
	gStatusAnlage.Luftgeschwindigkeit	:= aiLuftgeschwindigkeit;
	gStatusAnlage.Kanaldruck			:= aiDifferenzdruck;

	
	//Drehzahlvorgaben *********************************************************************************************************************************************************************
	gStatusAnlage.DrehzahlKompressorModul1	:= aoDrehzahlvorgKompressorModul1;
	gStatusAnlage.DrehzahlKompressorModul2	:= aoDrehzahlvorgKompressorModul2;
	gStatusAnlage.DrehzahlVentilator1		:= aoDrehzahlvorgVentilator1;
	gStatusAnlage.DrehzahlVentilator2		:= aoDrehzahlvorgVentilator2;
	
	//Luftmenge Aktuell **********************************************************************************************************************************************************************
	IF Betriebsparameter.Ausstattung.Entfeuchter THEN
		gStatusAnlage.LuftmengeAktuell	:= aiLuftgeschwindigkeit * Betriebsparameter.Entfeuchter.Registerflaeche[Betriebsparameter.Entfeuchter.IndexType] * 3600;
	ELSE
		gStatusAnlage.LuftmengeAktuell	:= aiLuftgeschwindigkeit * Betriebsparameter.Allgemein.AnsaugflaecheVent * 3600;
	END_IF
	
	//Status Frischluftbetrieb / Umluftbetrieb *****************************************************************************************************************************************************
	IF (hmiStatus.NameSteuerung <> 4) AND (hmiStatus.NameSteuerung <> 5) THEN
		gStatusAnlage.FrischluftbetriebAktiv	:= (fbEntfUmschaltung_0.FrischluftbetriebOut AND Betriebsparameter.Umschaltklappen.Automatik) OR 
		Betriebsparameter.Umschaltklappen.Frischluft;
		gStatusAnlage.UmluftbetriebAktiv		:= (fbEntfUmschaltung_0.UmluftbetriebOut AND Betriebsparameter.Umschaltklappen.Automatik) OR
		Betriebsparameter.Umschaltklappen.Umluft;
	ELSE
		gStatusAnlage.FrischluftbetriebAktiv	:= (Betriebsparameter.Umschaltklappen.Automatik AND NOT gStatusAnlage.WetterIstSchlecht) OR 
		Betriebsparameter.Umschaltklappen.Frischluft;
		gStatusAnlage.UmluftbetriebAktiv		:= (Betriebsparameter.Umschaltklappen.Automatik AND gStatusAnlage.WetterIstSchlecht) OR
		Betriebsparameter.Umschaltklappen.Umluft;
	END_IF
	
	
END_ACTION
