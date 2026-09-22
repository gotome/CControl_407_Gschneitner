#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/2_07/4PPC30_0702_21B/hmiMain/Mainst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Visualisierung/hmiMain/Main.nodebug"
#line 2 "C:/SharedFolder/CControl/Logical/Visualisierung/hmiMain/Main.st"
void __BUR__ENTRY_INIT_FUNCT__(void){{


__AS__MEMCPY(((unsigned long)(&hmiParameter)),((unsigned long)(&Betriebsparameter)),2968);
__AS__MEMCPY(((unsigned long)(&hmiNutzungsdaten)),((unsigned long)(&Nutzungsdaten)),284);


if(hmiParameter.Abluftklappe.Automatik){
(hmiStatus.Abluftklappe.IndexBetriebsart=0);
}else if(hmiParameter.Abluftklappe.Oeffnen){
(hmiStatus.Abluftklappe.IndexBetriebsart=1);
}else{
(hmiStatus.Abluftklappe.IndexBetriebsart=2);
}
if(hmiParameter.Abluftventilator.Automatik){
(hmiStatus.Abluftventilator.IndexBetriebsart=0);
}else if(hmiParameter.Abluftventilator.Ein){
(hmiStatus.Abluftventilator.IndexBetriebsart=1);
}else{
(hmiStatus.Abluftventilator.IndexBetriebsart=2);
}
if(hmiParameter.Umschaltklappen.Automatik){
(hmiStatus.Umluftklappen.IndexBetriebsart=0);
}else if(hmiParameter.Umschaltklappen.Frischluft){
(hmiStatus.Umluftklappen.IndexBetriebsart=1);
}else{
(hmiStatus.Umluftklappen.IndexBetriebsart=2);
}

(hmiVisibility.Layers.Zeitfenster=1);
(hmiVisibility.Layers.DetailansichtBox=1);
(hmiVisibility.Layers.MdgPwSchutzAus=1);
(hmiVisibility.Layers.MldgDatumFalsch=1);
(hmiVisibility.Layers.MldgKontrolleUhrzeit=1);
(hmiVisibility.Layers.MldgStockkontrolle=1);
(hmiVisibility.Layers.Trocknungsbilanz=1);

(hmiStatus.hmiPasswort=0);


}}
#line 42 "C:/SharedFolder/CControl/Logical/Visualisierung/hmiMain/Main.nodebug"
#line 46 "C:/SharedFolder/CControl/Logical/Visualisierung/hmiMain/Main.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){int __AS__Local0_00000;plcstring* __AS__Local3_00000;plcstring* __AS__Local4_00000;{




(fbLascoZdxx_0.IN=(((unsigned long)(Echtzeit.Milli))/((unsigned long)(CheckDivUint(100)))));;fbLascoZdxx(&fbLascoZdxx_0);
(hmilliTick=fbLascoZdxx_0.Q);
(fbLascoZdxx_1.IN=Echtzeit.Sekunde);;fbLascoZdxx(&fbLascoZdxx_1);
(sekTick=fbLascoZdxx_1.Q);
(fbLascoZdxx_2.IN=Echtzeit.Stunde);;fbLascoZdxx(&fbLascoZdxx_2);
(stdTick=fbLascoZdxx_2.Q);
(fbLascoZdxx_3.IN=Echtzeit.Tag);;fbLascoZdxx(&fbLascoZdxx_3);
(tagTick=fbLascoZdxx_3.Q);
(fbLascoZdxx_5.IN=Echtzeit.Jahr);;fbLascoZdxx(&fbLascoZdxx_5);
(jahrTick=fbLascoZdxx_5.Q);

(fbLascoPuge_0.StartMitPuls=1);;(fbLascoPuge_0.Tick=hmilliTick);;(fbLascoPuge_0.ZeitPuls=8);;(fbLascoPuge_0.ZeitPause=8);;fbLascoPuge(&fbLascoPuge_0);
(hmiBlink=fbLascoPuge_0.PulsQ);

(fbLascoPuge_1.StartMitPuls=1);;(fbLascoPuge_1.Tick=hmilliTick);;(fbLascoPuge_1.ZeitPuls=8);;(fbLascoPuge_1.ZeitPause=40);;fbLascoPuge(&fbLascoPuge_1);
(hmiBlink2=fbLascoPuge_1.PulsQ);




if((((unsigned long)(unsigned char)hmiStatus.hmiSelectAlarmGroup>(unsigned long)(unsigned char)0))){
(hmiStatus.hmiAlarmFilter=3);
}else{
(hmiStatus.hmiAlarmFilter=0);
}


(loc_DisplayTimeout=hmiParameter.Allgemein.DisplayTimeout);






if(hmiParameter.Allgemein.PasswortschutzAus){
(hmiParameter.Allgemein.AutoLogoutEin=0);
}


if((hmiParameter.Ausstattung.SensorLuftgeschwindigkeit^1)){
(hmiParameter.Ausstattung.LuftmngReglerFrischlVent1=0);
(hmiParameter.Ausstattung.LuftmngReglerFrischlVent2=0);
(hmiParameter.Ausstattung.LuftmngReglerUmluftVent1=0);
(hmiParameter.Ausstattung.LuftmngReglerUmluftVent2=0);
(hmiParameter.Ventilator1.LuftmengenregFrischluftEin=0);
(hmiParameter.Ventilator1.LuftmengenregUmluftEin=0);
(hmiParameter.Ventilator2.LuftmengenregFrischluftEin=0);
(hmiParameter.Ventilator2.LuftmengenregUmluftEin=0);
}



if((((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)1))&(hmiParameter.Ausstattung.SensorDachluft^1))|((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)2))&(hmiParameter.Ausstattung.SensorTrockenluft^1)))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].AuswahlSensorGrenzwert=0);
}
else if((((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)1))&(hmiParameter.Ausstattung.SensorDachluft^1))|((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)2))&(hmiParameter.Ausstattung.SensorTrockenluft^1)))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].AuswahlSensorGrenzwert=0);
}
else if((((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)1))&(hmiParameter.Ausstattung.SensorDachluft^1))|((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)2))&(hmiParameter.Ausstattung.SensorTrockenluft^1)))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].AuswahlSensorGrenzwert=0);
}
else if((((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)1))&(hmiParameter.Ausstattung.SensorDachluft^1))|((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)2))&(hmiParameter.Ausstattung.SensorTrockenluft^1)))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].AuswahlSensorGrenzwert=0);
}
else if((((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)1))&(hmiParameter.Ausstattung.SensorDachluft^1))|((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)2))&(hmiParameter.Ausstattung.SensorTrockenluft^1)))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].AuswahlSensorGrenzwert=0);
}
else if((((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)1))&(hmiParameter.Ausstattung.SensorDachluft^1))|((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)2))&(hmiParameter.Ausstattung.SensorTrockenluft^1)))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].AuswahlSensorGrenzwert=0);
}


if(((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)0))&(hmiParameter.Ausstattung.SensorFrischluft^1))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].AuswahlSensorGrenzwert=1);
}
if(((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)0))&(hmiParameter.Ausstattung.SensorFrischluft^1))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].AuswahlSensorGrenzwert=1);
}
if(((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)0))&(hmiParameter.Ausstattung.SensorFrischluft^1))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].AuswahlSensorGrenzwert=1);
}
if(((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)0))&(hmiParameter.Ausstattung.SensorFrischluft^1))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].AuswahlSensorGrenzwert=1);
}
if(((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)0))&(hmiParameter.Ausstattung.SensorFrischluft^1))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].AuswahlSensorGrenzwert=1);
}
if(((((unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].AuswahlSensorGrenzwert==(unsigned long)(unsigned char)0))&(hmiParameter.Ausstattung.SensorFrischluft^1))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].AuswahlSensorGrenzwert=1);
}






__AS__Local3_00000=(plcstring*)hmiStatus.EntfeuchterType; __AS__Local4_00000=(plcstring*)hmiParameter.Entfeuchter.Type[hmiParameter.Entfeuchter.IndexType]; for(__AS__Local0_00000=0; __AS__Local0_00000<20l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;







if((((unsigned long)(unsigned char)Betriebsparameter.Allgemein.PasswortschutzAus==(unsigned long)(unsigned char)0))){
if(((((signed long)hmiStatus.hmiPasswort==(signed long)4321))|(((signed long)hmiStatus.hmiPasswort==(signed long)1234)))){
(hmiStatus.CurUserLevel=1);
}else if((((signed long)hmiStatus.hmiPasswort==(signed long)8613))){
(hmiStatus.CurUserLevel=2);
}else if((((signed long)hmiStatus.hmiPasswort==(signed long)21666))){
(hmiStatus.CurUserLevel=3);
}else if(((((signed long)hmiStatus.hmiPasswort==(signed long)110588))|(((signed long)hmiStatus.hmiPasswort==(signed long)81190)))){
(hmiStatus.CurUserLevel=4);
}else{
(hmiStatus.CurUserLevel=0);
}
}else{
if((((signed long)hmiStatus.hmiPasswort==(signed long)8613))){
(hmiStatus.CurUserLevel=2);
}else if((((signed long)hmiStatus.hmiPasswort==(signed long)21666))){
(hmiStatus.CurUserLevel=3);
}else if(((((signed long)hmiStatus.hmiPasswort==(signed long)110588))|(((signed long)hmiStatus.hmiPasswort==(signed long)81190)))){
(hmiStatus.CurUserLevel=4);
}else{
(hmiStatus.CurUserLevel=1);
}
}


if((((signed long)hmiStatus.hmiPasswort==(signed long)110588))){
(gAktuellesPasswort=110588);
}else if((((signed long)hmiStatus.hmiPasswort==(signed long)81190))){
(gAktuellesPasswort=81190);
}else if((((signed long)hmiStatus.hmiPasswort==(signed long)4321))){
(gAktuellesPasswort=4321);
}else if((((signed long)hmiStatus.hmiPasswort==(signed long)1234))){
(gAktuellesPasswort=1234);
}else if((((signed long)hmiStatus.hmiPasswort==(signed long)21666))){
(gAktuellesPasswort=21666);
}else if((((signed long)hmiStatus.hmiPasswort==(signed long)8613))){
(gAktuellesPasswort=8613);
}


(hmiStatus.UserIstAdmin=(((signed long)hmiStatus.CurUserLevel==(signed long)4)));






if((((unsigned long)hmiParameter.Allgemein.LoginTimeout<(unsigned long)60))){
(hmiParameter.Allgemein.LoginTimeout=60);
}



if((((((unsigned long)loc_TimePwReset>=(unsigned long)hmiParameter.Allgemein.LoginTimeout))&hmiParameter.Allgemein.AutoLogoutEin&(hmiParameter.Allgemein.PasswortschutzAus^1))|hmiButtons.Logout)){
(hmiStatus.hmiPasswort=0);
(loc_TimePwReset=0);
(hmiActions.cmdChangePageTo=1);
}
else if(((((signed long)hmiStatus.CurUserLevel!=(signed long)0))&hmiParameter.Allgemein.AutoLogoutEin&(hmiParameter.Allgemein.PasswortschutzAus^1)&sekTick)){
(loc_TimePwReset=(loc_TimePwReset+1));
}








if(hmiParameter.Ausstattung.Box1){
(hmiVisibility.Allgemein.Box1=0);
}else{
(hmiVisibility.Allgemein.Box1=1);
}

if(hmiParameter.Ausstattung.Box2){
(hmiVisibility.Allgemein.Box2=0);
}else{
(hmiVisibility.Allgemein.Box2=1);
}

if(hmiParameter.Ausstattung.Box3){
(hmiVisibility.Allgemein.Box3=0);
}else{
(hmiVisibility.Allgemein.Box3=1);
}

if(hmiParameter.Ausstattung.Box4){
(hmiVisibility.Allgemein.Box4=0);
}else{
(hmiVisibility.Allgemein.Box4=1);
}

if(hmiParameter.Ausstattung.Box5){
(hmiVisibility.Allgemein.Box5=0);
}else{
(hmiVisibility.Allgemein.Box5=1);
}

if(hmiParameter.Ausstattung.Box6){
(hmiVisibility.Allgemein.Box6=0);
}else{
(hmiVisibility.Allgemein.Box6=1);
}



if(((hmiParameter.Ausstattung.Abluftklappe^1)&(hmiParameter.Ausstattung.Abluftventilator^1)&(hmiParameter.Ausstattung.Bypassklappe^1)&(hmiParameter.Ausstattung.Umschaltklappe1^1)&(hmiParameter.Ausstattung.Umschaltklappe2^1))){
(hmiVisibility.Allgemein.UebersichtKlappen=1);
}else{
(hmiVisibility.Allgemein.UebersichtKlappen=0);
}




if(((hmiParameter.Ausstattung.Entfeuchter^1)&(hmiParameter.Ausstattung.Heizregister^1)&(hmiParameter.Ausstattung.Scheitholzofen^1)&(hmiParameter.Ausstattung.Warmluftofen^1)&(hmiParameter.Ausstattung.WarmluftofenBetriebsmldg^1)&(hmiParameter.Ausstattung.EntfeuchterFremd^1))){
(hmiVisibility.Allgemein.UebersichtTrocknungsger=1);
}else{
(hmiVisibility.Allgemein.UebersichtTrocknungsger=0);
}


if(hmiParameter.Ausstattung.Ventilator2){
(hmiVisibility.Allgemein.Ventilator2=0);
}else{
(hmiVisibility.Allgemein.Ventilator2=1);
}


(hmiVisibility.Allgemein.Energiemessung=CheckRange((unsigned char)((hmiParameter.Ausstattung.Energiemessung^1)&1),0,24));


if(gStatusAnlage.Fehler.SummeFehler){
(hmiVisibility.Layers.EbeneFehler=CheckRange((unsigned char)(hmiBlink&1),0,24));
}else{
(hmiVisibility.Layers.EbeneFehler=1);
}


if((gStatusAnlage.Fehler.SummeWarnung|alarmSystem[CheckBounds(0,0,4)]|alarmSystem[CheckBounds(1,0,4)])){
(hmiVisibility.Layers.EbeneWarnung=CheckRange((unsigned char)(hmiBlink&1),0,24));
}else{
(hmiVisibility.Layers.EbeneWarnung=1);
}


if(((((unsigned long)(unsigned short)Echtzeit.Jahr<(unsigned long)(unsigned short)2024))&(loc_MsgFalschesDatumAckn^1))){
(hmiVisibility.Layers.MldgDatumFalsch=0);
}else{
(hmiVisibility.Layers.MldgDatumFalsch=1);
}


if((hmiNutzungsdaten.Serviceintervalle.KontrolleUhrzeitErforderlich&(loc_MsgKontrUhrzeitAckn^1))){
(hmiVisibility.Layers.MldgKontrolleUhrzeit=0);
}


if(((((unsigned long)(unsigned char)Echtzeit.Stunde==(unsigned long)(unsigned char)12))&(((unsigned long)(unsigned char)Echtzeit.Minute==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)Echtzeit.Sekunde==(unsigned long)(unsigned char)0))&gStatusAnlage.Betrieb)){
(hmiVisibility.Layers.MldgStockkontrolle=0);
}


if(stdTick){
(loc_MsgFalschesDatumAckn=0);
(loc_MsgKontrUhrzeitAckn=0);
}


if((((signed long)hmiStatus.CurUserLevel>(signed long)1))){
(hmiVisibility.Allgemein.EbeneService=0);
}else{
(hmiVisibility.Allgemein.EbeneService=1);
}


if((((signed long)hmiStatus.CurUserLevel>(signed long)2))){
(hmiVisibility.Allgemein.EbeneLasco=0);
}else{
(hmiVisibility.Allgemein.EbeneLasco=1);
}


if(hmiParameter.Allgemein.PasswortschutzAus){
(hmiVisibility.Buttons.LogoutButton=1);
}else{
(hmiVisibility.Buttons.LogoutButton=0);
}


if(((((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)4))|(((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)5)))){
(hmiVisibility.Allgemein.HB4000=0);
}else{
(hmiVisibility.Allgemein.HB4000=1);
}


if(((((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)4))|(((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)5)))){
(hmiVisibility.Allgemein.HB4000Hide=1);
}else{
(hmiVisibility.Allgemein.HB4000Hide=0);
}







if(((((signed long)hmiStatus.CurPage==(signed long)1))&(((signed long)hmiStatus.CurUserLevel>(signed long)0)))){
(hmiActions.cmdChangePageTo=10);
}



if(((((signed long)hmiStatus.CurUserLevel==(signed long)0))&(((signed long)hmiStatus.CurPage!=(signed long)0))&(((signed long)hmiStatus.CurPage!=(signed long)1))&(hmiParameter.Allgemein.PasswortschutzAus^1))){
(hmiActions.cmdChangePageTo=1);
}


if((hmiButtons.SicherheitshinweisOk&~Edge0000100000&1?((Edge0000100000=hmiButtons.SicherheitshinweisOk&1),1):((Edge0000100000=hmiButtons.SicherheitshinweisOk&1),0))){
if(hmiParameter.Allgemein.PasswortschutzAus){
(hmiActions.cmdChangePageTo=10);
}else{
(hmiActions.cmdChangePageTo=1);
}
}



if(((((signed long)hmiStatus.CurUserLevel!=(signed long)0))&(((signed long)hmiStatus.CurPage!=(signed long)0))&((gStatusAnlage.Fehler.SummeFehler&~Edge0000100001&1?((Edge0000100001=gStatusAnlage.Fehler.SummeFehler&1),1):((Edge0000100001=gStatusAnlage.Fehler.SummeFehler&1),0))|(gStatusAnlage.Fehler.SummeWarnung&~Edge0000100002&1?((Edge0000100002=gStatusAnlage.Fehler.SummeWarnung&1),1):((Edge0000100002=gStatusAnlage.Fehler.SummeWarnung&1),0))))){
(hmiActions.cmdChangePageTo=100);
}








if(hmiButtons.showSensoren){
(hmiVisibility.Layers.DetailansichtSensoren=0);
}else{
(hmiVisibility.Layers.DetailansichtSensoren=1);
}



(hmiSensoren.FrischluftTemp=gStatusAnlage.FrischluftTemperatur);
(hmiSensoren.FrischluftFeuchte=gStatusAnlage.FrischluftFeuchte);
(hmiSensoren.FrischluftSattDefizit=gStatusAnlage.Berechnungen.FrischluftSattDefizit);

(hmiSensoren.DachluftTemp=gStatusAnlage.DachluftTemperatur);
(hmiSensoren.DachluftFeuchte=gStatusAnlage.DachluftFeuchte);
(hmiSensoren.DachluftSattDefizit=gStatusAnlage.Berechnungen.DachluftSattDefizit);

(hmiSensoren.TrockenluftTemp=gStatusAnlage.TrockenluftTemperatur);
(hmiSensoren.TrockenluftFeuchte=gStatusAnlage.TrockenluftFeuchte);
(hmiSensoren.TrockenluftSattDefizit=gStatusAnlage.Berechnungen.TrockenluftSattDefizit);

(hmiSensoren.AbluftTemp=gStatusAnlage.AbluftTemperatur);
(hmiSensoren.AbluftFeuchte=gStatusAnlage.AbluftFeuchte);
(hmiSensoren.AbluftSattDefizit=gStatusAnlage.Berechnungen.AbluftSattDefizit);

(hmiSensoren.EintrittTemp=gStatusAnlage.EintrittTemperatur);
(hmiSensoren.EintrittFeuchte=gStatusAnlage.EintrittFeuchte);
(hmiSensoren.AustrittTemp=gStatusAnlage.AustrittTemperatur);
(hmiSensoren.AustrittFeuchte=gStatusAnlage.AustrittFeuchte);

if(((doVentilator1Ein|doVentilator2Ein)|Boxen.EntfeuchterInselbetrieb)){
(hmiSensoren.KanaldruckmmH2O=gStatusAnlage.Berechnungen.Kanaldruck_mmWs);
(hmiSensoren.KanaldruckPa=gStatusAnlage.Kanaldruck);
}else{
(hmiSensoren.KanaldruckmmH2O=(0.00000000000000000000E+00));
(hmiSensoren.KanaldruckPa=(0.00000000000000000000E+00));
}

if(((doVentilator1Ein|doVentilator2Ein)|Boxen.EntfeuchterInselbetrieb)){
(hmiSensoren.Luftgeschwindigkeit=gStatusAnlage.Luftgeschwindigkeit);
(hmiSensoren.LuftmengeAktuell=gStatusAnlage.LuftmengeAktuell);
}else{
(hmiSensoren.Luftgeschwindigkeit=(0.00000000000000000000E+00));
(hmiSensoren.LuftmengeAktuell=(0.00000000000000000000E+00));
}


(hmiSensoren.NiederdruckModul1=gStatusAnlage.NiederdruckModul1);
(hmiSensoren.NiederdruckModul2=gStatusAnlage.NiederdruckModul2);
(hmiSensoren.HochdruckModul1=gStatusAnlage.HochdruckModul1);
(hmiSensoren.HochdruckModul2=gStatusAnlage.HochdruckModul2);



