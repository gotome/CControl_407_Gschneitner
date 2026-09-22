#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/Leistung/Leistungst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Regelung/Leistung/Leistung.nodebug"
#line 2 "C:/SharedFolder/CControl/Logical/Regelung/Leistung/Leistung.st"
void __BUR__ENTRY_INIT_FUNCT__(void){{




(fbPidLuftmengeVent1.Mode=FBREG_MODUS_AUS);
fbRegPidReglerAllg(&fbPidLuftmengeVent1);


(fbPidLuftmengeVent2.Mode=FBREG_MODUS_AUS);
fbRegPidReglerAllg(&fbPidLuftmengeVent2);


(fbPidKompressor1.Mode=FBREG_MODUS_AUS);
fbRegPidReglerAllg(&fbPidKompressor1);


(fbPidKompressor2.Mode=FBREG_MODUS_AUS);
fbRegPidReglerAllg(&fbPidKompressor2);


(fbPidHeizregister.Mode=FBREG_MODUS_AUS);
fbRegPidReglerAllg(&fbPidHeizregister);


(fbPidAbluftregler.Mode=FBREG_MODUS_AUS);
fbRegPidReglerAllg(&fbPidAbluftregler);

}}
#line 30 "C:/SharedFolder/CControl/Logical/Regelung/Leistung/Leistung.nodebug"
#line 34 "C:/SharedFolder/CControl/Logical/Regelung/Leistung/Leistung.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){{


(fbLascoZdxx_0.IN=Echtzeit.Minute);;fbLascoZdxx(&fbLascoZdxx_0);
(minTick=fbLascoZdxx_0.Q);
(fbLascoZdxx_1.IN=Echtzeit.Sekunde);;fbLascoZdxx(&fbLascoZdxx_1);
(sekTick=fbLascoZdxx_1.Q);







(fbBoxenLuftmengen_0.EntfeuchterInBetrieb=(Aktoren.KompressorModul1.FreigabeKompressorOut|Aktoren.KompressorModul2.FreigabeKompressorOut|diEntfeuchterFremdInBetrieb));
(fbBoxenLuftmengen_0.FrischluftbetriebAktiv=gStatusAnlage.FrischluftbetriebAktiv);
(fbBoxenLuftmengen_0.UmluftbetriebAktiv=gStatusAnlage.UmluftbetriebAktiv);
(fbBoxenLuftmengen_0.LuftgeschwEntfeuchterMin=Betriebsparameter.Entfeuchter.LuftgeschwEntfeuchterMin);
(fbBoxenLuftmengen_0.LuftgeschwEntfeuchterMax=Betriebsparameter.Entfeuchter.LuftgeschwEntfeuchterMax);
(fbBoxenLuftmengen_0.LuftmengeSollProM2FrischlVent1=Betriebsparameter.Ventilator1.LuftmengeSollFrischluft);
(fbBoxenLuftmengen_0.LuftmengeSollProM2UmluftVent1=Betriebsparameter.Ventilator1.LuftmengeSollUmluft);
(fbBoxenLuftmengen_0.LuftmengeSollProM2FrischlVent2=Betriebsparameter.Ventilator2.LuftmengeSollFrischluft);
(fbBoxenLuftmengen_0.LuftmengeSollProM2UmluftVent2=Betriebsparameter.Ventilator2.LuftmengeSollUmluft);
if(Betriebsparameter.Ausstattung.EntfeuchterFremd){
(fbBoxenLuftmengen_0.RegisterflaecheEntfeuchter=Betriebsparameter.Allgemein.AnsaugflaecheVent);
}else{
(fbBoxenLuftmengen_0.RegisterflaecheEntfeuchter=Betriebsparameter.Entfeuchter.Registerflaeche[CheckBounds(Betriebsparameter.Entfeuchter.IndexType,0,14)]);
}


(fbBoxenLuftmengen_0.Box1.BoxIstAktiv=Boxen.Box1Out.BoxAktiv);
(fbBoxenLuftmengen_0.Box1.GrundflaecheBox=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Grundflaeche);
(fbBoxenLuftmengen_0.Box1.Ventilator1=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Ventilator1);
(fbBoxenLuftmengen_0.Box1.Ventilator2=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Ventilator2);

