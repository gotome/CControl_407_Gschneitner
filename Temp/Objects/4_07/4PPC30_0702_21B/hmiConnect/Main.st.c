#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/hmiConnect/Mainst.h"
#line 1 "C:/SharedFolder/CControl_Gschneitner/Logical/Visualisierung/hmiConnect/Main.nodebug"
#line 2 "C:/SharedFolder/CControl_Gschneitner/Logical/Visualisierung/hmiConnect/Main.st"
void __BUR__ENTRY_INIT_FUNCT__(void){int __AS__Local0_00000;plcstring* __AS__Local3_00000;plcstring* __AS__Local4_00000;{


(hmiVisibility.Trend.AbluftFeuchte=0);
(hmiVisibility.Trend.AbluftTemp=0);
(hmiVisibility.Trend.AustrittFeuchte=0);
(hmiVisibility.Trend.AustrittTemp=0);
(hmiVisibility.Trend.DachluftFeuchte=0);
(hmiVisibility.Trend.DachluftTemp=0);
(hmiVisibility.Trend.EintrittFeuchte=0);
(hmiVisibility.Trend.EintrittTemp=0);
(hmiVisibility.Trend.FrischluftFeuchte=0);
(hmiVisibility.Trend.FrischluftTemp=0);
(hmiVisibility.Trend.HochdruckMod1=0);
(hmiVisibility.Trend.HochdruckMod2=0);
(hmiVisibility.Trend.Kanaldruck=0);
(hmiVisibility.Trend.Luftgeschw=0);
(hmiVisibility.Trend.NiederdruckMod1=0);
(hmiVisibility.Trend.NiederdruckMod2=0);
(hmiVisibility.Trend.TrockenluftFeuchte=0);
(hmiVisibility.Trend.TrockenluftTemp=0);



(hmiStatus.Trendkurven.WertZoomTrend1=1);
(hmiStatus.Trendkurven.WertZoomTrend2=1);
(hmiStatus.Trendkurven.WertZoomTrend3=1);


__AS__Local3_00000=(plcstring*)hmiStatus.SoftwareVersion; __AS__Local4_00000=(plcstring*)VERSION; for(__AS__Local0_00000=0; __AS__Local0_00000<16l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;


}}
#line 34 "C:/SharedFolder/CControl_Gschneitner/Logical/Visualisierung/hmiConnect/Main.nodebug"
#line 36 "C:/SharedFolder/CControl_Gschneitner/Logical/Visualisierung/hmiConnect/Main.st"
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






__AS__MEMCPY(((unsigned long)(&Betriebsparameter)),((unsigned long)(&hmiParameter)),2968);
__AS__MEMCPY(((unsigned long)(&Nutzungsdaten)),((unsigned long)(&hmiNutzungsdaten)),284);






if((~Boxen.Box1Out.BoxBereit&Edge0000100000&1?((Edge0000100000=Boxen.Box1Out.BoxBereit&1),1):((Edge0000100000=Boxen.Box1Out.BoxBereit&1),0))){
(loc_Box1Beendet=1);
__AS__Local3_00000=(plcstring*)hmiTrocknungsbilanz.NameBox; __AS__Local4_00000=(plcstring*)hmiParameter.Boxen[1-1].NameBox; for(__AS__Local0_00000=0; __AS__Local0_00000<20l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(hmiTrocknungsbilanz.LaufzeitGesamt=hmiNutzungsdaten.Bst.Box1Std);
(hmiTrocknungsbilanz.LaufzeitLuftaufbereitung=hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox1);
(hmiTrocknungsbilanz.LaufzeitVentilator=hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox1);
(hmiVisibility.Layers.Trocknungsbilanz=0);
}


if((~Boxen.Box2Out.BoxBereit&Edge0000100001&1?((Edge0000100001=Boxen.Box2Out.BoxBereit&1),1):((Edge0000100001=Boxen.Box2Out.BoxBereit&1),0))){
(loc_Box2Beendet=1);
__AS__Local3_00000=(plcstring*)hmiTrocknungsbilanz.NameBox; __AS__Local4_00000=(plcstring*)hmiParameter.Boxen[2-1].NameBox; for(__AS__Local0_00000=0; __AS__Local0_00000<20l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(hmiTrocknungsbilanz.LaufzeitGesamt=hmiNutzungsdaten.Bst.Box2Std);
(hmiTrocknungsbilanz.LaufzeitLuftaufbereitung=hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox2);
(hmiTrocknungsbilanz.LaufzeitVentilator=hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox2);
(hmiVisibility.Layers.Trocknungsbilanz=0);
}


if((~Boxen.Box3Out.BoxBereit&Edge0000100002&1?((Edge0000100002=Boxen.Box3Out.BoxBereit&1),1):((Edge0000100002=Boxen.Box3Out.BoxBereit&1),0))){
(loc_Box3Beendet=1);
__AS__Local3_00000=(plcstring*)hmiTrocknungsbilanz.NameBox; __AS__Local4_00000=(plcstring*)hmiParameter.Boxen[3-1].NameBox; for(__AS__Local0_00000=0; __AS__Local0_00000<20l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(hmiTrocknungsbilanz.LaufzeitGesamt=hmiNutzungsdaten.Bst.Box3Std);
(hmiTrocknungsbilanz.LaufzeitLuftaufbereitung=hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox3);
(hmiTrocknungsbilanz.LaufzeitVentilator=hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox3);
(hmiVisibility.Layers.Trocknungsbilanz=0);
}


if((~Boxen.Box4Out.BoxBereit&Edge0000100003&1?((Edge0000100003=Boxen.Box4Out.BoxBereit&1),1):((Edge0000100003=Boxen.Box4Out.BoxBereit&1),0))){
(loc_Box4Beendet=1);
__AS__Local3_00000=(plcstring*)hmiTrocknungsbilanz.NameBox; __AS__Local4_00000=(plcstring*)hmiParameter.Boxen[4-1].NameBox; for(__AS__Local0_00000=0; __AS__Local0_00000<20l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(hmiTrocknungsbilanz.LaufzeitGesamt=hmiNutzungsdaten.Bst.Box4Std);
(hmiTrocknungsbilanz.LaufzeitLuftaufbereitung=hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox4);
(hmiTrocknungsbilanz.LaufzeitVentilator=hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox4);
(hmiVisibility.Layers.Trocknungsbilanz=0);
}


if((~Boxen.Box5Out.BoxBereit&Edge0000100004&1?((Edge0000100004=Boxen.Box5Out.BoxBereit&1),1):((Edge0000100004=Boxen.Box5Out.BoxBereit&1),0))){
(loc_Box5Beendet=1);
__AS__Local3_00000=(plcstring*)hmiTrocknungsbilanz.NameBox; __AS__Local4_00000=(plcstring*)hmiParameter.Boxen[5-1].NameBox; for(__AS__Local0_00000=0; __AS__Local0_00000<20l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(hmiTrocknungsbilanz.LaufzeitGesamt=hmiNutzungsdaten.Bst.Box5Std);
(hmiTrocknungsbilanz.LaufzeitLuftaufbereitung=hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox5);
(hmiTrocknungsbilanz.LaufzeitVentilator=hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox5);
(hmiVisibility.Layers.Trocknungsbilanz=0);
}


if((~Boxen.Box6Out.BoxBereit&Edge0000100005&1?((Edge0000100005=Boxen.Box6Out.BoxBereit&1),1):((Edge0000100005=Boxen.Box6Out.BoxBereit&1),0))){
(loc_Box6Beendet=1);
__AS__Local3_00000=(plcstring*)hmiTrocknungsbilanz.NameBox; __AS__Local4_00000=(plcstring*)hmiParameter.Boxen[6-1].NameBox; for(__AS__Local0_00000=0; __AS__Local0_00000<20l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(hmiTrocknungsbilanz.LaufzeitGesamt=hmiNutzungsdaten.Bst.Box6Std);
(hmiTrocknungsbilanz.LaufzeitLuftaufbereitung=hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox6);
(hmiTrocknungsbilanz.LaufzeitVentilator=hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox6);
(hmiVisibility.Layers.Trocknungsbilanz=0);
}


if(hmiButtons.TrocknungsbilanzOk){
if(loc_Box1Beendet){
(hmiNutzungsdaten.Bst.Box1Min=0);
(hmiNutzungsdaten.Bst.Box1Std=0);
(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox1=0);
(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox1=0);
(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox1=0);
(hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox1=0);
__AS__MEMSET(((unsigned long)(&hmiParameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten)),0,24);
__AS__MEMSET(((unsigned long)(&hmiParameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten)),0,24);
(loc_Box1Beendet=0);
}else if(loc_Box2Beendet){
(hmiNutzungsdaten.Bst.Box2Min=0);
(hmiNutzungsdaten.Bst.Box2Std=0);
(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox2=0);
(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox2=0);
(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox2=0);
(hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox2=0);
__AS__MEMSET(((unsigned long)(&hmiParameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten)),0,24);
__AS__MEMSET(((unsigned long)(&hmiParameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten)),0,24);
(loc_Box2Beendet=0);
}else if(loc_Box3Beendet){
(hmiNutzungsdaten.Bst.Box3Min=0);
(hmiNutzungsdaten.Bst.Box3Std=0);
(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox3=0);
(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox3=0);
(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox3=0);
(hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox3=0);
__AS__MEMSET(((unsigned long)(&hmiParameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten)),0,24);
__AS__MEMSET(((unsigned long)(&hmiParameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten)),0,24);
(loc_Box3Beendet=0);
}else if(loc_Box4Beendet){
(hmiNutzungsdaten.Bst.Box4Min=0);
(hmiNutzungsdaten.Bst.Box4Std=0);
(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox4=0);
(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox4=0);
(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox4=0);
(hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox4=0);
__AS__MEMSET(((unsigned long)(&hmiParameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten)),0,24);
__AS__MEMSET(((unsigned long)(&hmiParameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten)),0,24);
(loc_Box4Beendet=0);
}else if(loc_Box5Beendet){
(hmiNutzungsdaten.Bst.Box5Min=0);
(hmiNutzungsdaten.Bst.Box5Std=0);
(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox5=0);
(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox5=0);
(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox5=0);
(hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox5=0);
__AS__MEMSET(((unsigned long)(&hmiParameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten)),0,24);
__AS__MEMSET(((unsigned long)(&hmiParameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten)),0,24);
(loc_Box5Beendet=0);
}else if(loc_Box6Beendet){
(hmiNutzungsdaten.Bst.Box6Min=0);
(hmiNutzungsdaten.Bst.Box6Std=0);
(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox6=0);
(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox6=0);
(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox6=0);
(hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox6=0);
__AS__MEMSET(((unsigned long)(&hmiParameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten)),0,24);
__AS__MEMSET(((unsigned long)(&hmiParameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten)),0,24);
(loc_Box6Beendet=0);
}
(hmiButtons.TrocknungsbilanzOk=0);
(hmiVisibility.Layers.Trocknungsbilanz=1);
}








if((((signed long)gAktModus==(signed long)0))){


if((Aktoren.Notstromaggregat.NotstromaggregatAngefordert&(Aktoren.Notstromaggregat.NotstromBereitOut^1))){
(hmiStatus.Zusatzmeldungen.Statustext=4);
(hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell=Aktoren.Notstromaggregat.RestVorlaufzeit);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=0);
(hmiStatus.Zusatzmeldungen.IconSanduhr=1);

}else if(Aktoren.Warmluftofen.WarmluftofenAktiv){
(hmiStatus.Zusatzmeldungen.Statustext=5);
(hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell=Aktoren.Warmluftofen.RestAuskuehlzeit);
if((hmiParameter.Ausstattung.WarmluftofenBetriebsmldg^1)){
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=0);
}else{
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
}
(hmiStatus.Zusatzmeldungen.IconSanduhr=CheckRange((unsigned char)(hmiBlink&1),0,24));

}else if(Aktoren.Scheitholzofen.ScheitholzofenAktiv){
(hmiStatus.Zusatzmeldungen.Statustext=6);
(hmiStatus.Zusatzmeldungen.IconSanduhr=CheckRange((unsigned char)(hmiBlink&1),0,24));
(hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell=Aktoren.Scheitholzofen.RestAuskuehlzeit);
if((Aktoren.Scheitholzofen.Betriebsmeldung^1)){
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=0);
}

}
else if(((Boxen.NotbetriebVentilator1|Boxen.NotbetriebVentilator2)&((((unsigned long)(unsigned char)Aktoren.KompressorModul1.curStep!=(unsigned long)(unsigned char)0))|(((unsigned long)(unsigned char)Aktoren.KompressorModul2.curStep!=(unsigned long)(unsigned char)0))|(hmiParameter.Ausstattung.EntfeuchterFremd&diEntfeuchterFremdInBetrieb)))){
(hmiStatus.Zusatzmeldungen.Statustext=3);
(hmiStatus.Zusatzmeldungen.IconSanduhr=CheckRange((unsigned char)(hmiBlink&1),0,24));
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);

}else if(gCmdAnlage.FehlerStopp){
(hmiStatus.Zusatzmeldungen.Statustext=16);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
(hmiStatus.Zusatzmeldungen.IconSanduhr=1);

}else if(gStatusAnlage.Fehler.SummeFehler){
(hmiStatus.Zusatzmeldungen.Statustext=1);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
(hmiStatus.Zusatzmeldungen.IconSanduhr=1);

}else{
(hmiStatus.Zusatzmeldungen.Statustext=2);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
(hmiStatus.Zusatzmeldungen.IconSanduhr=1);
}



}else if((((signed long)gAktModus==(signed long)2))){
(hmiStatus.Zusatzmeldungen.Statustext=0);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
(hmiStatus.Zusatzmeldungen.IconSanduhr=1);


}else if((((signed long)gAktModus==(signed long)1))){


if(Tarifabschaltung.TarifabschaltungEin){
(hmiStatus.Zusatzmeldungen.Statustext=9);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
(hmiStatus.Zusatzmeldungen.IconSanduhr=1);

}else if(Strombegrenzung.StrombegrenzungEin){
(hmiStatus.Zusatzmeldungen.Statustext=10);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
(hmiStatus.Zusatzmeldungen.IconSanduhr=1);

}else if(Aktoren.VentUndKlappen.UmschaltungAktiv){
(hmiStatus.Zusatzmeldungen.Statustext=11);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
(hmiStatus.Zusatzmeldungen.IconSanduhr=CheckRange((unsigned char)(hmiBlink&1),0,24));

}else if((Aktoren.Notstromaggregat.NotstromaggregatAngefordert&(Aktoren.Notstromaggregat.NotstromBereitOut^1))){
(hmiStatus.Zusatzmeldungen.Statustext=4);
(hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell=Aktoren.Notstromaggregat.RestVorlaufzeit);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=0);
(hmiStatus.Zusatzmeldungen.IconSanduhr=CheckRange((unsigned char)(hmiBlink&1),0,24));

}else if(Aktoren.VentUndKlappen.AnlaufverzVent1Aktiv){
(hmiStatus.Zusatzmeldungen.Statustext=8);
(hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell=Aktoren.VentUndKlappen.RestAnlaufverzoegerung);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=0);
(hmiStatus.Zusatzmeldungen.IconSanduhr=CheckRange((unsigned char)(hmiBlink&1),0,24));

}else if(Aktoren.VentUndKlappen.AnlaufverzVent2Aktiv){
(hmiStatus.Zusatzmeldungen.Statustext=7);
(hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell=Aktoren.VentUndKlappen.RestAnlaufverzoegerung);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=0);
(hmiStatus.Zusatzmeldungen.IconSanduhr=CheckRange((unsigned char)(hmiBlink&1),0,24));

}else if(Boxen.EntfeuchterInselbetrieb){

if((Boxen.EntfeuchterInselbetrAktivOut^1)){
(hmiStatus.Zusatzmeldungen.Statustext=20);

}else if((Boxen.FreigabeEntfeuchterInselbetrieb^1)){
(hmiStatus.Zusatzmeldungen.Statustext=21);

}else if((Aktoren.VentUndKlappen.Ventilator1InBetrieb^1)){
(hmiStatus.Zusatzmeldungen.Statustext=23);
}else{
(hmiStatus.Zusatzmeldungen.Statustext=22);
}
(hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell=0);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
(hmiStatus.Zusatzmeldungen.IconSanduhr=1);

}else if(((Aktoren.VentUndKlappen.AnforderungVentilator1^1)&(Aktoren.VentUndKlappen.AnforderungVentilator2^1))){
(hmiStatus.Zusatzmeldungen.Statustext=15);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
(hmiStatus.Zusatzmeldungen.IconSanduhr=CheckRange((unsigned char)(hmiBlink&1),0,24));

}else if((Aktoren.Warmluftofen.WarmluftofenAktiv&(Aktoren.Warmluftofen.Freigabe^1))){
(hmiStatus.Zusatzmeldungen.Statustext=5);
(hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell=Aktoren.Warmluftofen.RestAuskuehlzeit);
if((hmiParameter.Ausstattung.WarmluftofenBetriebsmldg^1)){
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=0);
}else{
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
}
(hmiStatus.Zusatzmeldungen.IconSanduhr=CheckRange((unsigned char)(hmiBlink&1),0,24));

}else if(((Boxen.NotbetriebVentilator1|Boxen.NotbetriebVentilator2)&Aktoren.Scheitholzofen.ScheitholzofenAktiv)){
(hmiStatus.Zusatzmeldungen.Statustext=6);
(hmiStatus.Zusatzmeldungen.IconSanduhr=CheckRange((unsigned char)(hmiBlink&1),0,24));
(hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell=Aktoren.Scheitholzofen.RestAuskuehlzeit);
if((Aktoren.Scheitholzofen.Betriebsmeldung^1)){
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=0);
}

}else if(((Boxen.NotbetriebVentilator1|Boxen.NotbetriebVentilator2)&((((unsigned long)(unsigned char)Aktoren.KompressorModul1.curStep!=(unsigned long)(unsigned char)0))|(((unsigned long)(unsigned char)Aktoren.KompressorModul2.curStep!=(unsigned long)(unsigned char)0))))){
(hmiStatus.Zusatzmeldungen.Statustext=3);
(hmiStatus.Zusatzmeldungen.IconSanduhr=CheckRange((unsigned char)(hmiBlink&1),0,24));
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);

}else if(((gStatusAnlage.FrischluftbetriebAktiv&hmiParameter.Umschaltklappen.Automatik)|hmiParameter.Umschaltklappen.Frischluft)){
if(hmiParameter.Ausstattung.SensorDachluft){

if(Tarifabschaltung.TarifabschaltungLuftaufbEin){
(hmiStatus.Zusatzmeldungen.Statustext=18);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
}else{
(hmiStatus.Zusatzmeldungen.Statustext=13);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
}
}else{

if(Tarifabschaltung.TarifabschaltungLuftaufbEin){
(hmiStatus.Zusatzmeldungen.Statustext=17);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
}else{
(hmiStatus.Zusatzmeldungen.Statustext=12);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
}
}
(hmiStatus.Zusatzmeldungen.IconSanduhr=1);

}else if(((gStatusAnlage.UmluftbetriebAktiv&hmiParameter.Umschaltklappen.Automatik)|hmiParameter.Umschaltklappen.Umluft)){

if(Tarifabschaltung.TarifabschaltungLuftaufbEin){
(hmiStatus.Zusatzmeldungen.Statustext=19);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
(hmiStatus.Zusatzmeldungen.IconSanduhr=1);
}else{
(hmiStatus.Zusatzmeldungen.Statustext=14);
(hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit=1);
(hmiStatus.Zusatzmeldungen.IconSanduhr=1);
}
}
}







