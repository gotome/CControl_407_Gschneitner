#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/Alarm/AlarmCyclicst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Alarmsystem/Alarm/AlarmCyclic.nodebug"
#line 3 "C:/SharedFolder/CControl/Logical/Alarmsystem/Alarm/AlarmCyclic.st"
void __BUR__ENTRY_INIT_FUNCT__(void){{

(init=0);

}}
#line 7 "C:/SharedFolder/CControl/Logical/Alarmsystem/Alarm/AlarmCyclic.nodebug"
#line 9 "C:/SharedFolder/CControl/Logical/Alarmsystem/Alarm/AlarmCyclic.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){{



(eUhr.Freigabe=1);;fbLascoEUhr(&eUhr);
(fbLascoZdxx_0.IN=eUhr.Sekunde);;fbLascoZdxx(&fbLascoZdxx_0);
(sekTick=fbLascoZdxx_0.Q);


if(init){







(alarmFehler[CheckBounds(0,0,49)]=(di24VDCinternIstOk^1));


(alarmFehler[CheckBounds(1,0,49)]=Aktoren.KompressorModul1.StoerungOut);


(alarmFehler[CheckBounds(2,0,49)]=Aktoren.KompressorModul2.StoerungOut);



(fbLascoFehl_0.FehlerIn=(doKompressorEinModul1&(diBetriebsmldgKompressorModul1^1)));;(fbLascoFehl_0.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_0.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_0.Tick=sekTick);;(fbLascoFehl_0.Mode=1);;fbLascoFehl(&fbLascoFehl_0);
(alarmFehler[CheckBounds(3,0,49)]=fbLascoFehl_0.FehlerOut);



(fbLascoFehl_1.FehlerIn=(gModul2Vorhanden&doKompressorEinModul2&(diBetriebsmldgKompressorModul2^1)));;(fbLascoFehl_1.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_1.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_1.Tick=sekTick);;(fbLascoFehl_1.Mode=1);;fbLascoFehl(&fbLascoFehl_1);
(alarmFehler[CheckBounds(4,0,49)]=fbLascoFehl_1.FehlerOut);



(fbLascoFehl_2.FehlerIn=Aktoren.VentUndKlappen.FehlerFuVentilator1);;(fbLascoFehl_2.VerzZeit=0);;(fbLascoFehl_2.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_2.Tick=sekTick);;(fbLascoFehl_2.Mode=1);;fbLascoFehl(&fbLascoFehl_2);
(alarmFehler[CheckBounds(5,0,49)]=fbLascoFehl_2.FehlerOut);



(fbLascoFehl_3.FehlerIn=Aktoren.VentUndKlappen.FehlerFuVentilator2);;(fbLascoFehl_3.VerzZeit=0);;(fbLascoFehl_3.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_3.Tick=sekTick);;(fbLascoFehl_3.Mode=1);;fbLascoFehl(&fbLascoFehl_3);
(alarmFehler[CheckBounds(6,0,49)]=fbLascoFehl_3.FehlerOut);



(fbLascoFehl_4.FehlerIn=Aktoren.Abluftventilator.FehlerOut);;(fbLascoFehl_4.VerzZeit=0);;(fbLascoFehl_4.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_4.Tick=sekTick);;(fbLascoFehl_4.Mode=1);;fbLascoFehl(&fbLascoFehl_4);
(alarmFehler[CheckBounds(7,0,49)]=fbLascoFehl_4.FehlerOut);



(fbLascoFehl_5.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&(diHochdruckOkModul1^1)));;(fbLascoFehl_5.VerzZeit=0);;(fbLascoFehl_5.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_5.Tick=sekTick);;(fbLascoFehl_5.Mode=0);;fbLascoFehl(&fbLascoFehl_5);
(alarmFehler[CheckBounds(8,0,49)]=fbLascoFehl_5.FehlerOut);



(fbLascoFehl_6.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&gModul2Vorhanden&(diHochdruckOkModul2^1)));;(fbLascoFehl_6.VerzZeit=0);;(fbLascoFehl_6.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_6.Tick=sekTick);;(fbLascoFehl_6.Mode=0);;fbLascoFehl(&fbLascoFehl_6);
(alarmFehler[CheckBounds(9,0,49)]=fbLascoFehl_6.FehlerOut);



