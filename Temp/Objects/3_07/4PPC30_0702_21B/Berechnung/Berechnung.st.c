#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/Berechnung/Berechnungst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Berechnung/Berechnung/Berechnung.nodebug"
#line 4 "C:/SharedFolder/CControl/Logical/Berechnung/Berechnung/Berechnung.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){{










(Frischluftsensor.Freigabe=(Betriebsparameter.Ausstattung.SensorFrischluft&(alarmFehler[CheckBounds(20,0,49)]^1)));
(Frischluftsensor.LuftTemperatur=aiFrischluftTemperatur);
(Frischluftsensor.LuftRelFeuchte=aiFrischluftFeuchte);
(Frischluftsensor.MeterUeberAdria=Betriebsparameter.Allgemein.StandortHoehe);
fbMathLuft(&Frischluftsensor);

(gStatusAnlage.Berechnungen.FrischluftSattDefizit=Frischluftsensor.LuftSaettigungsdefizit);




(Trockenluftsensor.Freigabe=(Betriebsparameter.Ausstattung.SensorTrockenluft&(alarmFehler[CheckBounds(22,0,49)]^1)));
(Trockenluftsensor.LuftTemperatur=aiTrockenluftTemperatur);
(Trockenluftsensor.LuftRelFeuchte=aiTrockenluftFeuchte);
(Trockenluftsensor.MeterUeberAdria=Betriebsparameter.Allgemein.StandortHoehe);
fbMathLuft(&Trockenluftsensor);

(gStatusAnlage.Berechnungen.TrockenluftSattDefizit=Trockenluftsensor.LuftSaettigungsdefizit);




(Dachluftsensor.Freigabe=(Betriebsparameter.Ausstattung.SensorDachluft&(alarmFehler[CheckBounds(21,0,49)]^1)));
(Dachluftsensor.LuftTemperatur=aiDachluftTemperatur);
(Dachluftsensor.LuftRelFeuchte=aiDachluftFeuchte);
(Dachluftsensor.MeterUeberAdria=Betriebsparameter.Allgemein.StandortHoehe);
fbMathLuft(&Dachluftsensor);

(gStatusAnlage.Berechnungen.DachluftSattDefizit=Dachluftsensor.LuftSaettigungsdefizit);




(Abluftsensor.Freigabe=(Betriebsparameter.Ausstattung.SensorAbluft&(alarmFehler[CheckBounds(23,0,49)]^1)));
(Abluftsensor.LuftTemperatur=aiAbluftTemperatur);
(Abluftsensor.LuftRelFeuchte=aiAbluftFeuchte);
(Abluftsensor.MeterUeberAdria=Betriebsparameter.Allgemein.StandortHoehe);
fbMathLuft(&Abluftsensor);

(gStatusAnlage.Berechnungen.AbluftSattDefizit=Abluftsensor.LuftSaettigungsdefizit);




(Drucksensor.Freigabe=((doVentilator1Ein|doVentilator2Ein)&Betriebsparameter.Ausstattung.SensorKanaldruck&(alarmFehler[CheckBounds(27,0,49)]^1)));
(Drucksensor.TrockenluftDruck=aiDifferenzdruck);
fbMathTrLftDruck(&Drucksensor);

if((doVentilator1Ein|doVentilator2Ein)){
(gStatusAnlage.Berechnungen.Kanaldruck_mmWs=Drucksensor.LuftDruck_mmWS);
}else{
(gStatusAnlage.Berechnungen.Kanaldruck_mmWs=(0.00000000000000000000E+00));
}










(gStatusAnlage.WetterIstSchlecht=((Boxen.Box1In.WetterIstSchlecht&Boxen.Box1Out.BoxBereit)|(Boxen.Box2In.WetterIstSchlecht&Boxen.Box2Out.BoxBereit)|(Boxen.Box3In.WetterIstSchlecht&Boxen.Box3Out.BoxBereit)|(Boxen.Box4In.WetterIstSchlecht&Boxen.Box4Out.BoxBereit)|(Boxen.Box5In.WetterIstSchlecht&Boxen.Box5Out.BoxBereit)|(Boxen.Box6In.WetterIstSchlecht&Boxen.Box6Out.BoxBereit)));


