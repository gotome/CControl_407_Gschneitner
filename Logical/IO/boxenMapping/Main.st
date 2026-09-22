
PROGRAM _INIT

	 
END_PROGRAM

PROGRAM _CYCLIC

	//Eingänge Boxen Allgemein
	Boxen.StundeAktuell						:= Echtzeit.Stunde;
	Boxen.MehrereBoxenBelueftbar			:= Betriebsparameter.Ausstattung.MehrereBoxenBelueftbar;
	Boxen.AlleKlappenSchliessenWennAus		:= Betriebsparameter.Ausstattung.AlleBoxenklSchliessenWennAus;
	Boxen.BoxenklVonBeidenVentAbhaengig		:= Betriebsparameter.Ausstattung.BeideVentAusBeiUmschBoxenkl;
	Boxen.BypassklVonBeidenVentAbhaengig	:= Betriebsparameter.Ausstattung.BeideVentAusBeiUmschBypasskl;
	Boxen.WarmluftofenNochAktiv				:= Aktoren.Warmluftofen.WarmluftofenAktiv;
	Boxen.ScheitholzofenNochAktiv			:= Aktoren.Scheitholzofen.ScheitholzofenAktiv;
	Boxen.EntfeuchterNochAktiv				:= (Aktoren.KompressorModul1.curStep <> 0) OR (Aktoren.KompressorModul2.curStep <> 0) OR (Aktoren.EntfeuchterFremd.BetriebsmldgEntfeuchter);
	Boxen.AnfEntfeuchterExtern				:= diAnfEntfeuchterExtern;
	Boxen.EntfeuchterInselbetrieb			:= NOT Betriebsparameter.Ausstattung.Ventilator1;
	Boxen.TasteEntfeuchterEinInselbetrieb	:= hmiActions.cmdInselbetriebEntfeuchterEin;
	
	//Ausgänge Ansteuerung Boxenklappen
	Aktoren.VentUndKlappen.Boxenklappe1Oeffnen		:= Boxen.FreigabeKlappe1Out;
	Aktoren.VentUndKlappen.Boxenklappe1Schliessen	:= NOT Boxen.FreigabeKlappe1Out;
	Aktoren.VentUndKlappen.Boxenklappe2Oeffnen		:= Boxen.FreigabeKlappe2Out;
	Aktoren.VentUndKlappen.Boxenklappe2Schliessen	:= NOT Boxen.FreigabeKlappe2Out;
	Aktoren.VentUndKlappen.Boxenklappe3Oeffnen		:= Boxen.FreigabeKlappe3Out;
	Aktoren.VentUndKlappen.Boxenklappe3Schliessen	:= NOT Boxen.FreigabeKlappe3Out;
	Aktoren.VentUndKlappen.Boxenklappe4Oeffnen		:= Boxen.FreigabeKlappe4Out;
	Aktoren.VentUndKlappen.Boxenklappe4Schliessen	:= NOT Boxen.FreigabeKlappe4Out;
	Aktoren.VentUndKlappen.Boxenklappe5Oeffnen		:= Boxen.FreigabeKlappe5Out;
	Aktoren.VentUndKlappen.Boxenklappe5Schliessen	:= NOT Boxen.FreigabeKlappe5Out;
	Aktoren.VentUndKlappen.Boxenklappe6Oeffnen		:= Boxen.FreigabeKlappe6Out;
	Aktoren.VentUndKlappen.Boxenklappe6Schliessen	:= NOT Boxen.FreigabeKlappe6Out;
	
	
	//Box 1 **********************************************************************************************************************************************************************************
	
	//Eingänge Betriebsarten
	Boxen.Box1In.DauerbetriebEin			:= Betriebsparameter.Boxen[1].DauerbetriebEin;
	Boxen.Box1In.IntervallbetriebEin		:= Betriebsparameter.Boxen[1].IntervallbetriebEin;
	Boxen.Box1In.NachtrocknungEin			:= Betriebsparameter.Boxen[1].NachtrocknungEin;
	
	//Eingänge Schlechtwetterbetrieb 
	Boxen.Box1In.WetterIstSchlecht			:= fbSchlechtwetterBox1.WetterIstSchlecht;
	Boxen.Box1In.LuftaufbIstVerfuegbar		:= (Boxen.Box1In.Heizregister AND NOT Betriebsparameter.Heizregister.Aus) OR
	(Boxen.Box1In.Luftentfeuchter AND NOT Betriebsparameter.Entfeuchter.Aus AND NOT gCmdAnlage.FehlerModul1 AND NOT gCmdAnlage.FehlerModul2) OR
	(Boxen.Box1In.Scheitholzofen AND diScheitholzofenInBetrieb) OR (Boxen.Box1In.Warmluftofen AND NOT Betriebsparameter.Warmluftofen.Aus AND NOT 
	alarmFehler[FEHLER_BETRIEBSMLDG_WARMLUFTOFEN]);
	Boxen.Box1In.SchlechtwetterPulszeit		:= fbSchlechtwetterBox1.SchlechtwetterPulszeit;
	Boxen.Box1In.SchlechtwetterPausezeit	:= fbSchlechtwetterBox1.SchlechtwetterPausezeit;
	
	Boxen.Box1In.IntervallbetriebZeiten[0]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[0];
	Boxen.Box1In.IntervallbetriebZeiten[1]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[1];
	Boxen.Box1In.IntervallbetriebZeiten[2]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[2];
	Boxen.Box1In.IntervallbetriebZeiten[3]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[3];
	Boxen.Box1In.IntervallbetriebZeiten[4]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[4];
	Boxen.Box1In.IntervallbetriebZeiten[5]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[5];
	Boxen.Box1In.IntervallbetriebZeiten[6]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[6];
	Boxen.Box1In.IntervallbetriebZeiten[7]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[7];
	Boxen.Box1In.IntervallbetriebZeiten[8]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[8];
	Boxen.Box1In.IntervallbetriebZeiten[9]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[9];
	Boxen.Box1In.IntervallbetriebZeiten[10]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[10];
	Boxen.Box1In.IntervallbetriebZeiten[11]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[11];
	Boxen.Box1In.IntervallbetriebZeiten[12]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[12];
	Boxen.Box1In.IntervallbetriebZeiten[13]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[13];
	Boxen.Box1In.IntervallbetriebZeiten[14]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[14];
	Boxen.Box1In.IntervallbetriebZeiten[15]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[15];
	Boxen.Box1In.IntervallbetriebZeiten[16]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[16];
	Boxen.Box1In.IntervallbetriebZeiten[17]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[17];
	Boxen.Box1In.IntervallbetriebZeiten[18]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[18];
	Boxen.Box1In.IntervallbetriebZeiten[19]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[19];
	Boxen.Box1In.IntervallbetriebZeiten[20]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[20];
	Boxen.Box1In.IntervallbetriebZeiten[21]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[21];
	Boxen.Box1In.IntervallbetriebZeiten[22]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[22];
	Boxen.Box1In.IntervallbetriebZeiten[23]	:= Betriebsparameter.Boxen[1].IntervallbetriebZeiten[23];

	Boxen.Box1In.NachtrocknungZeiten[0]		:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[0];
	Boxen.Box1In.NachtrocknungZeiten[1]		:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[1];
	Boxen.Box1In.NachtrocknungZeiten[2]		:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[2];
	Boxen.Box1In.NachtrocknungZeiten[3]		:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[3];
	Boxen.Box1In.NachtrocknungZeiten[4]		:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[4];
	Boxen.Box1In.NachtrocknungZeiten[5]		:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[5];
	Boxen.Box1In.NachtrocknungZeiten[6]		:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[6];
	Boxen.Box1In.NachtrocknungZeiten[7]		:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[7];
	Boxen.Box1In.NachtrocknungZeiten[8]		:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[8];
	Boxen.Box1In.NachtrocknungZeiten[9]		:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[9];
	Boxen.Box1In.NachtrocknungZeiten[10]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[10];
	Boxen.Box1In.NachtrocknungZeiten[11]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[11];
	Boxen.Box1In.NachtrocknungZeiten[12]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[12];
	Boxen.Box1In.NachtrocknungZeiten[13]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[13];
	Boxen.Box1In.NachtrocknungZeiten[14]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[14];
	Boxen.Box1In.NachtrocknungZeiten[15]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[15];
	Boxen.Box1In.NachtrocknungZeiten[16]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[16];
	Boxen.Box1In.NachtrocknungZeiten[17]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[17];
	Boxen.Box1In.NachtrocknungZeiten[18]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[18];
	Boxen.Box1In.NachtrocknungZeiten[19]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[19];
	Boxen.Box1In.NachtrocknungZeiten[20]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[20];
	Boxen.Box1In.NachtrocknungZeiten[21]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[21];
	Boxen.Box1In.NachtrocknungZeiten[22]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[22];
	Boxen.Box1In.NachtrocknungZeiten[23]	:= Betriebsparameter.Boxen[1].NachtrocknungZeiten[23];
	
	//Eingänge Klappenstellungen
	Boxen.Box1In.StellungKlappe1		:= Betriebsparameter.Boxen[1].StellungKlappe1;
	Boxen.Box1In.StellungKlappe2		:= Betriebsparameter.Boxen[1].StellungKlappe2;
	Boxen.Box1In.StellungKlappe3		:= Betriebsparameter.Boxen[1].StellungKlappe3;
	Boxen.Box1In.StellungKlappe4		:= Betriebsparameter.Boxen[1].StellungKlappe4;
	Boxen.Box1In.StellungKlappe5		:= Betriebsparameter.Boxen[1].StellungKlappe5;
	Boxen.Box1In.StellungKlappe6		:= Betriebsparameter.Boxen[1].StellungKlappe6;
	
	//Eingänge zuständige Aktoren
	Boxen.Box1In.Ventilator1			:= Betriebsparameter.Boxen[1].Ventilator1 AND Betriebsparameter.Ausstattung.Ventilator1;
	Boxen.Box1In.Ventilator2			:= Betriebsparameter.Boxen[1].Ventilator2 AND Betriebsparameter.Ausstattung.Ventilator2; 
	Boxen.Box1In.Luftentfeuchter		:= Betriebsparameter.Boxen[1].Luftentfeuchter AND (Betriebsparameter.Ausstattung.Entfeuchter OR Betriebsparameter.Ausstattung.EntfeuchterFremd);
	Boxen.Box1In.Warmluftofen			:= Betriebsparameter.Boxen[1].Warmluftofen AND Betriebsparameter.Ausstattung.Warmluftofen;
	Boxen.Box1In.Heizregister			:= Betriebsparameter.Boxen[1].Heizregister AND Betriebsparameter.Ausstattung.Heizregister;
	Boxen.Box1In.Scheitholzofen			:= Betriebsparameter.Boxen[1].Scheitholzofen AND Betriebsparameter.Ausstattung.Scheitholzofen;
	

	//Box 2 **********************************************************************************************************************************************************************************
		
	//Eingänge Betriebsarten
	Boxen.Box2In.DauerbetriebEin			:= Betriebsparameter.Boxen[2].DauerbetriebEin;
	Boxen.Box2In.IntervallbetriebEin		:= Betriebsparameter.Boxen[2].IntervallbetriebEin;
	Boxen.Box2In.NachtrocknungEin			:= Betriebsparameter.Boxen[2].NachtrocknungEin;
	
	//Eingänge Schlechtwetterbetrieb
	Boxen.Box2In.WetterIstSchlecht			:= fbSchlechtwetterBox2.WetterIstSchlecht;
	Boxen.Box2In.LuftaufbIstVerfuegbar		:= (Boxen.Box2In.Heizregister AND NOT Betriebsparameter.Heizregister.Aus) OR
	(Boxen.Box2In.Luftentfeuchter AND NOT Betriebsparameter.Entfeuchter.Aus AND NOT gCmdAnlage.FehlerModul1 AND NOT gCmdAnlage.FehlerModul2) OR
	(Boxen.Box2In.Scheitholzofen AND diScheitholzofenInBetrieb) OR (Boxen.Box2In.Warmluftofen AND NOT Betriebsparameter.Warmluftofen.Aus AND NOT 
	alarmFehler[FEHLER_BETRIEBSMLDG_WARMLUFTOFEN]);
	Boxen.Box2In.SchlechtwetterPulszeit		:= fbSchlechtwetterBox2.SchlechtwetterPulszeit;
	Boxen.Box2In.SchlechtwetterPausezeit	:= fbSchlechtwetterBox2.SchlechtwetterPausezeit;
	
	Boxen.Box2In.IntervallbetriebZeiten[0]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[0];
	Boxen.Box2In.IntervallbetriebZeiten[1]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[1];
	Boxen.Box2In.IntervallbetriebZeiten[2]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[2];
	Boxen.Box2In.IntervallbetriebZeiten[3]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[3];
	Boxen.Box2In.IntervallbetriebZeiten[4]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[4];
	Boxen.Box2In.IntervallbetriebZeiten[5]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[5];
	Boxen.Box2In.IntervallbetriebZeiten[6]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[6];
	Boxen.Box2In.IntervallbetriebZeiten[7]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[7];
	Boxen.Box2In.IntervallbetriebZeiten[8]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[8];
	Boxen.Box2In.IntervallbetriebZeiten[9]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[9];
	Boxen.Box2In.IntervallbetriebZeiten[10]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[10];
	Boxen.Box2In.IntervallbetriebZeiten[11]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[11];
	Boxen.Box2In.IntervallbetriebZeiten[12]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[12];
	Boxen.Box2In.IntervallbetriebZeiten[13]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[13];
	Boxen.Box2In.IntervallbetriebZeiten[14]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[14];
	Boxen.Box2In.IntervallbetriebZeiten[15]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[15];
	Boxen.Box2In.IntervallbetriebZeiten[16]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[16];
	Boxen.Box2In.IntervallbetriebZeiten[17]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[17];
	Boxen.Box2In.IntervallbetriebZeiten[18]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[18];
	Boxen.Box2In.IntervallbetriebZeiten[19]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[19];
	Boxen.Box2In.IntervallbetriebZeiten[20]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[20];
	Boxen.Box2In.IntervallbetriebZeiten[21]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[21];
	Boxen.Box2In.IntervallbetriebZeiten[22]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[22];
	Boxen.Box2In.IntervallbetriebZeiten[23]	:= Betriebsparameter.Boxen[2].IntervallbetriebZeiten[23];

	Boxen.Box2In.NachtrocknungZeiten[0]		:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[0];
	Boxen.Box2In.NachtrocknungZeiten[1]		:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[1];
	Boxen.Box2In.NachtrocknungZeiten[2]		:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[2];
	Boxen.Box2In.NachtrocknungZeiten[3]		:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[3];
	Boxen.Box2In.NachtrocknungZeiten[4]		:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[4];
	Boxen.Box2In.NachtrocknungZeiten[5]		:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[5];
	Boxen.Box2In.NachtrocknungZeiten[6]		:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[6];
	Boxen.Box2In.NachtrocknungZeiten[7]		:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[7];
	Boxen.Box2In.NachtrocknungZeiten[8]		:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[8];
	Boxen.Box2In.NachtrocknungZeiten[9]		:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[9];
	Boxen.Box2In.NachtrocknungZeiten[10]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[10];
	Boxen.Box2In.NachtrocknungZeiten[11]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[11];
	Boxen.Box2In.NachtrocknungZeiten[12]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[12];
	Boxen.Box2In.NachtrocknungZeiten[13]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[13];
	Boxen.Box2In.NachtrocknungZeiten[14]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[14];
	Boxen.Box2In.NachtrocknungZeiten[15]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[15];
	Boxen.Box2In.NachtrocknungZeiten[16]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[16];
	Boxen.Box2In.NachtrocknungZeiten[17]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[17];
	Boxen.Box2In.NachtrocknungZeiten[18]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[18];
	Boxen.Box2In.NachtrocknungZeiten[19]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[19];
	Boxen.Box2In.NachtrocknungZeiten[20]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[20];
	Boxen.Box2In.NachtrocknungZeiten[21]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[21];
	Boxen.Box2In.NachtrocknungZeiten[22]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[22];
	Boxen.Box2In.NachtrocknungZeiten[23]	:= Betriebsparameter.Boxen[2].NachtrocknungZeiten[23];
	
	//Eingänge Klappenstellungen	
	Boxen.Box2In.StellungKlappe1		:= Betriebsparameter.Boxen[2].StellungKlappe1;
	Boxen.Box2In.StellungKlappe2		:= Betriebsparameter.Boxen[2].StellungKlappe2;
	Boxen.Box2In.StellungKlappe3		:= Betriebsparameter.Boxen[2].StellungKlappe3;
	Boxen.Box2In.StellungKlappe4		:= Betriebsparameter.Boxen[2].StellungKlappe4;
	Boxen.Box2In.StellungKlappe5		:= Betriebsparameter.Boxen[2].StellungKlappe5;
	Boxen.Box2In.StellungKlappe6		:= Betriebsparameter.Boxen[2].StellungKlappe6;
	
	//Eingänge zuständige Aktoren
	Boxen.Box2In.Ventilator1			:= Betriebsparameter.Boxen[2].Ventilator1 AND Betriebsparameter.Ausstattung.Ventilator1;
	Boxen.Box2In.Ventilator2			:= Betriebsparameter.Boxen[2].Ventilator2 AND Betriebsparameter.Ausstattung.Ventilator2;
	Boxen.Box2In.Luftentfeuchter		:= Betriebsparameter.Boxen[2].Luftentfeuchter AND (Betriebsparameter.Ausstattung.Entfeuchter OR Betriebsparameter.Ausstattung.EntfeuchterFremd);
	Boxen.Box2In.Warmluftofen			:= Betriebsparameter.Boxen[2].Warmluftofen AND Betriebsparameter.Ausstattung.Warmluftofen;
	Boxen.Box2In.Heizregister			:= Betriebsparameter.Boxen[2].Heizregister AND Betriebsparameter.Ausstattung.Heizregister;
	Boxen.Box2In.Scheitholzofen			:= Betriebsparameter.Boxen[2].Scheitholzofen AND Betriebsparameter.Ausstattung.Scheitholzofen;

	//Box 3 **********************************************************************************************************************************************************************************
	
	//Eingänge Betriebsarten
	Boxen.Box3In.DauerbetriebEin			:= Betriebsparameter.Boxen[3].DauerbetriebEin;
	Boxen.Box3In.IntervallbetriebEin		:= Betriebsparameter.Boxen[3].IntervallbetriebEin;
	Boxen.Box3In.NachtrocknungEin			:= Betriebsparameter.Boxen[3].NachtrocknungEin;
	
	//Eingänge Schlechtwetterbetrieb
	Boxen.Box3In.WetterIstSchlecht			:= fbSchlechtwetterBox3.WetterIstSchlecht;
	Boxen.Box3In.LuftaufbIstVerfuegbar		:= (Boxen.Box3In.Heizregister AND NOT Betriebsparameter.Heizregister.Aus) OR
	(Boxen.Box3In.Luftentfeuchter AND NOT Betriebsparameter.Entfeuchter.Aus AND NOT gCmdAnlage.FehlerModul1 AND NOT gCmdAnlage.FehlerModul2) OR
	(Boxen.Box3In.Scheitholzofen AND diScheitholzofenInBetrieb) OR (Boxen.Box3In.Warmluftofen AND NOT Betriebsparameter.Warmluftofen.Aus AND NOT 
	alarmFehler[FEHLER_BETRIEBSMLDG_WARMLUFTOFEN]);
	Boxen.Box3In.SchlechtwetterPulszeit		:= fbSchlechtwetterBox3.SchlechtwetterPulszeit;
	Boxen.Box3In.SchlechtwetterPausezeit	:= fbSchlechtwetterBox3.SchlechtwetterPausezeit;
	
	Boxen.Box3In.IntervallbetriebZeiten[0]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[0];
	Boxen.Box3In.IntervallbetriebZeiten[1]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[1];
	Boxen.Box3In.IntervallbetriebZeiten[2]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[2];
	Boxen.Box3In.IntervallbetriebZeiten[3]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[3];
	Boxen.Box3In.IntervallbetriebZeiten[4]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[4];
	Boxen.Box3In.IntervallbetriebZeiten[5]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[5];
	Boxen.Box3In.IntervallbetriebZeiten[6]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[6];
	Boxen.Box3In.IntervallbetriebZeiten[7]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[7];
	Boxen.Box3In.IntervallbetriebZeiten[8]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[8];
	Boxen.Box3In.IntervallbetriebZeiten[9]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[9];
	Boxen.Box3In.IntervallbetriebZeiten[10]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[10];
	Boxen.Box3In.IntervallbetriebZeiten[11]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[11];
	Boxen.Box3In.IntervallbetriebZeiten[12]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[12];
	Boxen.Box3In.IntervallbetriebZeiten[13]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[13];
	Boxen.Box3In.IntervallbetriebZeiten[14]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[14];
	Boxen.Box3In.IntervallbetriebZeiten[15]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[15];
	Boxen.Box3In.IntervallbetriebZeiten[16]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[16];
	Boxen.Box3In.IntervallbetriebZeiten[17]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[17];
	Boxen.Box3In.IntervallbetriebZeiten[18]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[18];
	Boxen.Box3In.IntervallbetriebZeiten[19]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[19];
	Boxen.Box3In.IntervallbetriebZeiten[20]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[20];
	Boxen.Box3In.IntervallbetriebZeiten[21]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[21];
	Boxen.Box3In.IntervallbetriebZeiten[22]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[22];
	Boxen.Box3In.IntervallbetriebZeiten[23]	:= Betriebsparameter.Boxen[3].IntervallbetriebZeiten[23];

	Boxen.Box3In.NachtrocknungZeiten[0]		:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[0];
	Boxen.Box3In.NachtrocknungZeiten[1]		:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[1];
	Boxen.Box3In.NachtrocknungZeiten[2]		:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[2];
	Boxen.Box3In.NachtrocknungZeiten[3]		:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[3];
	Boxen.Box3In.NachtrocknungZeiten[4]		:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[4];
	Boxen.Box3In.NachtrocknungZeiten[5]		:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[5];
	Boxen.Box3In.NachtrocknungZeiten[6]		:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[6];
	Boxen.Box3In.NachtrocknungZeiten[7]		:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[7];
	Boxen.Box3In.NachtrocknungZeiten[8]		:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[8];
	Boxen.Box3In.NachtrocknungZeiten[9]		:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[9];
	Boxen.Box3In.NachtrocknungZeiten[10]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[10];
	Boxen.Box3In.NachtrocknungZeiten[11]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[11];
	Boxen.Box3In.NachtrocknungZeiten[12]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[12];
	Boxen.Box3In.NachtrocknungZeiten[13]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[13];
	Boxen.Box3In.NachtrocknungZeiten[14]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[14];
	Boxen.Box3In.NachtrocknungZeiten[15]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[15];
	Boxen.Box3In.NachtrocknungZeiten[16]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[16];
	Boxen.Box3In.NachtrocknungZeiten[17]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[17];
	Boxen.Box3In.NachtrocknungZeiten[18]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[18];
	Boxen.Box3In.NachtrocknungZeiten[19]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[19];
	Boxen.Box3In.NachtrocknungZeiten[20]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[20];
	Boxen.Box3In.NachtrocknungZeiten[21]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[21];
	Boxen.Box3In.NachtrocknungZeiten[22]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[22];
	Boxen.Box3In.NachtrocknungZeiten[23]	:= Betriebsparameter.Boxen[3].NachtrocknungZeiten[23];
	
	//Eingänge Klappenstellungen
	Boxen.Box3In.StellungKlappe1		:= Betriebsparameter.Boxen[3].StellungKlappe1;
	Boxen.Box3In.StellungKlappe2		:= Betriebsparameter.Boxen[3].StellungKlappe2;
	Boxen.Box3In.StellungKlappe3		:= Betriebsparameter.Boxen[3].StellungKlappe3;
	Boxen.Box3In.StellungKlappe4		:= Betriebsparameter.Boxen[3].StellungKlappe4;
	Boxen.Box3In.StellungKlappe5		:= Betriebsparameter.Boxen[3].StellungKlappe5;
	Boxen.Box3In.StellungKlappe6		:= Betriebsparameter.Boxen[3].StellungKlappe6;
	
	//Eingänge zuständige Aktoren
	Boxen.Box3In.Ventilator1			:= Betriebsparameter.Boxen[3].Ventilator1 AND Betriebsparameter.Ausstattung.Ventilator1;
	Boxen.Box3In.Ventilator2			:= Betriebsparameter.Boxen[3].Ventilator2 AND Betriebsparameter.Ausstattung.Ventilator2;
	Boxen.Box3In.Luftentfeuchter		:= Betriebsparameter.Boxen[3].Luftentfeuchter AND (Betriebsparameter.Ausstattung.Entfeuchter OR Betriebsparameter.Ausstattung.EntfeuchterFremd);
	Boxen.Box3In.Warmluftofen			:= Betriebsparameter.Boxen[3].Warmluftofen AND Betriebsparameter.Ausstattung.Warmluftofen;
	Boxen.Box3In.Heizregister			:= Betriebsparameter.Boxen[3].Heizregister AND Betriebsparameter.Ausstattung.Heizregister;
	Boxen.Box3In.Scheitholzofen			:= Betriebsparameter.Boxen[3].Scheitholzofen AND Betriebsparameter.Ausstattung.Scheitholzofen;


	//Box 4 **********************************************************************************************************************************************************************************
	
	//Eingänge Betriebsarten
	Boxen.Box4In.DauerbetriebEin			:= Betriebsparameter.Boxen[4].DauerbetriebEin;
	Boxen.Box4In.IntervallbetriebEin		:= Betriebsparameter.Boxen[4].IntervallbetriebEin;
	Boxen.Box4In.NachtrocknungEin			:= Betriebsparameter.Boxen[4].NachtrocknungEin;
	
	//Eingänge Schlechtwetterbetrieb
	Boxen.Box4In.WetterIstSchlecht			:= fbSchlechtwetterBox4.WetterIstSchlecht;
	Boxen.Box4In.LuftaufbIstVerfuegbar		:= (Boxen.Box4In.Heizregister AND NOT Betriebsparameter.Heizregister.Aus) OR
	(Boxen.Box4In.Luftentfeuchter AND NOT Betriebsparameter.Entfeuchter.Aus AND NOT gCmdAnlage.FehlerModul1 AND NOT gCmdAnlage.FehlerModul2) OR
	(Boxen.Box4In.Scheitholzofen AND diScheitholzofenInBetrieb) OR (Boxen.Box4In.Warmluftofen AND NOT Betriebsparameter.Warmluftofen.Aus AND NOT 
	alarmFehler[FEHLER_BETRIEBSMLDG_WARMLUFTOFEN]);
	Boxen.Box4In.SchlechtwetterPulszeit		:= fbSchlechtwetterBox4.SchlechtwetterPulszeit;
	Boxen.Box4In.SchlechtwetterPausezeit	:= fbSchlechtwetterBox4.SchlechtwetterPausezeit;
	
	Boxen.Box4In.IntervallbetriebZeiten[0]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[0];
	Boxen.Box4In.IntervallbetriebZeiten[1]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[1];
	Boxen.Box4In.IntervallbetriebZeiten[2]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[2];
	Boxen.Box4In.IntervallbetriebZeiten[3]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[3];
	Boxen.Box4In.IntervallbetriebZeiten[4]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[4];
	Boxen.Box4In.IntervallbetriebZeiten[5]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[5];
	Boxen.Box4In.IntervallbetriebZeiten[6]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[6];
	Boxen.Box4In.IntervallbetriebZeiten[7]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[7];
	Boxen.Box4In.IntervallbetriebZeiten[8]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[8];
	Boxen.Box4In.IntervallbetriebZeiten[9]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[9];
	Boxen.Box4In.IntervallbetriebZeiten[10]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[10];
	Boxen.Box4In.IntervallbetriebZeiten[11]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[11];
	Boxen.Box4In.IntervallbetriebZeiten[12]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[12];
	Boxen.Box4In.IntervallbetriebZeiten[13]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[13];
	Boxen.Box4In.IntervallbetriebZeiten[14]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[14];
	Boxen.Box4In.IntervallbetriebZeiten[15]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[15];
	Boxen.Box4In.IntervallbetriebZeiten[16]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[16];
	Boxen.Box4In.IntervallbetriebZeiten[17]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[17];
	Boxen.Box4In.IntervallbetriebZeiten[18]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[18];
	Boxen.Box4In.IntervallbetriebZeiten[19]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[19];
	Boxen.Box4In.IntervallbetriebZeiten[20]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[20];
	Boxen.Box4In.IntervallbetriebZeiten[21]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[21];
	Boxen.Box4In.IntervallbetriebZeiten[22]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[22];
	Boxen.Box4In.IntervallbetriebZeiten[23]	:= Betriebsparameter.Boxen[4].IntervallbetriebZeiten[23];

	Boxen.Box4In.NachtrocknungZeiten[0]		:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[0];
	Boxen.Box4In.NachtrocknungZeiten[1]		:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[1];
	Boxen.Box4In.NachtrocknungZeiten[2]		:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[2];
	Boxen.Box4In.NachtrocknungZeiten[3]		:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[3];
	Boxen.Box4In.NachtrocknungZeiten[4]		:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[4];
	Boxen.Box4In.NachtrocknungZeiten[5]		:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[5];
	Boxen.Box4In.NachtrocknungZeiten[6]		:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[6];
	Boxen.Box4In.NachtrocknungZeiten[7]		:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[7];
	Boxen.Box4In.NachtrocknungZeiten[8]		:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[8];
	Boxen.Box4In.NachtrocknungZeiten[9]		:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[9];
	Boxen.Box4In.NachtrocknungZeiten[10]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[10];
	Boxen.Box4In.NachtrocknungZeiten[11]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[11];
	Boxen.Box4In.NachtrocknungZeiten[12]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[12];
	Boxen.Box4In.NachtrocknungZeiten[13]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[13];
	Boxen.Box4In.NachtrocknungZeiten[14]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[14];
	Boxen.Box4In.NachtrocknungZeiten[15]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[15];
	Boxen.Box4In.NachtrocknungZeiten[16]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[16];
	Boxen.Box4In.NachtrocknungZeiten[17]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[17];
	Boxen.Box4In.NachtrocknungZeiten[18]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[18];
	Boxen.Box4In.NachtrocknungZeiten[19]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[19];
	Boxen.Box4In.NachtrocknungZeiten[20]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[20];
	Boxen.Box4In.NachtrocknungZeiten[21]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[21];
	Boxen.Box4In.NachtrocknungZeiten[22]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[22];
	Boxen.Box4In.NachtrocknungZeiten[23]	:= Betriebsparameter.Boxen[4].NachtrocknungZeiten[23];
	
	
	//Eingänge Klappenstellungen
	Boxen.Box4In.StellungKlappe1		:= Betriebsparameter.Boxen[4].StellungKlappe1;
	Boxen.Box4In.StellungKlappe2		:= Betriebsparameter.Boxen[4].StellungKlappe2;
	Boxen.Box4In.StellungKlappe3		:= Betriebsparameter.Boxen[4].StellungKlappe3;
	Boxen.Box4In.StellungKlappe4		:= Betriebsparameter.Boxen[4].StellungKlappe4;
	Boxen.Box4In.StellungKlappe5		:= Betriebsparameter.Boxen[4].StellungKlappe5;
	Boxen.Box4In.StellungKlappe6		:= Betriebsparameter.Boxen[4].StellungKlappe6;
	
	//Eingänge zuständige Aktoren
	Boxen.Box4In.Ventilator1			:= Betriebsparameter.Boxen[4].Ventilator1 AND Betriebsparameter.Ausstattung.Ventilator1;
	Boxen.Box4In.Ventilator2			:= Betriebsparameter.Boxen[4].Ventilator2 AND Betriebsparameter.Ausstattung.Ventilator2;
	Boxen.Box4In.Luftentfeuchter		:= Betriebsparameter.Boxen[4].Luftentfeuchter AND (Betriebsparameter.Ausstattung.Entfeuchter OR Betriebsparameter.Ausstattung.EntfeuchterFremd);
	Boxen.Box4In.Warmluftofen			:= Betriebsparameter.Boxen[4].Warmluftofen AND Betriebsparameter.Ausstattung.Warmluftofen;
	Boxen.Box4In.Heizregister			:= Betriebsparameter.Boxen[4].Heizregister AND Betriebsparameter.Ausstattung.Heizregister;
	Boxen.Box4In.Scheitholzofen			:= Betriebsparameter.Boxen[4].Scheitholzofen AND Betriebsparameter.Ausstattung.Scheitholzofen;

	
	//Box 5 **********************************************************************************************************************************************************************************
	
	//Eingänge Betriebsarten
	Boxen.Box5In.DauerbetriebEin			:= Betriebsparameter.Boxen[5].DauerbetriebEin;
	Boxen.Box5In.IntervallbetriebEin		:= Betriebsparameter.Boxen[5].IntervallbetriebEin;
	Boxen.Box5In.NachtrocknungEin			:= Betriebsparameter.Boxen[5].NachtrocknungEin;
	
	//Eingänge Schlechtwetterbetrieb
	Boxen.Box5In.WetterIstSchlecht			:= fbSchlechtwetterBox5.WetterIstSchlecht;
	Boxen.Box5In.LuftaufbIstVerfuegbar		:= (Boxen.Box5In.Heizregister AND NOT Betriebsparameter.Heizregister.Aus) OR
	(Boxen.Box5In.Luftentfeuchter AND NOT Betriebsparameter.Entfeuchter.Aus AND NOT gCmdAnlage.FehlerModul1 AND NOT gCmdAnlage.FehlerModul2) OR
	(Boxen.Box5In.Scheitholzofen AND diScheitholzofenInBetrieb) OR (Boxen.Box5In.Warmluftofen AND NOT Betriebsparameter.Warmluftofen.Aus AND NOT 
	alarmFehler[FEHLER_BETRIEBSMLDG_WARMLUFTOFEN]);
	Boxen.Box5In.SchlechtwetterPulszeit		:= fbSchlechtwetterBox5.SchlechtwetterPulszeit;
	Boxen.Box5In.SchlechtwetterPausezeit	:= fbSchlechtwetterBox5.SchlechtwetterPausezeit;
	
	Boxen.Box5In.IntervallbetriebZeiten[0]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[0];
	Boxen.Box5In.IntervallbetriebZeiten[1]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[1];
	Boxen.Box5In.IntervallbetriebZeiten[2]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[2];
	Boxen.Box5In.IntervallbetriebZeiten[3]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[3];
	Boxen.Box5In.IntervallbetriebZeiten[4]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[4];
	Boxen.Box5In.IntervallbetriebZeiten[5]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[5];
	Boxen.Box5In.IntervallbetriebZeiten[6]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[6];
	Boxen.Box5In.IntervallbetriebZeiten[7]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[7];
	Boxen.Box5In.IntervallbetriebZeiten[8]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[8];
	Boxen.Box5In.IntervallbetriebZeiten[9]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[9];
	Boxen.Box5In.IntervallbetriebZeiten[10]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[10];
	Boxen.Box5In.IntervallbetriebZeiten[11]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[11];
	Boxen.Box5In.IntervallbetriebZeiten[12]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[12];
	Boxen.Box5In.IntervallbetriebZeiten[13]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[13];
	Boxen.Box5In.IntervallbetriebZeiten[14]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[14];
	Boxen.Box5In.IntervallbetriebZeiten[15]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[15];
	Boxen.Box5In.IntervallbetriebZeiten[16]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[16];
	Boxen.Box5In.IntervallbetriebZeiten[17]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[17];
	Boxen.Box5In.IntervallbetriebZeiten[18]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[18];
	Boxen.Box5In.IntervallbetriebZeiten[19]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[19];
	Boxen.Box5In.IntervallbetriebZeiten[20]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[20];
	Boxen.Box5In.IntervallbetriebZeiten[21]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[21];
	Boxen.Box5In.IntervallbetriebZeiten[22]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[22];
	Boxen.Box5In.IntervallbetriebZeiten[23]	:= Betriebsparameter.Boxen[5].IntervallbetriebZeiten[23];

	Boxen.Box5In.NachtrocknungZeiten[0]		:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[0];
	Boxen.Box5In.NachtrocknungZeiten[1]		:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[1];
	Boxen.Box5In.NachtrocknungZeiten[2]		:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[2];
	Boxen.Box5In.NachtrocknungZeiten[3]		:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[3];
	Boxen.Box5In.NachtrocknungZeiten[4]		:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[4];
	Boxen.Box5In.NachtrocknungZeiten[5]		:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[5];
	Boxen.Box5In.NachtrocknungZeiten[6]		:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[6];
	Boxen.Box5In.NachtrocknungZeiten[7]		:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[7];
	Boxen.Box5In.NachtrocknungZeiten[8]		:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[8];
	Boxen.Box5In.NachtrocknungZeiten[9]		:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[9];
	Boxen.Box5In.NachtrocknungZeiten[10]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[10];
	Boxen.Box5In.NachtrocknungZeiten[11]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[11];
	Boxen.Box5In.NachtrocknungZeiten[12]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[12];
	Boxen.Box5In.NachtrocknungZeiten[13]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[13];
	Boxen.Box5In.NachtrocknungZeiten[14]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[14];
	Boxen.Box5In.NachtrocknungZeiten[15]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[15];
	Boxen.Box5In.NachtrocknungZeiten[16]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[16];
	Boxen.Box5In.NachtrocknungZeiten[17]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[17];
	Boxen.Box5In.NachtrocknungZeiten[18]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[18];
	Boxen.Box5In.NachtrocknungZeiten[19]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[19];
	Boxen.Box5In.NachtrocknungZeiten[20]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[20];
	Boxen.Box5In.NachtrocknungZeiten[21]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[21];
	Boxen.Box5In.NachtrocknungZeiten[22]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[22];
	Boxen.Box5In.NachtrocknungZeiten[23]	:= Betriebsparameter.Boxen[5].NachtrocknungZeiten[23];
	
	//Eingänge Klappenstellungen
	Boxen.Box5In.StellungKlappe1		:= Betriebsparameter.Boxen[5].StellungKlappe1;
	Boxen.Box5In.StellungKlappe2		:= Betriebsparameter.Boxen[5].StellungKlappe2;
	Boxen.Box5In.StellungKlappe3		:= Betriebsparameter.Boxen[5].StellungKlappe3;
	Boxen.Box5In.StellungKlappe4		:= Betriebsparameter.Boxen[5].StellungKlappe4;
	Boxen.Box5In.StellungKlappe5		:= Betriebsparameter.Boxen[5].StellungKlappe5;
	Boxen.Box5In.StellungKlappe6		:= Betriebsparameter.Boxen[5].StellungKlappe6;
	
	//Eingänge zuständige Aktoren
	Boxen.Box5In.Ventilator1			:= Betriebsparameter.Boxen[5].Ventilator1 AND Betriebsparameter.Ausstattung.Ventilator1;
	Boxen.Box5In.Ventilator2			:= Betriebsparameter.Boxen[5].Ventilator2 AND Betriebsparameter.Ausstattung.Ventilator2;
	Boxen.Box5In.Luftentfeuchter		:= Betriebsparameter.Boxen[5].Luftentfeuchter AND (Betriebsparameter.Ausstattung.Entfeuchter OR Betriebsparameter.Ausstattung.EntfeuchterFremd);
	Boxen.Box5In.Warmluftofen			:= Betriebsparameter.Boxen[5].Warmluftofen AND Betriebsparameter.Ausstattung.Warmluftofen;
	Boxen.Box5In.Heizregister			:= Betriebsparameter.Boxen[5].Heizregister AND Betriebsparameter.Ausstattung.Heizregister;
	Boxen.Box5In.Scheitholzofen			:= Betriebsparameter.Boxen[5].Scheitholzofen AND Betriebsparameter.Ausstattung.Scheitholzofen;


	//Box 6 **********************************************************************************************************************************************************************************
	
	//Eingänge Betriebsarten
	Boxen.Box6In.DauerbetriebEin			:= Betriebsparameter.Boxen[6].DauerbetriebEin;
	Boxen.Box6In.IntervallbetriebEin		:= Betriebsparameter.Boxen[6].IntervallbetriebEin;
	Boxen.Box6In.NachtrocknungEin			:= Betriebsparameter.Boxen[6].NachtrocknungEin;
	
	//Eingänge Schlechtwetterbetrieb
	Boxen.Box6In.WetterIstSchlecht			:= fbSchlechtwetterBox6.WetterIstSchlecht;
	Boxen.Box6In.LuftaufbIstVerfuegbar		:= (Boxen.Box6In.Heizregister AND NOT Betriebsparameter.Heizregister.Aus) OR
	(Boxen.Box6In.Luftentfeuchter AND NOT Betriebsparameter.Entfeuchter.Aus AND NOT gCmdAnlage.FehlerModul1 AND NOT gCmdAnlage.FehlerModul2) OR
	(Boxen.Box6In.Scheitholzofen AND diScheitholzofenInBetrieb) OR (Boxen.Box6In.Warmluftofen AND NOT Betriebsparameter.Warmluftofen.Aus AND NOT 
	alarmFehler[FEHLER_BETRIEBSMLDG_WARMLUFTOFEN]);
	Boxen.Box6In.SchlechtwetterPulszeit		:= fbSchlechtwetterBox6.SchlechtwetterPulszeit;
	Boxen.Box6In.SchlechtwetterPausezeit	:= fbSchlechtwetterBox6.SchlechtwetterPausezeit;
	
	Boxen.Box6In.IntervallbetriebZeiten[0]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[0];
	Boxen.Box6In.IntervallbetriebZeiten[1]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[1];
	Boxen.Box6In.IntervallbetriebZeiten[2]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[2];
	Boxen.Box6In.IntervallbetriebZeiten[3]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[3];
	Boxen.Box6In.IntervallbetriebZeiten[4]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[4];
	Boxen.Box6In.IntervallbetriebZeiten[5]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[5];
	Boxen.Box6In.IntervallbetriebZeiten[6]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[6];
	Boxen.Box6In.IntervallbetriebZeiten[7]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[7];
	Boxen.Box6In.IntervallbetriebZeiten[8]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[8];
	Boxen.Box6In.IntervallbetriebZeiten[9]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[9];
	Boxen.Box6In.IntervallbetriebZeiten[10]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[10];
	Boxen.Box6In.IntervallbetriebZeiten[11]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[11];
	Boxen.Box6In.IntervallbetriebZeiten[12]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[12];
	Boxen.Box6In.IntervallbetriebZeiten[13]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[13];
	Boxen.Box6In.IntervallbetriebZeiten[14]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[14];
	Boxen.Box6In.IntervallbetriebZeiten[15]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[15];
	Boxen.Box6In.IntervallbetriebZeiten[16]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[16];
	Boxen.Box6In.IntervallbetriebZeiten[17]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[17];
	Boxen.Box6In.IntervallbetriebZeiten[18]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[18];
	Boxen.Box6In.IntervallbetriebZeiten[19]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[19];
	Boxen.Box6In.IntervallbetriebZeiten[20]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[20];
	Boxen.Box6In.IntervallbetriebZeiten[21]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[21];
	Boxen.Box6In.IntervallbetriebZeiten[22]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[22];
	Boxen.Box6In.IntervallbetriebZeiten[23]	:= Betriebsparameter.Boxen[6].IntervallbetriebZeiten[23];

	Boxen.Box6In.NachtrocknungZeiten[0]		:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[0];
	Boxen.Box6In.NachtrocknungZeiten[1]		:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[1];
	Boxen.Box6In.NachtrocknungZeiten[2]		:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[2];
	Boxen.Box6In.NachtrocknungZeiten[3]		:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[3];
	Boxen.Box6In.NachtrocknungZeiten[4]		:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[4];
	Boxen.Box6In.NachtrocknungZeiten[5]		:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[5];
	Boxen.Box6In.NachtrocknungZeiten[6]		:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[6];
	Boxen.Box6In.NachtrocknungZeiten[7]		:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[7];
	Boxen.Box6In.NachtrocknungZeiten[8]		:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[8];
	Boxen.Box6In.NachtrocknungZeiten[9]		:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[9];
	Boxen.Box6In.NachtrocknungZeiten[10]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[10];
	Boxen.Box6In.NachtrocknungZeiten[11]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[11];
	Boxen.Box6In.NachtrocknungZeiten[12]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[12];
	Boxen.Box6In.NachtrocknungZeiten[13]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[13];
	Boxen.Box6In.NachtrocknungZeiten[14]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[14];
	Boxen.Box6In.NachtrocknungZeiten[15]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[15];
	Boxen.Box6In.NachtrocknungZeiten[16]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[16];
	Boxen.Box6In.NachtrocknungZeiten[17]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[17];
	Boxen.Box6In.NachtrocknungZeiten[18]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[18];
	Boxen.Box6In.NachtrocknungZeiten[19]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[19];
	Boxen.Box6In.NachtrocknungZeiten[20]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[20];
	Boxen.Box6In.NachtrocknungZeiten[21]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[21];
	Boxen.Box6In.NachtrocknungZeiten[22]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[22];
	Boxen.Box6In.NachtrocknungZeiten[23]	:= Betriebsparameter.Boxen[6].NachtrocknungZeiten[23];
	
	//Eingänge Klappenstellungen
	Boxen.Box6In.StellungKlappe1		:= Betriebsparameter.Boxen[6].StellungKlappe1;
	Boxen.Box6In.StellungKlappe2		:= Betriebsparameter.Boxen[6].StellungKlappe2;
	Boxen.Box6In.StellungKlappe3		:= Betriebsparameter.Boxen[6].StellungKlappe3;
	Boxen.Box6In.StellungKlappe4		:= Betriebsparameter.Boxen[6].StellungKlappe4;
	Boxen.Box6In.StellungKlappe5		:= Betriebsparameter.Boxen[6].StellungKlappe5;
	Boxen.Box6In.StellungKlappe6		:= Betriebsparameter.Boxen[6].StellungKlappe6;
	
	//Eingänge zuständige Aktoren
	Boxen.Box6In.Ventilator1			:= Betriebsparameter.Boxen[6].Ventilator1 AND Betriebsparameter.Ausstattung.Ventilator1;
	Boxen.Box6In.Ventilator2			:= Betriebsparameter.Boxen[6].Ventilator2 AND Betriebsparameter.Ausstattung.Ventilator2;
	Boxen.Box6In.Luftentfeuchter		:= Betriebsparameter.Boxen[6].Luftentfeuchter AND (Betriebsparameter.Ausstattung.Entfeuchter OR Betriebsparameter.Ausstattung.EntfeuchterFremd);
	Boxen.Box6In.Warmluftofen			:= Betriebsparameter.Boxen[6].Warmluftofen AND Betriebsparameter.Ausstattung.Warmluftofen;
	Boxen.Box6In.Heizregister			:= Betriebsparameter.Boxen[6].Heizregister AND Betriebsparameter.Ausstattung.Heizregister;
	Boxen.Box6In.Scheitholzofen			:= Betriebsparameter.Boxen[6].Scheitholzofen AND Betriebsparameter.Ausstattung.Scheitholzofen;
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