(fbLascoFehl_7.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&(diNiederdruckOkModul1^1)));;(fbLascoFehl_7.VerzZeit=0);;(fbLascoFehl_7.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_7.Tick=sekTick);;(fbLascoFehl_7.Mode=0);;fbLascoFehl(&fbLascoFehl_7);
(alarmFehler[CheckBounds(10,0,49)]=fbLascoFehl_7.FehlerOut);



(fbLascoFehl_8.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&gModul2Vorhanden&(diNiederdruckOkModul2^1)));;(fbLascoFehl_8.VerzZeit=0);;(fbLascoFehl_8.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_8.Tick=sekTick);;(fbLascoFehl_8.Mode=0);;fbLascoFehl(&fbLascoFehl_8);
(alarmFehler[CheckBounds(11,0,49)]=fbLascoFehl_8.FehlerOut);



(fbLascoFehl_9.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&(diOeldruckKompressorModul1^1)));;(fbLascoFehl_9.VerzZeit=0);;(fbLascoFehl_9.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_9.Tick=sekTick);;(fbLascoFehl_9.Mode=0);;fbLascoFehl(&fbLascoFehl_9);
(alarmFehler[CheckBounds(12,0,49)]=fbLascoFehl_9.FehlerOut);



(fbLascoFehl_10.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&gModul2Vorhanden&(diOeldruckKompressorModul2^1)));;(fbLascoFehl_10.VerzZeit=0);;(fbLascoFehl_10.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_10.Tick=sekTick);;(fbLascoFehl_10.Mode=0);;fbLascoFehl(&fbLascoFehl_10);
(alarmFehler[CheckBounds(13,0,49)]=fbLascoFehl_10.FehlerOut);



(fbLascoFehl_11.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&(diKopftempKompressorModul1^1)));;(fbLascoFehl_11.VerzZeit=0);;(fbLascoFehl_11.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_11.Tick=sekTick);;(fbLascoFehl_11.Mode=0);;fbLascoFehl(&fbLascoFehl_11);
(alarmFehler[CheckBounds(14,0,49)]=fbLascoFehl_11.FehlerOut);



(fbLascoFehl_12.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&gModul2Vorhanden&(diKopftempKompressorModul2^1)));;(fbLascoFehl_12.VerzZeit=0);;(fbLascoFehl_12.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_12.Tick=sekTick);;(fbLascoFehl_12.Mode=0);;fbLascoFehl(&fbLascoFehl_12);
(alarmFehler[CheckBounds(15,0,49)]=fbLascoFehl_12.FehlerOut);



(fbLascoFehl_13.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&(diVollschutzKompressorModul1^1)));;(fbLascoFehl_13.VerzZeit=0);;(fbLascoFehl_13.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_13.Tick=sekTick);;(fbLascoFehl_13.Mode=0);;fbLascoFehl(&fbLascoFehl_13);
(alarmFehler[CheckBounds(16,0,49)]=fbLascoFehl_13.FehlerOut);



(fbLascoFehl_14.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&gModul2Vorhanden&(diVollschutzKompressorModul2^1)));;(fbLascoFehl_14.VerzZeit=0);;(fbLascoFehl_14.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_14.Tick=sekTick);;(fbLascoFehl_14.Mode=0);;fbLascoFehl(&fbLascoFehl_14);
(alarmFehler[CheckBounds(17,0,49)]=fbLascoFehl_14.FehlerOut);


(alarmFehler[CheckBounds(18,0,49)]=Aktoren.Warmluftofen.FehlerBetriebsmeldungOut);


(alarmFehler[CheckBounds(19,0,49)]=Aktoren.Notstromaggregat.FehlerOut);




(fbLascoFehl_15.FehlerIn=((diStatusFrischluftFeuchteMin|diStatusFrischluftTempMax|diStatusFrischluftTempMin)&Betriebsparameter.Ausstattung.SensorFrischluft));;(fbLascoFehl_15.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_15.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_15.Tick=sekTick);;(fbLascoFehl_15.Mode=1);;fbLascoFehl(&fbLascoFehl_15);
(alarmFehler[CheckBounds(20,0,49)]=fbLascoFehl_15.FehlerOut);