(fbBoxenLuftmengen_0.Box2.BoxIstAktiv=Boxen.Box2Out.BoxAktiv);
(fbBoxenLuftmengen_0.Box2.GrundflaecheBox=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Grundflaeche);
(fbBoxenLuftmengen_0.Box2.Ventilator1=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Ventilator1);
(fbBoxenLuftmengen_0.Box2.Ventilator2=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Ventilator2);

(fbBoxenLuftmengen_0.Box3.BoxIstAktiv=Boxen.Box3Out.BoxAktiv);
(fbBoxenLuftmengen_0.Box3.GrundflaecheBox=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Grundflaeche);
(fbBoxenLuftmengen_0.Box3.Ventilator1=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Ventilator1);
(fbBoxenLuftmengen_0.Box3.Ventilator2=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Ventilator2);

(fbBoxenLuftmengen_0.Box4.BoxIstAktiv=Boxen.Box4Out.BoxAktiv);
(fbBoxenLuftmengen_0.Box4.GrundflaecheBox=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Grundflaeche);
(fbBoxenLuftmengen_0.Box4.Ventilator1=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Ventilator1);
(fbBoxenLuftmengen_0.Box4.Ventilator2=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Ventilator2);

(fbBoxenLuftmengen_0.Box5.BoxIstAktiv=Boxen.Box5Out.BoxAktiv);
(fbBoxenLuftmengen_0.Box5.GrundflaecheBox=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Grundflaeche);
(fbBoxenLuftmengen_0.Box5.Ventilator1=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Ventilator1);
(fbBoxenLuftmengen_0.Box5.Ventilator2=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Ventilator2);

(fbBoxenLuftmengen_0.Box6.BoxIstAktiv=Boxen.Box6Out.BoxAktiv);
(fbBoxenLuftmengen_0.Box6.GrundflaecheBox=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Grundflaeche);
(fbBoxenLuftmengen_0.Box6.Ventilator1=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Ventilator1);
(fbBoxenLuftmengen_0.Box6.Ventilator2=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Ventilator2);

fbBoxenLuftmengen(&fbBoxenLuftmengen_0);






if(Betriebsparameter.Ausstattung.Entfeuchter){
(loc_Ansaugflaeche=Betriebsparameter.Entfeuchter.Registerflaeche[CheckBounds(Betriebsparameter.Entfeuchter.IndexType,0,14)]);
}else{
(loc_Ansaugflaeche=Betriebsparameter.Allgemein.AnsaugflaecheVent);
}


if((gStatusAnlage.FrischluftbetriebAktiv&Betriebsparameter.Ventilator1.LuftmengenregFrischluftEin)){
if(((loc_Ansaugflaeche!=0))){
(loc_LuftgeschwSollVent1=((fbBoxenLuftmengen_0.LuftmengeSollVent1Out/CheckDivReal(loc_Ansaugflaeche))/CheckDivReal(3600)));
}

}else if((gStatusAnlage.UmluftbetriebAktiv&Betriebsparameter.Ventilator1.LuftmengenregUmluftEin)){
if(((loc_Ansaugflaeche!=0))){
(loc_LuftgeschwSollVent1=((fbBoxenLuftmengen_0.LuftmengeSollVent1Out/CheckDivReal(loc_Ansaugflaeche))/CheckDivReal(3600)));
}
}


if((gStatusAnlage.FrischluftbetriebAktiv&Betriebsparameter.Ventilator2.LuftmengenregFrischluftEin)){
if(((loc_Ansaugflaeche!=0))){
(loc_LuftgeschwSollVent2=((fbBoxenLuftmengen_0.LuftmengeSollVent2Out/CheckDivReal(loc_Ansaugflaeche))/CheckDivReal(3600)));
}

}else if((gStatusAnlage.UmluftbetriebAktiv&Betriebsparameter.Ventilator2.LuftmengenregUmluftEin)){
if(((loc_Ansaugflaeche!=0))){
(loc_LuftgeschwSollVent2=((fbBoxenLuftmengen_0.LuftmengeSollVent2Out/CheckDivReal(loc_Ansaugflaeche))/CheckDivReal(3600)));
}
}