if(hmiParameter.Ausstattung.SensorAbluft){
(hmiVisibility.Allgemein.Abluft=0);
}else{
(hmiVisibility.Allgemein.Abluft=1);
}


if(hmiParameter.Ausstattung.SensorDachluft){
(hmiVisibility.Allgemein.Dachluft=0);
}else{
(hmiVisibility.Allgemein.Dachluft=1);
}


if(hmiParameter.Ausstattung.SensorFrischluft){
(hmiVisibility.Allgemein.Frischluft=0);
}else{
(hmiVisibility.Allgemein.Frischluft=1);
}


if(hmiParameter.Ausstattung.SensorKanaldruck){
(hmiVisibility.Allgemein.Kanaldruck=0);
}else{
(hmiVisibility.Allgemein.Kanaldruck=1);
}


if(hmiParameter.Ausstattung.SensorLuftgeschwindigkeit){
(hmiVisibility.Allgemein.Luftgeschwindigkeit=0);
}else{
(hmiVisibility.Allgemein.Luftgeschwindigkeit=1);
}


if(hmiParameter.Ausstattung.SensorTrockenluft){
(hmiVisibility.Allgemein.Trockenluft=0);
}else{
(hmiVisibility.Allgemein.Trockenluft=1);
}







if((hmiParameter.Ausstattung.Ventilator1&hmiParameter.Ausstattung.Ventilator2)){
(hmiVisibility.Layers.UebersichtZweiVentilatoren=0);
(hmiVisibility.Layers.UebersichtEinVentilator=1);
}else{
(hmiVisibility.Layers.UebersichtZweiVentilatoren=1);
(hmiVisibility.Layers.UebersichtEinVentilator=0);
}



if(Aktoren.VentUndKlappen.FehlerFuVentilator1){
(hmiStatus.Ventilator1.BargraphAktiv=1);
(hmiStatus.Ventilator1.BargraphInaktiv=0);
(hmiStatus.Ventilator1.FarbeDrehzahl=5);
(hmiStatus.Ventilator1.FarbeIcon=4);
(hmiStatus.Ventilator1.IstDrehzahl=(0.00000000000000000000E+00));
}else if(Aktoren.VentUndKlappen.FreigabeVentilator1Out){
(hmiStatus.Ventilator1.BargraphAktiv=0);
(hmiStatus.Ventilator1.BargraphInaktiv=1);
(hmiStatus.Ventilator1.FarbeDrehzahl=7);
(hmiStatus.Ventilator1.FarbeIcon=3);
(hmiStatus.Ventilator1.IstDrehzahl=Aktoren.VentUndKlappen.DrehzahlVent1Out);
}else{
(hmiStatus.Ventilator1.BargraphAktiv=1);
(hmiStatus.Ventilator1.BargraphInaktiv=0);
(hmiStatus.Ventilator1.FarbeDrehzahl=5);
(hmiStatus.Ventilator1.FarbeIcon=2);
(hmiStatus.Ventilator1.IstDrehzahl=(0.00000000000000000000E+00));
}



if(hmiParameter.Ausstattung.Ventilator2){
if(Aktoren.VentUndKlappen.FehlerFuVentilator2){
(hmiStatus.Ventilator2.BargraphAktiv=1);
(hmiStatus.Ventilator2.BargraphInaktiv=0);
(hmiStatus.Ventilator2.FarbeDrehzahl=5);
(hmiStatus.Ventilator2.FarbeIcon=4);
(hmiStatus.Ventilator2.IstDrehzahl=(0.00000000000000000000E+00));
}else if(Aktoren.VentUndKlappen.FreigabeVentilator2Out){
(hmiStatus.Ventilator2.BargraphAktiv=0);
(hmiStatus.Ventilator2.BargraphInaktiv=1);
(hmiStatus.Ventilator2.FarbeDrehzahl=6);
(hmiStatus.Ventilator2.FarbeIcon=3);
(hmiStatus.Ventilator2.IstDrehzahl=Aktoren.VentUndKlappen.DrehzahlVent2Out);
}else{
(hmiStatus.Ventilator2.BargraphAktiv=1);
(hmiStatus.Ventilator2.BargraphInaktiv=0);
(hmiStatus.Ventilator2.FarbeDrehzahl=5);
(hmiStatus.Ventilator2.FarbeIcon=2);
(hmiStatus.Ventilator2.IstDrehzahl=(0.00000000000000000000E+00));
}
}







if(hmiButtons.showVentilatoren){
(hmiVisibility.Layers.DetailansichtVentilatoren=0);
}else{
(hmiVisibility.Layers.DetailansichtVentilatoren=1);
}


if(hmiParameter.Ausstattung.LuftmngReglerFrischlVent1){
(hmiStatus.Ventilator1.LuftmengenregFrischlSperre=0);
if(hmiParameter.Ventilator1.LuftmengenregFrischluftEin){
(hmiStatus.Ventilator1.EingabefeldFixdrehzFrischl=1);
(hmiStatus.Ventilator1.EingabefeldLuftmengeFrischl=0);
}else{
(hmiStatus.Ventilator1.EingabefeldFixdrehzFrischl=0);
(hmiStatus.Ventilator1.EingabefeldLuftmengeFrischl=1);
}
}else{
(hmiParameter.Ventilator1.LuftmengenregFrischluftEin=0);
(hmiStatus.Ventilator1.LuftmengenregFrischlSperre=1);
(hmiStatus.Ventilator1.EingabefeldFixdrehzFrischl=0);
(hmiStatus.Ventilator1.EingabefeldLuftmengeFrischl=1);
}

if((hmiParameter.Ausstattung.Umschaltklappe1|hmiParameter.Ausstattung.Umschaltklappe2)){
(hmiStatus.Ventilator1.Umluftbetrieb=0);
if(hmiParameter.Ausstattung.LuftmngReglerUmluftVent1){
(hmiStatus.Ventilator1.LuftmengenregUmluftSperre=0);
if(hmiParameter.Ventilator1.LuftmengenregUmluftEin){
(hmiStatus.Ventilator1.EingabefeldFixdrehzUmluft=1);
(hmiStatus.Ventilator1.EingabefeldLuftmengeUmluft=0);
}else{
(hmiStatus.Ventilator1.EingabefeldFixdrehzUmluft=0);
(hmiStatus.Ventilator1.EingabefeldLuftmengeUmluft=1);
}
}else{
(hmiParameter.Ventilator1.LuftmengenregUmluftEin=0);
(hmiStatus.Ventilator1.LuftmengenregUmluftSperre=1);
(hmiStatus.Ventilator1.EingabefeldFixdrehzUmluft=0);
(hmiStatus.Ventilator1.EingabefeldLuftmengeUmluft=1);
}
}else{
(hmiStatus.Ventilator1.EingabefeldFixdrehzUmluft=1);
(hmiStatus.Ventilator1.EingabefeldLuftmengeUmluft=1);
(hmiStatus.Ventilator1.Umluftbetrieb=1);
}



if(hmiParameter.Ausstattung.Ventilator2){
if(hmiParameter.Ausstattung.SensorLuftgeschwindigkeit){
(hmiStatus.Ventilator2.Luftmenge=0);
}else{
(hmiStatus.Ventilator2.Luftmenge=1);
}
if(hmiParameter.Ausstattung.LuftmngReglerFrischlVent2){
(hmiStatus.Ventilator2.LuftmengenregFrischlSperre=0);
if(hmiParameter.Ventilator2.LuftmengenregFrischluftEin){
(hmiStatus.Ventilator2.EingabefeldFixdrehzFrischl=1);
(hmiStatus.Ventilator2.EingabefeldLuftmengeFrischl=0);
}else{
(hmiStatus.Ventilator2.EingabefeldFixdrehzFrischl=0);
(hmiStatus.Ventilator2.EingabefeldLuftmengeFrischl=1);
}
}else{
(hmiParameter.Ventilator2.LuftmengenregFrischluftEin=0);
(hmiStatus.Ventilator2.LuftmengenregFrischlSperre=1);
(hmiStatus.Ventilator2.EingabefeldFixdrehzFrischl=0);
(hmiStatus.Ventilator2.EingabefeldLuftmengeFrischl=1);
}

if((hmiParameter.Ausstattung.Umschaltklappe1|hmiParameter.Ausstattung.Umschaltklappe2)){
(hmiStatus.Ventilator2.Umluftbetrieb=0);
if(hmiParameter.Ausstattung.LuftmngReglerUmluftVent2){
(hmiStatus.Ventilator2.LuftmengenregUmluftSperre=0);
if(hmiParameter.Ventilator2.LuftmengenregUmluftEin){
(hmiStatus.Ventilator2.EingabefeldFixdrehzUmluft=1);
(hmiStatus.Ventilator2.EingabefeldLuftmengeUmluft=0);
}else{
(hmiStatus.Ventilator2.EingabefeldFixdrehzUmluft=0);
(hmiStatus.Ventilator2.EingabefeldLuftmengeUmluft=1);
}
}else{
(hmiParameter.Ventilator2.LuftmengenregUmluftEin=0);
(hmiStatus.Ventilator2.LuftmengenregUmluftSperre=1);
(hmiStatus.Ventilator2.EingabefeldFixdrehzUmluft=0);
(hmiStatus.Ventilator2.EingabefeldLuftmengeUmluft=1);
}
}else{
(hmiStatus.Ventilator2.Umluftbetrieb=1);
(hmiStatus.Ventilator2.EingabefeldFixdrehzUmluft=1);
(hmiStatus.Ventilator2.EingabefeldLuftmengeUmluft=1);
}
}else{
(hmiStatus.Ventilator2.BargraphAktiv=1);
(hmiStatus.Ventilator2.BargraphInaktiv=1);
(hmiStatus.Ventilator2.EingabefeldFixdrehzFrischl=1);
(hmiStatus.Ventilator2.EingabefeldFixdrehzUmluft=1);
(hmiStatus.Ventilator2.EingabefeldLuftmengeFrischl=1);
(hmiStatus.Ventilator2.EingabefeldLuftmengeUmluft=1);
(hmiStatus.Ventilator2.Umluftbetrieb=1);
(hmiStatus.Ventilator2.Luftmenge=1);
}



if(hmiParameter.Ausstattung.SensorDachluft){
(hmiStatus.Ventilator1.TextFrischluftDachluft=1);
(hmiStatus.Ventilator2.TextFrischluftDachluft=1);
}else{
(hmiStatus.Ventilator1.TextFrischluftDachluft=0);
(hmiStatus.Ventilator2.TextFrischluftDachluft=0);
}







if(((hmiParameter.Ausstattung.Ventilator1^1)&(hmiParameter.Ausstattung.Box1^1))){
(hmiVisibility.Layers.UebersichtInselbetrieb=0);
}else{
(hmiVisibility.Layers.UebersichtInselbetrieb=1);
}


if((gCmdAnlage.FehlerModul1|gCmdAnlage.FehlerModul2)){
(hmiStatus.Entfeuchter.StatusButtonInselbetrieb=22);
(hmiActions.cmdInselbetriebEntfeuchterEin=0);
}else if(hmiActions.cmdInselbetriebEntfeuchterEin){
(hmiStatus.Entfeuchter.StatusButtonInselbetrieb=24);
}else{
(hmiStatus.Entfeuchter.StatusButtonInselbetrieb=23);
}


if(diAnfEntfeuchterExtern){
(hmiStatus.Entfeuchter.IconAnforderungExtern=3);
}else{
(hmiStatus.Entfeuchter.IconAnforderungExtern=2);
}








if(gMindestlaufzOelsumpfOk){
(hmiVisibility.Allgemein.LaufzRestOelsumpf=1);
}else{
(hmiVisibility.Allgemein.LaufzRestOelsumpf=CheckRange((unsigned char)(hmiBlink2&1),0,24));
}


(hmiStatus.Entfeuchter.RestlaufzeitOelsumpfh=((((unsigned long)(hmiParameter.Entfeuchter.RestzeitLaufzOelsumpf))/((unsigned long)(CheckDivUdint(60000))))+1));



if(((hmiParameter.Entfeuchter.Aus^1)&(hmiParameter.Entfeuchter.Dauerbetrieb^1)&(hmiParameter.Entfeuchter.Automatikbetrieb^1))){
(hmiParameter.Entfeuchter.Aus=1);
}


if(hmiButtons.showEntfeuchter){
(hmiVisibility.Layers.DetailansichtEntfeuchter=0);
}else{
(hmiVisibility.Layers.DetailansichtEntfeuchter=1);
}


if(hmiButtons.showEntfeuchterFremd){
(hmiVisibility.Layers.DetailansichtEntfeuchterFremd=0);
}else{
(hmiVisibility.Layers.DetailansichtEntfeuchterFremd=1);
}


if((hmiParameter.Entfeuchter.Aus&~Edge0000100003&1?((Edge0000100003=hmiParameter.Entfeuchter.Aus&1),1):((Edge0000100003=hmiParameter.Entfeuchter.Aus&1),0))){
(hmiParameter.Entfeuchter.Dauerbetrieb=0);
(hmiParameter.Entfeuchter.Automatikbetrieb=0);
}else if((hmiParameter.Entfeuchter.Dauerbetrieb&~Edge0000100004&1?((Edge0000100004=hmiParameter.Entfeuchter.Dauerbetrieb&1),1):((Edge0000100004=hmiParameter.Entfeuchter.Dauerbetrieb&1),0))){
(hmiParameter.Entfeuchter.Aus=0);
(hmiParameter.Entfeuchter.Automatikbetrieb=0);
}else if((hmiParameter.Entfeuchter.Automatikbetrieb&~Edge0000100005&1?((Edge0000100005=hmiParameter.Entfeuchter.Automatikbetrieb&1),1):((Edge0000100005=hmiParameter.Entfeuchter.Automatikbetrieb&1),0))){
(hmiParameter.Entfeuchter.Aus=0);
(hmiParameter.Entfeuchter.Dauerbetrieb=0);
}


if((hmiParameter.Entfeuchter.Automatikbetrieb^1)){
(hmiStatus.Entfeuchter.EingabeFeuchteEinAusSperre=1);
}else{
(hmiStatus.Entfeuchter.EingabeFeuchteEinAusSperre=0);
}


if(hmiParameter.Ausstattung.Entfeuchter){
(hmiVisibility.Allgemein.Entfeuchter=0);
}else{
(hmiVisibility.Allgemein.Entfeuchter=1);
}


if((gModul2Vorhanden&hmiParameter.Ausstattung.Entfeuchter)){
(hmiVisibility.Allgemein.KompressorModul2=0);
}else{
(hmiVisibility.Allgemein.KompressorModul2=1);
}


if(hmiParameter.Ausstattung.Entfeuchter){
(hmiStatus.Entfeuchter.Status=CheckRange(gStatusAnlage.Aktor[CheckBounds(3,0,39)],0,26));
}else if(hmiParameter.Ausstattung.EntfeuchterFremd){
(hmiStatus.Entfeuchter.Status=CheckRange(gStatusAnlage.Aktor[CheckBounds(25,0,39)],0,26));
}
(hmiStatus.Entfeuchter.IstDrehzahlKompressor1=Aktoren.KompressorModul1.DrehzahlOut);
(hmiStatus.Entfeuchter.IstDrehzahlKompressor2=Aktoren.KompressorModul2.DrehzahlOut);

if((((signed long)hmiStatus.Entfeuchter.Status==(signed long)10))){
(hmiStatus.Entfeuchter.FarbeTextStatus=6);
(hmiStatus.Entfeuchter.StatusfeldAktiv=0);
(hmiStatus.Entfeuchter.StatusfeldInaktiv=1);
(hmiStatus.Entfeuchter.IconAbtauung=1);
}else if((((signed long)hmiStatus.Entfeuchter.Status==(signed long)9))){
(hmiStatus.Entfeuchter.FarbeTextStatus=5);
(hmiStatus.Entfeuchter.StatusfeldAktiv=1);
(hmiStatus.Entfeuchter.StatusfeldInaktiv=0);
(hmiStatus.Entfeuchter.IconAbtauung=1);
}else if((((signed long)hmiStatus.Entfeuchter.Status==(signed long)20))){
(hmiStatus.Entfeuchter.FarbeTextStatus=5);
(hmiStatus.Entfeuchter.StatusfeldAktiv=1);
(hmiStatus.Entfeuchter.StatusfeldInaktiv=0);
(hmiStatus.Entfeuchter.IconAbtauung=1);
}else if((((signed long)hmiStatus.Entfeuchter.Status==(signed long)17))){
(hmiStatus.Entfeuchter.FarbeTextStatus=6);
(hmiStatus.Entfeuchter.StatusfeldAktiv=0);
(hmiStatus.Entfeuchter.StatusfeldInaktiv=1);
if(hmiBlink){
(hmiStatus.Entfeuchter.IconAbtauung=0);
}else{
(hmiStatus.Entfeuchter.IconAbtauung=1);
}
}else{
(hmiStatus.Entfeuchter.FarbeTextStatus=5);
(hmiStatus.Entfeuchter.StatusfeldAktiv=1);
(hmiStatus.Entfeuchter.StatusfeldInaktiv=0);
(hmiStatus.Entfeuchter.IconAbtauung=1);
}







if(hmiButtons.showOfen){
(hmiVisibility.Layers.DetailansichtOfen=0);
}else{
(hmiVisibility.Layers.DetailansichtOfen=1);
}


if(((hmiParameter.Warmluftofen.Aus^1)&(hmiParameter.Warmluftofen.DauerbetriebEin^1)&(hmiParameter.Warmluftofen.AutomatikbetriebEin^1))){
(hmiParameter.Warmluftofen.Aus=1);
}


if((hmiParameter.Warmluftofen.Aus&~Edge0000100006&1?((Edge0000100006=hmiParameter.Warmluftofen.Aus&1),1):((Edge0000100006=hmiParameter.Warmluftofen.Aus&1),0))){
(hmiParameter.Warmluftofen.DauerbetriebEin=0);
(hmiParameter.Warmluftofen.AutomatikbetriebEin=0);
}else if((hmiParameter.Warmluftofen.DauerbetriebEin&~Edge0000100007&1?((Edge0000100007=hmiParameter.Warmluftofen.DauerbetriebEin&1),1):((Edge0000100007=hmiParameter.Warmluftofen.DauerbetriebEin&1),0))){
(hmiParameter.Warmluftofen.Aus=0);
(hmiParameter.Warmluftofen.AutomatikbetriebEin=0);
}else if((hmiParameter.Warmluftofen.AutomatikbetriebEin&~Edge0000100008&1?((Edge0000100008=hmiParameter.Warmluftofen.AutomatikbetriebEin&1),1):((Edge0000100008=hmiParameter.Warmluftofen.AutomatikbetriebEin&1),0))){
(hmiParameter.Warmluftofen.Aus=0);
(hmiParameter.Warmluftofen.DauerbetriebEin=0);
}



if((hmiParameter.Ausstattung.Warmluftofen&hmiParameter.Ausstattung.Scheitholzofen)){
(hmiStatus.WarmluftScheitholzofen.TextindexUeberschrift=2);
}else if(hmiParameter.Ausstattung.Scheitholzofen){
(hmiStatus.WarmluftScheitholzofen.TextindexUeberschrift=1);
}else{
(hmiStatus.WarmluftScheitholzofen.TextindexUeberschrift=0);
}


if((hmiParameter.Warmluftofen.AutomatikbetriebEin^1)){
(hmiStatus.WarmluftScheitholzofen.EingabeSattDefizitSperre=1);
}else{
(hmiStatus.WarmluftScheitholzofen.EingabeSattDefizitSperre=0);
}


if(hmiParameter.Ausstattung.Brandschutzklappe){
(hmiVisibility.Allgemein.Brandschutzklappe=0);
}else{
(hmiVisibility.Allgemein.Brandschutzklappe=1);
}


if(hmiParameter.Ausstattung.Scheitholzofen){
(hmiVisibility.Allgemein.Scheitholzofen=0);
}else{
(hmiVisibility.Allgemein.Scheitholzofen=1);
}


if(hmiParameter.Ausstattung.Warmluftofen){
(hmiVisibility.Allgemein.Warmluftofen=0);
}else{
(hmiVisibility.Allgemein.Warmluftofen=1);
}



if(hmiParameter.Ausstattung.WarmluftofenTempVorgabe){
(hmiVisibility.Allgemein.TemperaturvorgWarmluftofen=0);
}else{
(hmiVisibility.Allgemein.TemperaturvorgWarmluftofen=1);
}