(fbLascoFehl_16.FehlerIn=((diStatusDachluftFeuchteMin|diStatusDachluftTempMax|diStatusDachluftTempMin)&Betriebsparameter.Ausstattung.SensorDachluft));;(fbLascoFehl_16.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_16.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_16.Tick=sekTick);;(fbLascoFehl_16.Mode=1);;fbLascoFehl(&fbLascoFehl_16);
(alarmFehler[CheckBounds(21,0,49)]=fbLascoFehl_16.FehlerOut);



(fbLascoFehl_17.FehlerIn=((diStatusTrockenluftFeuchteMin|diStatusTrockenluftTempMax|diStatusTrockenluftTempMin)&Betriebsparameter.Ausstattung.SensorTrockenluft));;(fbLascoFehl_17.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_17.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_17.Tick=sekTick);;(fbLascoFehl_17.Mode=1);;fbLascoFehl(&fbLascoFehl_17);
(alarmFehler[CheckBounds(22,0,49)]=fbLascoFehl_17.FehlerOut);



(fbLascoFehl_18.FehlerIn=((diStatusAbluftFeuchteMin|diStatusAbluftTempMax|diStatusAbluftTempMin)&Betriebsparameter.Ausstattung.SensorAbluft));;(fbLascoFehl_18.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_18.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_18.Tick=sekTick);;(fbLascoFehl_18.Mode=1);;fbLascoFehl(&fbLascoFehl_18);
(alarmFehler[CheckBounds(23,0,49)]=fbLascoFehl_18.FehlerOut);



(fbLascoFehl_19.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&(diStatusEintrittFeuchteMin|diStatusEintrittTempMax|diStatusEintrittTempMin)));;(fbLascoFehl_19.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_19.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_19.Tick=sekTick);;(fbLascoFehl_19.Mode=1);;fbLascoFehl(&fbLascoFehl_19);
(alarmFehler[CheckBounds(24,0,49)]=fbLascoFehl_19.FehlerOut);

(alarmFehler[CheckBounds(25,0,49)]=0);


(fbLascoFehl_20.FehlerIn=((diStatusLuftgeschwDrahtbruch|diStatusLuftgeschwMax|diStatusLuftgeschwMin)&Betriebsparameter.Ausstattung.SensorLuftgeschwindigkeit));;(fbLascoFehl_20.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_20.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_20.Tick=sekTick);;(fbLascoFehl_20.Mode=1);;fbLascoFehl(&fbLascoFehl_20);
(alarmFehler[CheckBounds(26,0,49)]=fbLascoFehl_20.FehlerOut);


(fbLascoFehl_21.FehlerIn=((diStatusDifferenzdruckMax|diStatusDifferenzdruckMin)&Betriebsparameter.Ausstattung.SensorKanaldruck));;(fbLascoFehl_21.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_21.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_21.Tick=sekTick);;(fbLascoFehl_21.Mode=1);;fbLascoFehl(&fbLascoFehl_21);
(alarmFehler[CheckBounds(27,0,49)]=fbLascoFehl_21.FehlerOut);


(fbLascoFehl_22.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&(diStatusNiederdruckMaxMod1|diStatusNiederdruckMinMod1)));;(fbLascoFehl_22.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_22.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_22.Tick=sekTick);;(fbLascoFehl_22.Mode=1);;fbLascoFehl(&fbLascoFehl_22);
(alarmFehler[CheckBounds(28,0,49)]=fbLascoFehl_22.FehlerOut);


(fbLascoFehl_23.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&gModul2Vorhanden&(diStatusNiederdruckMaxMod2|diStatusNiederdruckMinMod2)));;(fbLascoFehl_23.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_23.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_23.Tick=sekTick);;(fbLascoFehl_23.Mode=1);;fbLascoFehl(&fbLascoFehl_23);
(alarmFehler[CheckBounds(29,0,49)]=fbLascoFehl_23.FehlerOut);


(fbLascoFehl_24.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&(diStatusHochdruckMaxMod1|diStatusHochdruckMinMod1)));;(fbLascoFehl_24.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_24.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_24.Tick=sekTick);;(fbLascoFehl_24.Mode=1);;fbLascoFehl(&fbLascoFehl_24);
(alarmFehler[CheckBounds(30,0,49)]=fbLascoFehl_24.FehlerOut);