(PidLuftmengeVent1.Sollgroesse=loc_LuftgeschwSollVent1);
(fbPidLuftmengeVent1.Freigabe=PidLuftmengeVent1.Enable);
(fbPidLuftmengeVent1.Sollwert=PidLuftmengeVent1.Sollgroesse);
(fbPidLuftmengeVent1.Istwert=gStatusAnlage.Luftgeschwindigkeit);
(fbPidLuftmengeVent1.AbschwaechungSollwert=(1.00000000000000000000E+00));
(fbPidLuftmengeVent1.Aufschaltgroesse=(0.00000000000000000000E+00));
(fbPidLuftmengeVent1.Fehlerverzoegerung=0);
(fbPidLuftmengeVent1.Hold_I=0);
(fbPidLuftmengeVent1.Hysterese=(0.00000000000000000000E+00));
(fbPidLuftmengeVent1.Invert=0);
(fbPidLuftmengeVent1.D_Anteil=Betriebsparameter.Ventilator1.D);
(fbPidLuftmengeVent1.D_Filterzeit=(Betriebsparameter.Ventilator1.D*(1.39999997615814208984E+00)));
(fbPidLuftmengeVent1.I_Anteil=Betriebsparameter.Ventilator1.I);
(fbPidLuftmengeVent1.P_Anteil=Betriebsparameter.Ventilator1.P);
(fbPidLuftmengeVent1.RampeMax=(0.00000000000000000000E+00));
(fbPidLuftmengeVent1.RegelbereichMin=Betriebsparameter.Sensoren.LuftgeschwMessberMin);
if(Betriebsparameter.Ausstattung.Entfeuchter){
(fbPidLuftmengeVent1.RegelbereichMax=Betriebsparameter.Entfeuchter.LuftgeschwEntfeuchterMax);
}else{
(fbPidLuftmengeVent1.RegelbereichMax=Betriebsparameter.Sensoren.LuftgeschwMessberMax);
}
(fbPidLuftmengeVent1.StellgroesseManuell=(0.00000000000000000000E+00));
(fbPidLuftmengeVent1.StellgroesseMin=Betriebsparameter.Ventilator1.DrehzahlMin);
(fbPidLuftmengeVent1.StellgroesseMax=Betriebsparameter.Ventilator1.DrehzahlMax);
(fbPidLuftmengeVent1.WindupDaempfung=(0.00000000000000000000E+00));






(PidLuftmengeVent2.Sollgroesse=loc_LuftgeschwSollVent2);
(fbPidLuftmengeVent2.Freigabe=PidLuftmengeVent2.Enable);
(fbPidLuftmengeVent2.Sollwert=PidLuftmengeVent2.Sollgroesse);
(fbPidLuftmengeVent2.Istwert=gStatusAnlage.Luftgeschwindigkeit);
(fbPidLuftmengeVent2.AbschwaechungSollwert=(1.00000000000000000000E+00));
(fbPidLuftmengeVent2.Aufschaltgroesse=(0.00000000000000000000E+00));
(fbPidLuftmengeVent2.Fehlerverzoegerung=0);
(fbPidLuftmengeVent2.Hold_I=0);
(fbPidLuftmengeVent2.Hysterese=(0.00000000000000000000E+00));
(fbPidLuftmengeVent2.Invert=0);
(fbPidLuftmengeVent2.D_Anteil=Betriebsparameter.Ventilator2.D);
(fbPidLuftmengeVent2.D_Filterzeit=(Betriebsparameter.Ventilator2.D*(1.39999997615814208984E+00)));
(fbPidLuftmengeVent2.I_Anteil=Betriebsparameter.Ventilator2.I);
(fbPidLuftmengeVent2.P_Anteil=Betriebsparameter.Ventilator2.P);
(fbPidLuftmengeVent2.RampeMax=(0.00000000000000000000E+00));
(fbPidLuftmengeVent2.RegelbereichMin=Betriebsparameter.Sensoren.LuftgeschwMessberMin);
if(Betriebsparameter.Ausstattung.Entfeuchter){
(fbPidLuftmengeVent1.RegelbereichMax=Betriebsparameter.Entfeuchter.LuftgeschwEntfeuchterMax);
}else{
(fbPidLuftmengeVent1.RegelbereichMax=Betriebsparameter.Sensoren.LuftgeschwMessberMax);
}
(fbPidLuftmengeVent2.StellgroesseManuell=(0.00000000000000000000E+00));
(fbPidLuftmengeVent2.StellgroesseMin=Betriebsparameter.Ventilator2.DrehzahlMin);
(fbPidLuftmengeVent2.StellgroesseMax=Betriebsparameter.Ventilator2.DrehzahlMax);
(fbPidLuftmengeVent2.WindupDaempfung=(0.00000000000000000000E+00));