if(Betriebsparameter.Ausstattung.Entfeuchter){
(hmiVisibility.Allgemein.SymbolEntfeuchterUebersicht=0);
if((((signed long)gStatusAnlage.Aktor[CheckBounds(3,0,39)]==(signed long)9))){
(hmiStatus.Entfeuchter.FarbeIcon=4);
}else if((((signed long)gStatusAnlage.Aktor[CheckBounds(3,0,39)]==(signed long)10))){
(hmiStatus.Entfeuchter.FarbeIcon=3);
}else if((((signed long)gStatusAnlage.Aktor[CheckBounds(3,0,39)]==(signed long)8))){
(hmiStatus.Entfeuchter.FarbeIcon=2);
}else if(((((signed long)gStatusAnlage.Aktor[CheckBounds(3,0,39)]==(signed long)17))|(((signed long)gStatusAnlage.Aktor[CheckBounds(3,0,39)]==(signed long)20)))){
if(hmiBlink){
(hmiStatus.Entfeuchter.FarbeIcon=3);
}else{
(hmiStatus.Entfeuchter.FarbeIcon=2);
}
}else{
(hmiStatus.Entfeuchter.FarbeIcon=2);
}
}else{
(hmiVisibility.Allgemein.SymbolEntfeuchterUebersicht=1);
}