if(hmiParameter.Ausstattung.Warmluftofen){
(hmiStatus.WarmluftScheitholzofen.StatusWarmluftofen=CheckRange(gStatusAnlage.Aktor[CheckBounds(20,0,39)],0,26));
if((((signed long)hmiStatus.WarmluftScheitholzofen.StatusWarmluftofen==(signed long)10))){
(hmiStatus.WarmluftScheitholzofen.FarbeStatustextWlo=6);
(hmiStatus.WarmluftScheitholzofen.StatusfeldWloAktiv=0);
(hmiStatus.WarmluftScheitholzofen.StatusfeldWloInaktiv=1);
}else if((((signed long)hmiStatus.WarmluftScheitholzofen.StatusWarmluftofen==(signed long)9))){
(hmiStatus.WarmluftScheitholzofen.FarbeStatustextWlo=5);
(hmiStatus.WarmluftScheitholzofen.StatusfeldWloAktiv=1);
(hmiStatus.WarmluftScheitholzofen.StatusfeldWloInaktiv=0);
}else if((((signed long)hmiStatus.WarmluftScheitholzofen.StatusWarmluftofen==(signed long)19))){
if(hmiBlink){
(hmiStatus.WarmluftScheitholzofen.FarbeStatustextWlo=5);
(hmiStatus.WarmluftScheitholzofen.StatusfeldWloAktiv=1);
(hmiStatus.WarmluftScheitholzofen.StatusfeldWloInaktiv=0);
}else{
(hmiStatus.WarmluftScheitholzofen.FarbeStatustextWlo=6);
(hmiStatus.WarmluftScheitholzofen.StatusfeldWloAktiv=0);
(hmiStatus.WarmluftScheitholzofen.StatusfeldWloInaktiv=1);
}
}else{
(hmiStatus.WarmluftScheitholzofen.FarbeStatustextWlo=5);
(hmiStatus.WarmluftScheitholzofen.StatusfeldWloAktiv=1);
(hmiStatus.WarmluftScheitholzofen.StatusfeldWloInaktiv=0);
}
}else{
(hmiStatus.WarmluftScheitholzofen.StatusfeldWloAktiv=1);
(hmiStatus.WarmluftScheitholzofen.StatusfeldWloInaktiv=1);
}


if(Betriebsparameter.Ausstattung.Scheitholzofen){
(hmiStatus.WarmluftScheitholzofen.StatusScheitholzofen=CheckRange(gStatusAnlage.Aktor[CheckBounds(22,0,39)],0,26));
if((((signed long)hmiStatus.WarmluftScheitholzofen.StatusScheitholzofen==(signed long)10))){
(hmiStatus.WarmluftScheitholzofen.FarbeStatustextSho=6);
(hmiStatus.WarmluftScheitholzofen.StatusfeldShoAktiv=0);
(hmiStatus.WarmluftScheitholzofen.StatusfeldShoInaktiv=1);
}else if((((signed long)hmiStatus.WarmluftScheitholzofen.StatusScheitholzofen==(signed long)19))){
if(hmiBlink){
(hmiStatus.WarmluftScheitholzofen.FarbeStatustextSho=5);
(hmiStatus.WarmluftScheitholzofen.StatusfeldShoAktiv=1);
(hmiStatus.WarmluftScheitholzofen.StatusfeldShoInaktiv=0);
}else{
(hmiStatus.WarmluftScheitholzofen.FarbeStatustextSho=6);
(hmiStatus.WarmluftScheitholzofen.StatusfeldShoAktiv=0);
(hmiStatus.WarmluftScheitholzofen.StatusfeldShoInaktiv=1);
}
}else{
(hmiStatus.WarmluftScheitholzofen.FarbeStatustextSho=5);
(hmiStatus.WarmluftScheitholzofen.StatusfeldShoAktiv=1);
(hmiStatus.WarmluftScheitholzofen.StatusfeldShoInaktiv=0);
}
}else{
(hmiStatus.WarmluftScheitholzofen.StatusfeldShoAktiv=1);
(hmiStatus.WarmluftScheitholzofen.StatusfeldShoInaktiv=1);
}


if(hmiParameter.Ausstattung.Brandschutzklappe){
(hmiStatus.Brandschutzklappe.Status=CheckRange(gStatusAnlage.Aktor[CheckBounds(24,0,39)],0,26));
if((((signed long)hmiStatus.Brandschutzklappe.Status==(signed long)12))){
(hmiStatus.Brandschutzklappe.FarbeStatustext=6);
(hmiStatus.Brandschutzklappe.StatusfeldAktiv=0);
(hmiStatus.Brandschutzklappe.StatusfeldInaktiv=1);
}else{
(hmiStatus.Brandschutzklappe.FarbeStatustext=5);
(hmiStatus.Brandschutzklappe.StatusfeldAktiv=1);
(hmiStatus.Brandschutzklappe.StatusfeldInaktiv=0);
}
}else{
(hmiStatus.Brandschutzklappe.StatusfeldAktiv=1);
(hmiStatus.Brandschutzklappe.StatusfeldInaktiv=1);
}







if(((hmiParameter.Heizregister.Aus^1)&(hmiParameter.Heizregister.DauerbetriebEin^1)&(hmiParameter.Heizregister.AutomatikbetriebEin^1))){
(hmiParameter.Heizregister.Aus=1);
}


if(hmiButtons.showHeizregister){
(hmiVisibility.Layers.DetailansichtRegister=0);
}else{
(hmiVisibility.Layers.DetailansichtRegister=1);
}


if((hmiParameter.Heizregister.Aus&~Edge0000100009&1?((Edge0000100009=hmiParameter.Heizregister.Aus&1),1):((Edge0000100009=hmiParameter.Heizregister.Aus&1),0))){
(hmiParameter.Heizregister.DauerbetriebEin=0);
(hmiParameter.Heizregister.AutomatikbetriebEin=0);
}else if((hmiParameter.Heizregister.DauerbetriebEin&~Edge0000100010&1?((Edge0000100010=hmiParameter.Heizregister.DauerbetriebEin&1),1):((Edge0000100010=hmiParameter.Heizregister.DauerbetriebEin&1),0))){
(hmiParameter.Heizregister.Aus=0);
(hmiParameter.Heizregister.AutomatikbetriebEin=0);
}else if((hmiParameter.Heizregister.AutomatikbetriebEin&~Edge0000100011&1?((Edge0000100011=hmiParameter.Heizregister.AutomatikbetriebEin&1),1):((Edge0000100011=hmiParameter.Heizregister.AutomatikbetriebEin&1),0))){
(hmiParameter.Heizregister.Aus=0);
(hmiParameter.Heizregister.DauerbetriebEin=0);
}


if((hmiParameter.Heizregister.AutomatikbetriebEin^1)){
(hmiStatus.Heizregister.EingabeSattDefizitSperre=1);
}else{
(hmiStatus.Heizregister.EingabeSattDefizitSperre=0);
}


if(hmiParameter.Ausstattung.HeizregisterDrehzahlvorgabe){
(hmiVisibility.Allgemein.TemperaturvorgHeizregister=0);
}else{
(hmiVisibility.Allgemein.TemperaturvorgHeizregister=1);
}


(hmiStatus.Heizregister.Status=CheckRange(gStatusAnlage.Aktor[CheckBounds(21,0,39)],0,26));
(hmiStatus.Heizregister.IstDrehzahl=Aktoren.Heizregister.DrehzahlHeizregisterOut);
if((((signed long)hmiStatus.Heizregister.Status==(signed long)10))){
(hmiStatus.Heizregister.FarbeStatustext=6);
(hmiStatus.Heizregister.StatusfeldAktiv=0);
(hmiStatus.Heizregister.StatusfeldInaktiv=1);
}else if((((signed long)hmiStatus.Heizregister.Status==(signed long)9))){
(hmiStatus.Heizregister.FarbeStatustext=5);
(hmiStatus.Heizregister.StatusfeldAktiv=1);
(hmiStatus.Heizregister.StatusfeldInaktiv=0);
}else{
(hmiStatus.Heizregister.FarbeStatustext=5);
(hmiStatus.Heizregister.StatusfeldAktiv=1);
(hmiStatus.Heizregister.StatusfeldInaktiv=0);
}









if(hmiButtons.showKlappen){
(hmiVisibility.Layers.DetailansichtKlappen=0);
}else{
(hmiVisibility.Layers.DetailansichtKlappen=1);
}





if((hmiParameter.Ausstattung.Umschaltklappe1|hmiParameter.Ausstattung.Umschaltklappe2)){
(hmiVisibility.Allgemein.Umschaltklappen=0);
}else{
(hmiVisibility.Allgemein.Umschaltklappen=1);
}


if((((unsigned long)(unsigned char)hmiStatus.Umluftklappen.IndexBetriebsart==(unsigned long)(unsigned char)0))){
(hmiStatus.Umluftklappen.EingabeTempDifferenzSperre=0);
(hmiStatus.Umluftklappen.EingabeTempSchaltpunktSperre=0);
}else{
(hmiStatus.Umluftklappen.EingabeTempDifferenzSperre=1);
(hmiStatus.Umluftklappen.EingabeTempSchaltpunktSperre=1);
}



(TOF_VerzUmschaltungUmluftkl.IN=(hmiButtons.changeBetrArtUmluftklappen&~Edge0000100012&1?((Edge0000100012=hmiButtons.changeBetrArtUmluftklappen&1),1):((Edge0000100012=hmiButtons.changeBetrArtUmluftklappen&1),0)));;(TOF_VerzUmschaltungUmluftkl.PT=hmiParameter.Allgemein.VerzoegerungAenderungKlappen);;TOF(&TOF_VerzUmschaltungUmluftkl);
if(hmiButtons.changeBetrArtUmluftklappen){
(hmiButtons.changeBetrArtUmluftklappen=0);
if((((unsigned long)(unsigned char)hmiStatus.Umluftklappen.IndexBetriebsart<(unsigned long)(unsigned char)2))){
(hmiStatus.Umluftklappen.IndexBetriebsart=(hmiStatus.Umluftklappen.IndexBetriebsart+1));
}else{
(hmiStatus.Umluftklappen.IndexBetriebsart=0);
}
}
if((~TOF_VerzUmschaltungUmluftkl.Q&Edge0000100013&1?((Edge0000100013=TOF_VerzUmschaltungUmluftkl.Q&1),1):((Edge0000100013=TOF_VerzUmschaltungUmluftkl.Q&1),0))){
if((((unsigned long)(unsigned char)hmiStatus.Umluftklappen.IndexBetriebsart==(unsigned long)(unsigned char)0))){
(hmiParameter.Umschaltklappen.Automatik=1);
(hmiParameter.Umschaltklappen.Frischluft=0);
(hmiParameter.Umschaltklappen.Umluft=0);
}else if((((unsigned long)(unsigned char)hmiStatus.Umluftklappen.IndexBetriebsart==(unsigned long)(unsigned char)1))){
(hmiParameter.Umschaltklappen.Automatik=0);
(hmiParameter.Umschaltklappen.Frischluft=1);
(hmiParameter.Umschaltklappen.Umluft=0);
}else if((((unsigned long)(unsigned char)hmiStatus.Umluftklappen.IndexBetriebsart==(unsigned long)(unsigned char)2))){
(hmiParameter.Umschaltklappen.Automatik=0);
(hmiParameter.Umschaltklappen.Frischluft=0);
(hmiParameter.Umschaltklappen.Umluft=1);
}
}



if((((unsigned long)(unsigned char)hmiStatus.Umluftklappen.IndexBetriebsart==(unsigned long)(unsigned char)0))){
(hmiStatus.Umluftklappen.TextindexButton=0);
}else if((((unsigned long)(unsigned char)hmiStatus.Umluftklappen.IndexBetriebsart==(unsigned long)(unsigned char)1))){
if(hmiParameter.Ausstattung.SensorDachluft){
(hmiStatus.Umluftklappen.TextindexButton=2);
}else{
(hmiStatus.Umluftklappen.TextindexButton=1);
}
}else if((((unsigned long)(unsigned char)hmiStatus.Umluftklappen.IndexBetriebsart==(unsigned long)(unsigned char)2))){
(hmiStatus.Umluftklappen.TextindexButton=3);
}


if((hmiParameter.Ausstattung.Umschaltklappe1|hmiParameter.Ausstattung.Umschaltklappe2)){
if((hmiParameter.Ausstattung.SensorAbluft&(hmiParameter.Ausstattung.SensorDachluft|hmiParameter.Ausstattung.SensorFrischluft))){
(hmiStatus.Umluftklappen.EingabefeldTempDifferenz=0);
(hmiStatus.Umluftklappen.EingabefeldTempUmschaltung=1);
}else{
(hmiStatus.Umluftklappen.EingabefeldTempDifferenz=1);
(hmiStatus.Umluftklappen.EingabefeldTempUmschaltung=0);
}
}else{
(hmiStatus.Umluftklappen.EingabefeldTempDifferenz=1);
(hmiStatus.Umluftklappen.EingabefeldTempUmschaltung=1);
}






if((hmiParameter.Ausstattung.SensorAbluft&hmiParameter.Ausstattung.SensorDachluft)){
(hmiStatus.Umluftklappen.TextindexEingabeUmschaltpunkt=0);
}else if((hmiParameter.Ausstattung.SensorAbluft&hmiParameter.Ausstattung.SensorFrischluft)){
(hmiStatus.Umluftklappen.TextindexEingabeUmschaltpunkt=1);
}else if(hmiParameter.Ausstattung.SensorDachluft){
(hmiStatus.Umluftklappen.TextindexEingabeUmschaltpunkt=2);
}else{
(hmiStatus.Umluftklappen.TextindexEingabeUmschaltpunkt=3);
}


if((hmiParameter.Ausstattung.Umschaltklappe1|hmiParameter.Ausstattung.Umschaltklappe2)){
if(((((signed long)gStatusAnlage.Aktor[CheckBounds(8,0,39)]==(signed long)10))|(((signed long)gStatusAnlage.Aktor[CheckBounds(9,0,39)]==(signed long)10)))){
(hmiStatus.Umluftklappen.Status=10);
(hmiStatus.Umluftklappen.FarbeStatustext=6);
(hmiStatus.Umluftklappen.StatusfeldAktiv=0);
(hmiStatus.Umluftklappen.StatusfeldInaktiv=1);
}else if((((signed long)gStatusAnlage.Aktor[CheckBounds(8,0,39)]==(signed long)12))){
(hmiStatus.Umluftklappen.Status=23);
(hmiStatus.Umluftklappen.FarbeStatustext=5);
(hmiStatus.Umluftklappen.StatusfeldAktiv=1);
(hmiStatus.Umluftklappen.StatusfeldInaktiv=0);
}else if((((signed long)gStatusAnlage.Aktor[CheckBounds(8,0,39)]==(signed long)13))){
(hmiStatus.Umluftklappen.FarbeStatustext=5);
(hmiStatus.Umluftklappen.StatusfeldAktiv=1);
(hmiStatus.Umluftklappen.StatusfeldInaktiv=0);
if(hmiParameter.Ausstattung.SensorDachluft){
(hmiStatus.Umluftklappen.Status=22);
}else{
(hmiStatus.Umluftklappen.Status=21);
}
}else if(((((signed long)gStatusAnlage.Aktor[CheckBounds(8,0,39)]==(signed long)9))|(((signed long)gStatusAnlage.Aktor[CheckBounds(9,0,39)]==(signed long)9)))){
(hmiStatus.Umluftklappen.Status=9);
(hmiStatus.Umluftklappen.FarbeStatustext=5);
(hmiStatus.Umluftklappen.StatusfeldAktiv=1);
(hmiStatus.Umluftklappen.StatusfeldInaktiv=0);
}
}else{
(hmiStatus.Umluftklappen.StatusfeldAktiv=1);
(hmiStatus.Umluftklappen.StatusfeldInaktiv=1);
}






if(hmiParameter.Ausstattung.Abluftventilator){
(hmiVisibility.Allgemein.Abluftventilator=0);
}else{
(hmiVisibility.Allgemein.Abluftventilator=1);
}


if((((unsigned long)(unsigned char)hmiStatus.Abluftventilator.IndexBetriebsart==(unsigned long)(unsigned char)0))){
(hmiStatus.Abluftventilator.EingabeMaxAbluftfeuchteSperre=0);
}else{
(hmiStatus.Abluftventilator.EingabeMaxAbluftfeuchteSperre=1);
}



(TOF_VerzUmschaltungAbluftvent.IN=(hmiButtons.changeBetrArtAbluftvent&~Edge0000100014&1?((Edge0000100014=hmiButtons.changeBetrArtAbluftvent&1),1):((Edge0000100014=hmiButtons.changeBetrArtAbluftvent&1),0)));;(TOF_VerzUmschaltungAbluftvent.PT=hmiParameter.Allgemein.VerzoegerungAenderungKlappen);;TOF(&TOF_VerzUmschaltungAbluftvent);
if(hmiButtons.changeBetrArtAbluftvent){
(hmiButtons.changeBetrArtAbluftvent=0);
if((((unsigned long)(unsigned char)hmiStatus.Abluftventilator.IndexBetriebsart<(unsigned long)(unsigned char)2))){
(hmiStatus.Abluftventilator.IndexBetriebsart=(hmiStatus.Abluftventilator.IndexBetriebsart+1));
}else{
(hmiStatus.Abluftventilator.IndexBetriebsart=0);
}
}
(hmiStatus.Abluftventilator.TextindexButton=hmiStatus.Abluftventilator.IndexBetriebsart);
if((~TOF_VerzUmschaltungAbluftvent.Q&Edge0000100015&1?((Edge0000100015=TOF_VerzUmschaltungAbluftvent.Q&1),1):((Edge0000100015=TOF_VerzUmschaltungAbluftvent.Q&1),0))){
if((((unsigned long)(unsigned char)hmiStatus.Abluftventilator.IndexBetriebsart==(unsigned long)(unsigned char)0))){
(hmiParameter.Abluftventilator.Automatik=1);
(hmiParameter.Abluftventilator.Ein=0);
}else if((((unsigned long)(unsigned char)hmiStatus.Abluftventilator.IndexBetriebsart==(unsigned long)(unsigned char)1))){
(hmiParameter.Abluftventilator.Automatik=0);
(hmiParameter.Abluftventilator.Ein=1);
}else if((((unsigned long)(unsigned char)hmiStatus.Abluftventilator.IndexBetriebsart==(unsigned long)(unsigned char)2))){
(hmiParameter.Abluftventilator.Automatik=0);
(hmiParameter.Abluftventilator.Ein=0);
}
}


(hmiStatus.Abluftventilator.Status=CheckRange(gStatusAnlage.Aktor[CheckBounds(19,0,39)],0,26));
if(hmiParameter.Ausstattung.Abluftventilator){
if((((signed long)hmiStatus.Abluftventilator.Status==(signed long)10))){
(hmiStatus.Abluftventilator.FarbeStatustext=6);
(hmiStatus.Abluftventilator.StatusfeldAktiv=0);
(hmiStatus.Abluftventilator.StatusfeldInaktiv=1);
}else{
(hmiStatus.Abluftventilator.FarbeStatustext=5);
(hmiStatus.Abluftventilator.StatusfeldAktiv=1);
(hmiStatus.Abluftventilator.StatusfeldInaktiv=0);
}
}else{
(hmiStatus.Abluftventilator.StatusfeldAktiv=1);
(hmiStatus.Abluftventilator.StatusfeldInaktiv=1);
}





if(hmiParameter.Ausstattung.Abluftklappe){
(hmiVisibility.Allgemein.Abluftklappe=0);
}else{
(hmiVisibility.Allgemein.Abluftklappe=1);
}


if((((unsigned long)(unsigned char)hmiStatus.Abluftklappe.IndexBetriebsart==(unsigned long)(unsigned char)0))){
(hmiStatus.Abluftklappe.EingabeMaxAbluftfeuchteSperre=0);
}else{
(hmiStatus.Abluftklappe.EingabeMaxAbluftfeuchteSperre=1);
}



(TOF_VerzUmschaltungAbluftklappe.IN=(hmiButtons.changeBetrArtAbluftklappe&~Edge0000100016&1?((Edge0000100016=hmiButtons.changeBetrArtAbluftklappe&1),1):((Edge0000100016=hmiButtons.changeBetrArtAbluftklappe&1),0)));;(TOF_VerzUmschaltungAbluftklappe.PT=hmiParameter.Allgemein.VerzoegerungAenderungKlappen);;TOF(&TOF_VerzUmschaltungAbluftklappe);
if(hmiButtons.changeBetrArtAbluftklappe){
(hmiButtons.changeBetrArtAbluftklappe=0);
if((((unsigned long)(unsigned char)hmiStatus.Abluftklappe.IndexBetriebsart<(unsigned long)(unsigned char)2))){
(hmiStatus.Abluftklappe.IndexBetriebsart=(hmiStatus.Abluftklappe.IndexBetriebsart+1));
}else{
(hmiStatus.Abluftklappe.IndexBetriebsart=0);
}
}
(hmiStatus.Abluftklappe.TextindexButton=hmiStatus.Abluftklappe.IndexBetriebsart);
if((~TOF_VerzUmschaltungAbluftklappe.Q&Edge0000100017&1?((Edge0000100017=TOF_VerzUmschaltungAbluftklappe.Q&1),1):((Edge0000100017=TOF_VerzUmschaltungAbluftklappe.Q&1),0))){
if((((unsigned long)(unsigned char)hmiStatus.Abluftklappe.IndexBetriebsart==(unsigned long)(unsigned char)0))){
(hmiParameter.Abluftklappe.Automatik=1);
(hmiParameter.Abluftklappe.Oeffnen=0);
(hmiParameter.Abluftklappe.Schliessen=0);
}else if((((unsigned long)(unsigned char)hmiStatus.Abluftklappe.IndexBetriebsart==(unsigned long)(unsigned char)1))){
(hmiParameter.Abluftklappe.Automatik=0);
(hmiParameter.Abluftklappe.Oeffnen=1);
(hmiParameter.Abluftklappe.Schliessen=0);
}else if((((unsigned long)(unsigned char)hmiStatus.Abluftklappe.IndexBetriebsart==(unsigned long)(unsigned char)2))){
(hmiParameter.Abluftklappe.Automatik=0);
(hmiParameter.Abluftklappe.Oeffnen=0);
(hmiParameter.Abluftklappe.Schliessen=1);
}
}