(PidKompressor1.Sollgroesse=Betriebsparameter.Kompressor1.NiederdruckSoll);
(fbPidKompressor1.Freigabe=PidKompressor1.Enable);
(fbPidKompressor1.Sollwert=PidKompressor1.Sollgroesse);
(fbPidKompressor1.Istwert=gStatusAnlage.NiederdruckModul1);
(fbPidKompressor1.AbschwaechungSollwert=(1.00000000000000000000E+00));
(fbPidKompressor1.Aufschaltgroesse=(0.00000000000000000000E+00));
(fbPidKompressor1.Fehlerverzoegerung=0);
(fbPidKompressor1.Hold_I=0);
(fbPidKompressor1.Hysterese=Betriebsparameter.Kompressor1.Hysterese);
(fbPidKompressor1.Invert=1);
(fbPidKompressor1.D_Anteil=Betriebsparameter.Kompressor1.D);
(fbPidKompressor1.D_Filterzeit=(Betriebsparameter.Kompressor1.D*(1.39999997615814208984E+00)));
(fbPidKompressor1.I_Anteil=Betriebsparameter.Kompressor1.I);
(fbPidKompressor1.P_Anteil=Betriebsparameter.Kompressor1.P);
(fbPidKompressor1.RampeMax=(0.00000000000000000000E+00));
(fbPidKompressor1.RegelbereichMin=Betriebsparameter.Sensoren.NiederdruckMessberMin);
(fbPidKompressor1.RegelbereichMax=Betriebsparameter.Sensoren.NiederdruckMessberMax);
(fbPidKompressor1.StellgroesseManuell=(0.00000000000000000000E+00));
(fbPidKompressor1.StellgroesseMin=Betriebsparameter.Kompressor1.DrehzahlMin);
(fbPidKompressor1.StellgroesseMax=Betriebsparameter.Kompressor1.DrehzahlMax);
(fbPidKompressor1.WindupDaempfung=(0.00000000000000000000E+00));






(PidKompressor2.Sollgroesse=Betriebsparameter.Kompressor2.NiederdruckSoll);
(fbPidKompressor2.Freigabe=PidKompressor2.Enable);
(fbPidKompressor2.Sollwert=PidKompressor2.Sollgroesse);
(fbPidKompressor2.Istwert=gStatusAnlage.NiederdruckModul2);
(fbPidKompressor2.AbschwaechungSollwert=(1.00000000000000000000E+00));
(fbPidKompressor2.Aufschaltgroesse=(0.00000000000000000000E+00));
(fbPidKompressor2.Fehlerverzoegerung=0);
(fbPidKompressor2.Hold_I=0);
(fbPidKompressor2.Hysterese=Betriebsparameter.Kompressor2.Hysterese);
(fbPidKompressor2.Invert=1);
(fbPidKompressor2.D_Anteil=Betriebsparameter.Kompressor2.D);
(fbPidKompressor2.D_Filterzeit=(Betriebsparameter.Kompressor2.D*(1.39999997615814208984E+00)));
(fbPidKompressor2.I_Anteil=Betriebsparameter.Kompressor2.I);
(fbPidKompressor2.P_Anteil=Betriebsparameter.Kompressor2.P);
(fbPidKompressor2.RampeMax=(0.00000000000000000000E+00));
(fbPidKompressor2.RegelbereichMin=Betriebsparameter.Sensoren.NiederdruckMessberMin);
(fbPidKompressor2.RegelbereichMax=Betriebsparameter.Sensoren.NiederdruckMessberMax);
(fbPidKompressor2.StellgroesseManuell=(0.00000000000000000000E+00));
(fbPidKompressor2.StellgroesseMin=Betriebsparameter.Kompressor2.DrehzahlMin);
(fbPidKompressor2.StellgroesseMax=Betriebsparameter.Kompressor2.DrehzahlMax);
(fbPidKompressor2.WindupDaempfung=(0.00000000000000000000E+00));






