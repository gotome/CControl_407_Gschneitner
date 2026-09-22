
	

PROGRAM _CYCLIC



	
	//====================================================================================================================================================
	//Berechnungen aus Fühlerwerten
	//====================================================================================================================================================

	//Berechnungen Frischluftsensor
	//*****************************
	Frischluftsensor.Freigabe							:= Betriebsparameter.Ausstattung.SensorFrischluft AND NOT alarmFehler[FEHLER_SENSOR_FRISCHLUFT];
	Frischluftsensor.LuftTemperatur						:= aiFrischluftTemperatur;
	Frischluftsensor.LuftRelFeuchte						:= aiFrischluftFeuchte;
	Frischluftsensor.MeterUeberAdria					:= Betriebsparameter.Allgemein.StandortHoehe;
	Frischluftsensor();
	
	gStatusAnlage.Berechnungen.FrischluftSattDefizit	:= Frischluftsensor.LuftSaettigungsdefizit;				
	
	
	//Berechnungen Trockenluftsensor
	//******************************
	Trockenluftsensor.Freigabe							:= Betriebsparameter.Ausstattung.SensorTrockenluft AND NOT alarmFehler[FEHLER_SENSOR_TROCKENLUFT];
	Trockenluftsensor.LuftTemperatur					:= aiTrockenluftTemperatur;
	Trockenluftsensor.LuftRelFeuchte					:= aiTrockenluftFeuchte;
	Trockenluftsensor.MeterUeberAdria					:= Betriebsparameter.Allgemein.StandortHoehe;
	Trockenluftsensor();
	
	gStatusAnlage.Berechnungen.TrockenluftSattDefizit	:= Trockenluftsensor.LuftSaettigungsdefizit;
	
	
	//Berechnungen Dachluftsensor
	//******************************
	Dachluftsensor.Freigabe							:= Betriebsparameter.Ausstattung.SensorDachluft AND NOT alarmFehler[FEHLER_SENSOR_DACHLUFT];
	Dachluftsensor.LuftTemperatur					:= aiDachluftTemperatur;
	Dachluftsensor.LuftRelFeuchte					:= aiDachluftFeuchte;
	Dachluftsensor.MeterUeberAdria					:= Betriebsparameter.Allgemein.StandortHoehe;
	Dachluftsensor();
	
	gStatusAnlage.Berechnungen.DachluftSattDefizit	:= Dachluftsensor.LuftSaettigungsdefizit;
	
	
	//Berechnungen Abluftsensor
	//************************
	Abluftsensor.Freigabe							:= Betriebsparameter.Ausstattung.SensorAbluft AND NOT alarmFehler[FEHLER_SENSOR_ABLUFT]; 
	Abluftsensor.LuftTemperatur						:= aiAbluftTemperatur;
	Abluftsensor.LuftRelFeuchte						:= aiAbluftFeuchte;
	Abluftsensor.MeterUeberAdria					:= Betriebsparameter.Allgemein.StandortHoehe;
	Abluftsensor();
	
	gStatusAnlage.Berechnungen.AbluftSattDefizit	:= Abluftsensor.LuftSaettigungsdefizit;
		

	//Berechnungen Drucksensor
	//************************
	Drucksensor.Freigabe						:= (doVentilator1Ein OR doVentilator2Ein) AND Betriebsparameter.Ausstattung.SensorKanaldruck AND NOT alarmFehler[FEHLER_SENSOR_KANALDRUCK];
	Drucksensor.TrockenluftDruck				:= aiDifferenzdruck;
	Drucksensor();
		
	IF doVentilator1Ein OR doVentilator2Ein THEN
		gStatusAnlage.Berechnungen.Kanaldruck_mmWs	:= Drucksensor.LuftDruck_mmWS;
	ELSE
		gStatusAnlage.Berechnungen.Kanaldruck_mmWs	:= 0.0;
	END_IF

	
	
	//====================================================================================================================================================
	//Bestimmung der Witterungsverhältnisse 
	//====================================================================================================================================================
	
	//Variable "Wetter is Schlecht" generieren, wenn eine der eingeschalteten Boxen schlechte Witterung ausgibt
	gStatusAnlage.WetterIstSchlecht := (Boxen.Box1In.WetterIstSchlecht AND Boxen.Box1Out.BoxBereit) OR (Boxen.Box2In.WetterIstSchlecht AND Boxen.Box2Out.BoxBereit) OR
	(Boxen.Box3In.WetterIstSchlecht AND Boxen.Box3Out.BoxBereit) OR (Boxen.Box4In.WetterIstSchlecht AND Boxen.Box4Out.BoxBereit) OR 
	(Boxen.Box5In.WetterIstSchlecht AND Boxen.Box5Out.BoxBereit) OR (Boxen.Box6In.WetterIstSchlecht AND Boxen.Box6Out.BoxBereit);
	
	//Box 1	**********************************************************************************************************************************************
	fbSchlechtwetterBox1.Freigabe						:= TRUE;
	fbSchlechtwetterBox1.AuswahlSensor					:= Betriebsparameter.SchlechtwetterBoxen[1].AuswahlSensorGrenzwert;
	fbSchlechtwetterBox1.FrischluftSaettigungsdefizit	:= gStatusAnlage.Berechnungen.FrischluftSattDefizit;
	fbSchlechtwetterBox1.DachluftSaettigungsdefizit		:= gStatusAnlage.Berechnungen.DachluftSattDefizit;
	fbSchlechtwetterBox1.TrockenluftSaettigungsdefizit	:= gStatusAnlage.Berechnungen.TrockenluftSattDefizit;
	fbSchlechtwetterBox1.SensorFrischluftVhd			:= Betriebsparameter.Ausstattung.SensorFrischluft AND NOT alarmFehler[FEHLER_SENSOR_FRISCHLUFT];
	fbSchlechtwetterBox1.SensorDachluftVhd				:= Betriebsparameter.Ausstattung.SensorDachluft AND NOT alarmFehler[FEHLER_SENSOR_DACHLUFT];
	fbSchlechtwetterBox1.SensorTrockenluftVhd			:= Betriebsparameter.Ausstattung.SensorTrockenluft AND NOT alarmFehler[FEHLER_SENSOR_TROCKENLUFT];
	fbSchlechtwetterBox1.VerzWetterwechsel				:= Betriebsparameter.Schrittkette.VerzWetterwechsel;
	
	fbSchlechtwetterBox1.MaterialfeuchteStufe[1]		:= Betriebsparameter.SchlechtwetterBoxen[1].Stufe[1].MaterialfeuchteStufe;
	fbSchlechtwetterBox1.MaterialfeuchteStufe[2]		:= Betriebsparameter.SchlechtwetterBoxen[1].Stufe[2].MaterialfeuchteStufe;
	fbSchlechtwetterBox1.MaterialfeuchteStufe[3]		:= Betriebsparameter.SchlechtwetterBoxen[1].Stufe[3].MaterialfeuchteStufe;
	fbSchlechtwetterBox1.MaterialfeuchteStufe[4]		:= Betriebsparameter.SchlechtwetterBoxen[1].Stufe[4].MaterialfeuchteStufe;
	fbSchlechtwetterBox1.MaterialfeuchteStufe[5]		:= Betriebsparameter.SchlechtwetterBoxen[1].Stufe[5].MaterialfeuchteStufe;
	fbSchlechtwetterBox1.MaterialfeuchteStufe[6]		:= Betriebsparameter.SchlechtwetterBoxen[1].Stufe[6].MaterialfeuchteStufe;
	
	fbSchlechtwetterBox1.GrenzwertStufeAktuell			:= Betriebsparameter.SchlechtwetterBoxen[1].Stufe[fbSchlechtwetterBox1.StufeAktuell].Saettigungsdefizit;
	fbSchlechtwetterBox1.HystereseGrenzwert				:= Betriebsparameter.SchlechtwetterBoxen[1].HystereseGrenzwert;
	fbSchlechtwetterBox1.MaterialfeuchteIst				:= Betriebsparameter.SchlechtwetterBoxen[1].MaterialfeuchteIst;
	
	fbSchlechtwetterBox1.SchlechtwetterPausezeitStufe[fbSchlechtwetterBox1.StufeAktuell] := 
	Betriebsparameter.SchlechtwetterBoxen[1].Stufe[fbSchlechtwetterBox1.StufeAktuell].SchlechtwetterZeitPause;
	fbSchlechtwetterBox1.SchlechtwetterPulszeitStufe[fbSchlechtwetterBox1.StufeAktuell] := 
	Betriebsparameter.SchlechtwetterBoxen[1].Stufe[fbSchlechtwetterBox1.StufeAktuell].SchlechtwetterZeitLauf;
	
	
	//Box 2	**********************************************************************************************************************************************
	fbSchlechtwetterBox2.Freigabe						:= TRUE;
	fbSchlechtwetterBox2.AuswahlSensor					:= Betriebsparameter.SchlechtwetterBoxen[2].AuswahlSensorGrenzwert;
	fbSchlechtwetterBox2.FrischluftSaettigungsdefizit	:= gStatusAnlage.Berechnungen.FrischluftSattDefizit;
	fbSchlechtwetterBox2.DachluftSaettigungsdefizit		:= gStatusAnlage.Berechnungen.DachluftSattDefizit;
	fbSchlechtwetterBox2.TrockenluftSaettigungsdefizit	:= gStatusAnlage.Berechnungen.TrockenluftSattDefizit;
	fbSchlechtwetterBox2.SensorFrischluftVhd			:= Betriebsparameter.Ausstattung.SensorFrischluft AND NOT alarmFehler[FEHLER_SENSOR_FRISCHLUFT];
	fbSchlechtwetterBox2.SensorDachluftVhd				:= Betriebsparameter.Ausstattung.SensorDachluft AND NOT alarmFehler[FEHLER_SENSOR_DACHLUFT];
	fbSchlechtwetterBox2.SensorTrockenluftVhd			:= Betriebsparameter.Ausstattung.SensorTrockenluft AND NOT alarmFehler[FEHLER_SENSOR_TROCKENLUFT];
	fbSchlechtwetterBox2.VerzWetterwechsel				:= Betriebsparameter.Schrittkette.VerzWetterwechsel;
	
	fbSchlechtwetterBox2.MaterialfeuchteStufe[1]		:= Betriebsparameter.SchlechtwetterBoxen[2].Stufe[1].MaterialfeuchteStufe;
	fbSchlechtwetterBox2.MaterialfeuchteStufe[2]		:= Betriebsparameter.SchlechtwetterBoxen[2].Stufe[2].MaterialfeuchteStufe;
	fbSchlechtwetterBox2.MaterialfeuchteStufe[3]		:= Betriebsparameter.SchlechtwetterBoxen[2].Stufe[3].MaterialfeuchteStufe;
	fbSchlechtwetterBox2.MaterialfeuchteStufe[4]		:= Betriebsparameter.SchlechtwetterBoxen[2].Stufe[4].MaterialfeuchteStufe;
	fbSchlechtwetterBox2.MaterialfeuchteStufe[5]		:= Betriebsparameter.SchlechtwetterBoxen[2].Stufe[5].MaterialfeuchteStufe;
	fbSchlechtwetterBox2.MaterialfeuchteStufe[6]		:= Betriebsparameter.SchlechtwetterBoxen[2].Stufe[6].MaterialfeuchteStufe;
	
	fbSchlechtwetterBox2.GrenzwertStufeAktuell			:= Betriebsparameter.SchlechtwetterBoxen[2].Stufe[fbSchlechtwetterBox2.StufeAktuell].Saettigungsdefizit;
	fbSchlechtwetterBox2.HystereseGrenzwert				:= Betriebsparameter.SchlechtwetterBoxen[1].HystereseGrenzwert; //Gleiche Hysterese für alle Boxen
	fbSchlechtwetterBox2.MaterialfeuchteIst				:= Betriebsparameter.SchlechtwetterBoxen[2].MaterialfeuchteIst;
	
	fbSchlechtwetterBox2.SchlechtwetterPausezeitStufe[fbSchlechtwetterBox2.StufeAktuell] := 
	Betriebsparameter.SchlechtwetterBoxen[2].Stufe[fbSchlechtwetterBox2.StufeAktuell].SchlechtwetterZeitPause;
	fbSchlechtwetterBox2.SchlechtwetterPulszeitStufe[fbSchlechtwetterBox2.StufeAktuell] := 
	Betriebsparameter.SchlechtwetterBoxen[2].Stufe[fbSchlechtwetterBox2.StufeAktuell].SchlechtwetterZeitLauf;

	
	//Box 3	**********************************************************************************************************************************************
	fbSchlechtwetterBox3.Freigabe						:= TRUE;
	fbSchlechtwetterBox3.AuswahlSensor					:= Betriebsparameter.SchlechtwetterBoxen[3].AuswahlSensorGrenzwert;
	fbSchlechtwetterBox3.FrischluftSaettigungsdefizit	:= gStatusAnlage.Berechnungen.FrischluftSattDefizit;
	fbSchlechtwetterBox3.DachluftSaettigungsdefizit		:= gStatusAnlage.Berechnungen.DachluftSattDefizit;
	fbSchlechtwetterBox3.TrockenluftSaettigungsdefizit	:= gStatusAnlage.Berechnungen.TrockenluftSattDefizit;
	fbSchlechtwetterBox3.SensorFrischluftVhd			:= Betriebsparameter.Ausstattung.SensorFrischluft AND NOT alarmFehler[FEHLER_SENSOR_FRISCHLUFT];
	fbSchlechtwetterBox3.SensorDachluftVhd				:= Betriebsparameter.Ausstattung.SensorDachluft AND NOT alarmFehler[FEHLER_SENSOR_DACHLUFT];
	fbSchlechtwetterBox3.SensorTrockenluftVhd			:= Betriebsparameter.Ausstattung.SensorTrockenluft AND NOT alarmFehler[FEHLER_SENSOR_TROCKENLUFT];
	fbSchlechtwetterBox3.VerzWetterwechsel				:= Betriebsparameter.Schrittkette.VerzWetterwechsel;
	
	fbSchlechtwetterBox3.MaterialfeuchteStufe[1]		:= Betriebsparameter.SchlechtwetterBoxen[3].Stufe[1].MaterialfeuchteStufe;
	fbSchlechtwetterBox3.MaterialfeuchteStufe[2]		:= Betriebsparameter.SchlechtwetterBoxen[3].Stufe[2].MaterialfeuchteStufe;
	fbSchlechtwetterBox3.MaterialfeuchteStufe[3]		:= Betriebsparameter.SchlechtwetterBoxen[3].Stufe[3].MaterialfeuchteStufe;
	fbSchlechtwetterBox3.MaterialfeuchteStufe[4]		:= Betriebsparameter.SchlechtwetterBoxen[3].Stufe[4].MaterialfeuchteStufe;
	fbSchlechtwetterBox3.MaterialfeuchteStufe[5]		:= Betriebsparameter.SchlechtwetterBoxen[3].Stufe[5].MaterialfeuchteStufe;
	fbSchlechtwetterBox3.MaterialfeuchteStufe[6]		:= Betriebsparameter.SchlechtwetterBoxen[3].Stufe[6].MaterialfeuchteStufe;
	
	fbSchlechtwetterBox3.GrenzwertStufeAktuell			:= Betriebsparameter.SchlechtwetterBoxen[3].Stufe[fbSchlechtwetterBox3.StufeAktuell].Saettigungsdefizit;
	fbSchlechtwetterBox3.HystereseGrenzwert				:= Betriebsparameter.SchlechtwetterBoxen[1].HystereseGrenzwert; //Gleiche Hysterese für alle Boxen
	fbSchlechtwetterBox3.MaterialfeuchteIst				:= Betriebsparameter.SchlechtwetterBoxen[3].MaterialfeuchteIst;
	
	fbSchlechtwetterBox3.SchlechtwetterPausezeitStufe[fbSchlechtwetterBox3.StufeAktuell] := 
	Betriebsparameter.SchlechtwetterBoxen[3].Stufe[fbSchlechtwetterBox3.StufeAktuell].SchlechtwetterZeitPause;
	fbSchlechtwetterBox3.SchlechtwetterPulszeitStufe[fbSchlechtwetterBox3.StufeAktuell] := 
	Betriebsparameter.SchlechtwetterBoxen[3].Stufe[fbSchlechtwetterBox3.StufeAktuell].SchlechtwetterZeitLauf;
	
	
	//Box 4	**********************************************************************************************************************************************
	fbSchlechtwetterBox4.Freigabe						:= TRUE;
	fbSchlechtwetterBox4.AuswahlSensor					:= Betriebsparameter.SchlechtwetterBoxen[4].AuswahlSensorGrenzwert;
	fbSchlechtwetterBox4.FrischluftSaettigungsdefizit	:= gStatusAnlage.Berechnungen.FrischluftSattDefizit;
	fbSchlechtwetterBox4.DachluftSaettigungsdefizit		:= gStatusAnlage.Berechnungen.DachluftSattDefizit;
	fbSchlechtwetterBox4.TrockenluftSaettigungsdefizit	:= gStatusAnlage.Berechnungen.TrockenluftSattDefizit;
	fbSchlechtwetterBox4.SensorFrischluftVhd			:= Betriebsparameter.Ausstattung.SensorFrischluft AND NOT alarmFehler[FEHLER_SENSOR_FRISCHLUFT];
	fbSchlechtwetterBox4.SensorDachluftVhd				:= Betriebsparameter.Ausstattung.SensorDachluft AND NOT alarmFehler[FEHLER_SENSOR_DACHLUFT];
	fbSchlechtwetterBox4.SensorTrockenluftVhd			:= Betriebsparameter.Ausstattung.SensorTrockenluft AND NOT alarmFehler[FEHLER_SENSOR_TROCKENLUFT];
	fbSchlechtwetterBox4.VerzWetterwechsel				:= Betriebsparameter.Schrittkette.VerzWetterwechsel;
	
	fbSchlechtwetterBox4.MaterialfeuchteStufe[1]		:= Betriebsparameter.SchlechtwetterBoxen[4].Stufe[1].MaterialfeuchteStufe;
	fbSchlechtwetterBox4.MaterialfeuchteStufe[2]		:= Betriebsparameter.SchlechtwetterBoxen[4].Stufe[2].MaterialfeuchteStufe;
	fbSchlechtwetterBox4.MaterialfeuchteStufe[3]		:= Betriebsparameter.SchlechtwetterBoxen[4].Stufe[3].MaterialfeuchteStufe;
	fbSchlechtwetterBox4.MaterialfeuchteStufe[4]		:= Betriebsparameter.SchlechtwetterBoxen[4].Stufe[4].MaterialfeuchteStufe;
	fbSchlechtwetterBox4.MaterialfeuchteStufe[5]		:= Betriebsparameter.SchlechtwetterBoxen[4].Stufe[5].MaterialfeuchteStufe;
	fbSchlechtwetterBox4.MaterialfeuchteStufe[6]		:= Betriebsparameter.SchlechtwetterBoxen[4].Stufe[6].MaterialfeuchteStufe;
	
	fbSchlechtwetterBox4.GrenzwertStufeAktuell			:= Betriebsparameter.SchlechtwetterBoxen[4].Stufe[fbSchlechtwetterBox4.StufeAktuell].Saettigungsdefizit;
	fbSchlechtwetterBox4.HystereseGrenzwert				:= Betriebsparameter.SchlechtwetterBoxen[1].HystereseGrenzwert; //Gleiche Hysterese für alle Boxen
	fbSchlechtwetterBox4.MaterialfeuchteIst				:= Betriebsparameter.SchlechtwetterBoxen[4].MaterialfeuchteIst;
	
	fbSchlechtwetterBox4.SchlechtwetterPausezeitStufe[fbSchlechtwetterBox4.StufeAktuell] := 
	Betriebsparameter.SchlechtwetterBoxen[4].Stufe[fbSchlechtwetterBox4.StufeAktuell].SchlechtwetterZeitPause;
	fbSchlechtwetterBox4.SchlechtwetterPulszeitStufe[fbSchlechtwetterBox4.StufeAktuell] := 
	Betriebsparameter.SchlechtwetterBoxen[4].Stufe[fbSchlechtwetterBox4.StufeAktuell].SchlechtwetterZeitLauf;
	
	
	//Box 5	**********************************************************************************************************************************************
	fbSchlechtwetterBox5.Freigabe						:= TRUE;
	fbSchlechtwetterBox5.AuswahlSensor					:= Betriebsparameter.SchlechtwetterBoxen[5].AuswahlSensorGrenzwert;
	fbSchlechtwetterBox5.FrischluftSaettigungsdefizit	:= gStatusAnlage.Berechnungen.FrischluftSattDefizit;
	fbSchlechtwetterBox5.DachluftSaettigungsdefizit		:= gStatusAnlage.Berechnungen.DachluftSattDefizit;
	fbSchlechtwetterBox5.TrockenluftSaettigungsdefizit	:= gStatusAnlage.Berechnungen.TrockenluftSattDefizit;
	fbSchlechtwetterBox5.SensorFrischluftVhd			:= Betriebsparameter.Ausstattung.SensorFrischluft AND NOT alarmFehler[FEHLER_SENSOR_FRISCHLUFT];
	fbSchlechtwetterBox5.SensorDachluftVhd				:= Betriebsparameter.Ausstattung.SensorDachluft AND NOT alarmFehler[FEHLER_SENSOR_DACHLUFT];
	fbSchlechtwetterBox5.SensorTrockenluftVhd			:= Betriebsparameter.Ausstattung.SensorTrockenluft AND NOT alarmFehler[FEHLER_SENSOR_TROCKENLUFT];
	fbSchlechtwetterBox5.VerzWetterwechsel				:= Betriebsparameter.Schrittkette.VerzWetterwechsel;
	
	fbSchlechtwetterBox5.MaterialfeuchteStufe[1]		:= Betriebsparameter.SchlechtwetterBoxen[5].Stufe[1].MaterialfeuchteStufe;
	fbSchlechtwetterBox5.MaterialfeuchteStufe[2]		:= Betriebsparameter.SchlechtwetterBoxen[5].Stufe[2].MaterialfeuchteStufe;
	fbSchlechtwetterBox5.MaterialfeuchteStufe[3]		:= Betriebsparameter.SchlechtwetterBoxen[5].Stufe[3].MaterialfeuchteStufe;
	fbSchlechtwetterBox5.MaterialfeuchteStufe[4]		:= Betriebsparameter.SchlechtwetterBoxen[5].Stufe[4].MaterialfeuchteStufe;
	fbSchlechtwetterBox5.MaterialfeuchteStufe[5]		:= Betriebsparameter.SchlechtwetterBoxen[5].Stufe[5].MaterialfeuchteStufe;
	fbSchlechtwetterBox5.MaterialfeuchteStufe[6]		:= Betriebsparameter.SchlechtwetterBoxen[5].Stufe[6].MaterialfeuchteStufe;
	
	fbSchlechtwetterBox5.GrenzwertStufeAktuell			:= Betriebsparameter.SchlechtwetterBoxen[5].Stufe[fbSchlechtwetterBox5.StufeAktuell].Saettigungsdefizit;
	fbSchlechtwetterBox5.HystereseGrenzwert				:= Betriebsparameter.SchlechtwetterBoxen[1].HystereseGrenzwert; //Gleiche Hysterese für alle Boxen
	fbSchlechtwetterBox5.MaterialfeuchteIst				:= Betriebsparameter.SchlechtwetterBoxen[5].MaterialfeuchteIst;
	
	fbSchlechtwetterBox5.SchlechtwetterPausezeitStufe[fbSchlechtwetterBox5.StufeAktuell] := 
	Betriebsparameter.SchlechtwetterBoxen[5].Stufe[fbSchlechtwetterBox5.StufeAktuell].SchlechtwetterZeitPause;
	fbSchlechtwetterBox5.SchlechtwetterPulszeitStufe[fbSchlechtwetterBox5.StufeAktuell] := 
	Betriebsparameter.SchlechtwetterBoxen[5].Stufe[fbSchlechtwetterBox5.StufeAktuell].SchlechtwetterZeitLauf;
	
	
	//Box 6	**********************************************************************************************************************************************
	fbSchlechtwetterBox6.Freigabe						:= TRUE;
	fbSchlechtwetterBox6.AuswahlSensor					:= Betriebsparameter.SchlechtwetterBoxen[6].AuswahlSensorGrenzwert;
	fbSchlechtwetterBox6.FrischluftSaettigungsdefizit	:= gStatusAnlage.Berechnungen.FrischluftSattDefizit;
	fbSchlechtwetterBox6.DachluftSaettigungsdefizit		:= gStatusAnlage.Berechnungen.DachluftSattDefizit;
	fbSchlechtwetterBox6.TrockenluftSaettigungsdefizit	:= gStatusAnlage.Berechnungen.TrockenluftSattDefizit;
	fbSchlechtwetterBox6.SensorFrischluftVhd			:= Betriebsparameter.Ausstattung.SensorFrischluft AND NOT alarmFehler[FEHLER_SENSOR_FRISCHLUFT];
	fbSchlechtwetterBox6.SensorDachluftVhd				:= Betriebsparameter.Ausstattung.SensorDachluft AND NOT alarmFehler[FEHLER_SENSOR_DACHLUFT];
	fbSchlechtwetterBox6.SensorTrockenluftVhd			:= Betriebsparameter.Ausstattung.SensorTrockenluft AND NOT alarmFehler[FEHLER_SENSOR_TROCKENLUFT];
	fbSchlechtwetterBox6.VerzWetterwechsel				:= Betriebsparameter.Schrittkette.VerzWetterwechsel;
	
	fbSchlechtwetterBox6.MaterialfeuchteStufe[1]		:= Betriebsparameter.SchlechtwetterBoxen[6].Stufe[1].MaterialfeuchteStufe;
	fbSchlechtwetterBox6.MaterialfeuchteStufe[2]		:= Betriebsparameter.SchlechtwetterBoxen[6].Stufe[2].MaterialfeuchteStufe;
	fbSchlechtwetterBox6.MaterialfeuchteStufe[3]		:= Betriebsparameter.SchlechtwetterBoxen[6].Stufe[3].MaterialfeuchteStufe;
	fbSchlechtwetterBox6.MaterialfeuchteStufe[4]		:= Betriebsparameter.SchlechtwetterBoxen[6].Stufe[4].MaterialfeuchteStufe;
	fbSchlechtwetterBox6.MaterialfeuchteStufe[5]		:= Betriebsparameter.SchlechtwetterBoxen[6].Stufe[5].MaterialfeuchteStufe;
	fbSchlechtwetterBox6.MaterialfeuchteStufe[6]		:= Betriebsparameter.SchlechtwetterBoxen[6].Stufe[6].MaterialfeuchteStufe;
	
	fbSchlechtwetterBox6.GrenzwertStufeAktuell			:= Betriebsparameter.SchlechtwetterBoxen[6].Stufe[fbSchlechtwetterBox6.StufeAktuell].Saettigungsdefizit;
	fbSchlechtwetterBox6.HystereseGrenzwert				:= Betriebsparameter.SchlechtwetterBoxen[1].HystereseGrenzwert; //Gleiche Hysterese für alle Boxen
	fbSchlechtwetterBox6.MaterialfeuchteIst				:= Betriebsparameter.SchlechtwetterBoxen[6].MaterialfeuchteIst;
	
	fbSchlechtwetterBox6.SchlechtwetterPausezeitStufe[fbSchlechtwetterBox6.StufeAktuell] := 
	Betriebsparameter.SchlechtwetterBoxen[6].Stufe[fbSchlechtwetterBox6.StufeAktuell].SchlechtwetterZeitPause;
	fbSchlechtwetterBox6.SchlechtwetterPulszeitStufe[fbSchlechtwetterBox6.StufeAktuell] := 
	Betriebsparameter.SchlechtwetterBoxen[6].Stufe[fbSchlechtwetterBox6.StufeAktuell].SchlechtwetterZeitLauf;
	
	
END_PROGRAM