(hmiStatus.Abluftklappe.Status=CheckRange(gStatusAnlage.Aktor[CheckBounds(18,0,39)],0,26));
if(hmiParameter.Ausstattung.Abluftklappe){
if((((signed long)hmiStatus.Abluftklappe.Status==(signed long)10))){
(hmiStatus.Abluftklappe.FarbeStatustext=6);
(hmiStatus.Abluftklappe.StatusfeldAktiv=0);
(hmiStatus.Abluftklappe.StatusfeldInaktiv=1);
}else{
(hmiStatus.Abluftklappe.FarbeStatustext=5);
(hmiStatus.Abluftklappe.StatusfeldAktiv=1);
(hmiStatus.Abluftklappe.StatusfeldInaktiv=0);
}
}else{
(hmiStatus.Abluftklappe.StatusfeldAktiv=1);
(hmiStatus.Abluftklappe.StatusfeldInaktiv=1);
}





if(hmiParameter.Ausstattung.Bypassklappe){
(hmiVisibility.Allgemein.Bypassklappe=0);
}else{
(hmiVisibility.Allgemein.Bypassklappe=1);
}



(TOF_VerzUmschaltungBypassklappe.IN=(hmiButtons.changeBetrArtBypassklappe&~Edge0000100018&1?((Edge0000100018=hmiButtons.changeBetrArtBypassklappe&1),1):((Edge0000100018=hmiButtons.changeBetrArtBypassklappe&1),0)));;(TOF_VerzUmschaltungBypassklappe.PT=hmiParameter.Allgemein.VerzoegerungAenderungKlappen);;TOF(&TOF_VerzUmschaltungBypassklappe);
if(hmiButtons.changeBetrArtBypassklappe){
(hmiButtons.changeBetrArtBypassklappe=0);
if((((unsigned long)(unsigned char)hmiStatus.Bypassklappe.IndexBetriebsart<(unsigned long)(unsigned char)2))){
(hmiStatus.Bypassklappe.IndexBetriebsart=(hmiStatus.Bypassklappe.IndexBetriebsart+1));
}else{
(hmiStatus.Bypassklappe.IndexBetriebsart=0);
}
}
(hmiStatus.Bypassklappe.TextindexButton=hmiStatus.Bypassklappe.IndexBetriebsart);
if((~TOF_VerzUmschaltungBypassklappe.Q&Edge0000100019&1?((Edge0000100019=TOF_VerzUmschaltungBypassklappe.Q&1),1):((Edge0000100019=TOF_VerzUmschaltungBypassklappe.Q&1),0))){
if((((unsigned long)(unsigned char)hmiStatus.Bypassklappe.IndexBetriebsart==(unsigned long)(unsigned char)0))){
(hmiParameter.Bypassklappe.Automatik=1);
(hmiParameter.Bypassklappe.Oeffnen=0);
(hmiParameter.Bypassklappe.Schliessen=0);
}else if((((unsigned long)(unsigned char)hmiStatus.Bypassklappe.IndexBetriebsart==(unsigned long)(unsigned char)1))){
(hmiParameter.Bypassklappe.Automatik=0);
(hmiParameter.Bypassklappe.Oeffnen=1);
(hmiParameter.Bypassklappe.Schliessen=0);
}else if((((unsigned long)(unsigned char)hmiStatus.Bypassklappe.IndexBetriebsart==(unsigned long)(unsigned char)2))){
(hmiParameter.Bypassklappe.Automatik=0);
(hmiParameter.Bypassklappe.Oeffnen=0);
(hmiParameter.Bypassklappe.Schliessen=1);
}
}


(hmiStatus.Bypassklappe.Status=CheckRange(gStatusAnlage.Aktor[CheckBounds(7,0,39)],0,26));
if(hmiParameter.Ausstattung.Bypassklappe){
if((((signed long)hmiStatus.Bypassklappe.Status==(signed long)10))){
(hmiStatus.Bypassklappe.FarbeStatustext=6);
(hmiStatus.Bypassklappe.StatusfeldAktiv=0);
(hmiStatus.Bypassklappe.StatusfeldInaktiv=1);
}else{
(hmiStatus.Bypassklappe.FarbeStatustext=5);
(hmiStatus.Bypassklappe.StatusfeldAktiv=1);
(hmiStatus.Bypassklappe.StatusfeldInaktiv=0);
}
}else{
(hmiStatus.Bypassklappe.StatusfeldAktiv=1);
(hmiStatus.Bypassklappe.StatusfeldInaktiv=1);
}









if(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Aus){
(hmiStatus.Box1.AnzeigeLaufRestzeit=1);
(hmiStatus.Box1.TextindexLaufzeit=0);
}else if(hmiParameter.Boxen[CheckBounds(1,1,6)-1].DauerbetriebEin){
(hmiStatus.Box1.AnzeigeLaufRestzeit=0);


if((fbSchlechtwetterBox1.WetterIstSchlecht&(Boxen.Box1In.LuftaufbIstVerfuegbar^1)&Boxen.Box1Out.BoxAktiv&(((unsigned long)fbSchlechtwetterBox1.SchlechtwetterPausezeit!=(unsigned long)0)))){

(loc_RestzeitSchlechtMillisek=(float)(Boxen.Box1Out.RestzeitSchlechtwetterPuls+60000));
(loc_RestzeitSchlechtStunden=((signed long)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))/CheckDivReal(60)))));
(loc_RestzeitSchlechtMinuten=(unsigned short)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))>=0.0?(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))+0.5:(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))-0.5));
(hmiStatus.Box1.TextindexLaufzeit=2);
(hmiStatus.Box1.LaufRestzeitMinuten=loc_RestzeitSchlechtMinuten);
(hmiStatus.Box1.LaufRestzeitStunden=(unsigned short)loc_RestzeitSchlechtStunden);

}else if((fbSchlechtwetterBox1.WetterIstSchlecht&(Boxen.Box1Out.BoxAktiv^1))){

(loc_RestzeitSchlechtMillisek=(float)(Boxen.Box1Out.RestzeitSchlechtwetterPause+60000));
(loc_RestzeitSchlechtStunden=((signed long)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))/CheckDivReal(60)))));
(loc_RestzeitSchlechtMinuten=(unsigned short)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))>=0.0?(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))+0.5:(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))-0.5));
(hmiStatus.Box1.TextindexLaufzeit=1);
(hmiStatus.Box1.LaufRestzeitMinuten=loc_RestzeitSchlechtMinuten);
(hmiStatus.Box1.LaufRestzeitStunden=(unsigned short)loc_RestzeitSchlechtStunden);

}else{
(hmiStatus.Box1.TextindexLaufzeit=0);
(hmiStatus.Box1.LaufRestzeitMinuten=(unsigned short)hmiNutzungsdaten.Bst.Box1Min);
(hmiStatus.Box1.LaufRestzeitStunden=(unsigned short)hmiNutzungsdaten.Bst.Box1Std);
}
}else if((hmiParameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebEin|hmiParameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungEin)){
(hmiStatus.Box1.AnzeigeLaufRestzeit=0);
(hmiStatus.Box1.LaufRestzeitMinuten=gStatusAnlage.RestlaufzeitenBoxen.Box1Minuten);
(hmiStatus.Box1.LaufRestzeitStunden=gStatusAnlage.RestlaufzeitenBoxen.Box1Stunden);
if(Boxen.Box1Out.BoxAktiv){
(hmiStatus.Box1.TextindexLaufzeit=2);
}else{
(hmiStatus.Box1.TextindexLaufzeit=1);
}
}


if(hmiParameter.Ausstattung.Box2){
if(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Aus){
(hmiStatus.Box2.AnzeigeLaufRestzeit=1);
(hmiStatus.Box2.TextindexLaufzeit=0);
}else if(hmiParameter.Boxen[CheckBounds(2,1,6)-1].DauerbetriebEin){
(hmiStatus.Box2.AnzeigeLaufRestzeit=0);


if((fbSchlechtwetterBox2.WetterIstSchlecht&(Boxen.Box2In.LuftaufbIstVerfuegbar^1)&Boxen.Box2Out.BoxAktiv&(((unsigned long)fbSchlechtwetterBox2.SchlechtwetterPausezeit!=(unsigned long)0)))){

(loc_RestzeitSchlechtMillisek=(float)(Boxen.Box2Out.RestzeitSchlechtwetterPuls+60000));
(loc_RestzeitSchlechtStunden=((signed long)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))/CheckDivReal(60)))));
(loc_RestzeitSchlechtMinuten=(unsigned short)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))>=0.0?(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))+0.5:(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))-0.5));
(hmiStatus.Box2.TextindexLaufzeit=2);
(hmiStatus.Box2.LaufRestzeitMinuten=loc_RestzeitSchlechtMinuten);
(hmiStatus.Box2.LaufRestzeitStunden=(unsigned short)loc_RestzeitSchlechtStunden);

}else if((fbSchlechtwetterBox2.WetterIstSchlecht&(Boxen.Box2Out.BoxAktiv^1))){

(loc_RestzeitSchlechtMillisek=(float)(Boxen.Box2Out.RestzeitSchlechtwetterPause+60000));
(loc_RestzeitSchlechtStunden=((signed long)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))/CheckDivReal(60)))));
(loc_RestzeitSchlechtMinuten=(unsigned short)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))>=0.0?(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))+0.5:(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))-0.5));
(hmiStatus.Box2.TextindexLaufzeit=1);
(hmiStatus.Box2.LaufRestzeitMinuten=loc_RestzeitSchlechtMinuten);
(hmiStatus.Box2.LaufRestzeitStunden=(unsigned short)loc_RestzeitSchlechtStunden);

}else{
(hmiStatus.Box2.TextindexLaufzeit=0);
(hmiStatus.Box2.LaufRestzeitMinuten=(unsigned short)hmiNutzungsdaten.Bst.Box2Min);
(hmiStatus.Box2.LaufRestzeitStunden=(unsigned short)hmiNutzungsdaten.Bst.Box2Std);
}
}else if((hmiParameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebEin|hmiParameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungEin)){
(hmiStatus.Box2.AnzeigeLaufRestzeit=0);
(hmiStatus.Box2.LaufRestzeitMinuten=gStatusAnlage.RestlaufzeitenBoxen.Box2Minuten);
(hmiStatus.Box2.LaufRestzeitStunden=gStatusAnlage.RestlaufzeitenBoxen.Box2Stunden);
if(Boxen.Box2Out.BoxAktiv){
(hmiStatus.Box2.TextindexLaufzeit=2);
}else{
(hmiStatus.Box2.TextindexLaufzeit=1);
}
}
}


if(hmiParameter.Ausstattung.Box3){
if(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Aus){
(hmiStatus.Box3.AnzeigeLaufRestzeit=1);
(hmiStatus.Box3.TextindexLaufzeit=0);
}else if(hmiParameter.Boxen[CheckBounds(3,1,6)-1].DauerbetriebEin){
(hmiStatus.Box3.AnzeigeLaufRestzeit=0);


if((fbSchlechtwetterBox3.WetterIstSchlecht&(Boxen.Box3In.LuftaufbIstVerfuegbar^1)&Boxen.Box3Out.BoxAktiv&(((unsigned long)fbSchlechtwetterBox3.SchlechtwetterPausezeit!=(unsigned long)0)))){

(loc_RestzeitSchlechtMillisek=(float)(Boxen.Box3Out.RestzeitSchlechtwetterPuls+60000));
(loc_RestzeitSchlechtStunden=((signed long)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))/CheckDivReal(60)))));
(loc_RestzeitSchlechtMinuten=(unsigned short)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))>=0.0?(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))+0.5:(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))-0.5));
(hmiStatus.Box3.TextindexLaufzeit=2);
(hmiStatus.Box3.LaufRestzeitMinuten=loc_RestzeitSchlechtMinuten);
(hmiStatus.Box3.LaufRestzeitStunden=(unsigned short)loc_RestzeitSchlechtStunden);

}else if((fbSchlechtwetterBox3.WetterIstSchlecht&(Boxen.Box3Out.BoxAktiv^1))){

(loc_RestzeitSchlechtMillisek=(float)(Boxen.Box3Out.RestzeitSchlechtwetterPause+60000));
(loc_RestzeitSchlechtStunden=((signed long)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))/CheckDivReal(60)))));
(loc_RestzeitSchlechtMinuten=(unsigned short)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))>=0.0?(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))+0.5:(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))-0.5));
(hmiStatus.Box3.TextindexLaufzeit=1);
(hmiStatus.Box3.LaufRestzeitMinuten=loc_RestzeitSchlechtMinuten);
(hmiStatus.Box3.LaufRestzeitStunden=(unsigned short)loc_RestzeitSchlechtStunden);

}else{
(hmiStatus.Box3.TextindexLaufzeit=0);
(hmiStatus.Box3.LaufRestzeitMinuten=(unsigned short)hmiNutzungsdaten.Bst.Box3Min);
(hmiStatus.Box3.LaufRestzeitStunden=(unsigned short)hmiNutzungsdaten.Bst.Box3Std);
}
}else if((hmiParameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebEin|hmiParameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungEin)){
(hmiStatus.Box3.AnzeigeLaufRestzeit=0);
(hmiStatus.Box3.LaufRestzeitMinuten=gStatusAnlage.RestlaufzeitenBoxen.Box3Minuten);
(hmiStatus.Box3.LaufRestzeitStunden=gStatusAnlage.RestlaufzeitenBoxen.Box3Stunden);
if(Boxen.Box3Out.BoxAktiv){
(hmiStatus.Box3.TextindexLaufzeit=2);
}else{
(hmiStatus.Box3.TextindexLaufzeit=1);
}
}
}


if(hmiParameter.Ausstattung.Box4){
if(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Aus){
(hmiStatus.Box4.AnzeigeLaufRestzeit=1);
(hmiStatus.Box4.TextindexLaufzeit=0);
}else if(hmiParameter.Boxen[CheckBounds(4,1,6)-1].DauerbetriebEin){
(hmiStatus.Box4.AnzeigeLaufRestzeit=0);


if((fbSchlechtwetterBox4.WetterIstSchlecht&(Boxen.Box4In.LuftaufbIstVerfuegbar^1)&Boxen.Box4Out.BoxAktiv&(((unsigned long)fbSchlechtwetterBox4.SchlechtwetterPausezeit!=(unsigned long)0)))){

(loc_RestzeitSchlechtMillisek=(float)(Boxen.Box4Out.RestzeitSchlechtwetterPuls+60000));
(loc_RestzeitSchlechtStunden=((signed long)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))/CheckDivReal(60)))));
(loc_RestzeitSchlechtMinuten=(unsigned short)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))>=0.0?(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))+0.5:(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))-0.5));
(hmiStatus.Box4.TextindexLaufzeit=2);
(hmiStatus.Box4.LaufRestzeitMinuten=loc_RestzeitSchlechtMinuten);
(hmiStatus.Box4.LaufRestzeitStunden=(unsigned short)loc_RestzeitSchlechtStunden);

}else if((fbSchlechtwetterBox4.WetterIstSchlecht&(Boxen.Box4Out.BoxAktiv^1))){

(loc_RestzeitSchlechtMillisek=(float)(Boxen.Box4Out.RestzeitSchlechtwetterPause+60000));
(loc_RestzeitSchlechtStunden=((signed long)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))/CheckDivReal(60)))));
(loc_RestzeitSchlechtMinuten=(unsigned short)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))>=0.0?(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))+0.5:(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))-0.5));
(hmiStatus.Box4.TextindexLaufzeit=1);
(hmiStatus.Box4.LaufRestzeitMinuten=loc_RestzeitSchlechtMinuten);
(hmiStatus.Box4.LaufRestzeitStunden=(unsigned short)loc_RestzeitSchlechtStunden);

}else{
(hmiStatus.Box4.TextindexLaufzeit=0);
(hmiStatus.Box4.LaufRestzeitMinuten=(unsigned short)hmiNutzungsdaten.Bst.Box4Min);
(hmiStatus.Box4.LaufRestzeitStunden=(unsigned short)hmiNutzungsdaten.Bst.Box4Std);
}
}else if((hmiParameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebEin|hmiParameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungEin)){
(hmiStatus.Box4.AnzeigeLaufRestzeit=0);
(hmiStatus.Box4.LaufRestzeitMinuten=gStatusAnlage.RestlaufzeitenBoxen.Box4Minuten);
(hmiStatus.Box4.LaufRestzeitStunden=gStatusAnlage.RestlaufzeitenBoxen.Box4Stunden);
if(Boxen.Box4Out.BoxAktiv){
(hmiStatus.Box4.TextindexLaufzeit=2);
}else{
(hmiStatus.Box4.TextindexLaufzeit=1);
}
}
}


if(hmiParameter.Ausstattung.Box5){
if(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Aus){
(hmiStatus.Box5.AnzeigeLaufRestzeit=1);
(hmiStatus.Box5.TextindexLaufzeit=0);
}else if(hmiParameter.Boxen[CheckBounds(5,1,6)-1].DauerbetriebEin){
(hmiStatus.Box5.AnzeigeLaufRestzeit=0);


if((fbSchlechtwetterBox5.WetterIstSchlecht&(Boxen.Box5In.LuftaufbIstVerfuegbar^1)&Boxen.Box5Out.BoxAktiv&(((unsigned long)fbSchlechtwetterBox5.SchlechtwetterPausezeit!=(unsigned long)0)))){

(loc_RestzeitSchlechtMillisek=(float)(Boxen.Box5Out.RestzeitSchlechtwetterPuls+60000));
(loc_RestzeitSchlechtStunden=((signed long)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))/CheckDivReal(60)))));
(loc_RestzeitSchlechtMinuten=(unsigned short)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))>=0.0?(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))+0.5:(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))-0.5));
(hmiStatus.Box5.TextindexLaufzeit=2);
(hmiStatus.Box5.LaufRestzeitMinuten=loc_RestzeitSchlechtMinuten);
(hmiStatus.Box5.LaufRestzeitStunden=(unsigned short)loc_RestzeitSchlechtStunden);

}else if((fbSchlechtwetterBox5.WetterIstSchlecht&(Boxen.Box5Out.BoxAktiv^1))){

(loc_RestzeitSchlechtMillisek=(float)(Boxen.Box5Out.RestzeitSchlechtwetterPause+60000));
(loc_RestzeitSchlechtStunden=((signed long)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))/CheckDivReal(60)))));
(loc_RestzeitSchlechtMinuten=(unsigned short)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))>=0.0?(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))+0.5:(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))-0.5));
(hmiStatus.Box5.TextindexLaufzeit=1);
(hmiStatus.Box5.LaufRestzeitMinuten=loc_RestzeitSchlechtMinuten);
(hmiStatus.Box5.LaufRestzeitStunden=(unsigned short)loc_RestzeitSchlechtStunden);

}else{
(hmiStatus.Box5.TextindexLaufzeit=0);
(hmiStatus.Box5.LaufRestzeitMinuten=(unsigned short)hmiNutzungsdaten.Bst.Box5Min);
(hmiStatus.Box5.LaufRestzeitStunden=(unsigned short)hmiNutzungsdaten.Bst.Box5Std);
}
}else if((hmiParameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebEin|hmiParameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungEin)){
(hmiStatus.Box5.AnzeigeLaufRestzeit=0);
(hmiStatus.Box5.LaufRestzeitMinuten=gStatusAnlage.RestlaufzeitenBoxen.Box5Minuten);
(hmiStatus.Box5.LaufRestzeitStunden=gStatusAnlage.RestlaufzeitenBoxen.Box5Stunden);
if(Boxen.Box5Out.BoxAktiv){
(hmiStatus.Box5.TextindexLaufzeit=2);
}else{
(hmiStatus.Box5.TextindexLaufzeit=1);
}
}
}