(PidHeizregister.Sollgroesse=Betriebsparameter.Heizregister.TrockenluftTempSoll);
(fbPidHeizregister.Freigabe=PidHeizregister.Enable);
(fbPidHeizregister.Sollwert=PidHeizregister.Sollgroesse);
(fbPidHeizregister.Istwert=gStatusAnlage.TrockenluftTemperatur);
(fbPidHeizregister.AbschwaechungSollwert=(1.00000000000000000000E+00));
(fbPidHeizregister.Aufschaltgroesse=(0.00000000000000000000E+00));
(fbPidHeizregister.Fehlerverzoegerung=0);
(fbPidHeizregister.Hold_I=0);
(fbPidHeizregister.Hysterese=Betriebsparameter.Heizregister.Hysterese);
(fbPidHeizregister.Invert=0);
(fbPidHeizregister.D_Anteil=Betriebsparameter.Heizregister.D);
(fbPidHeizregister.D_Filterzeit=(Betriebsparameter.Heizregister.D*(1.39999997615814208984E+00)));
(fbPidHeizregister.I_Anteil=Betriebsparameter.Heizregister.I);
(fbPidHeizregister.P_Anteil=Betriebsparameter.Heizregister.P);
(fbPidHeizregister.RampeMax=(0.00000000000000000000E+00));
(fbPidHeizregister.RegelbereichMin=(0.00000000000000000000E+00));
(fbPidHeizregister.RegelbereichMax=(1.00000000000000000000E+02));
(fbPidHeizregister.StellgroesseManuell=(0.00000000000000000000E+00));
(fbPidHeizregister.StellgroesseMin=Betriebsparameter.Heizregister.DrehzahlVorgabeMin);
(fbPidHeizregister.StellgroesseMax=Betriebsparameter.Heizregister.DrehzahlVorgabeMax);
(fbPidHeizregister.WindupDaempfung=(0.00000000000000000000E+00));







(PidAbluftregler.Sollgroesse=Betriebsparameter.Abluftventilator.AbluftfeuchteMax);
(fbPidAbluftregler.Freigabe=PidAbluftregler.Enable);
(fbPidAbluftregler.Sollwert=PidAbluftregler.Sollgroesse);
(fbPidAbluftregler.Istwert=gStatusAnlage.AbluftFeuchte);
(fbPidAbluftregler.AbschwaechungSollwert=(1.00000000000000000000E+00));
(fbPidAbluftregler.Aufschaltgroesse=(0.00000000000000000000E+00));
(fbPidAbluftregler.Fehlerverzoegerung=0);
(fbPidAbluftregler.Hold_I=0);
(fbPidAbluftregler.Hysterese=Betriebsparameter.Abluftventilator.Hysterese);
(fbPidAbluftregler.Invert=1);
(fbPidAbluftregler.D_Anteil=Betriebsparameter.Abluftventilator.D);
(fbPidAbluftregler.D_Filterzeit=(Betriebsparameter.Abluftventilator.D*(1.39999997615814208984E+00)));
(fbPidAbluftregler.I_Anteil=Betriebsparameter.Abluftventilator.I);
(fbPidAbluftregler.P_Anteil=Betriebsparameter.Abluftventilator.P);
(fbPidAbluftregler.RampeMax=(0.00000000000000000000E+00));
(fbPidAbluftregler.RegelbereichMin=(0.00000000000000000000E+00));
(fbPidAbluftregler.RegelbereichMax=(1.00000000000000000000E+02));
(fbPidAbluftregler.StellgroesseManuell=(0.00000000000000000000E+00));
(fbPidAbluftregler.StellgroesseMin=Betriebsparameter.Abluftventilator.DrehzahlMin);
(fbPidAbluftregler.StellgroesseMax=Betriebsparameter.Abluftventilator.DrehzahlMax);
(fbPidAbluftregler.WindupDaempfung=(0.00000000000000000000E+00));











if((((signed long)gAktModus==(signed long)0))){



(PidLuftmengeVent1.Enable=0);
(PidLuftmengeVent2.Enable=0);


(PidKompressor1.Enable=0);
(PidKompressor2.Enable=0);


(PidHeizregister.Enable=0);



(PidAbluftregler.Enable=(Betriebsparameter.Abluftventilator.Automatik&(Aktoren.VentUndKlappen.AnforderungVentilator1|Aktoren.VentUndKlappen.AnforderungVentilator2)));


if(Aktoren.VentUndKlappen.AnforderungVentilator1){
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlBeiAuskuehlphase);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlMin);
}

if(Aktoren.VentUndKlappen.AnforderungVentilator2){
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlBeiAuskuehlphase);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlMin);
}


(gCmdAnlage.Leistung.DrehzahlKompressorModul1=(0.00000000000000000000E+00));
(gCmdAnlage.Leistung.DrehzahlKompressorModul2=(0.00000000000000000000E+00));