if(Betriebsparameter.Ausstattung.EntfeuchterFremd){
(hmiVisibility.Allgemein.SymbolEntfeuchterFremdUebersicht=0);
if((((signed long)gStatusAnlage.Aktor[CheckBounds(25,0,39)]==(signed long)9))){
(hmiStatus.Entfeuchter.FarbeIcon=4);
}else if((((signed long)gStatusAnlage.Aktor[CheckBounds(25,0,39)]==(signed long)10))){
(hmiStatus.Entfeuchter.FarbeIcon=3);
}else if((((signed long)gStatusAnlage.Aktor[CheckBounds(25,0,39)]==(signed long)8))){
(hmiStatus.Entfeuchter.FarbeIcon=2);
}else if(((((signed long)gStatusAnlage.Aktor[CheckBounds(25,0,39)]==(signed long)17))|(((signed long)gStatusAnlage.Aktor[CheckBounds(25,0,39)]==(signed long)20)))){
if(hmiBlink){
(hmiStatus.Entfeuchter.FarbeIcon=3);
}else{
(hmiStatus.Entfeuchter.FarbeIcon=2);
}
}else{
(hmiStatus.Entfeuchter.FarbeIcon=2);
}
}else{
(hmiVisibility.Allgemein.SymbolEntfeuchterFremdUebersicht=1);
}