if(hmiParameter.Ausstattung.Box6){
if(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Aus){
(hmiStatus.Box6.AnzeigeLaufRestzeit=1);
(hmiStatus.Box6.TextindexLaufzeit=0);
}else if(hmiParameter.Boxen[CheckBounds(6,1,6)-1].DauerbetriebEin){
(hmiStatus.Box6.AnzeigeLaufRestzeit=0);


if((fbSchlechtwetterBox6.WetterIstSchlecht&(Boxen.Box6In.LuftaufbIstVerfuegbar^1)&Boxen.Box6Out.BoxAktiv&(((unsigned long)fbSchlechtwetterBox6.SchlechtwetterPausezeit!=(unsigned long)0)))){

(loc_RestzeitSchlechtMillisek=(float)(Boxen.Box6Out.RestzeitSchlechtwetterPuls+60000));
(loc_RestzeitSchlechtStunden=((signed long)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))/CheckDivReal(60)))));
(loc_RestzeitSchlechtMinuten=(unsigned short)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))>=0.0?(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))+0.5:(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))-0.5));
(hmiStatus.Box6.TextindexLaufzeit=2);
(hmiStatus.Box6.LaufRestzeitMinuten=loc_RestzeitSchlechtMinuten);
(hmiStatus.Box6.LaufRestzeitStunden=(unsigned short)loc_RestzeitSchlechtStunden);

}else if((fbSchlechtwetterBox6.WetterIstSchlecht&(Boxen.Box6Out.BoxAktiv^1))){

(loc_RestzeitSchlechtMillisek=(float)(Boxen.Box6Out.RestzeitSchlechtwetterPause+60000));
(loc_RestzeitSchlechtStunden=((signed long)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))/CheckDivReal(60)))));
(loc_RestzeitSchlechtMinuten=(unsigned short)((((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))>=0.0?(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))+0.5:(((loc_RestzeitSchlechtMillisek/CheckDivReal(1000))/CheckDivReal(60))-(60*loc_RestzeitSchlechtStunden))-0.5));
(hmiStatus.Box6.TextindexLaufzeit=1);
(hmiStatus.Box6.LaufRestzeitMinuten=loc_RestzeitSchlechtMinuten);
(hmiStatus.Box6.LaufRestzeitStunden=(unsigned short)loc_RestzeitSchlechtStunden);

}else{
(hmiStatus.Box6.TextindexLaufzeit=0);
(hmiStatus.Box6.LaufRestzeitMinuten=(unsigned short)hmiNutzungsdaten.Bst.Box6Min);
(hmiStatus.Box6.LaufRestzeitStunden=(unsigned short)hmiNutzungsdaten.Bst.Box6Std);
}
}else if((hmiParameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebEin|hmiParameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungEin)){
(hmiStatus.Box6.AnzeigeLaufRestzeit=0);
(hmiStatus.Box6.LaufRestzeitMinuten=gStatusAnlage.RestlaufzeitenBoxen.Box6Minuten);
(hmiStatus.Box6.LaufRestzeitStunden=gStatusAnlage.RestlaufzeitenBoxen.Box6Stunden);
if(Boxen.Box6Out.BoxAktiv){
(hmiStatus.Box6.TextindexLaufzeit=2);
}else{
(hmiStatus.Box6.TextindexLaufzeit=1);
}
}
}








if(((hmiParameter.Boxen[CheckBounds(1,1,6)-1].Aus^1)&(hmiParameter.Boxen[CheckBounds(1,1,6)-1].DauerbetriebEin^1)&(hmiParameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebEin^1)&(hmiParameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungEin^1)&hmiParameter.Ausstattung.Box1)){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Aus=1);
}else if((hmiParameter.Ausstattung.Box1^1)){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Aus=1);
}

if(((hmiParameter.Boxen[CheckBounds(2,1,6)-1].Aus^1)&(hmiParameter.Boxen[CheckBounds(2,1,6)-1].DauerbetriebEin^1)&(hmiParameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebEin^1)&(hmiParameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungEin^1)&hmiParameter.Ausstattung.Box2)){
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Aus=1);
}else if((hmiParameter.Ausstattung.Box2^1)){
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Aus=1);
}

if(((hmiParameter.Boxen[CheckBounds(3,1,6)-1].Aus^1)&(hmiParameter.Boxen[CheckBounds(3,1,6)-1].DauerbetriebEin^1)&(hmiParameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebEin^1)&(hmiParameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungEin^1)&hmiParameter.Ausstattung.Box3)){
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Aus=1);
}else if((hmiParameter.Ausstattung.Box3^1)){
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Aus=1);
}

if(((hmiParameter.Boxen[CheckBounds(4,1,6)-1].Aus^1)&(hmiParameter.Boxen[CheckBounds(4,1,6)-1].DauerbetriebEin^1)&(hmiParameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebEin^1)&(hmiParameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungEin^1)&hmiParameter.Ausstattung.Box4)){
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Aus=1);
}else if((hmiParameter.Ausstattung.Box4^1)){
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Aus=1);
}

if(((hmiParameter.Boxen[CheckBounds(5,1,6)-1].Aus^1)&(hmiParameter.Boxen[CheckBounds(5,1,6)-1].DauerbetriebEin^1)&(hmiParameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebEin^1)&(hmiParameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungEin^1)&hmiParameter.Ausstattung.Box5)){
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Aus=1);
}else if((hmiParameter.Ausstattung.Box5^1)){
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Aus=1);
}

if(((hmiParameter.Boxen[CheckBounds(6,1,6)-1].Aus^1)&(hmiParameter.Boxen[CheckBounds(6,1,6)-1].DauerbetriebEin^1)&(hmiParameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebEin^1)&(hmiParameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungEin^1)&hmiParameter.Ausstattung.Box6)){
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Aus=1);
}else if((hmiParameter.Ausstattung.Box6^1)){
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Aus=1);
}



if((hmiBoxAktuell.Aus&~Edge0000100020&1?((Edge0000100020=hmiBoxAktuell.Aus&1),1):((Edge0000100020=hmiBoxAktuell.Aus&1),0))){
(hmiBoxAktuell.DauerbetriebEin=0);
(hmiBoxAktuell.IntervallbetriebEin=0);
(hmiBoxAktuell.NachtrocknungEin=0);
}else if((hmiBoxAktuell.DauerbetriebEin&~Edge0000100021&1?((Edge0000100021=hmiBoxAktuell.DauerbetriebEin&1),1):((Edge0000100021=hmiBoxAktuell.DauerbetriebEin&1),0))){
(hmiBoxAktuell.Aus=0);
(hmiBoxAktuell.IntervallbetriebEin=0);
(hmiBoxAktuell.NachtrocknungEin=0);
}else if((hmiBoxAktuell.IntervallbetriebEin&~Edge0000100022&1?((Edge0000100022=hmiBoxAktuell.IntervallbetriebEin&1),1):((Edge0000100022=hmiBoxAktuell.IntervallbetriebEin&1),0))){
(hmiBoxAktuell.Aus=0);
(hmiBoxAktuell.DauerbetriebEin=0);
(hmiBoxAktuell.NachtrocknungEin=0);
}else if((hmiBoxAktuell.NachtrocknungEin&~Edge0000100023&1?((Edge0000100023=hmiBoxAktuell.NachtrocknungEin&1),1):((Edge0000100023=hmiBoxAktuell.NachtrocknungEin&1),0))){
(hmiBoxAktuell.Aus=0);
(hmiBoxAktuell.DauerbetriebEin=0);
(hmiBoxAktuell.IntervallbetriebEin=0);
}



if(((hmiBoxAktuell.Aus^1)&(hmiBoxAktuell.DauerbetriebEin^1)&(hmiBoxAktuell.IntervallbetriebEin^1)&(hmiBoxAktuell.NachtrocknungEin^1))){
(hmiBoxAktuell.Aus=1);
}



(TOF_VerzBetriebsartBox.IN=((TOF_BoxAufgerufen.Q^1)&((hmiBoxAktuell.Aus^Edge0000100024&1?((Edge0000100024=hmiBoxAktuell.Aus&1),1):((Edge0000100024=hmiBoxAktuell.Aus&1),0))|(hmiBoxAktuell.DauerbetriebEin^Edge0000100025&1?((Edge0000100025=hmiBoxAktuell.DauerbetriebEin&1),1):((Edge0000100025=hmiBoxAktuell.DauerbetriebEin&1),0))|(hmiBoxAktuell.IntervallbetriebEin^Edge0000100026&1?((Edge0000100026=hmiBoxAktuell.IntervallbetriebEin&1),1):((Edge0000100026=hmiBoxAktuell.IntervallbetriebEin&1),0))|(hmiBoxAktuell.NachtrocknungEin^Edge0000100027&1?((Edge0000100027=hmiBoxAktuell.NachtrocknungEin&1),1):((Edge0000100027=hmiBoxAktuell.NachtrocknungEin&1),0)))));;(TOF_VerzBetriebsartBox.PT=Betriebsparameter.Allgemein.VerzUmschBetriebsartBoxen);;TOF(&TOF_VerzBetriebsartBox);



(TOF_BoxAufgerufen.IN=((hmiButtons.showBox1&~Edge0000100028&1?((Edge0000100028=hmiButtons.showBox1&1),1):((Edge0000100028=hmiButtons.showBox1&1),0))|(hmiButtons.showBox2&~Edge0000100029&1?((Edge0000100029=hmiButtons.showBox2&1),1):((Edge0000100029=hmiButtons.showBox2&1),0))|(hmiButtons.showBox3&~Edge0000100030&1?((Edge0000100030=hmiButtons.showBox3&1),1):((Edge0000100030=hmiButtons.showBox3&1),0))|(hmiButtons.showBox4&~Edge0000100031&1?((Edge0000100031=hmiButtons.showBox4&1),1):((Edge0000100031=hmiButtons.showBox4&1),0))|(hmiButtons.showBox5&~Edge0000100032&1?((Edge0000100032=hmiButtons.showBox5&1),1):((Edge0000100032=hmiButtons.showBox5&1),0))|(hmiButtons.showBox6&~Edge0000100033&1?((Edge0000100033=hmiButtons.showBox6&1),1):((Edge0000100033=hmiButtons.showBox6&1),0))));;(TOF_BoxAufgerufen.PT=(500));;TOF(&TOF_BoxAufgerufen);


if(TOF_VerzBetriebsartBox.Q){
(hmiBoxAktuell.RestzeitUmschaltverzBetriebsart=(hmiParameter.Allgemein.VerzUmschBetriebsartBoxen-(unsigned long)TOF_VerzBetriebsartBox.ET));
(hmiVisibility.Allgemein.UmschaltverzBetriebsartAktiv=0);
}else{
(hmiVisibility.Allgemein.UmschaltverzBetriebsartAktiv=1);
}








if(hmiBoxAktuell.IntervallbetriebEin){
(hmiVisibility.Buttons.IntervallEinstellenBoxAktuell=0);
}else{
(hmiVisibility.Buttons.IntervallEinstellenBoxAktuell=1);
}
if(hmiBoxAktuell.NachtrocknungEin){
(hmiVisibility.Buttons.NachtrocknEinstellenBoxAktuell=0);
}else{
(hmiVisibility.Buttons.NachtrocknEinstellenBoxAktuell=1);
}


if(hmiBoxAktuell.DauerbetriebEin){
(hmiVisibility.Allgemein.EingabeTrockengutfeuchteBox=0);
}else{
(hmiVisibility.Allgemein.EingabeTrockengutfeuchteBox=1);
}




if((((signed long)hmiVisibility.Layers.UebersichtEineBox==(signed long)0))){


if((~TOF_VerzBetriebsartBox.Q&Edge0000100034&1?((Edge0000100034=TOF_VerzBetriebsartBox.Q&1),1):((Edge0000100034=TOF_VerzBetriebsartBox.Q&1),0))){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Aus=hmiBoxAktuell.Aus);
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].DauerbetriebEin=hmiBoxAktuell.DauerbetriebEin);
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebEin=hmiBoxAktuell.IntervallbetriebEin);
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungEin=hmiBoxAktuell.NachtrocknungEin);
}


(hmiParameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].MaterialfeuchteIst=hmiBoxAktuell.TrockengutfeuchteAktuell);



if((hmiButtons.IntervallEinstellenBoxAktuell&~Edge0000100035&1?((Edge0000100035=hmiButtons.IntervallEinstellenBoxAktuell&1),1):((Edge0000100035=hmiButtons.IntervallEinstellenBoxAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.IntervallEinstellenBoxAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}



if((hmiButtons.NachtrocknEinstellenAktuell&~Edge0000100036&1?((Edge0000100036=hmiButtons.NachtrocknEinstellenAktuell&1),1):((Edge0000100036=hmiButtons.NachtrocknEinstellenAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.NachtrocknEinstellenAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}
}





if((hmiButtons.showBox1&~Edge0000100037&1?((Edge0000100037=hmiButtons.showBox1&1),1):((Edge0000100037=hmiButtons.showBox1&1),0))){
(hmiBoxAktuell.Aus=hmiParameter.Boxen[CheckBounds(1,1,6)-1].Aus);
(hmiBoxAktuell.DauerbetriebEin=hmiParameter.Boxen[CheckBounds(1,1,6)-1].DauerbetriebEin);
(hmiBoxAktuell.IntervallbetriebEin=hmiParameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebEin);
(hmiBoxAktuell.NachtrocknungEin=hmiParameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungEin);
__AS__Local3_00000=(plcstring*)hmiBoxAktuell.NameBox; __AS__Local4_00000=(plcstring*)hmiParameter.Boxen[1-1].NameBox; for(__AS__Local0_00000=0; __AS__Local0_00000<20l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(hmiBoxAktuell.AnzeigeLaufRestzeit=CheckRange(hmiStatus.Box1.AnzeigeLaufRestzeit,0,24));
(hmiBoxAktuell.LaufRestzeitMinuten=hmiStatus.Box1.LaufRestzeitMinuten);
(hmiBoxAktuell.LaufRestzeitStunden=hmiStatus.Box1.LaufRestzeitStunden);
(hmiBoxAktuell.TextindexLaufzeit=hmiStatus.Box1.TextindexLaufzeit);
(hmiBoxAktuell.SperreDauerbetrieb=Boxen.Box1Out.DauerbetriebSperre);
(hmiBoxAktuell.SperreIntervallbetrieb=Boxen.Box1Out.IntervallbetriebSperre);
(hmiBoxAktuell.Trockengut=CheckRange(hmiStatus.Box1.Trockengut,0,24));
(hmiBoxAktuell.IconWitterung=hmiStatus.Box1.IconWitterung);
(hmiBoxAktuell.TrockengutfeuchteAktuell=hmiParameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].MaterialfeuchteIst);
*((char volatile*)&(hmiBoxAktuell)) = *((char*)&(hmiBoxAktuell));
(hmiVisibility.Layers.DetailansichtBox=0);
}


if((hmiButtons.showBox2&~Edge0000100038&1?((Edge0000100038=hmiButtons.showBox2&1),1):((Edge0000100038=hmiButtons.showBox2&1),0))){
(hmiBoxAktuell.Aus=hmiParameter.Boxen[CheckBounds(2,1,6)-1].Aus);
(hmiBoxAktuell.DauerbetriebEin=hmiParameter.Boxen[CheckBounds(2,1,6)-1].DauerbetriebEin);
(hmiBoxAktuell.IntervallbetriebEin=hmiParameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebEin);
(hmiBoxAktuell.NachtrocknungEin=hmiParameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungEin);
__AS__Local3_00000=(plcstring*)hmiBoxAktuell.NameBox; __AS__Local4_00000=(plcstring*)hmiParameter.Boxen[2-1].NameBox; for(__AS__Local0_00000=0; __AS__Local0_00000<20l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(hmiBoxAktuell.AnzeigeLaufRestzeit=CheckRange(hmiStatus.Box2.AnzeigeLaufRestzeit,0,24));
(hmiBoxAktuell.LaufRestzeitMinuten=hmiStatus.Box2.LaufRestzeitMinuten);
(hmiBoxAktuell.LaufRestzeitStunden=hmiStatus.Box2.LaufRestzeitStunden);
(hmiBoxAktuell.TextindexLaufzeit=hmiStatus.Box2.TextindexLaufzeit);
(hmiBoxAktuell.SperreDauerbetrieb=Boxen.Box2Out.DauerbetriebSperre);
(hmiBoxAktuell.SperreIntervallbetrieb=Boxen.Box2Out.IntervallbetriebSperre);
(hmiBoxAktuell.Trockengut=CheckRange(hmiStatus.Box2.Trockengut,0,24));
(hmiBoxAktuell.IconWitterung=hmiStatus.Box2.IconWitterung);
(hmiBoxAktuell.TrockengutfeuchteAktuell=hmiParameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].MaterialfeuchteIst);
*((char volatile*)&(hmiBoxAktuell)) = *((char*)&(hmiBoxAktuell));
(hmiVisibility.Layers.DetailansichtBox=0);
}



if((hmiButtons.showBox3&~Edge0000100039&1?((Edge0000100039=hmiButtons.showBox3&1),1):((Edge0000100039=hmiButtons.showBox3&1),0))){
(hmiBoxAktuell.Aus=hmiParameter.Boxen[CheckBounds(3,1,6)-1].Aus);
(hmiBoxAktuell.DauerbetriebEin=hmiParameter.Boxen[CheckBounds(3,1,6)-1].DauerbetriebEin);
(hmiBoxAktuell.IntervallbetriebEin=hmiParameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebEin);
(hmiBoxAktuell.NachtrocknungEin=hmiParameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungEin);
__AS__Local3_00000=(plcstring*)hmiBoxAktuell.NameBox; __AS__Local4_00000=(plcstring*)hmiParameter.Boxen[3-1].NameBox; for(__AS__Local0_00000=0; __AS__Local0_00000<20l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(hmiBoxAktuell.AnzeigeLaufRestzeit=CheckRange(hmiStatus.Box3.AnzeigeLaufRestzeit,0,24));
(hmiBoxAktuell.LaufRestzeitMinuten=hmiStatus.Box3.LaufRestzeitMinuten);
(hmiBoxAktuell.LaufRestzeitStunden=hmiStatus.Box3.LaufRestzeitStunden);
(hmiBoxAktuell.TextindexLaufzeit=hmiStatus.Box3.TextindexLaufzeit);
(hmiBoxAktuell.SperreDauerbetrieb=Boxen.Box3Out.DauerbetriebSperre);
(hmiBoxAktuell.SperreIntervallbetrieb=Boxen.Box3Out.IntervallbetriebSperre);
(hmiBoxAktuell.Trockengut=CheckRange(hmiStatus.Box3.Trockengut,0,24));
(hmiBoxAktuell.IconWitterung=hmiStatus.Box3.IconWitterung);
(hmiBoxAktuell.TrockengutfeuchteAktuell=hmiParameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].MaterialfeuchteIst);
*((char volatile*)&(hmiBoxAktuell)) = *((char*)&(hmiBoxAktuell));
(hmiVisibility.Layers.DetailansichtBox=0);
}


if((hmiButtons.showBox4&~Edge0000100040&1?((Edge0000100040=hmiButtons.showBox4&1),1):((Edge0000100040=hmiButtons.showBox4&1),0))){
(hmiBoxAktuell.Aus=hmiParameter.Boxen[CheckBounds(4,1,6)-1].Aus);
(hmiBoxAktuell.DauerbetriebEin=hmiParameter.Boxen[CheckBounds(4,1,6)-1].DauerbetriebEin);
(hmiBoxAktuell.IntervallbetriebEin=hmiParameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebEin);
(hmiBoxAktuell.NachtrocknungEin=hmiParameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungEin);
__AS__Local3_00000=(plcstring*)hmiBoxAktuell.NameBox; __AS__Local4_00000=(plcstring*)hmiParameter.Boxen[4-1].NameBox; for(__AS__Local0_00000=0; __AS__Local0_00000<20l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(hmiBoxAktuell.AnzeigeLaufRestzeit=CheckRange(hmiStatus.Box4.AnzeigeLaufRestzeit,0,24));
(hmiBoxAktuell.LaufRestzeitMinuten=hmiStatus.Box4.LaufRestzeitMinuten);
(hmiBoxAktuell.LaufRestzeitStunden=hmiStatus.Box4.LaufRestzeitStunden);
(hmiBoxAktuell.TextindexLaufzeit=hmiStatus.Box4.TextindexLaufzeit);
(hmiBoxAktuell.SperreDauerbetrieb=Boxen.Box4Out.DauerbetriebSperre);
(hmiBoxAktuell.SperreIntervallbetrieb=Boxen.Box4Out.IntervallbetriebSperre);
(hmiBoxAktuell.Trockengut=CheckRange(hmiStatus.Box4.Trockengut,0,24));
(hmiBoxAktuell.IconWitterung=hmiStatus.Box4.IconWitterung);
(hmiBoxAktuell.TrockengutfeuchteAktuell=hmiParameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].MaterialfeuchteIst);
*((char volatile*)&(hmiBoxAktuell)) = *((char*)&(hmiBoxAktuell));
(hmiVisibility.Layers.DetailansichtBox=0);
}



if((hmiButtons.showBox5&~Edge0000100041&1?((Edge0000100041=hmiButtons.showBox5&1),1):((Edge0000100041=hmiButtons.showBox5&1),0))){
(hmiBoxAktuell.Aus=hmiParameter.Boxen[CheckBounds(5,1,6)-1].Aus);
(hmiBoxAktuell.DauerbetriebEin=hmiParameter.Boxen[CheckBounds(5,1,6)-1].DauerbetriebEin);
(hmiBoxAktuell.IntervallbetriebEin=hmiParameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebEin);
(hmiBoxAktuell.NachtrocknungEin=hmiParameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungEin);
__AS__Local3_00000=(plcstring*)hmiBoxAktuell.NameBox; __AS__Local4_00000=(plcstring*)hmiParameter.Boxen[5-1].NameBox; for(__AS__Local0_00000=0; __AS__Local0_00000<20l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(hmiBoxAktuell.AnzeigeLaufRestzeit=CheckRange(hmiStatus.Box5.AnzeigeLaufRestzeit,0,24));
(hmiBoxAktuell.LaufRestzeitMinuten=hmiStatus.Box5.LaufRestzeitMinuten);
(hmiBoxAktuell.LaufRestzeitStunden=hmiStatus.Box5.LaufRestzeitStunden);
(hmiBoxAktuell.TextindexLaufzeit=hmiStatus.Box5.TextindexLaufzeit);
(hmiBoxAktuell.SperreDauerbetrieb=Boxen.Box5Out.DauerbetriebSperre);
(hmiBoxAktuell.SperreIntervallbetrieb=Boxen.Box5Out.IntervallbetriebSperre);
(hmiBoxAktuell.Trockengut=CheckRange(hmiStatus.Box5.Trockengut,0,24));
(hmiBoxAktuell.IconWitterung=hmiStatus.Box5.IconWitterung);
(hmiBoxAktuell.TrockengutfeuchteAktuell=hmiParameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].MaterialfeuchteIst);
*((char volatile*)&(hmiBoxAktuell)) = *((char*)&(hmiBoxAktuell));
(hmiVisibility.Layers.DetailansichtBox=0);
}



if((hmiButtons.showBox6&~Edge0000100042&1?((Edge0000100042=hmiButtons.showBox6&1),1):((Edge0000100042=hmiButtons.showBox6&1),0))){
(hmiBoxAktuell.Aus=hmiParameter.Boxen[CheckBounds(6,1,6)-1].Aus);
(hmiBoxAktuell.DauerbetriebEin=hmiParameter.Boxen[CheckBounds(6,1,6)-1].DauerbetriebEin);
(hmiBoxAktuell.IntervallbetriebEin=hmiParameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebEin);
(hmiBoxAktuell.NachtrocknungEin=hmiParameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungEin);
__AS__Local3_00000=(plcstring*)hmiBoxAktuell.NameBox; __AS__Local4_00000=(plcstring*)hmiParameter.Boxen[6-1].NameBox; for(__AS__Local0_00000=0; __AS__Local0_00000<20l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(hmiBoxAktuell.AnzeigeLaufRestzeit=CheckRange(hmiStatus.Box6.AnzeigeLaufRestzeit,0,24));
(hmiBoxAktuell.LaufRestzeitMinuten=hmiStatus.Box6.LaufRestzeitMinuten);
(hmiBoxAktuell.LaufRestzeitStunden=hmiStatus.Box6.LaufRestzeitStunden);
(hmiBoxAktuell.TextindexLaufzeit=hmiStatus.Box6.TextindexLaufzeit);
(hmiBoxAktuell.SperreDauerbetrieb=Boxen.Box6Out.DauerbetriebSperre);
(hmiBoxAktuell.SperreIntervallbetrieb=Boxen.Box6Out.IntervallbetriebSperre);
(hmiBoxAktuell.Trockengut=CheckRange(hmiStatus.Box6.Trockengut,0,24));
(hmiBoxAktuell.IconWitterung=hmiStatus.Box6.IconWitterung);
(hmiBoxAktuell.TrockengutfeuchteAktuell=hmiParameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].MaterialfeuchteIst);
*((char volatile*)&(hmiBoxAktuell)) = *((char*)&(hmiBoxAktuell));
(hmiVisibility.Layers.DetailansichtBox=0);
}



if((((signed long)hmiVisibility.Layers.DetailansichtBox==(signed long)0))){



if(hmiButtons.showBox1){


if((~TOF_VerzBetriebsartBox.Q&Edge0000100043&1?((Edge0000100043=TOF_VerzBetriebsartBox.Q&1),1):((Edge0000100043=TOF_VerzBetriebsartBox.Q&1),0))){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Aus=hmiBoxAktuell.Aus);
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].DauerbetriebEin=hmiBoxAktuell.DauerbetriebEin);
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebEin=hmiBoxAktuell.IntervallbetriebEin);
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungEin=hmiBoxAktuell.NachtrocknungEin);
}

(hmiBoxAktuell.AnzeigeLaufRestzeit=CheckRange(hmiStatus.Box1.AnzeigeLaufRestzeit,0,24));
(hmiBoxAktuell.LaufRestzeitMinuten=hmiStatus.Box1.LaufRestzeitMinuten);
(hmiBoxAktuell.LaufRestzeitStunden=hmiStatus.Box1.LaufRestzeitStunden);
(hmiBoxAktuell.TextindexLaufzeit=hmiStatus.Box1.TextindexLaufzeit);
(hmiBoxAktuell.Status=CheckRange(hmiStatus.Box1.Statustext,0,26));


if((hmiButtons.IntervallEinstellenBoxAktuell&~Edge0000100044&1?((Edge0000100044=hmiButtons.IntervallEinstellenBoxAktuell&1),1):((Edge0000100044=hmiButtons.IntervallEinstellenBoxAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.IntervallEinstellenBoxAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}



if((hmiButtons.NachtrocknEinstellenAktuell&~Edge0000100045&1?((Edge0000100045=hmiButtons.NachtrocknEinstellenAktuell&1),1):((Edge0000100045=hmiButtons.NachtrocknEinstellenAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.NachtrocknEinstellenAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}


if((((unsigned long)(unsigned char)hmiBoxAktuell.TrockengutfeuchteAktuell!=(unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].MaterialfeuchteIst))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(1,1,6)-1].MaterialfeuchteIst=hmiBoxAktuell.TrockengutfeuchteAktuell);
}

}






if(hmiButtons.showBox2){


if((~TOF_VerzBetriebsartBox.Q&Edge0000100046&1?((Edge0000100046=TOF_VerzBetriebsartBox.Q&1),1):((Edge0000100046=TOF_VerzBetriebsartBox.Q&1),0))){
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Aus=hmiBoxAktuell.Aus);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].DauerbetriebEin=hmiBoxAktuell.DauerbetriebEin);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebEin=hmiBoxAktuell.IntervallbetriebEin);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungEin=hmiBoxAktuell.NachtrocknungEin);
}

(hmiBoxAktuell.AnzeigeLaufRestzeit=CheckRange(hmiStatus.Box2.AnzeigeLaufRestzeit,0,24));
(hmiBoxAktuell.LaufRestzeitMinuten=hmiStatus.Box2.LaufRestzeitMinuten);
(hmiBoxAktuell.LaufRestzeitStunden=hmiStatus.Box2.LaufRestzeitStunden);
(hmiBoxAktuell.TextindexLaufzeit=hmiStatus.Box2.TextindexLaufzeit);
(hmiBoxAktuell.Status=CheckRange(hmiStatus.Box2.Statustext,0,26));


if((hmiButtons.IntervallEinstellenBoxAktuell&~Edge0000100047&1?((Edge0000100047=hmiButtons.IntervallEinstellenBoxAktuell&1),1):((Edge0000100047=hmiButtons.IntervallEinstellenBoxAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.IntervallEinstellenBoxAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}



if((hmiButtons.NachtrocknEinstellenAktuell&~Edge0000100048&1?((Edge0000100048=hmiButtons.NachtrocknEinstellenAktuell&1),1):((Edge0000100048=hmiButtons.NachtrocknEinstellenAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.NachtrocknEinstellenAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}


if((((unsigned long)(unsigned char)hmiBoxAktuell.TrockengutfeuchteAktuell!=(unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].MaterialfeuchteIst))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(2,1,6)-1].MaterialfeuchteIst=hmiBoxAktuell.TrockengutfeuchteAktuell);
}

}




if(hmiButtons.showBox3){


if((~TOF_VerzBetriebsartBox.Q&Edge0000100049&1?((Edge0000100049=TOF_VerzBetriebsartBox.Q&1),1):((Edge0000100049=TOF_VerzBetriebsartBox.Q&1),0))){
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Aus=hmiBoxAktuell.Aus);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].DauerbetriebEin=hmiBoxAktuell.DauerbetriebEin);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebEin=hmiBoxAktuell.IntervallbetriebEin);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungEin=hmiBoxAktuell.NachtrocknungEin);
}