(gCmdAnlage.Leistung.DrehzahlHeizregister=(0.00000000000000000000E+00));


if(PidAbluftregler.Enable){
(gCmdAnlage.Leistung.DrehzahlAbluftventilator=fbPidAbluftregler.Stellgroesse);
}else{
(gCmdAnlage.Leistung.DrehzahlAbluftventilator=Betriebsparameter.Abluftventilator.DrehzahlMin);
}





}else if((((signed long)gAktModus==(signed long)1))){



if((gStatusAnlage.FrischluftbetriebAktiv&Betriebsparameter.Ventilator1.LuftmengenregFrischluftEin)){
(PidLuftmengeVent1.Enable=1);
}else if((gStatusAnlage.UmluftbetriebAktiv&Betriebsparameter.Ventilator1.LuftmengenregUmluftEin)){
(PidLuftmengeVent1.Enable=1);
}else{
(PidLuftmengeVent1.Enable=0);
}

if((gStatusAnlage.FrischluftbetriebAktiv&Betriebsparameter.Ventilator2.LuftmengenregFrischluftEin)){
(PidLuftmengeVent2.Enable=1);
}else if((gStatusAnlage.UmluftbetriebAktiv&Betriebsparameter.Ventilator2.LuftmengenregUmluftEin)){
(PidLuftmengeVent2.Enable=1);
}else{
(PidLuftmengeVent2.Enable=0);
}


(PidKompressor1.Enable=Betriebsparameter.Kompressor1.DrehzahlregelungEin);
(PidKompressor2.Enable=Betriebsparameter.Kompressor2.DrehzahlregelungEin);


(PidHeizregister.Enable=(Betriebsparameter.Ausstattung.Heizregister&(diHeizregisterFrostschutz^1)));


(PidAbluftregler.Enable=Betriebsparameter.Abluftventilator.Automatik);




if(diDrehzahlbegrVentilator1){
if(PidLuftmengeVent1.Enable){
if(((fbPidLuftmengeVent1.Stellgroesse>Betriebsparameter.Ventilator1.DrehzahlLeistungsreduz))){
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlLeistungsreduz);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator1=fbPidLuftmengeVent1.Stellgroesse);
}
}else if(gStatusAnlage.FrischluftbetriebAktiv){
if(((Betriebsparameter.Ventilator1.DrehzahlFixFrischluft>Betriebsparameter.Ventilator1.DrehzahlLeistungsreduz))){
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlLeistungsreduz);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlFixFrischluft);
}
}else if(gStatusAnlage.UmluftbetriebAktiv){
if(((Betriebsparameter.Ventilator1.DrehzahlFixUmluft>Betriebsparameter.Ventilator1.DrehzahlLeistungsreduz))){
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlLeistungsreduz);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlFixUmluft);
}
}

}else if(Strombegrenzung.StrombegrenzungEin){
if(PidLuftmengeVent1.Enable){
if(((fbPidLuftmengeVent1.Stellgroesse>Betriebsparameter.Ventilator1.DrehzahlStrombegrenzung))){
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlStrombegrenzung);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator1=fbPidLuftmengeVent1.Stellgroesse);
}
}else if(gStatusAnlage.FrischluftbetriebAktiv){
if(((Betriebsparameter.Ventilator1.DrehzahlFixFrischluft>Betriebsparameter.Ventilator1.DrehzahlStrombegrenzung))){
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlStrombegrenzung);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlFixFrischluft);
}
}else if(gStatusAnlage.UmluftbetriebAktiv){
if(((Betriebsparameter.Ventilator1.DrehzahlFixUmluft>Betriebsparameter.Ventilator1.DrehzahlStrombegrenzung))){
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlStrombegrenzung);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlFixUmluft);
}
}

}else if((Boxen.NotbetriebVentilator1&(Boxen.FreigabeVentilator1^1))){
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlBeiAuskuehlphase);

}else if(PidLuftmengeVent1.Enable){
(gCmdAnlage.Leistung.DrehzahlVentilator1=fbPidLuftmengeVent1.Stellgroesse);

}else{
if(gStatusAnlage.FrischluftbetriebAktiv){
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlFixFrischluft);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator1=Betriebsparameter.Ventilator1.DrehzahlFixUmluft);
}
}