(fbLascoFehl_25.FehlerIn=(Betriebsparameter.Ausstattung.Entfeuchter&gModul2Vorhanden&(diStatusHochdruckMaxMod2|diStatusHochdruckMinMod2)));;(fbLascoFehl_25.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_25.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_25.Tick=sekTick);;(fbLascoFehl_25.Mode=1);;fbLascoFehl(&fbLascoFehl_25);
(alarmFehler[CheckBounds(31,0,49)]=fbLascoFehl_25.FehlerOut);


(alarmFehler[CheckBounds(32,0,49)]=(Aktoren.VentUndKlappen.FehlerLaufzeitBypass&Betriebsparameter.Ausstattung.Bypassklappe));


(alarmFehler[CheckBounds(33,0,49)]=(Aktoren.VentUndKlappen.FehlerLaufzeitUmschaltkl1&Betriebsparameter.Ausstattung.Umschaltklappe1));


(alarmFehler[CheckBounds(34,0,49)]=(Aktoren.VentUndKlappen.FehlerLaufzeitUmschaltkl2&Betriebsparameter.Ausstattung.Umschaltklappe2));


(alarmFehler[CheckBounds(35,0,49)]=Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox1);


(alarmFehler[CheckBounds(36,0,49)]=Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox2);


(alarmFehler[CheckBounds(37,0,49)]=Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox3);


(alarmFehler[CheckBounds(38,0,49)]=Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox4);


(alarmFehler[CheckBounds(39,0,49)]=Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox5);


(alarmFehler[CheckBounds(40,0,49)]=Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox6);


(alarmFehler[CheckBounds(41,0,49)]=Aktoren.Abluftklappe.FehlerLaufzeit);



(alarmFehler[CheckBounds(42,0,49)]=(((gStatusAnlage.EintrittTemperatur>Betriebsparameter.Kompressor1.EintrittTempMax))&Betriebsparameter.Ausstattung.Entfeuchter&Boxen.FreigabeLuftentfeuchter));



(alarmFehler[CheckBounds(43,0,49)]=(((gStatusAnlage.EintrittTemperatur<Betriebsparameter.Kompressor1.EintrittTempMin))&Betriebsparameter.Ausstattung.Entfeuchter&Boxen.FreigabeLuftentfeuchter));


(alarmFehler[CheckBounds(44,0,49)]=Aktoren.KompressorModul1.FehlerPumpdown);


(alarmFehler[CheckBounds(45,0,49)]=(Aktoren.KompressorModul2.FehlerPumpdown&gModul2Vorhanden));


if((((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)3))){
(alarmFehler[CheckBounds(46,0,49)]=((diDrehfeldIstKorrekt^1)&(alarmSystem[CheckBounds(1,0,4)]^1)));
}else{
(alarmFehler[CheckBounds(46,0,49)]=0);
}



(fbLascoFehl_29.FehlerIn=(Betriebsparameter.Ausstattung.EntfeuchterFremd&diEntfeuchterFremdStoerung));;(fbLascoFehl_29.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_29.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_29.Tick=sekTick);;(fbLascoFehl_29.Mode=2);;fbLascoFehl(&fbLascoFehl_29);
(alarmFehler[CheckBounds(47,0,49)]=fbLascoFehl_29.FehlerOut);


(alarmFehler[CheckBounds(48,0,49)]=(Betriebsparameter.Ausstattung.EntfeuchterFremd&Aktoren.EntfeuchterFremd.FehlerBetriebsmldg));









(fbLascoFehl_26.FehlerIn=(gStatusAnlage.Betrieb&((gStatusAnlage.HochdruckModul1>Betriebsparameter.Kompressor1.HochdruckMax))&(Aktoren.KompressorModul1.KlappenumschaltungAkiv^1)));;(fbLascoFehl_26.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungWarnungen);;(fbLascoFehl_26.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_26.Tick=sekTick);;(fbLascoFehl_26.Mode=0);;fbLascoFehl(&fbLascoFehl_26);
(alarmWarnung[CheckBounds(0,0,29)]=fbLascoFehl_26.FehlerOut);