(fbSchlechtwetterBox1.Freigabe=1);
(fbSchlechtwetterBox1.AuswahlSensor=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].AuswahlSensorGrenzwert);
(fbSchlechtwetterBox1.FrischluftSaettigungsdefizit=gStatusAnlage.Berechnungen.FrischluftSattDefizit);
(fbSchlechtwetterBox1.DachluftSaettigungsdefizit=gStatusAnlage.Berechnungen.DachluftSattDefizit);
(fbSchlechtwetterBox1.TrockenluftSaettigungsdefizit=gStatusAnlage.Berechnungen.TrockenluftSattDefizit);
(fbSchlechtwetterBox1.SensorFrischluftVhd=(Betriebsparameter.Ausstattung.SensorFrischluft&(alarmFehler[CheckBounds(20,0,49)]^1)));
(fbSchlechtwetterBox1.SensorDachluftVhd=(Betriebsparameter.Ausstattung.SensorDachluft&(alarmFehler[CheckBounds(21,0,49)]^1)));
(fbSchlechtwetterBox1.SensorTrockenluftVhd=(Betriebsparameter.Ausstattung.SensorTrockenluft&(alarmFehler[CheckBounds(22,0,49)]^1)));
(fbSchlechtwetterBox1.VerzWetterwechsel=Betriebsparameter.Schrittkette.VerzWetterwechsel);