if(diDrehzahlbegrVentilator2){
if(PidLuftmengeVent2.Enable){
if(((fbPidLuftmengeVent2.Stellgroesse>Betriebsparameter.Ventilator2.DrehzahlLeistungsreduz))){
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlLeistungsreduz);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator2=fbPidLuftmengeVent2.Stellgroesse);
}
}else if(gStatusAnlage.FrischluftbetriebAktiv){
if(((Betriebsparameter.Ventilator2.DrehzahlFixFrischluft>Betriebsparameter.Ventilator2.DrehzahlLeistungsreduz))){
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlLeistungsreduz);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlFixFrischluft);
}
}else if(gStatusAnlage.UmluftbetriebAktiv){
if(((Betriebsparameter.Ventilator2.DrehzahlFixUmluft>Betriebsparameter.Ventilator2.DrehzahlLeistungsreduz))){
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlLeistungsreduz);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlFixUmluft);
}
}

}else if(Strombegrenzung.StrombegrenzungEin){
if(PidLuftmengeVent2.Enable){
if(((fbPidLuftmengeVent2.Stellgroesse>Betriebsparameter.Ventilator2.DrehzahlStrombegrenzung))){
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlStrombegrenzung);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator2=fbPidLuftmengeVent2.Stellgroesse);
}
}else if(gStatusAnlage.FrischluftbetriebAktiv){
if(((Betriebsparameter.Ventilator2.DrehzahlFixFrischluft>Betriebsparameter.Ventilator2.DrehzahlStrombegrenzung))){
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlStrombegrenzung);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlFixFrischluft);
}
}else if(gStatusAnlage.UmluftbetriebAktiv){
if(((Betriebsparameter.Ventilator2.DrehzahlFixUmluft>Betriebsparameter.Ventilator2.DrehzahlStrombegrenzung))){
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlStrombegrenzung);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlFixUmluft);
}
}

}else if((Boxen.NotbetriebVentilator2&(Boxen.FreigabeVentilator2^1))){
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlBeiAuskuehlphase);

}else if(PidLuftmengeVent2.Enable){
(gCmdAnlage.Leistung.DrehzahlVentilator2=fbPidLuftmengeVent2.Stellgroesse);

}else{
if(gStatusAnlage.FrischluftbetriebAktiv){
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlFixFrischluft);
}else{
(gCmdAnlage.Leistung.DrehzahlVentilator2=Betriebsparameter.Ventilator2.DrehzahlFixUmluft);
}
}





if(diLeistungsvorgKompressorExtMod1){
if(PidKompressor1.Enable){
if(((fbPidKompressor1.Stellgroesse>Betriebsparameter.Kompressor1.DrehzahlReduzierung))){
(gCmdAnlage.Leistung.DrehzahlKompressorModul1=Betriebsparameter.Kompressor1.DrehzahlReduzierung);
}else{
(gCmdAnlage.Leistung.DrehzahlKompressorModul1=fbPidKompressor1.Stellgroesse);
}
}

}else if(PidKompressor1.Enable){
(gCmdAnlage.Leistung.DrehzahlKompressorModul1=fbPidKompressor1.Stellgroesse);

}else{
(gCmdAnlage.Leistung.DrehzahlKompressorModul1=Betriebsparameter.Kompressor1.DrehzahlFix);
}





if(diLeistungsvorgKompressorExtMod1){
if(PidKompressor2.Enable){
if(((fbPidKompressor2.Stellgroesse>Betriebsparameter.Kompressor2.DrehzahlReduzierung))){
(gCmdAnlage.Leistung.DrehzahlKompressorModul2=Betriebsparameter.Kompressor2.DrehzahlReduzierung);
}else{
(gCmdAnlage.Leistung.DrehzahlKompressorModul2=fbPidKompressor2.Stellgroesse);
}
}

}else if(PidKompressor2.Enable){
(gCmdAnlage.Leistung.DrehzahlKompressorModul2=fbPidKompressor2.Stellgroesse);

}else{
(gCmdAnlage.Leistung.DrehzahlKompressorModul2=Betriebsparameter.Kompressor2.DrehzahlFix);
}



if((PidHeizregister.Enable&Aktoren.Heizregister.FreigabeHeizregisterOut)){
(gCmdAnlage.Leistung.DrehzahlHeizregister=fbPidHeizregister.Stellgroesse);
}else{
(gCmdAnlage.Leistung.DrehzahlHeizregister=Betriebsparameter.Heizregister.DrehzahlVorgabeMin);
}