if((Betriebsparameter.Ausstattung.Warmluftofen|Betriebsparameter.Ausstattung.Scheitholzofen)){
(hmiVisibility.Allgemein.SymbolOfenUebersicht=0);
if((((signed long)gStatusAnlage.Aktor[CheckBounds(20,0,39)]==(signed long)9))){
(hmiStatus.WarmluftScheitholzofen.FarbeIcon=4);
}else if(((((signed long)gStatusAnlage.Aktor[CheckBounds(20,0,39)]==(signed long)10))|(((signed long)gStatusAnlage.Aktor[CheckBounds(22,0,39)]==(signed long)10)))){
(hmiStatus.WarmluftScheitholzofen.FarbeIcon=3);
}else if(((((signed long)gStatusAnlage.Aktor[CheckBounds(20,0,39)]==(signed long)19))|(((signed long)gStatusAnlage.Aktor[CheckBounds(22,0,39)]==(signed long)19)))){
if(hmiBlink){
(hmiStatus.WarmluftScheitholzofen.FarbeIcon=3);
}else{
(hmiStatus.WarmluftScheitholzofen.FarbeIcon=2);
}
}else{
(hmiStatus.WarmluftScheitholzofen.FarbeIcon=2);
}
}else{
(hmiVisibility.Allgemein.SymbolOfenUebersicht=1);
}