(hmiBoxAktuell.AnzeigeLaufRestzeit=CheckRange(hmiStatus.Box3.AnzeigeLaufRestzeit,0,24));
(hmiBoxAktuell.LaufRestzeitMinuten=hmiStatus.Box3.LaufRestzeitMinuten);
(hmiBoxAktuell.LaufRestzeitStunden=hmiStatus.Box3.LaufRestzeitStunden);
(hmiBoxAktuell.TextindexLaufzeit=hmiStatus.Box3.TextindexLaufzeit);
(hmiBoxAktuell.Status=CheckRange(hmiStatus.Box3.Statustext,0,26));


if((hmiButtons.IntervallEinstellenBoxAktuell&~Edge0000100050&1?((Edge0000100050=hmiButtons.IntervallEinstellenBoxAktuell&1),1):((Edge0000100050=hmiButtons.IntervallEinstellenBoxAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.IntervallEinstellenBoxAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}



if((hmiButtons.NachtrocknEinstellenAktuell&~Edge0000100051&1?((Edge0000100051=hmiButtons.NachtrocknEinstellenAktuell&1),1):((Edge0000100051=hmiButtons.NachtrocknEinstellenAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.NachtrocknEinstellenAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}


if((((unsigned long)(unsigned char)hmiBoxAktuell.TrockengutfeuchteAktuell!=(unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].MaterialfeuchteIst))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(3,1,6)-1].MaterialfeuchteIst=hmiBoxAktuell.TrockengutfeuchteAktuell);
}

}





if(hmiButtons.showBox4){


if((~TOF_VerzBetriebsartBox.Q&Edge0000100052&1?((Edge0000100052=TOF_VerzBetriebsartBox.Q&1),1):((Edge0000100052=TOF_VerzBetriebsartBox.Q&1),0))){
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Aus=hmiBoxAktuell.Aus);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].DauerbetriebEin=hmiBoxAktuell.DauerbetriebEin);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebEin=hmiBoxAktuell.IntervallbetriebEin);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungEin=hmiBoxAktuell.NachtrocknungEin);
}

(hmiBoxAktuell.AnzeigeLaufRestzeit=CheckRange(hmiStatus.Box4.AnzeigeLaufRestzeit,0,24));
(hmiBoxAktuell.LaufRestzeitMinuten=hmiStatus.Box4.LaufRestzeitMinuten);
(hmiBoxAktuell.LaufRestzeitStunden=hmiStatus.Box4.LaufRestzeitStunden);
(hmiBoxAktuell.TextindexLaufzeit=hmiStatus.Box4.TextindexLaufzeit);
(hmiBoxAktuell.Status=CheckRange(hmiStatus.Box4.Statustext,0,26));


if((hmiButtons.IntervallEinstellenBoxAktuell&~Edge0000100053&1?((Edge0000100053=hmiButtons.IntervallEinstellenBoxAktuell&1),1):((Edge0000100053=hmiButtons.IntervallEinstellenBoxAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.IntervallEinstellenBoxAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}



if((hmiButtons.NachtrocknEinstellenAktuell&~Edge0000100054&1?((Edge0000100054=hmiButtons.NachtrocknEinstellenAktuell&1),1):((Edge0000100054=hmiButtons.NachtrocknEinstellenAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.NachtrocknEinstellenAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}


if((((unsigned long)(unsigned char)hmiBoxAktuell.TrockengutfeuchteAktuell!=(unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].MaterialfeuchteIst))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(4,1,6)-1].MaterialfeuchteIst=hmiBoxAktuell.TrockengutfeuchteAktuell);
}

}





if(hmiButtons.showBox5){


if((~TOF_VerzBetriebsartBox.Q&Edge0000100055&1?((Edge0000100055=TOF_VerzBetriebsartBox.Q&1),1):((Edge0000100055=TOF_VerzBetriebsartBox.Q&1),0))){
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Aus=hmiBoxAktuell.Aus);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].DauerbetriebEin=hmiBoxAktuell.DauerbetriebEin);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebEin=hmiBoxAktuell.IntervallbetriebEin);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungEin=hmiBoxAktuell.NachtrocknungEin);
}

(hmiBoxAktuell.AnzeigeLaufRestzeit=CheckRange(hmiStatus.Box5.AnzeigeLaufRestzeit,0,24));
(hmiBoxAktuell.LaufRestzeitMinuten=hmiStatus.Box5.LaufRestzeitMinuten);
(hmiBoxAktuell.LaufRestzeitStunden=hmiStatus.Box5.LaufRestzeitStunden);
(hmiBoxAktuell.TextindexLaufzeit=hmiStatus.Box5.TextindexLaufzeit);
(hmiBoxAktuell.Status=CheckRange(hmiStatus.Box5.Statustext,0,26));


if((hmiButtons.IntervallEinstellenBoxAktuell&~Edge0000100056&1?((Edge0000100056=hmiButtons.IntervallEinstellenBoxAktuell&1),1):((Edge0000100056=hmiButtons.IntervallEinstellenBoxAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.IntervallEinstellenBoxAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}



if((hmiButtons.NachtrocknEinstellenAktuell&~Edge0000100057&1?((Edge0000100057=hmiButtons.NachtrocknEinstellenAktuell&1),1):((Edge0000100057=hmiButtons.NachtrocknEinstellenAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.NachtrocknEinstellenAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}


if((((unsigned long)(unsigned char)hmiBoxAktuell.TrockengutfeuchteAktuell!=(unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].MaterialfeuchteIst))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(5,1,6)-1].MaterialfeuchteIst=hmiBoxAktuell.TrockengutfeuchteAktuell);
}

}





if(hmiButtons.showBox6){


if((~TOF_VerzBetriebsartBox.Q&Edge0000100058&1?((Edge0000100058=TOF_VerzBetriebsartBox.Q&1),1):((Edge0000100058=TOF_VerzBetriebsartBox.Q&1),0))){
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Aus=hmiBoxAktuell.Aus);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].DauerbetriebEin=hmiBoxAktuell.DauerbetriebEin);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebEin=hmiBoxAktuell.IntervallbetriebEin);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungEin=hmiBoxAktuell.NachtrocknungEin);
}

(hmiBoxAktuell.AnzeigeLaufRestzeit=CheckRange(hmiStatus.Box6.AnzeigeLaufRestzeit,0,24));
(hmiBoxAktuell.LaufRestzeitMinuten=hmiStatus.Box6.LaufRestzeitMinuten);
(hmiBoxAktuell.LaufRestzeitStunden=hmiStatus.Box6.LaufRestzeitStunden);
(hmiBoxAktuell.TextindexLaufzeit=hmiStatus.Box6.TextindexLaufzeit);
(hmiBoxAktuell.Status=CheckRange(hmiStatus.Box6.Statustext,0,26));