(fbLascoFehl_27.FehlerIn=(gModul2Vorhanden&gStatusAnlage.Betrieb&((gStatusAnlage.HochdruckModul2>Betriebsparameter.Kompressor1.HochdruckMax))&(Aktoren.KompressorModul2.KlappenumschaltungAkiv^1)));;(fbLascoFehl_27.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungWarnungen);;(fbLascoFehl_27.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_27.Tick=sekTick);;(fbLascoFehl_27.Mode=0);;fbLascoFehl(&fbLascoFehl_27);
(alarmWarnung[CheckBounds(1,0,29)]=fbLascoFehl_27.FehlerOut);



(fbLascoFehl_28.FehlerIn=(diStatusAustrittFeuchteMax|diStatusAustrittFeuchteMin|diStatusAustrittTempMax|diStatusAustrittTempMin));;(fbLascoFehl_28.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungFehler);;(fbLascoFehl_28.Quit=hmiButtons.QuitFehler);;(fbLascoFehl_28.Tick=sekTick);;(fbLascoFehl_28.Mode=1);;fbLascoFehl(&fbLascoFehl_28);
(alarmWarnung[CheckBounds(2,0,29)]=fbLascoFehl_28.FehlerOut);


(alarmWarnung[CheckBounds(3,0,29)]=diHeizregisterFrostschutz);






if((gStatusAnlage.Betrieb|(((signed long)gAktModus==(signed long)0)))){
(doTrocknungStoerung=gStatusAnlage.Fehler.SummeFehler);
}else{
(doTrocknungStoerung=0);
}

}





(alarmSystem[CheckBounds(0,0,4)]=(Nutzungsdaten.Allgemein.IoTestAbgeschlossen^1));


(TON_Fehlerquittierung.IN=hmiButtons.QuitFehler);
(TON_Fehlerquittierung.PT=(plctime)CONST_VERZ_QUIT);
TON(&TON_Fehlerquittierung);

if(TON_Fehlerquittierung.Q){
(hmiButtons.QuitFehler=0);
}




(gStatusAnlage.Fehler.SummeFehler=0);
(gStatusAnlage.Fehler.FehlerNr=0);
(ilen=49);
for((i=0);i<=ilen;i+=1){
if((((unsigned long)(unsigned char)alarmFehler[CheckBounds(i,0,49)]==(unsigned long)(unsigned char)1))){
(gStatusAnlage.Fehler.SummeFehler=1);
(gStatusAnlage.Fehler.FehlerNr=(i+1));
goto imp1_endfor4_0;
}
}imp1_endfor4_0:;


(gStatusAnlage.Fehler.SummeWarnung=0);
(gStatusAnlage.Fehler.WarnungNr=0);
(ilen=29);
for((i=0);i<=ilen;i+=1){
if((((unsigned long)(unsigned char)alarmWarnung[CheckBounds(i,0,29)]==(unsigned long)(unsigned char)1))){
(gStatusAnlage.Fehler.SummeWarnung=1);
(gStatusAnlage.Fehler.WarnungNr=(i+1));
goto imp1_endfor6_0;
}
}imp1_endfor6_0:;

(gStatusAnlage.Fehler.SummeSystem=0);
(ilen=4);
for((i=0);i<=ilen;i+=1){
if((((unsigned long)(unsigned char)alarmSystem[CheckBounds(i,0,4)]==(unsigned long)(unsigned char)1))){
(gStatusAnlage.Fehler.SummeSystem=1);
goto imp1_endfor8_0;
}
}imp1_endfor8_0:;

(init=1);

}}
#line 316 "C:/SharedFolder/CControl/Logical/Alarmsystem/Alarm/AlarmCyclic.nodebug"

void __AS__ImplInitAlarmCyclic_st(void){__BUR__ENTRY_INIT_FUNCT__();}

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
__asm__(".ascii \"iecfile \\\"Temp/Includes/AS_TempDecl/3_04_Plus/GlobalComponents/MpComponents.var\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Logical/Alarmsystem/Alarm/Alarm.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/Alarm/AlarmCyclic.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/Alarm/AlarmCyclic.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Alarmsystem/Alarm/AlarmCyclic.st\\\"\\n\"");
__asm__(".previous");

__asm__(".section \".plciec\"");
__asm__(".ascii \"plcdata_const 'alarmWarnung'\\n\"");
__asm__(".ascii \"plcdata_const 'alarmFehler'\\n\"");
__asm__(".ascii \"plcdata_const 'alarmSystem'\\n\"");
__asm__(".previous");