(fbSchlechtwetterBox1.MaterialfeuchteStufe[CheckBounds(1,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].Stufe[CheckBounds(1,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox1.MaterialfeuchteStufe[CheckBounds(2,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].Stufe[CheckBounds(2,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox1.MaterialfeuchteStufe[CheckBounds(3,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].Stufe[CheckBounds(3,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox1.MaterialfeuchteStufe[CheckBounds(4,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].Stufe[CheckBounds(4,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox1.MaterialfeuchteStufe[CheckBounds(5,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].Stufe[CheckBounds(5,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox1.MaterialfeuchteStufe[CheckBounds(6,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].Stufe[CheckBounds(6,1,6)-1].MaterialfeuchteStufe);

(fbSchlechtwetterBox1.GrenzwertStufeAktuell=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox1.StufeAktuell,1,6)-1].Saettigungsdefizit);
(fbSchlechtwetterBox1.HystereseGrenzwert=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].HystereseGrenzwert);
(fbSchlechtwetterBox1.MaterialfeuchteIst=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].MaterialfeuchteIst);


(fbSchlechtwetterBox1.SchlechtwetterPausezeitStufe[CheckBounds(fbSchlechtwetterBox1.StufeAktuell,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox1.StufeAktuell,1,6)-1].SchlechtwetterZeitPause);

(fbSchlechtwetterBox1.SchlechtwetterPulszeitStufe[CheckBounds(fbSchlechtwetterBox1.StufeAktuell,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox1.StufeAktuell,1,6)-1].SchlechtwetterZeitLauf);



(fbSchlechtwetterBox2.Freigabe=1);
(fbSchlechtwetterBox2.AuswahlSensor=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].AuswahlSensorGrenzwert);
(fbSchlechtwetterBox2.FrischluftSaettigungsdefizit=gStatusAnlage.Berechnungen.FrischluftSattDefizit);
(fbSchlechtwetterBox2.DachluftSaettigungsdefizit=gStatusAnlage.Berechnungen.DachluftSattDefizit);
(fbSchlechtwetterBox2.TrockenluftSaettigungsdefizit=gStatusAnlage.Berechnungen.TrockenluftSattDefizit);
(fbSchlechtwetterBox2.SensorFrischluftVhd=(Betriebsparameter.Ausstattung.SensorFrischluft&(alarmFehler[CheckBounds(20,0,49)]^1)));
(fbSchlechtwetterBox2.SensorDachluftVhd=(Betriebsparameter.Ausstattung.SensorDachluft&(alarmFehler[CheckBounds(21,0,49)]^1)));
(fbSchlechtwetterBox2.SensorTrockenluftVhd=(Betriebsparameter.Ausstattung.SensorTrockenluft&(alarmFehler[CheckBounds(22,0,49)]^1)));
(fbSchlechtwetterBox2.VerzWetterwechsel=Betriebsparameter.Schrittkette.VerzWetterwechsel);

(fbSchlechtwetterBox2.MaterialfeuchteStufe[CheckBounds(1,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].Stufe[CheckBounds(1,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox2.MaterialfeuchteStufe[CheckBounds(2,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].Stufe[CheckBounds(2,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox2.MaterialfeuchteStufe[CheckBounds(3,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].Stufe[CheckBounds(3,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox2.MaterialfeuchteStufe[CheckBounds(4,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].Stufe[CheckBounds(4,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox2.MaterialfeuchteStufe[CheckBounds(5,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].Stufe[CheckBounds(5,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox2.MaterialfeuchteStufe[CheckBounds(6,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].Stufe[CheckBounds(6,1,6)-1].MaterialfeuchteStufe);

(fbSchlechtwetterBox2.GrenzwertStufeAktuell=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox2.StufeAktuell,1,6)-1].Saettigungsdefizit);
(fbSchlechtwetterBox2.HystereseGrenzwert=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].HystereseGrenzwert);
(fbSchlechtwetterBox2.MaterialfeuchteIst=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].MaterialfeuchteIst);


(fbSchlechtwetterBox2.SchlechtwetterPausezeitStufe[CheckBounds(fbSchlechtwetterBox2.StufeAktuell,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox2.StufeAktuell,1,6)-1].SchlechtwetterZeitPause);

(fbSchlechtwetterBox2.SchlechtwetterPulszeitStufe[CheckBounds(fbSchlechtwetterBox2.StufeAktuell,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox2.StufeAktuell,1,6)-1].SchlechtwetterZeitLauf);



(fbSchlechtwetterBox3.Freigabe=1);
(fbSchlechtwetterBox3.AuswahlSensor=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].AuswahlSensorGrenzwert);
(fbSchlechtwetterBox3.FrischluftSaettigungsdefizit=gStatusAnlage.Berechnungen.FrischluftSattDefizit);
(fbSchlechtwetterBox3.DachluftSaettigungsdefizit=gStatusAnlage.Berechnungen.DachluftSattDefizit);
(fbSchlechtwetterBox3.TrockenluftSaettigungsdefizit=gStatusAnlage.Berechnungen.TrockenluftSattDefizit);
(fbSchlechtwetterBox3.SensorFrischluftVhd=(Betriebsparameter.Ausstattung.SensorFrischluft&(alarmFehler[CheckBounds(20,0,49)]^1)));
(fbSchlechtwetterBox3.SensorDachluftVhd=(Betriebsparameter.Ausstattung.SensorDachluft&(alarmFehler[CheckBounds(21,0,49)]^1)));
(fbSchlechtwetterBox3.SensorTrockenluftVhd=(Betriebsparameter.Ausstattung.SensorTrockenluft&(alarmFehler[CheckBounds(22,0,49)]^1)));
(fbSchlechtwetterBox3.VerzWetterwechsel=Betriebsparameter.Schrittkette.VerzWetterwechsel);

(fbSchlechtwetterBox3.MaterialfeuchteStufe[CheckBounds(1,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].Stufe[CheckBounds(1,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox3.MaterialfeuchteStufe[CheckBounds(2,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].Stufe[CheckBounds(2,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox3.MaterialfeuchteStufe[CheckBounds(3,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].Stufe[CheckBounds(3,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox3.MaterialfeuchteStufe[CheckBounds(4,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].Stufe[CheckBounds(4,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox3.MaterialfeuchteStufe[CheckBounds(5,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].Stufe[CheckBounds(5,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox3.MaterialfeuchteStufe[CheckBounds(6,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].Stufe[CheckBounds(6,1,6)-1].MaterialfeuchteStufe);

(fbSchlechtwetterBox3.GrenzwertStufeAktuell=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox3.StufeAktuell,1,6)-1].Saettigungsdefizit);
(fbSchlechtwetterBox3.HystereseGrenzwert=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].HystereseGrenzwert);
(fbSchlechtwetterBox3.MaterialfeuchteIst=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].MaterialfeuchteIst);


(fbSchlechtwetterBox3.SchlechtwetterPausezeitStufe[CheckBounds(fbSchlechtwetterBox3.StufeAktuell,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox3.StufeAktuell,1,6)-1].SchlechtwetterZeitPause);

(fbSchlechtwetterBox3.SchlechtwetterPulszeitStufe[CheckBounds(fbSchlechtwetterBox3.StufeAktuell,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox3.StufeAktuell,1,6)-1].SchlechtwetterZeitLauf);



(fbSchlechtwetterBox4.Freigabe=1);
(fbSchlechtwetterBox4.AuswahlSensor=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].AuswahlSensorGrenzwert);
(fbSchlechtwetterBox4.FrischluftSaettigungsdefizit=gStatusAnlage.Berechnungen.FrischluftSattDefizit);
(fbSchlechtwetterBox4.DachluftSaettigungsdefizit=gStatusAnlage.Berechnungen.DachluftSattDefizit);
(fbSchlechtwetterBox4.TrockenluftSaettigungsdefizit=gStatusAnlage.Berechnungen.TrockenluftSattDefizit);
(fbSchlechtwetterBox4.SensorFrischluftVhd=(Betriebsparameter.Ausstattung.SensorFrischluft&(alarmFehler[CheckBounds(20,0,49)]^1)));
(fbSchlechtwetterBox4.SensorDachluftVhd=(Betriebsparameter.Ausstattung.SensorDachluft&(alarmFehler[CheckBounds(21,0,49)]^1)));
(fbSchlechtwetterBox4.SensorTrockenluftVhd=(Betriebsparameter.Ausstattung.SensorTrockenluft&(alarmFehler[CheckBounds(22,0,49)]^1)));
(fbSchlechtwetterBox4.VerzWetterwechsel=Betriebsparameter.Schrittkette.VerzWetterwechsel);

(fbSchlechtwetterBox4.MaterialfeuchteStufe[CheckBounds(1,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].Stufe[CheckBounds(1,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox4.MaterialfeuchteStufe[CheckBounds(2,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].Stufe[CheckBounds(2,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox4.MaterialfeuchteStufe[CheckBounds(3,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].Stufe[CheckBounds(3,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox4.MaterialfeuchteStufe[CheckBounds(4,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].Stufe[CheckBounds(4,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox4.MaterialfeuchteStufe[CheckBounds(5,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].Stufe[CheckBounds(5,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox4.MaterialfeuchteStufe[CheckBounds(6,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].Stufe[CheckBounds(6,1,6)-1].MaterialfeuchteStufe);

(fbSchlechtwetterBox4.GrenzwertStufeAktuell=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox4.StufeAktuell,1,6)-1].Saettigungsdefizit);
(fbSchlechtwetterBox4.HystereseGrenzwert=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].HystereseGrenzwert);
(fbSchlechtwetterBox4.MaterialfeuchteIst=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].MaterialfeuchteIst);


(fbSchlechtwetterBox4.SchlechtwetterPausezeitStufe[CheckBounds(fbSchlechtwetterBox4.StufeAktuell,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox4.StufeAktuell,1,6)-1].SchlechtwetterZeitPause);

(fbSchlechtwetterBox4.SchlechtwetterPulszeitStufe[CheckBounds(fbSchlechtwetterBox4.StufeAktuell,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox4.StufeAktuell,1,6)-1].SchlechtwetterZeitLauf);



(fbSchlechtwetterBox5.Freigabe=1);
(fbSchlechtwetterBox5.AuswahlSensor=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].AuswahlSensorGrenzwert);
(fbSchlechtwetterBox5.FrischluftSaettigungsdefizit=gStatusAnlage.Berechnungen.FrischluftSattDefizit);
(fbSchlechtwetterBox5.DachluftSaettigungsdefizit=gStatusAnlage.Berechnungen.DachluftSattDefizit);
(fbSchlechtwetterBox5.TrockenluftSaettigungsdefizit=gStatusAnlage.Berechnungen.TrockenluftSattDefizit);
(fbSchlechtwetterBox5.SensorFrischluftVhd=(Betriebsparameter.Ausstattung.SensorFrischluft&(alarmFehler[CheckBounds(20,0,49)]^1)));
(fbSchlechtwetterBox5.SensorDachluftVhd=(Betriebsparameter.Ausstattung.SensorDachluft&(alarmFehler[CheckBounds(21,0,49)]^1)));
(fbSchlechtwetterBox5.SensorTrockenluftVhd=(Betriebsparameter.Ausstattung.SensorTrockenluft&(alarmFehler[CheckBounds(22,0,49)]^1)));
(fbSchlechtwetterBox5.VerzWetterwechsel=Betriebsparameter.Schrittkette.VerzWetterwechsel);

(fbSchlechtwetterBox5.MaterialfeuchteStufe[CheckBounds(1,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].Stufe[CheckBounds(1,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox5.MaterialfeuchteStufe[CheckBounds(2,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].Stufe[CheckBounds(2,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox5.MaterialfeuchteStufe[CheckBounds(3,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].Stufe[CheckBounds(3,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox5.MaterialfeuchteStufe[CheckBounds(4,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].Stufe[CheckBounds(4,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox5.MaterialfeuchteStufe[CheckBounds(5,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].Stufe[CheckBounds(5,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox5.MaterialfeuchteStufe[CheckBounds(6,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].Stufe[CheckBounds(6,1,6)-1].MaterialfeuchteStufe);

(fbSchlechtwetterBox5.GrenzwertStufeAktuell=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox5.StufeAktuell,1,6)-1].Saettigungsdefizit);
(fbSchlechtwetterBox5.HystereseGrenzwert=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].HystereseGrenzwert);
(fbSchlechtwetterBox5.MaterialfeuchteIst=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].MaterialfeuchteIst);


(fbSchlechtwetterBox5.SchlechtwetterPausezeitStufe[CheckBounds(fbSchlechtwetterBox5.StufeAktuell,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox5.StufeAktuell,1,6)-1].SchlechtwetterZeitPause);

(fbSchlechtwetterBox5.SchlechtwetterPulszeitStufe[CheckBounds(fbSchlechtwetterBox5.StufeAktuell,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox5.StufeAktuell,1,6)-1].SchlechtwetterZeitLauf);



(fbSchlechtwetterBox6.Freigabe=1);
(fbSchlechtwetterBox6.AuswahlSensor=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].AuswahlSensorGrenzwert);
(fbSchlechtwetterBox6.FrischluftSaettigungsdefizit=gStatusAnlage.Berechnungen.FrischluftSattDefizit);
(fbSchlechtwetterBox6.DachluftSaettigungsdefizit=gStatusAnlage.Berechnungen.DachluftSattDefizit);
(fbSchlechtwetterBox6.TrockenluftSaettigungsdefizit=gStatusAnlage.Berechnungen.TrockenluftSattDefizit);
(fbSchlechtwetterBox6.SensorFrischluftVhd=(Betriebsparameter.Ausstattung.SensorFrischluft&(alarmFehler[CheckBounds(20,0,49)]^1)));
(fbSchlechtwetterBox6.SensorDachluftVhd=(Betriebsparameter.Ausstattung.SensorDachluft&(alarmFehler[CheckBounds(21,0,49)]^1)));
(fbSchlechtwetterBox6.SensorTrockenluftVhd=(Betriebsparameter.Ausstattung.SensorTrockenluft&(alarmFehler[CheckBounds(22,0,49)]^1)));
(fbSchlechtwetterBox6.VerzWetterwechsel=Betriebsparameter.Schrittkette.VerzWetterwechsel);

(fbSchlechtwetterBox6.MaterialfeuchteStufe[CheckBounds(1,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].Stufe[CheckBounds(1,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox6.MaterialfeuchteStufe[CheckBounds(2,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].Stufe[CheckBounds(2,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox6.MaterialfeuchteStufe[CheckBounds(3,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].Stufe[CheckBounds(3,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox6.MaterialfeuchteStufe[CheckBounds(4,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].Stufe[CheckBounds(4,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox6.MaterialfeuchteStufe[CheckBounds(5,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].Stufe[CheckBounds(5,1,6)-1].MaterialfeuchteStufe);
(fbSchlechtwetterBox6.MaterialfeuchteStufe[CheckBounds(6,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].Stufe[CheckBounds(6,1,6)-1].MaterialfeuchteStufe);

(fbSchlechtwetterBox6.GrenzwertStufeAktuell=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox6.StufeAktuell,1,6)-1].Saettigungsdefizit);
(fbSchlechtwetterBox6.HystereseGrenzwert=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].HystereseGrenzwert);
(fbSchlechtwetterBox6.MaterialfeuchteIst=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].MaterialfeuchteIst);


(fbSchlechtwetterBox6.SchlechtwetterPausezeitStufe[CheckBounds(fbSchlechtwetterBox6.StufeAktuell,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox6.StufeAktuell,1,6)-1].SchlechtwetterZeitPause);

(fbSchlechtwetterBox6.SchlechtwetterPulszeitStufe[CheckBounds(fbSchlechtwetterBox6.StufeAktuell,1,6)-1]=Betriebsparameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].Stufe[CheckBounds(fbSchlechtwetterBox6.StufeAktuell,1,6)-1].SchlechtwetterZeitLauf);


}}
#line 248 "C:/SharedFolder/CControl/Logical/Berechnung/Berechnung/Berechnung.nodebug"

void __AS__ImplInitBerechnung_st(void){}

__asm__(".section \".plc\"");
__asm__(".ascii \"iecfile \\\"Logical/Parameter.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Enumeration.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/VisuIO.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Global.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/IO/InputOutput.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Regelung/RegelungIO.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/CSV/CSV_Global.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/operator/operator.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/runtime/runtime.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/astime/astime.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsIecCon/AsIecCon.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/standard/standard.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/sys_lib/sys_lib.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsBrStr/AsBrStr.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoMath/LascoMath.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoReg/LascoReg.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoTrock/LascoTrock.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoUtil/LascoUtil.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LaEntfV2/Types.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoBoxen/Types.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LoopConR/LoopConR.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/brsystem/brsystem.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/asstring/asstring.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/FileIO/FileIO.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/DataObj/DataObj.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsARCfg/AsARCfg.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/visapi/Visapi.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsUSB/AsUSB.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/dvframe/dvframe.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsTCP/AsTCP.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/Types.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpFile/MpFile.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpFile/MpFileError.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpFile/MpFileAlarm.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpRecipe/MpRecipe.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpRecipe/MpRecipeAlarm.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpRecipe/MpRecipeError.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/operator/operator.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/runtime/runtime.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/astime/astime.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsIecCon/AsIecCon.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/standard/standard.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/sys_lib/sys_lib.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsBrStr/AsBrStr.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoMath/LascoMath.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoReg/LascoReg.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoTrock/LascoTrock.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoUtil/LascoUtil.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LaEntfV2/LaEntfV2.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoBoxen/LascoBoxen.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LoopConR/LoopConR.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/brsystem/brsystem.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/asstring/asstring.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/FileIO/FileIO.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/DataObj/DataObj.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsARCfg/AsARCfg.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/visapi/Visapi.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsUSB/AsUSB.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/dvframe/dvframe.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/IecCheck/IecCheck.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsTCP/AsTCP.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/CControl.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpFile/MpFile.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpRecipe/MpRecipe.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/CSV/Library/CSV/CSV.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Global.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/VisuIO.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/IO/InputOutput.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Berechnung/Berechnungen.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Alarmsystem/Alarmsys.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Regelung/RegelungIO.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/CSV/CSV_Global.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Temp/Includes/AS_TempDecl/3_07/GlobalComponents/MpComponents.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/operator/operator.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/runtime/runtime.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/astime/astime.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsIecCon/AsIecCon.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/standard/standard.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/sys_lib/sys_lib.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsBrStr/AsBrStr.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoMath/LascoMath.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoReg/LascoReg.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoTrock/LascoTrock.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoUtil/LascoUtil.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LaEntfV2/Constants.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoBoxen/Constants.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LoopConR/LoopConR.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/brsystem/brsystem.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/asstring/asstring.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/FileIO/FileIO.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/DataObj/DataObj.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsARCfg/AsARCfg.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/visapi/Visapi.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsUSB/AsUSB.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/dvframe/dvframe.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsTCP/AsTCP.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/Constants.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Berechnung/Berechnung/Berechnung.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/Berechnung/Berechnung.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/Berechnung/Berechnung.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Berechnung/Berechnung/Berechnung.st\\\"\\n\"");
__asm__(".previous");