if((hmiButtons.IntervallEinstellenBoxAktuell&~Edge0000100059&1?((Edge0000100059=hmiButtons.IntervallEinstellenBoxAktuell&1),1):((Edge0000100059=hmiButtons.IntervallEinstellenBoxAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.IntervallEinstellenBoxAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}



if((hmiButtons.NachtrocknEinstellenAktuell&~Edge0000100060&1?((Edge0000100060=hmiButtons.NachtrocknEinstellenAktuell&1),1):((Edge0000100060=hmiButtons.NachtrocknEinstellenAktuell&1),0))){
__AS__MEMCPY(((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),((unsigned long)(&hmiParameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten)),24);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(0,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(0,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(1,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(1,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(2,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(2,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(3,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(3,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(4,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(4,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(5,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(5,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(6,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(6,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(7,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(7,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(8,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(8,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(9,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(9,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(10,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(10,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(11,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(11,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(12,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(12,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(13,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(13,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(14,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(14,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(15,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(15,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(16,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(16,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(17,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(17,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(18,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(18,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(19,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(19,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(20,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(20,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(21,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(21,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(22,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(22,0,23)]);
(hmiBoxAktuell.ZeitbereicheGesperrt[CheckBounds(23,0,23)]=Boxen.Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(23,0,23)]);
(hmiVisibility.Layers.Zeitfenster=0);
}
if(hmiButtons.NachtrocknEinstellenAktuell){
__AS__MEMCPY(((unsigned long)(&hmiParameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten)),((unsigned long)(&hmiBoxAktuell.Zeitbereiche)),24);
}


if((((unsigned long)(unsigned char)hmiBoxAktuell.TrockengutfeuchteAktuell!=(unsigned long)(unsigned char)hmiParameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].MaterialfeuchteIst))){
(hmiParameter.SchlechtwetterBoxen[CheckBounds(6,1,6)-1].MaterialfeuchteIst=hmiBoxAktuell.TrockengutfeuchteAktuell);
}

}




}



if((hmiButtons.hideDetailansichtBox&(TOF_VerzBetriebsartBox.Q^1))){
(hmiVisibility.Layers.DetailansichtBox=1);
(hmiButtons.hideDetailansichtBox=0);
(hmiButtons.showBox1=0);
(hmiButtons.showBox2=0);
(hmiButtons.showBox3=0);
(hmiButtons.showBox4=0);
(hmiButtons.showBox5=0);
(hmiButtons.showBox6=0);
}


if(hmiButtons.hideZeitfenster){
(hmiVisibility.Layers.Zeitfenster=1);
(hmiButtons.hideZeitfenster=0);
(hmiButtons.IntervallEinstellenBoxAktuell=0);
(hmiButtons.NachtrocknEinstellenAktuell=0);
}






if(gCmdAnlage.Test){
(hmiStatus.Box1.Statustext=2);
(hmiStatus.Box1.FarbeStatustext=5);
(hmiStatus.Box1.FarbeTextNameBox=5);
(hmiStatus.Box1.HintergrundAktiv=1);
(hmiStatus.Box1.HintergrundInaktiv=0);
(hmiStatus.Box1.StatusfeldAktiv=1);
(hmiStatus.Box1.StatusfeldInaktiv=0);
}else if(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Aus){
(hmiStatus.Box1.Statustext=1);
(hmiStatus.Box1.FarbeStatustext=5);
(hmiStatus.Box1.FarbeTextNameBox=5);
(hmiStatus.Box1.HintergrundAktiv=1);
(hmiStatus.Box1.HintergrundInaktiv=0);
(hmiStatus.Box1.StatusfeldAktiv=1);
(hmiStatus.Box1.StatusfeldInaktiv=0);
}else if(hmiParameter.Boxen[CheckBounds(1,1,6)-1].DauerbetriebEin){
if(Boxen.Box1Out.BoxAktiv){
if((Boxen.Box1In.WetterIstSchlecht&(Boxen.Box1In.LuftaufbIstVerfuegbar^1))){
(hmiStatus.Box1.Statustext=25);
(hmiStatus.Box1.FarbeStatustext=6);
(hmiStatus.Box1.FarbeTextNameBox=7);
(hmiStatus.Box1.HintergrundAktiv=0);
(hmiStatus.Box1.HintergrundInaktiv=1);
(hmiStatus.Box1.StatusfeldAktiv=0);
(hmiStatus.Box1.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box1.Statustext=3);
(hmiStatus.Box1.FarbeStatustext=6);
(hmiStatus.Box1.FarbeTextNameBox=7);
(hmiStatus.Box1.HintergrundAktiv=0);
(hmiStatus.Box1.HintergrundInaktiv=1);
(hmiStatus.Box1.StatusfeldAktiv=0);
(hmiStatus.Box1.StatusfeldInaktiv=1);
}
}else{
if((Boxen.Box1In.WetterIstSchlecht&(Boxen.Box1In.LuftaufbIstVerfuegbar^1))){
(hmiStatus.Box1.Statustext=26);
(hmiStatus.Box1.FarbeStatustext=5);
(hmiStatus.Box1.FarbeTextNameBox=7);
(hmiStatus.Box1.HintergrundAktiv=0);
(hmiStatus.Box1.HintergrundInaktiv=1);
(hmiStatus.Box1.StatusfeldAktiv=1);
(hmiStatus.Box1.StatusfeldInaktiv=0);
}else{
(hmiStatus.Box1.Statustext=24);
(hmiStatus.Box1.FarbeStatustext=5);
(hmiStatus.Box1.FarbeTextNameBox=7);
(hmiStatus.Box1.HintergrundAktiv=0);
(hmiStatus.Box1.HintergrundInaktiv=1);
(hmiStatus.Box1.StatusfeldAktiv=1);
(hmiStatus.Box1.StatusfeldInaktiv=0);
}
}
}else if(hmiParameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebEin){
if(Boxen.Box1Out.BoxAktiv){
(hmiStatus.Box1.Statustext=4);
(hmiStatus.Box1.FarbeStatustext=6);
(hmiStatus.Box1.FarbeTextNameBox=7);
(hmiStatus.Box1.HintergrundAktiv=0);
(hmiStatus.Box1.HintergrundInaktiv=1);
(hmiStatus.Box1.StatusfeldAktiv=0);
(hmiStatus.Box1.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box1.Statustext=5);
(hmiStatus.Box1.FarbeStatustext=5);
(hmiStatus.Box1.FarbeTextNameBox=7);
(hmiStatus.Box1.HintergrundAktiv=0);
(hmiStatus.Box1.HintergrundInaktiv=1);
(hmiStatus.Box1.StatusfeldAktiv=1);
(hmiStatus.Box1.StatusfeldInaktiv=0);
}
}else if(hmiParameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungEin){
if(Boxen.Box1Out.BoxAktiv){
(hmiStatus.Box1.Statustext=6);
(hmiStatus.Box1.FarbeStatustext=6);
(hmiStatus.Box1.FarbeTextNameBox=7);
(hmiStatus.Box1.HintergrundAktiv=0);
(hmiStatus.Box1.HintergrundInaktiv=1);
(hmiStatus.Box1.StatusfeldAktiv=0);
(hmiStatus.Box1.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box1.Statustext=7);
(hmiStatus.Box1.FarbeStatustext=5);
(hmiStatus.Box1.FarbeTextNameBox=7);
(hmiStatus.Box1.HintergrundAktiv=0);
(hmiStatus.Box1.HintergrundInaktiv=1);
(hmiStatus.Box1.StatusfeldAktiv=1);
(hmiStatus.Box1.StatusfeldInaktiv=0);
}
}



if(hmiParameter.Ausstattung.Box2){
if(gCmdAnlage.Test){
(hmiStatus.Box2.Statustext=2);
(hmiStatus.Box2.FarbeStatustext=5);
(hmiStatus.Box2.FarbeTextNameBox=5);
(hmiStatus.Box2.HintergrundAktiv=1);
(hmiStatus.Box2.HintergrundInaktiv=0);
(hmiStatus.Box2.StatusfeldAktiv=1);
(hmiStatus.Box2.StatusfeldInaktiv=0);
}else if(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Aus){
(hmiStatus.Box2.Statustext=1);
(hmiStatus.Box2.FarbeStatustext=5);
(hmiStatus.Box2.FarbeTextNameBox=5);
(hmiStatus.Box2.HintergrundAktiv=1);
(hmiStatus.Box2.HintergrundInaktiv=0);
(hmiStatus.Box2.StatusfeldAktiv=1);
(hmiStatus.Box2.StatusfeldInaktiv=0);
}else if(hmiParameter.Boxen[CheckBounds(2,1,6)-1].DauerbetriebEin){
if(Boxen.Box2Out.BoxAktiv){
(hmiStatus.Box2.Statustext=3);
(hmiStatus.Box2.FarbeStatustext=6);
(hmiStatus.Box2.FarbeTextNameBox=7);
(hmiStatus.Box2.HintergrundAktiv=0);
(hmiStatus.Box2.HintergrundInaktiv=1);
(hmiStatus.Box2.StatusfeldAktiv=0);
(hmiStatus.Box2.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box2.Statustext=24);
(hmiStatus.Box2.FarbeStatustext=5);
(hmiStatus.Box2.FarbeTextNameBox=7);
(hmiStatus.Box2.HintergrundAktiv=0);
(hmiStatus.Box2.HintergrundInaktiv=1);
(hmiStatus.Box2.StatusfeldAktiv=1);
(hmiStatus.Box2.StatusfeldInaktiv=0);
}
}else if(hmiParameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebEin){
if(Boxen.Box2Out.BoxAktiv){
(hmiStatus.Box2.Statustext=4);
(hmiStatus.Box2.FarbeStatustext=6);
(hmiStatus.Box2.FarbeTextNameBox=7);
(hmiStatus.Box2.HintergrundAktiv=0);
(hmiStatus.Box2.HintergrundInaktiv=1);
(hmiStatus.Box2.StatusfeldAktiv=0);
(hmiStatus.Box2.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box2.Statustext=5);
(hmiStatus.Box2.FarbeStatustext=5);
(hmiStatus.Box2.FarbeTextNameBox=7);
(hmiStatus.Box2.HintergrundAktiv=0);
(hmiStatus.Box2.HintergrundInaktiv=1);
(hmiStatus.Box2.StatusfeldAktiv=1);
(hmiStatus.Box2.StatusfeldInaktiv=0);
}
}else if(hmiParameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungEin){
if(Boxen.Box2Out.BoxAktiv){
(hmiStatus.Box2.Statustext=6);
(hmiStatus.Box2.FarbeStatustext=6);
(hmiStatus.Box2.FarbeTextNameBox=7);
(hmiStatus.Box2.HintergrundAktiv=0);
(hmiStatus.Box2.HintergrundInaktiv=1);
(hmiStatus.Box2.StatusfeldAktiv=0);
(hmiStatus.Box2.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box2.Statustext=7);
(hmiStatus.Box2.FarbeStatustext=5);
(hmiStatus.Box2.FarbeTextNameBox=7);
(hmiStatus.Box2.HintergrundAktiv=0);
(hmiStatus.Box2.HintergrundInaktiv=1);
(hmiStatus.Box2.StatusfeldAktiv=1);
(hmiStatus.Box2.StatusfeldInaktiv=0);
}
}
}


if(hmiParameter.Ausstattung.Box3){
if(gCmdAnlage.Test){
(hmiStatus.Box3.Statustext=2);
(hmiStatus.Box3.FarbeStatustext=5);
(hmiStatus.Box3.FarbeTextNameBox=5);
(hmiStatus.Box3.HintergrundAktiv=1);
(hmiStatus.Box3.HintergrundInaktiv=0);
(hmiStatus.Box3.StatusfeldAktiv=1);
(hmiStatus.Box3.StatusfeldInaktiv=0);
}else if(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Aus){
(hmiStatus.Box3.Statustext=1);
(hmiStatus.Box3.FarbeStatustext=5);
(hmiStatus.Box3.FarbeTextNameBox=5);
(hmiStatus.Box3.HintergrundAktiv=1);
(hmiStatus.Box3.HintergrundInaktiv=0);
(hmiStatus.Box3.StatusfeldAktiv=1);
(hmiStatus.Box3.StatusfeldInaktiv=0);
}else if(hmiParameter.Boxen[CheckBounds(3,1,6)-1].DauerbetriebEin){
if(Boxen.Box3Out.BoxAktiv){
(hmiStatus.Box3.Statustext=3);
(hmiStatus.Box3.FarbeStatustext=6);
(hmiStatus.Box3.FarbeTextNameBox=7);
(hmiStatus.Box3.HintergrundAktiv=0);
(hmiStatus.Box3.HintergrundInaktiv=1);
(hmiStatus.Box3.StatusfeldAktiv=0);
(hmiStatus.Box3.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box3.Statustext=24);
(hmiStatus.Box3.FarbeStatustext=5);
(hmiStatus.Box3.FarbeTextNameBox=7);
(hmiStatus.Box3.HintergrundAktiv=0);
(hmiStatus.Box3.HintergrundInaktiv=1);
(hmiStatus.Box3.StatusfeldAktiv=1);
(hmiStatus.Box3.StatusfeldInaktiv=0);
}
}else if(hmiParameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebEin){
if(Boxen.Box3Out.BoxAktiv){
(hmiStatus.Box3.Statustext=4);
(hmiStatus.Box3.FarbeStatustext=6);
(hmiStatus.Box3.FarbeTextNameBox=7);
(hmiStatus.Box3.HintergrundAktiv=0);
(hmiStatus.Box3.HintergrundInaktiv=1);
(hmiStatus.Box3.StatusfeldAktiv=0);
(hmiStatus.Box3.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box3.Statustext=5);
(hmiStatus.Box3.FarbeStatustext=5);
(hmiStatus.Box3.FarbeTextNameBox=7);
(hmiStatus.Box3.HintergrundAktiv=0);
(hmiStatus.Box3.HintergrundInaktiv=1);
(hmiStatus.Box3.StatusfeldAktiv=1);
(hmiStatus.Box3.StatusfeldInaktiv=0);
}
}else if(hmiParameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungEin){
if(Boxen.Box3Out.BoxAktiv){
(hmiStatus.Box3.Statustext=6);
(hmiStatus.Box3.FarbeStatustext=6);
(hmiStatus.Box3.FarbeTextNameBox=7);
(hmiStatus.Box3.HintergrundAktiv=0);
(hmiStatus.Box3.HintergrundInaktiv=1);
(hmiStatus.Box3.StatusfeldAktiv=0);
(hmiStatus.Box3.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box3.Statustext=7);
(hmiStatus.Box3.FarbeStatustext=5);
(hmiStatus.Box3.FarbeTextNameBox=7);
(hmiStatus.Box3.HintergrundAktiv=0);
(hmiStatus.Box3.HintergrundInaktiv=1);
(hmiStatus.Box3.StatusfeldAktiv=1);
(hmiStatus.Box3.StatusfeldInaktiv=0);
}
}
}



if(hmiParameter.Ausstattung.Box4){
if(gCmdAnlage.Test){
(hmiStatus.Box4.Statustext=2);
(hmiStatus.Box4.FarbeStatustext=5);
(hmiStatus.Box4.FarbeTextNameBox=5);
(hmiStatus.Box4.HintergrundAktiv=1);
(hmiStatus.Box4.HintergrundInaktiv=0);
(hmiStatus.Box4.StatusfeldAktiv=1);
(hmiStatus.Box4.StatusfeldInaktiv=0);
}else if(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Aus){
(hmiStatus.Box4.Statustext=1);
(hmiStatus.Box4.FarbeStatustext=5);
(hmiStatus.Box4.FarbeTextNameBox=5);
(hmiStatus.Box4.HintergrundAktiv=1);
(hmiStatus.Box4.HintergrundInaktiv=0);
(hmiStatus.Box4.StatusfeldAktiv=1);
(hmiStatus.Box4.StatusfeldInaktiv=0);
}else if(hmiParameter.Boxen[CheckBounds(4,1,6)-1].DauerbetriebEin){
if(Boxen.Box4Out.BoxAktiv){
(hmiStatus.Box4.Statustext=3);
(hmiStatus.Box4.FarbeStatustext=6);
(hmiStatus.Box4.FarbeTextNameBox=7);
(hmiStatus.Box4.HintergrundAktiv=0);
(hmiStatus.Box4.HintergrundInaktiv=1);
(hmiStatus.Box4.StatusfeldAktiv=0);
(hmiStatus.Box4.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box4.Statustext=24);
(hmiStatus.Box4.FarbeStatustext=5);
(hmiStatus.Box4.FarbeTextNameBox=7);
(hmiStatus.Box4.HintergrundAktiv=0);
(hmiStatus.Box4.HintergrundInaktiv=1);
(hmiStatus.Box4.StatusfeldAktiv=1);
(hmiStatus.Box4.StatusfeldInaktiv=0);
}
}else if(hmiParameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebEin){
if(Boxen.Box4Out.BoxAktiv){
(hmiStatus.Box4.Statustext=4);
(hmiStatus.Box4.FarbeStatustext=6);
(hmiStatus.Box4.FarbeTextNameBox=7);
(hmiStatus.Box4.HintergrundAktiv=0);
(hmiStatus.Box4.HintergrundInaktiv=1);
(hmiStatus.Box4.StatusfeldAktiv=0);
(hmiStatus.Box4.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box4.Statustext=5);
(hmiStatus.Box4.FarbeStatustext=5);
(hmiStatus.Box4.FarbeTextNameBox=7);
(hmiStatus.Box4.HintergrundAktiv=0);
(hmiStatus.Box4.HintergrundInaktiv=1);
(hmiStatus.Box4.StatusfeldAktiv=1);
(hmiStatus.Box4.StatusfeldInaktiv=0);
}
}else if(hmiParameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungEin){
if(Boxen.Box4Out.BoxAktiv){
(hmiStatus.Box4.Statustext=6);
(hmiStatus.Box4.FarbeStatustext=6);
(hmiStatus.Box4.FarbeTextNameBox=7);
(hmiStatus.Box4.HintergrundAktiv=0);
(hmiStatus.Box4.HintergrundInaktiv=1);
(hmiStatus.Box4.StatusfeldAktiv=0);
(hmiStatus.Box4.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box4.Statustext=7);
(hmiStatus.Box4.FarbeStatustext=5);
(hmiStatus.Box4.FarbeTextNameBox=7);
(hmiStatus.Box4.HintergrundAktiv=0);
(hmiStatus.Box4.HintergrundInaktiv=1);
(hmiStatus.Box4.StatusfeldAktiv=1);
(hmiStatus.Box4.StatusfeldInaktiv=0);
}
}
}



if(hmiParameter.Ausstattung.Box5){
if(gCmdAnlage.Test){
(hmiStatus.Box5.Statustext=2);
(hmiStatus.Box5.FarbeStatustext=5);
(hmiStatus.Box5.FarbeTextNameBox=5);
(hmiStatus.Box5.HintergrundAktiv=1);
(hmiStatus.Box5.HintergrundInaktiv=0);
(hmiStatus.Box5.StatusfeldAktiv=1);
(hmiStatus.Box5.StatusfeldInaktiv=0);
}else if(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Aus){
(hmiStatus.Box5.Statustext=1);
(hmiStatus.Box5.FarbeStatustext=5);
(hmiStatus.Box5.FarbeTextNameBox=5);
(hmiStatus.Box5.HintergrundAktiv=1);
(hmiStatus.Box5.HintergrundInaktiv=0);
(hmiStatus.Box5.StatusfeldAktiv=1);
(hmiStatus.Box5.StatusfeldInaktiv=0);
}else if(hmiParameter.Boxen[CheckBounds(5,1,6)-1].DauerbetriebEin){
if(Boxen.Box5Out.BoxAktiv){
(hmiStatus.Box5.Statustext=3);
(hmiStatus.Box5.FarbeStatustext=6);
(hmiStatus.Box5.FarbeTextNameBox=7);
(hmiStatus.Box5.HintergrundAktiv=0);
(hmiStatus.Box5.HintergrundInaktiv=1);
(hmiStatus.Box5.StatusfeldAktiv=0);
(hmiStatus.Box5.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box5.Statustext=24);
(hmiStatus.Box5.FarbeStatustext=5);
(hmiStatus.Box5.FarbeTextNameBox=7);
(hmiStatus.Box5.HintergrundAktiv=0);
(hmiStatus.Box5.HintergrundInaktiv=1);
(hmiStatus.Box5.StatusfeldAktiv=1);
(hmiStatus.Box5.StatusfeldInaktiv=0);
}
}else if(hmiParameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebEin){
if(Boxen.Box5Out.BoxAktiv){
(hmiStatus.Box5.Statustext=4);
(hmiStatus.Box5.FarbeStatustext=6);
(hmiStatus.Box5.FarbeTextNameBox=7);
(hmiStatus.Box5.HintergrundAktiv=0);
(hmiStatus.Box5.HintergrundInaktiv=1);
(hmiStatus.Box5.StatusfeldAktiv=0);
(hmiStatus.Box5.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box5.Statustext=5);
(hmiStatus.Box5.FarbeStatustext=5);
(hmiStatus.Box5.FarbeTextNameBox=7);
(hmiStatus.Box5.HintergrundAktiv=0);
(hmiStatus.Box5.HintergrundInaktiv=1);
(hmiStatus.Box5.StatusfeldAktiv=1);
(hmiStatus.Box5.StatusfeldInaktiv=0);
}
}else if(hmiParameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungEin){
if(Boxen.Box5Out.BoxAktiv){
(hmiStatus.Box5.Statustext=6);
(hmiStatus.Box5.FarbeStatustext=6);
(hmiStatus.Box5.FarbeTextNameBox=7);
(hmiStatus.Box5.HintergrundAktiv=0);
(hmiStatus.Box5.HintergrundInaktiv=1);
(hmiStatus.Box5.StatusfeldAktiv=0);
(hmiStatus.Box5.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box5.Statustext=7);
(hmiStatus.Box5.FarbeStatustext=5);
(hmiStatus.Box5.FarbeTextNameBox=7);
(hmiStatus.Box5.HintergrundAktiv=0);
(hmiStatus.Box5.HintergrundInaktiv=1);
(hmiStatus.Box5.StatusfeldAktiv=1);
(hmiStatus.Box5.StatusfeldInaktiv=0);
}
}
}



if(hmiParameter.Ausstattung.Box6){
if(gCmdAnlage.Test){
(hmiStatus.Box6.Statustext=2);
(hmiStatus.Box6.FarbeStatustext=5);
(hmiStatus.Box6.FarbeTextNameBox=5);
(hmiStatus.Box6.HintergrundAktiv=1);
(hmiStatus.Box6.HintergrundInaktiv=0);
(hmiStatus.Box6.StatusfeldAktiv=1);
(hmiStatus.Box6.StatusfeldInaktiv=0);
}else if(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Aus){
(hmiStatus.Box6.Statustext=1);
(hmiStatus.Box6.FarbeStatustext=5);
(hmiStatus.Box6.FarbeTextNameBox=5);
(hmiStatus.Box6.HintergrundAktiv=1);
(hmiStatus.Box6.HintergrundInaktiv=0);
(hmiStatus.Box6.StatusfeldAktiv=1);
(hmiStatus.Box6.StatusfeldInaktiv=0);
}else if(hmiParameter.Boxen[CheckBounds(6,1,6)-1].DauerbetriebEin){
if(Boxen.Box6Out.BoxAktiv){
(hmiStatus.Box6.Statustext=3);
(hmiStatus.Box6.FarbeStatustext=6);
(hmiStatus.Box6.FarbeTextNameBox=7);
(hmiStatus.Box6.HintergrundAktiv=0);
(hmiStatus.Box6.HintergrundInaktiv=1);
(hmiStatus.Box6.StatusfeldAktiv=0);
(hmiStatus.Box6.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box6.Statustext=24);
(hmiStatus.Box6.FarbeStatustext=5);
(hmiStatus.Box6.FarbeTextNameBox=7);
(hmiStatus.Box6.HintergrundAktiv=0);
(hmiStatus.Box6.HintergrundInaktiv=1);
(hmiStatus.Box6.StatusfeldAktiv=1);
(hmiStatus.Box6.StatusfeldInaktiv=0);
}
}else if(hmiParameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebEin){
if(Boxen.Box6Out.BoxAktiv){
(hmiStatus.Box6.Statustext=4);
(hmiStatus.Box6.FarbeStatustext=6);
(hmiStatus.Box6.FarbeTextNameBox=7);
(hmiStatus.Box6.HintergrundAktiv=0);
(hmiStatus.Box6.HintergrundInaktiv=1);
(hmiStatus.Box6.StatusfeldAktiv=0);
(hmiStatus.Box6.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box6.Statustext=5);
(hmiStatus.Box6.FarbeStatustext=5);
(hmiStatus.Box6.FarbeTextNameBox=7);
(hmiStatus.Box6.HintergrundAktiv=0);
(hmiStatus.Box6.HintergrundInaktiv=1);
(hmiStatus.Box6.StatusfeldAktiv=1);
(hmiStatus.Box6.StatusfeldInaktiv=0);
}
}else if(hmiParameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungEin){
if(Boxen.Box6Out.BoxAktiv){
(hmiStatus.Box6.Statustext=6);
(hmiStatus.Box6.FarbeStatustext=6);
(hmiStatus.Box6.FarbeTextNameBox=7);
(hmiStatus.Box6.HintergrundAktiv=0);
(hmiStatus.Box6.HintergrundInaktiv=1);
(hmiStatus.Box6.StatusfeldAktiv=0);
(hmiStatus.Box6.StatusfeldInaktiv=1);
}else{
(hmiStatus.Box6.Statustext=7);
(hmiStatus.Box6.FarbeStatustext=5);
(hmiStatus.Box6.FarbeTextNameBox=7);
(hmiStatus.Box6.HintergrundAktiv=0);
(hmiStatus.Box6.HintergrundInaktiv=1);
(hmiStatus.Box6.StatusfeldAktiv=1);
(hmiStatus.Box6.StatusfeldInaktiv=0);
}
}
}






(hmiStatus.Box1.IconWitterung=(unsigned char)(fbSchlechtwetterBox1.WetterIstSchlecht&1));
(hmiStatus.Box2.IconWitterung=(unsigned char)(fbSchlechtwetterBox2.WetterIstSchlecht&1));
(hmiStatus.Box3.IconWitterung=(unsigned char)(fbSchlechtwetterBox3.WetterIstSchlecht&1));
(hmiStatus.Box4.IconWitterung=(unsigned char)(fbSchlechtwetterBox4.WetterIstSchlecht&1));
(hmiStatus.Box5.IconWitterung=(unsigned char)(fbSchlechtwetterBox5.WetterIstSchlecht&1));
(hmiStatus.Box6.IconWitterung=(unsigned char)(fbSchlechtwetterBox6.WetterIstSchlecht&1));











if(hmiButtons.changeTrockengutBox1){
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut<(unsigned long)(unsigned char)6))){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut=(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut+1));
}else{
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut=0);
}
(hmiButtons.changeTrockengutBox1=0);
}


if(hmiButtons.changeTrockengutBox2){
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut<(unsigned long)(unsigned char)6))){
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut=(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut+1));
}else{
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut=0);
}
(hmiButtons.changeTrockengutBox2=0);
}


if(hmiButtons.changeTrockengutBox3){
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut<(unsigned long)(unsigned char)6))){
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut=(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut+1));
}else{
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut=0);
}
(hmiButtons.changeTrockengutBox3=0);
}


if(hmiButtons.changeTrockengutBox4){
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut<(unsigned long)(unsigned char)6))){
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut=(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut+1));
}else{
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut=0);
}
(hmiButtons.changeTrockengutBox4=0);
}


if(hmiButtons.changeTrockengutBox5){
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut<(unsigned long)(unsigned char)6))){
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut=(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut+1));
}else{
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut=0);
}
(hmiButtons.changeTrockengutBox5=0);
}


if(hmiButtons.changeTrockengutBox6){
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut<(unsigned long)(unsigned char)6))){
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut=(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut+1));
}else{
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut=0);
}
(hmiButtons.changeTrockengutBox6=0);
}



if((hmiParameter.Boxen[CheckBounds(1,1,6)-1].Aus|gCmdAnlage.Test)){
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)0))){
(hmiStatus.Box1.Trockengut=8);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)1))){
(hmiStatus.Box1.Trockengut=10);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)2))){
(hmiStatus.Box1.Trockengut=12);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)3))){
(hmiStatus.Box1.Trockengut=14);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)4))){
(hmiStatus.Box1.Trockengut=16);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)5))){
(hmiStatus.Box1.Trockengut=18);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)6))){
(hmiStatus.Box1.Trockengut=20);
}
}else{
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)0))){
(hmiStatus.Box1.Trockengut=9);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)1))){
(hmiStatus.Box1.Trockengut=11);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)2))){
(hmiStatus.Box1.Trockengut=13);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)3))){
(hmiStatus.Box1.Trockengut=15);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)4))){
(hmiStatus.Box1.Trockengut=17);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)5))){
(hmiStatus.Box1.Trockengut=19);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(1,1,6)-1].Trockengut==(unsigned long)(unsigned char)6))){
(hmiStatus.Box1.Trockengut=21);
}
}