if(Betriebsparameter.Ausstattung.Heizregister){
(hmiVisibility.Allgemein.SymbolRegisterUebersicht=0);
if((((signed long)gStatusAnlage.Aktor[CheckBounds(21,0,39)]==(signed long)9))){
(hmiStatus.Heizregister.FarbeIcon=4);
}else if((((signed long)gStatusAnlage.Aktor[CheckBounds(21,0,39)]==(signed long)10))){
(hmiStatus.Heizregister.FarbeIcon=3);
}else{
(hmiStatus.Heizregister.FarbeIcon=2);
}
}else{
(hmiVisibility.Allgemein.SymbolRegisterUebersicht=1);
}










if((hmiParameter.Ausstattung.Box1&hmiParameter.Ausstattung.Box2&hmiParameter.Ausstattung.Box3&hmiParameter.Ausstattung.Box4&hmiParameter.Ausstattung.Box5&hmiParameter.Ausstattung.Box6)){
(hmiVisibility.Layers.UebersichtEineBox=1);
(hmiVisibility.Layers.UebersichtZweiBoxen=1);
(hmiVisibility.Layers.UebersichtDreiBoxen=1);
(hmiVisibility.Layers.UebersichtVierBoxen=1);
(hmiVisibility.Layers.UebersichtFuenfBoxen=1);
(hmiVisibility.Layers.UebersichtSechsBoxen=0);
}else if((hmiParameter.Ausstattung.Box1&hmiParameter.Ausstattung.Box2&hmiParameter.Ausstattung.Box3&hmiParameter.Ausstattung.Box4&hmiParameter.Ausstattung.Box5)){
(hmiVisibility.Layers.UebersichtEineBox=1);
(hmiVisibility.Layers.UebersichtZweiBoxen=1);
(hmiVisibility.Layers.UebersichtDreiBoxen=1);
(hmiVisibility.Layers.UebersichtVierBoxen=1);
(hmiVisibility.Layers.UebersichtFuenfBoxen=0);
(hmiVisibility.Layers.UebersichtSechsBoxen=1);
}else if((hmiParameter.Ausstattung.Box1&hmiParameter.Ausstattung.Box2&hmiParameter.Ausstattung.Box3&hmiParameter.Ausstattung.Box4)){
(hmiVisibility.Layers.UebersichtEineBox=1);
(hmiVisibility.Layers.UebersichtZweiBoxen=1);
(hmiVisibility.Layers.UebersichtDreiBoxen=1);
(hmiVisibility.Layers.UebersichtVierBoxen=0);
(hmiVisibility.Layers.UebersichtFuenfBoxen=1);
(hmiVisibility.Layers.UebersichtSechsBoxen=1);
}else if((hmiParameter.Ausstattung.Box1&hmiParameter.Ausstattung.Box2&hmiParameter.Ausstattung.Box3)){
(hmiVisibility.Layers.UebersichtEineBox=1);
(hmiVisibility.Layers.UebersichtZweiBoxen=1);
(hmiVisibility.Layers.UebersichtDreiBoxen=0);
(hmiVisibility.Layers.UebersichtVierBoxen=1);
(hmiVisibility.Layers.UebersichtFuenfBoxen=1);
(hmiVisibility.Layers.UebersichtSechsBoxen=1);
}else if((hmiParameter.Ausstattung.Box1&hmiParameter.Ausstattung.Box2)){
(hmiVisibility.Layers.UebersichtEineBox=1);
(hmiVisibility.Layers.UebersichtZweiBoxen=0);
(hmiVisibility.Layers.UebersichtDreiBoxen=1);
(hmiVisibility.Layers.UebersichtVierBoxen=1);
(hmiVisibility.Layers.UebersichtFuenfBoxen=1);
(hmiVisibility.Layers.UebersichtSechsBoxen=1);
}else{
(hmiVisibility.Layers.UebersichtEineBox=0);
(hmiVisibility.Layers.UebersichtZweiBoxen=1);
(hmiVisibility.Layers.UebersichtDreiBoxen=1);
(hmiVisibility.Layers.UebersichtVierBoxen=1);
(hmiVisibility.Layers.UebersichtFuenfBoxen=1);
(hmiVisibility.Layers.UebersichtSechsBoxen=1);
}