if((gStatusAnlage.FrischluftbetriebAktiv&Betriebsparameter.Ausstattung.AbluftklImFrischlbetrImmerOffen)){
(gCmdAnlage.Leistung.DrehzahlAbluftventilator=Betriebsparameter.Abluftventilator.DrehzahlMax);
}else if((PidAbluftregler.Enable&Betriebsparameter.Abluftventilator.Automatik)){
(gCmdAnlage.Leistung.DrehzahlAbluftventilator=fbPidAbluftregler.Stellgroesse);
}else{
(gCmdAnlage.Leistung.DrehzahlAbluftventilator=Betriebsparameter.Abluftventilator.DrehzahlMax);
}



}else{


(PidLuftmengeVent1.Enable=0);
(PidLuftmengeVent2.Enable=0);


(PidKompressor1.Enable=0);
(PidKompressor2.Enable=0);


(PidHeizregister.Enable=0);


(PidAbluftregler.Enable=0);


(gCmdAnlage.Leistung.DrehzahlVentilator1=(0.00000000000000000000E+00));
(gCmdAnlage.Leistung.DrehzahlVentilator2=(0.00000000000000000000E+00));


(gCmdAnlage.Leistung.DrehzahlKompressorModul1=(0.00000000000000000000E+00));
(gCmdAnlage.Leistung.DrehzahlKompressorModul2=(0.00000000000000000000E+00));


(gCmdAnlage.Leistung.DrehzahlHeizregister=(0.00000000000000000000E+00));


(gCmdAnlage.Leistung.DrehzahlAbluftventilator=(0.00000000000000000000E+00));


}






if(fbPidLuftmengeVent1.Freigabe){
(fbPidLuftmengeVent1.Mode=FBREG_MODUS_AUTO);
}else{
(fbPidLuftmengeVent1.Mode=FBREG_MODUS_FREEZE);
}
fbRegPidReglerAllg(&fbPidLuftmengeVent1);


if(fbPidLuftmengeVent2.Freigabe){
(fbPidLuftmengeVent2.Mode=FBREG_MODUS_AUTO);
}else{
(fbPidLuftmengeVent2.Mode=FBREG_MODUS_FREEZE);
}
fbRegPidReglerAllg(&fbPidLuftmengeVent2);


if(fbPidHeizregister.Freigabe){
(fbPidHeizregister.Mode=FBREG_MODUS_AUTO);
}else{
(fbPidHeizregister.Mode=FBREG_MODUS_FREEZE);
}
fbRegPidReglerAllg(&fbPidHeizregister);


if(fbPidKompressor1.Freigabe){
(fbPidKompressor1.Mode=FBREG_MODUS_AUTO);
}else{
(fbPidKompressor1.Mode=FBREG_MODUS_FREEZE);
}
fbRegPidReglerAllg(&fbPidKompressor1);


if(fbPidKompressor2.Freigabe){
(fbPidKompressor2.Mode=FBREG_MODUS_AUTO);
}else{
(fbPidKompressor2.Mode=FBREG_MODUS_FREEZE);
}
fbRegPidReglerAllg(&fbPidKompressor2);


if(fbPidAbluftregler.Freigabe){
(fbPidAbluftregler.Mode=FBREG_MODUS_AUTO);
}else{
(fbPidAbluftregler.Mode=FBREG_MODUS_FREEZE);
}
fbRegPidReglerAllg(&fbPidAbluftregler);


}}
#line 656 "C:/SharedFolder/CControl/Logical/Regelung/Leistung/Leistung.nodebug"

void __AS__ImplInitLeistung_st(void){__BUR__ENTRY_INIT_FUNCT__();}

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
__asm__(".ascii \"iecfile \\\"Logical/Regelung/Leistung/Leistung.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/Leistung/Leistung.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/Leistung/Leistung.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Regelung/Leistung/Leistung.st\\\"\\n\"");
__asm__(".previous");

__asm__(".section \".plciec\"");
__asm__(".ascii \"plcdata_const 'FBREG_MODUS_AUS'\\n\"");
__asm__(".ascii \"plcdata_const 'FBREG_MODUS_AUTO'\\n\"");
__asm__(".ascii \"plcdata_const 'FBREG_MODUS_FREEZE'\\n\"");
__asm__(".previous");