if((hmiParameter.Boxen[CheckBounds(2,1,6)-1].Aus|gCmdAnlage.Test)){
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)0))){
(hmiStatus.Box2.Trockengut=8);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)1))){
(hmiStatus.Box2.Trockengut=10);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)2))){
(hmiStatus.Box2.Trockengut=12);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)3))){
(hmiStatus.Box2.Trockengut=14);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)4))){
(hmiStatus.Box2.Trockengut=16);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)5))){
(hmiStatus.Box2.Trockengut=18);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)6))){
(hmiStatus.Box2.Trockengut=20);
}
}else{
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)0))){
(hmiStatus.Box2.Trockengut=9);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)1))){
(hmiStatus.Box2.Trockengut=11);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)2))){
(hmiStatus.Box2.Trockengut=13);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)3))){
(hmiStatus.Box2.Trockengut=15);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)4))){
(hmiStatus.Box2.Trockengut=17);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)5))){
(hmiStatus.Box2.Trockengut=19);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(2,1,6)-1].Trockengut==(unsigned long)(unsigned char)6))){
(hmiStatus.Box2.Trockengut=21);
}
}


if((hmiParameter.Boxen[CheckBounds(3,1,6)-1].Aus|gCmdAnlage.Test)){
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)0))){
(hmiStatus.Box3.Trockengut=8);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)1))){
(hmiStatus.Box3.Trockengut=10);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)2))){
(hmiStatus.Box3.Trockengut=12);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)3))){
(hmiStatus.Box3.Trockengut=14);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)4))){
(hmiStatus.Box3.Trockengut=16);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)5))){
(hmiStatus.Box3.Trockengut=18);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)6))){
(hmiStatus.Box3.Trockengut=20);
}
}else{
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)0))){
(hmiStatus.Box3.Trockengut=9);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)1))){
(hmiStatus.Box3.Trockengut=11);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)2))){
(hmiStatus.Box3.Trockengut=13);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)3))){
(hmiStatus.Box3.Trockengut=15);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)4))){
(hmiStatus.Box3.Trockengut=17);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)5))){
(hmiStatus.Box3.Trockengut=19);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(3,1,6)-1].Trockengut==(unsigned long)(unsigned char)6))){
(hmiStatus.Box3.Trockengut=21);
}
}


if((hmiParameter.Boxen[CheckBounds(4,1,6)-1].Aus|gCmdAnlage.Test)){
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)0))){
(hmiStatus.Box4.Trockengut=8);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)1))){
(hmiStatus.Box4.Trockengut=10);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)2))){
(hmiStatus.Box4.Trockengut=12);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)3))){
(hmiStatus.Box4.Trockengut=14);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)4))){
(hmiStatus.Box4.Trockengut=16);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)5))){
(hmiStatus.Box4.Trockengut=18);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)6))){
(hmiStatus.Box4.Trockengut=20);
}
}else{
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)0))){
(hmiStatus.Box4.Trockengut=9);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)1))){
(hmiStatus.Box4.Trockengut=11);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)2))){
(hmiStatus.Box4.Trockengut=13);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)3))){
(hmiStatus.Box4.Trockengut=15);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)4))){
(hmiStatus.Box4.Trockengut=17);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)5))){
(hmiStatus.Box4.Trockengut=19);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(4,1,6)-1].Trockengut==(unsigned long)(unsigned char)6))){
(hmiStatus.Box4.Trockengut=21);
}
}


if((hmiParameter.Boxen[CheckBounds(5,1,6)-1].Aus|gCmdAnlage.Test)){
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)0))){
(hmiStatus.Box5.Trockengut=8);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)1))){
(hmiStatus.Box5.Trockengut=10);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)2))){
(hmiStatus.Box5.Trockengut=12);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)3))){
(hmiStatus.Box5.Trockengut=14);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)4))){
(hmiStatus.Box5.Trockengut=16);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)5))){
(hmiStatus.Box5.Trockengut=18);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)6))){
(hmiStatus.Box5.Trockengut=20);
}
}else{
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)0))){
(hmiStatus.Box5.Trockengut=9);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)1))){
(hmiStatus.Box5.Trockengut=11);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)2))){
(hmiStatus.Box5.Trockengut=13);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)3))){
(hmiStatus.Box5.Trockengut=15);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)4))){
(hmiStatus.Box5.Trockengut=17);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)5))){
(hmiStatus.Box5.Trockengut=19);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(5,1,6)-1].Trockengut==(unsigned long)(unsigned char)6))){
(hmiStatus.Box5.Trockengut=21);
}
}


if((hmiParameter.Boxen[CheckBounds(6,1,6)-1].Aus|gCmdAnlage.Test)){
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)0))){
(hmiStatus.Box6.Trockengut=8);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)1))){
(hmiStatus.Box6.Trockengut=10);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)2))){
(hmiStatus.Box6.Trockengut=12);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)3))){
(hmiStatus.Box6.Trockengut=14);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)4))){
(hmiStatus.Box6.Trockengut=16);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)5))){
(hmiStatus.Box6.Trockengut=18);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)6))){
(hmiStatus.Box6.Trockengut=20);
}
}else{
if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)0))){
(hmiStatus.Box6.Trockengut=9);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)1))){
(hmiStatus.Box6.Trockengut=11);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)2))){
(hmiStatus.Box6.Trockengut=13);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)3))){
(hmiStatus.Box6.Trockengut=15);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)4))){
(hmiStatus.Box6.Trockengut=17);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)5))){
(hmiStatus.Box6.Trockengut=19);
}else if((((unsigned long)(unsigned char)hmiParameter.Boxen[CheckBounds(6,1,6)-1].Trockengut==(unsigned long)(unsigned char)6))){
(hmiStatus.Box6.Trockengut=21);
}
}







if(hmiButtons.ButtonsKlappeBox1.Klappe1){
if((((signed long)hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe1>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe1=0);
}else{
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe1=CheckRange((hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe1+1),0,2));
}
(hmiButtons.ButtonsKlappeBox1.Klappe1=0);
}
if(hmiButtons.ButtonsKlappeBox1.Klappe2){
if((((signed long)hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe2>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe2=0);
}else{
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe2=CheckRange((hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe2+1),0,2));
}
(hmiButtons.ButtonsKlappeBox1.Klappe2=0);
}
if(hmiButtons.ButtonsKlappeBox1.Klappe3){
if((((signed long)hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe3>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe3=0);
}else{
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe3=CheckRange((hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe3+1),0,2));
}
(hmiButtons.ButtonsKlappeBox1.Klappe3=0);
}
if(hmiButtons.ButtonsKlappeBox1.Klappe4){
if((((signed long)hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe4>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe4=0);
}else{
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe4=CheckRange((hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe4+1),0,2));
}
(hmiButtons.ButtonsKlappeBox1.Klappe4=0);
}
if(hmiButtons.ButtonsKlappeBox1.Klappe5){
if((((signed long)hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe5>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe5=0);
}else{
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe5=CheckRange((hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe5+1),0,2));
}
(hmiButtons.ButtonsKlappeBox1.Klappe5=0);
}
if(hmiButtons.ButtonsKlappeBox1.Klappe6){
if((((signed long)hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe6>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe6=0);
}else{
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe6=CheckRange((hmiParameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe6+1),0,2));
}
(hmiButtons.ButtonsKlappeBox1.Klappe6=0);
}



if(hmiButtons.ButtonsKlappeBox2.Klappe1){
if((((signed long)hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe1>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe1=0);
}else{
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe1=CheckRange((hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe1+1),0,2));
}
(hmiButtons.ButtonsKlappeBox2.Klappe1=0);
}
if(hmiButtons.ButtonsKlappeBox2.Klappe2){
if((((signed long)hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe2>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe2=0);
}else{
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe2=CheckRange((hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe2+1),0,2));
}
(hmiButtons.ButtonsKlappeBox2.Klappe2=0);
}
if(hmiButtons.ButtonsKlappeBox2.Klappe3){
if((((signed long)hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe3>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe3=0);
}else{
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe3=CheckRange((hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe3+1),0,2));
}
(hmiButtons.ButtonsKlappeBox2.Klappe3=0);
}
if(hmiButtons.ButtonsKlappeBox2.Klappe4){
if((((signed long)hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe4>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe4=0);
}else{
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe4=CheckRange((hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe4+1),0,2));
}
(hmiButtons.ButtonsKlappeBox2.Klappe4=0);
}
if(hmiButtons.ButtonsKlappeBox2.Klappe5){
if((((signed long)hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe5>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe5=0);
}else{
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe5=CheckRange((hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe5+1),0,2));
}
(hmiButtons.ButtonsKlappeBox2.Klappe5=0);
}
if(hmiButtons.ButtonsKlappeBox2.Klappe6){
if((((signed long)hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe6>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe6=0);
}else{
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe6=CheckRange((hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe6+1),0,2));
}
(hmiButtons.ButtonsKlappeBox2.Klappe6=0);
}



if(hmiButtons.ButtonsKlappeBox3.Klappe1){
if((((signed long)hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe1>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe1=0);
}else{
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe1=CheckRange((hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe1+1),0,2));
}
(hmiButtons.ButtonsKlappeBox3.Klappe1=0);
}
if(hmiButtons.ButtonsKlappeBox3.Klappe2){
if((((signed long)hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe2>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe2=0);
}else{
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe2=CheckRange((hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe2+1),0,2));
}
(hmiButtons.ButtonsKlappeBox3.Klappe2=0);
}
if(hmiButtons.ButtonsKlappeBox3.Klappe3){
if((((signed long)hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe3>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe3=0);
}else{
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe3=CheckRange((hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe3+1),0,2));
}
(hmiButtons.ButtonsKlappeBox3.Klappe3=0);
}
if(hmiButtons.ButtonsKlappeBox3.Klappe4){
if((((signed long)hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe4>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe4=0);
}else{
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe4=CheckRange((hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe4+1),0,2));
}
(hmiButtons.ButtonsKlappeBox3.Klappe4=0);
}
if(hmiButtons.ButtonsKlappeBox3.Klappe5){
if((((signed long)hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe5>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe5=0);
}else{
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe5=CheckRange((hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe5+1),0,2));
}
(hmiButtons.ButtonsKlappeBox3.Klappe5=0);
}
if(hmiButtons.ButtonsKlappeBox3.Klappe6){
if((((signed long)hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe6>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe6=0);
}else{
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe6=CheckRange((hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe6+1),0,2));
}
(hmiButtons.ButtonsKlappeBox3.Klappe6=0);
}



if(hmiButtons.ButtonsKlappeBox4.Klappe1){
if((((signed long)hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe1>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe1=0);
}else{
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe1=CheckRange((hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe1+1),0,2));
}
(hmiButtons.ButtonsKlappeBox4.Klappe1=0);
}
if(hmiButtons.ButtonsKlappeBox4.Klappe2){
if((((signed long)hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe2>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe2=0);
}else{
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe2=CheckRange((hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe2+1),0,2));
}
(hmiButtons.ButtonsKlappeBox4.Klappe2=0);
}
if(hmiButtons.ButtonsKlappeBox4.Klappe3){
if((((signed long)hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe3>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe3=0);
}else{
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe3=CheckRange((hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe3+1),0,2));
}
(hmiButtons.ButtonsKlappeBox4.Klappe3=0);
}
if(hmiButtons.ButtonsKlappeBox4.Klappe4){
if((((signed long)hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe4>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe4=0);
}else{
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe4=CheckRange((hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe4+1),0,2));
}
(hmiButtons.ButtonsKlappeBox4.Klappe4=0);
}
if(hmiButtons.ButtonsKlappeBox4.Klappe5){
if((((signed long)hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe5>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe5=0);
}else{
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe5=CheckRange((hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe5+1),0,2));
}
(hmiButtons.ButtonsKlappeBox4.Klappe5=0);
}
if(hmiButtons.ButtonsKlappeBox4.Klappe6){
if((((signed long)hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe6>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe6=0);
}else{
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe6=CheckRange((hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe6+1),0,2));
}
(hmiButtons.ButtonsKlappeBox4.Klappe6=0);
}



if(hmiButtons.ButtonsKlappeBox5.Klappe1){
if((((signed long)hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe1>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe1=0);
}else{
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe1=CheckRange((hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe1+1),0,2));
}
(hmiButtons.ButtonsKlappeBox5.Klappe1=0);
}
if(hmiButtons.ButtonsKlappeBox5.Klappe2){
if((((signed long)hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe2>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe2=0);
}else{
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe2=CheckRange((hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe2+1),0,2));
}
(hmiButtons.ButtonsKlappeBox5.Klappe2=0);
}
if(hmiButtons.ButtonsKlappeBox5.Klappe3){
if((((signed long)hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe3>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe3=0);
}else{
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe3=CheckRange((hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe3+1),0,2));
}
(hmiButtons.ButtonsKlappeBox5.Klappe3=0);
}
if(hmiButtons.ButtonsKlappeBox5.Klappe4){
if((((signed long)hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe4>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe4=0);
}else{
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe4=CheckRange((hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe4+1),0,2));
}
(hmiButtons.ButtonsKlappeBox5.Klappe4=0);
}
if(hmiButtons.ButtonsKlappeBox5.Klappe5){
if((((signed long)hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe5>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe5=0);
}else{
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe5=CheckRange((hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe5+1),0,2));
}
(hmiButtons.ButtonsKlappeBox5.Klappe5=0);
}
if(hmiButtons.ButtonsKlappeBox5.Klappe6){
if((((signed long)hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe6>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe6=0);
}else{
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe6=CheckRange((hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe6+1),0,2));
}
(hmiButtons.ButtonsKlappeBox5.Klappe6=0);
}


if(hmiButtons.ButtonsKlappeBox6.Klappe1){
if((((signed long)hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe1>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe1=0);
}else{
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe1=CheckRange((hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe1+1),0,2));
}
(hmiButtons.ButtonsKlappeBox6.Klappe1=0);
}
if(hmiButtons.ButtonsKlappeBox6.Klappe2){
if((((signed long)hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe2>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe2=0);
}else{
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe2=CheckRange((hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe2+1),0,2));
}
(hmiButtons.ButtonsKlappeBox6.Klappe2=0);
}
if(hmiButtons.ButtonsKlappeBox6.Klappe3){
if((((signed long)hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe3>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe3=0);
}else{
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe3=CheckRange((hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe3+1),0,2));
}
(hmiButtons.ButtonsKlappeBox6.Klappe3=0);
}
if(hmiButtons.ButtonsKlappeBox6.Klappe4){
if((((signed long)hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe4>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe4=0);
}else{
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe4=CheckRange((hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe4+1),0,2));
}
(hmiButtons.ButtonsKlappeBox6.Klappe4=0);
}
if(hmiButtons.ButtonsKlappeBox6.Klappe5){
if((((signed long)hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe5>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe5=0);
}else{
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe5=CheckRange((hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe5+1),0,2));
}
(hmiButtons.ButtonsKlappeBox6.Klappe5=0);
}
if(hmiButtons.ButtonsKlappeBox6.Klappe6){
if((((signed long)hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe6>=(signed long)2))){
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe6=0);
}else{
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe6=CheckRange((hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe6+1),0,2));
}
(hmiButtons.ButtonsKlappeBox6.Klappe6=0);
}







if(hmiButtons.TestbetriebAbschliessen){
(hmiActions.cmdChangePageTo=700);
(hmiButtons.TestbetriebEin=0);
}


if(hmiButtons.TestbetriebAbbrechen){
(hmiActions.cmdChangePageTo=700);
(hmiButtons.TestbetriebEin=0);
}


if((hmiButtons.TestbetriebAbschliessen&~Edge0000100061&1?((Edge0000100061=hmiButtons.TestbetriebAbschliessen&1),1):((Edge0000100061=hmiButtons.TestbetriebAbschliessen&1),0))){
(hmiNutzungsdaten.Allgemein.IoTestAbgeschlossen=1);
(hmiParameter.Betrieb.BetriebAutoEin=1);
}else if(hmiButtons.TestbetriebEin){
(hmiNutzungsdaten.Allgemein.IoTestAbgeschlossen=0);
(hmiParameter.Betrieb.BetriebAutoEin=0);
}


if(((hmiButtons.TestbetriebAbbrechen&~Edge0000100062&1?((Edge0000100062=hmiButtons.TestbetriebAbbrechen&1),1):((Edge0000100062=hmiButtons.TestbetriebAbbrechen&1),0))|(hmiButtons.TestbetriebEin&~Edge0000100063&1?((Edge0000100063=hmiButtons.TestbetriebEin&1),1):((Edge0000100063=hmiButtons.TestbetriebEin&1),0)))){
(hmiNutzungsdaten.Allgemein.IoTestAbgeschlossen=0);
}


}imp1_else374_0:imp1_end374_0:;}
#line 3621 "C:/SharedFolder/CControl/Logical/Visualisierung/hmiMain/Main.nodebug"

void __AS__ImplInitMain_st(void){__BUR__ENTRY_INIT_FUNCT__();}

unsigned long __AS__MEMCPY(unsigned long pDest, unsigned long pSrc, unsigned long length)
{memcpy((char*)pDest, (char*)pSrc, length); return pDest + length;}

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
__asm__(".ascii \"iecfile \\\"Temp/Includes/AS_TempDecl/2_07/GlobalComponents/MpComponents.var\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Logical/Visualisierung/hmiMain/Types.typ\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Visualisierung/hmiMain/Variables.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/2_07/4PPC30_0702_21B/hmiMain/Main.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/2_07/4PPC30_0702_21B/hmiMain/Main.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Visualisierung/hmiMain/Main.st\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Temp/Objects/2_07/4PPC30_0702_21B/hmiMain/Main.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".previous");

__asm__(".section \".plciec\"");
__asm__(".ascii \"plcdata_const 'Betriebsparameter'\\n\"");
__asm__(".ascii \"plcdata_const 'hmiBoxAktuell'\\n\"");
__asm__(".ascii \"plcdata_const 'hmiParameter'\\n\"");
__asm__(".ascii \"plcdata_const 'hmiNutzungsdaten'\\n\"");
__asm__(".previous");