(hmiStatus.Trendkurven.FrischluftTemp=gStatusAnlage.FrischluftTemperatur);
(hmiStatus.Trendkurven.FrischluftFeuchte=gStatusAnlage.FrischluftFeuchte);
(hmiStatus.Trendkurven.DachluftTemp=gStatusAnlage.DachluftTemperatur);
(hmiStatus.Trendkurven.DachluftFeuchte=gStatusAnlage.DachluftFeuchte);
(hmiStatus.Trendkurven.TrockenluftTemp=gStatusAnlage.TrockenluftTemperatur);
(hmiStatus.Trendkurven.TrockenluftFeuchte=gStatusAnlage.TrockenluftFeuchte);
(hmiStatus.Trendkurven.AbluftTemp=gStatusAnlage.AbluftTemperatur);
(hmiStatus.Trendkurven.AbluftFeuchte=gStatusAnlage.AbluftFeuchte);
(hmiStatus.Trendkurven.EintrittTemp=gStatusAnlage.EintrittTemperatur);
(hmiStatus.Trendkurven.EintrittFeuchte=gStatusAnlage.EintrittFeuchte);
(hmiStatus.Trendkurven.AustrittTemp=gStatusAnlage.AustrittTemperatur);
(hmiStatus.Trendkurven.AustrittFeuchte=gStatusAnlage.AustrittFeuchte);
(hmiStatus.Trendkurven.NiederdruckMod1=gStatusAnlage.NiederdruckModul1);
(hmiStatus.Trendkurven.NiederdruckMod2=gStatusAnlage.NiederdruckModul2);
(hmiStatus.Trendkurven.HochdruckMod1=gStatusAnlage.HochdruckModul1);
(hmiStatus.Trendkurven.HochdruckMod2=gStatusAnlage.HochdruckModul2);
(hmiStatus.Trendkurven.Luftgeschw=gStatusAnlage.Luftgeschwindigkeit);
(hmiStatus.Trendkurven.Kanaldruck=gStatusAnlage.Berechnungen.Kanaldruck_mmWs);
(hmiStatus.Trendkurven.LeistungAktuell=hmiNutzungsdaten.Energiemessung.LeistungAktuell);


if((hmiParameter.Ausstattung.SensorFrischluft^1)){
(hmiVisibility.Trend.FrischluftFeuchte=1);
(hmiVisibility.Trend.FrischluftTemp=1);
}
if((hmiParameter.Ausstattung.SensorDachluft^1)){
(hmiVisibility.Trend.DachluftFeuchte=1);
(hmiVisibility.Trend.DachluftTemp=1);
}
if((hmiParameter.Ausstattung.SensorTrockenluft^1)){
(hmiVisibility.Trend.TrockenluftFeuchte=1);
(hmiVisibility.Trend.TrockenluftTemp=1);
}
if((hmiParameter.Ausstattung.SensorAbluft^1)){
(hmiVisibility.Trend.AbluftFeuchte=1);
(hmiVisibility.Trend.AbluftTemp=1);
}
if((hmiParameter.Ausstattung.SensorLuftgeschwindigkeit^1)){
(hmiVisibility.Trend.Luftgeschw=1);
}
if((hmiParameter.Ausstattung.SensorLuftgeschwindigkeit^1)){
(hmiVisibility.Trend.Luftgeschw=1);
}
if((hmiParameter.Ausstattung.SensorKanaldruck^1)){
(hmiVisibility.Trend.Kanaldruck=1);
}
if((hmiParameter.Ausstattung.Entfeuchter^1)){
(hmiVisibility.Trend.EintrittFeuchte=1);
(hmiVisibility.Trend.EintrittTemp=1);
(hmiVisibility.Trend.AustrittFeuchte=1);
(hmiVisibility.Trend.AustrittTemp=1);
(hmiVisibility.Trend.NiederdruckMod1=1);
(hmiVisibility.Trend.HochdruckMod1=1);
}







if((hmiParameter.Ausstattung.Box2^1)){
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Heizregister=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Luftentfeuchter=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Scheitholzofen=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe1=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe2=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe3=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe4=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe5=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe6=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Ventilator1=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Ventilator2=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Warmluftofen=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Aus=1);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].DauerbetriebEin=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebEin=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungEin=0);
}


if((hmiParameter.Ausstattung.Box3^1)){
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Heizregister=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Luftentfeuchter=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Scheitholzofen=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe1=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe2=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe3=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe4=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe5=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe6=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Ventilator1=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Ventilator2=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Warmluftofen=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Aus=1);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].DauerbetriebEin=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebEin=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungEin=0);
}


if((hmiParameter.Ausstattung.Box4^1)){
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Heizregister=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Luftentfeuchter=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Scheitholzofen=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe1=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe2=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe3=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe4=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe5=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe6=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Ventilator1=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Ventilator2=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Warmluftofen=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Aus=1);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].DauerbetriebEin=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebEin=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungEin=0);
}


if((hmiParameter.Ausstattung.Box5^1)){
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Heizregister=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Luftentfeuchter=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Scheitholzofen=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe1=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe2=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe3=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe4=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe5=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe6=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Ventilator1=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Ventilator2=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Warmluftofen=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Aus=1);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].DauerbetriebEin=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebEin=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungEin=0);
}


if((hmiParameter.Ausstattung.Box6^1)){
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Heizregister=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Luftentfeuchter=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Scheitholzofen=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe1=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe2=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe3=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe4=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe5=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe6=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Ventilator1=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Ventilator2=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Warmluftofen=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Aus=1);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].DauerbetriebEin=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebEin=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungEin=0);
}


if(((hmiParameter.Ausstattung.Entfeuchter^1)&(hmiParameter.Ausstattung.EntfeuchterFremd^1))){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Luftentfeuchter=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Luftentfeuchter=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Luftentfeuchter=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Luftentfeuchter=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Luftentfeuchter=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Luftentfeuchter=0);
}


if((hmiParameter.Ausstattung.Warmluftofen^1)){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Warmluftofen=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Warmluftofen=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Warmluftofen=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Warmluftofen=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Warmluftofen=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Warmluftofen=0);
}


if((hmiParameter.Ausstattung.Ventilator2^1)){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Ventilator2=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Ventilator2=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Ventilator2=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Ventilator2=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Ventilator2=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Ventilator2=0);
}


if((hmiParameter.Ausstattung.Scheitholzofen^1)){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Scheitholzofen=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Scheitholzofen=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Scheitholzofen=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Scheitholzofen=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Scheitholzofen=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Scheitholzofen=0);
}


if((hmiParameter.Ausstattung.Heizregister^1)){
(hmiParameter.Boxen[CheckBounds(1,1,6)-1].Heizregister=0);
(hmiParameter.Boxen[CheckBounds(2,1,6)-1].Heizregister=0);
(hmiParameter.Boxen[CheckBounds(3,1,6)-1].Heizregister=0);
(hmiParameter.Boxen[CheckBounds(4,1,6)-1].Heizregister=0);
(hmiParameter.Boxen[CheckBounds(5,1,6)-1].Heizregister=0);
(hmiParameter.Boxen[CheckBounds(6,1,6)-1].Heizregister=0);
}






}imp1_else49_0:imp1_end49_0:;}
#line 737 "C:/SharedFolder/CControl_Gschneitner/Logical/Visualisierung/hmiConnect/Main.nodebug"

void __AS__ImplInitMain_st(void){__BUR__ENTRY_INIT_FUNCT__();}

unsigned long __AS__MEMCPY(unsigned long pDest, unsigned long pSrc, unsigned long length)
{memcpy((char*)pDest, (char*)pSrc, length); return pDest + length;}

unsigned long __AS__MEMSET(unsigned long pDest, unsigned char value, unsigned long length)
{memset((char*)pDest, value, length); return pDest + length;}

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
__asm__(".ascii \"iecfile \\\"Temp/Includes/AS_TempDecl/4_07/GlobalComponents/MpComponents.var\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Logical/Visualisierung/hmiConnect/Types.typ\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Visualisierung/hmiConnect/Variables.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/hmiConnect/Main.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/hmiConnect/Main.st.c\\\" \\\"C:/SharedFolder/CControl_Gschneitner/Logical/Visualisierung/hmiConnect/Main.st\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Temp/Objects/4_07/4PPC30_0702_21B/hmiConnect/Main.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".previous");

__asm__(".section \".plciec\"");
__asm__(".ascii \"plcdata_const 'Betriebsparameter'\\n\"");
__asm__(".ascii \"plcdata_const 'Nutzungsdaten'\\n\"");
__asm__(".ascii \"plcdata_const 'hmiParameter'\\n\"");
__asm__(".previous");
