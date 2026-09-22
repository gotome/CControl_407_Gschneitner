#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/Nutzung/Nutzungst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Util/Nutzung/Nutzung.nodebug"
#line 3 "C:/SharedFolder/CControl/Logical/Util/Nutzung/Nutzung.st"
void __BUR__ENTRY_INIT_FUNCT__(void){{

(initOk=0);
(stateEntry=1);

}}
#line 8 "C:/SharedFolder/CControl/Logical/Util/Nutzung/Nutzung.nodebug"
#line 12 "C:/SharedFolder/CControl/Logical/Util/Nutzung/Nutzung.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){{








(fbLascoZdxx_0.IN=Echtzeit.Sekunde);;fbLascoZdxx(&fbLascoZdxx_0);
(sekTick=fbLascoZdxx_0.Q);

(fbLascoZdxx_1.IN=Echtzeit.Minute);;fbLascoZdxx(&fbLascoZdxx_1);
(minTick=fbLascoZdxx_1.Q);

(fbLascoZdxx_2.IN=Echtzeit.Tag);;fbLascoZdxx(&fbLascoZdxx_2);
(tagTick=fbLascoZdxx_2.Q);

(fbLascoZdxx_3.IN=Echtzeit.Monat);;fbLascoZdxx(&fbLascoZdxx_3);
(monatTick=fbLascoZdxx_3.Q);

(fbLascoZdxx_4.IN=Echtzeit.Jahr);;fbLascoZdxx(&fbLascoZdxx_4);
(jahrTick=fbLascoZdxx_4.Q);






if((initOk&stateEntry)){
(stateEntry=0);

(loc_UhrzeitAktuellUdint=(unsigned long)DTGetTime_0.DT1);
(loc_UhrzeitMEM_Udint=(unsigned long)hmiNutzungsdaten.Allgemein.DatumLetzterBetrieb);
(loc_ZeitStromausfall=((loc_UhrzeitAktuellUdint-loc_UhrzeitMEM_Udint)*1000));


if((((unsigned long)loc_ZeitStromausfall>(unsigned long)Betriebsparameter.Entfeuchter.MaxZeitStromlos))){
(gMindestlaufzOelsumpfOk=0);
(loc_MinLaufzeitOelsumpf=Betriebsparameter.Entfeuchter.MindestlaufzeitOelsumpf);
}else if((gMindestlaufzOelsumpfOk^1)){


if((((unsigned long)(Betriebsparameter.Entfeuchter.RestzeitLaufzOelsumpf+(loc_ZeitStromausfall*2))<(unsigned long)Betriebsparameter.Entfeuchter.MindestlaufzeitOelsumpf))){
(loc_MinLaufzeitOelsumpf=(Betriebsparameter.Entfeuchter.RestzeitLaufzOelsumpf+(loc_ZeitStromausfall*2)));
}else{
(loc_MinLaufzeitOelsumpf=Betriebsparameter.Entfeuchter.MindestlaufzeitOelsumpf);
}
}else{
(loc_MinLaufzeitOelsumpf=0);
}
}


(TON_MinLaufzeitOelsumpfh.IN=(doOelsumpfheizungEinModul1&initOk&(stateEntry^1)));;(TON_MinLaufzeitOelsumpfh.PT=loc_MinLaufzeitOelsumpf);;TON(&TON_MinLaufzeitOelsumpfh);
if(TON_MinLaufzeitOelsumpfh.Q){
(gMindestlaufzOelsumpfOk=1);
}


(DTGetTime_0.enable=1);;DTGetTime(&DTGetTime_0);
if((minTick&initOk&(stateEntry^1))){
(hmiNutzungsdaten.Allgemein.DatumLetzterBetrieb=DTGetTime_0.DT1);
(hmiParameter.Entfeuchter.RestzeitLaufzOelsumpf=(loc_MinLaufzeitOelsumpf-(unsigned long)TON_MinLaufzeitOelsumpfh.ET));
}








(fbMinutenVentilator1Ges.Aktiv=(diVentilator1InBetrieb&doVentilator1Ein));
(fbMinutenVentilator1Ges.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenVentilator1Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Ventilator1Min)));
fbLascoBmin(&fbMinutenVentilator1Ges);

((*(unsigned long*)&(fbStundenVentilator1Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Ventilator1Min)));
((*(unsigned long*)&(fbStundenVentilator1Ges.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.Ventilator1Std)));
fbLascoStdMin(&fbStundenVentilator1Ges);



(fbMinutenVentilator2Ges.Aktiv=(diVentilator2InBetrieb&doVentilator2Ein));
(fbMinutenVentilator2Ges.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenVentilator2Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Ventilator2Min)));
fbLascoBmin(&fbMinutenVentilator2Ges);

((*(unsigned long*)&(fbStundenVentilator2Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Ventilator2Min)));
((*(unsigned long*)&(fbStundenVentilator2Ges.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.Ventilator2Std)));
fbLascoStdMin(&fbStundenVentilator2Ges);



(fbMinutenOelsumpfhGes.Aktiv=doOelsumpfheizungEinModul1);
(fbMinutenOelsumpfhGes.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenOelsumpfhGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.OelsumpfheizungMin)));
fbLascoBmin(&fbMinutenOelsumpfhGes);

((*(unsigned long*)&(fbStundenOelsumpfhGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.OelsumpfheizungMin)));
((*(unsigned long*)&(fbStundenOelsumpfhGes.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.OelsumpfheizungStd)));
fbLascoStdMin(&fbStundenOelsumpfhGes);



(fbMinutenKompressor1Ges.Aktiv=(doKompressorEinModul1|doEntfFremdFreigabe));
(fbMinutenKompressor1Ges.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenKompressor1Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Kompressor1Min)));
fbLascoBmin(&fbMinutenKompressor1Ges);

((*(unsigned long*)&(fbStundenKompressor1Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Kompressor1Min)));
((*(unsigned long*)&(fbStundenKompressor1Ges.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.Kompressor1Std)));
fbLascoStdMin(&fbStundenKompressor1Ges);



(fbMinutenKompressor2Ges.Aktiv=doKompressorEinModul2);
(fbMinutenKompressor2Ges.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenKompressor2Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Kompressor2Min)));
fbLascoBmin(&fbMinutenKompressor2Ges);

((*(unsigned long*)&(fbStundenKompressor2Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Kompressor2Min)));
((*(unsigned long*)&(fbStundenKompressor2Ges.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.Kompressor2Std)));
fbLascoStdMin(&fbStundenKompressor2Ges);



(fbMinutenWarmluftofenGes.Aktiv=Aktoren.Warmluftofen.WarmluftofenAktiv);
(fbMinutenWarmluftofenGes.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenWarmluftofenGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.WarmluftofenMin)));
fbLascoBmin(&fbMinutenWarmluftofenGes);

((*(unsigned long*)&(fbStundenWarmluftofenGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.WarmluftofenMin)));
((*(unsigned long*)&(fbStundenWarmluftofenGes.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.WarmluftofenStd)));
fbLascoStdMin(&fbStundenWarmluftofenGes);



(fbMinutenHeizregisterGes.Aktiv=doHeizregisterEin);
(fbMinutenHeizregisterGes.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenHeizregisterGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.HeizregisterMin)));
fbLascoBmin(&fbMinutenHeizregisterGes);

((*(unsigned long*)&(fbStundenHeizregisterGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.HeizregisterMin)));
((*(unsigned long*)&(fbStundenHeizregisterGes.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.HeizregisterStd)));
fbLascoStdMin(&fbStundenHeizregisterGes);



(fbMinutenScheitholzofenGes.Aktiv=Aktoren.Scheitholzofen.ScheitholzofenAktiv);
(fbMinutenScheitholzofenGes.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenScheitholzofenGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.ScheitholzofenMin)));
fbLascoBmin(&fbMinutenScheitholzofenGes);

((*(unsigned long*)&(fbStundenScheitholzofenGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.ScheitholzofenMin)));
((*(unsigned long*)&(fbStundenScheitholzofenGes.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.ScheitholzofenStd)));
fbLascoStdMin(&fbStundenScheitholzofenGes);



(fbMinutenAbtauung1Ges.Aktiv=Aktoren.KompressorModul1.AbtauungAktiv);
(fbMinutenAbtauung1Ges.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenAbtauung1Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Abtauung1Min)));
fbLascoBmin(&fbMinutenAbtauung1Ges);

((*(unsigned long*)&(fbStundenAbtauung1Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Abtauung1Min)));
((*(unsigned long*)&(fbStundenAbtauung1Ges.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.Abtauung1Std)));
fbLascoStdMin(&fbStundenAbtauung1Ges);



(fbMinutenAbtauung2Ges.Aktiv=Aktoren.KompressorModul2.AbtauungAktiv);
(fbMinutenAbtauung2Ges.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenAbtauung2Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Abtauung2Min)));
fbLascoBmin(&fbMinutenAbtauung2Ges);

((*(unsigned long*)&(fbStundenAbtauung2Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Abtauung2Min)));
((*(unsigned long*)&(fbStundenAbtauung2Ges.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.Abtauung2Std)));
fbLascoStdMin(&fbStundenAbtauung2Ges);



(fbMinutenAbluftventGes.Aktiv=(Betriebsparameter.Ausstattung.Abluftventilator&diAbluftventInBetrieb));
(fbMinutenAbluftventGes.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenAbluftventGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.AbluftventMin)));
fbLascoBmin(&fbMinutenAbluftventGes);

((*(unsigned long*)&(fbStundenAbluftventGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.AbluftventMin)));
((*(unsigned long*)&(fbStundenAbluftventGes.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.AbluftventStd)));
fbLascoStdMin(&fbStundenAbluftventGes);



(fbMinutenFrischluftbetrGes.Aktiv=(gStatusAnlage.FrischluftbetriebAktiv&(((signed long)gAktModus==(signed long)1))));
(fbMinutenFrischluftbetrGes.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenFrischluftbetrGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.FrischluftbetrMin)));
fbLascoBmin(&fbMinutenFrischluftbetrGes);

((*(unsigned long*)&(fbStundenFrischluftbetrGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.FrischluftbetrMin)));
((*(unsigned long*)&(fbStundenFrischluftbetrGes.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.FrischluftbetrStd)));
fbLascoStdMin(&fbStundenFrischluftbetrGes);



(fbMinutenUmluftbetrGes.Aktiv=(gStatusAnlage.UmluftbetriebAktiv&(((signed long)gAktModus==(signed long)1))));
(fbMinutenUmluftbetrGes.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenUmluftbetrGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.UmluftbetrMin)));
fbLascoBmin(&fbMinutenUmluftbetrGes);

((*(unsigned long*)&(fbStundenUmluftbetrGes.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.UmluftbetrMin)));
((*(unsigned long*)&(fbStundenUmluftbetrGes.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.UmluftbetrStd)));
fbLascoStdMin(&fbStundenUmluftbetrGes);



(fbMinutenBox1Ges.Aktiv=Boxen.Box1Out.BoxBereit);
(fbMinutenBox1Ges.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenBox1Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box1Min)));
fbLascoBmin(&fbMinutenBox1Ges);

((*(unsigned long*)&(fbStundenBox1Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box1Min)));
((*(unsigned long*)&(fbStundenBox1Ges.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box1Std)));
fbLascoStdMin(&fbStundenBox1Ges);



(fbMinutenBox2Ges.Aktiv=Boxen.Box2Out.BoxBereit);
(fbMinutenBox2Ges.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenBox2Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box2Min)));
fbLascoBmin(&fbMinutenBox2Ges);

((*(unsigned long*)&(fbStundenBox2Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box2Min)));
((*(unsigned long*)&(fbStundenBox2Ges.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box2Std)));
fbLascoStdMin(&fbStundenBox2Ges);



(fbMinutenBox3Ges.Aktiv=Boxen.Box3Out.BoxBereit);
(fbMinutenBox3Ges.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenBox3Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box3Min)));
fbLascoBmin(&fbMinutenBox3Ges);

((*(unsigned long*)&(fbStundenBox3Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box3Min)));
((*(unsigned long*)&(fbStundenBox3Ges.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box3Std)));
fbLascoStdMin(&fbStundenBox3Ges);



(fbMinutenBox4Ges.Aktiv=Boxen.Box4Out.BoxBereit);
(fbMinutenBox4Ges.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenBox4Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box4Min)));
fbLascoBmin(&fbMinutenBox4Ges);

((*(unsigned long*)&(fbStundenBox4Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box4Min)));
((*(unsigned long*)&(fbStundenBox4Ges.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box4Std)));
fbLascoStdMin(&fbStundenBox4Ges);



(fbMinutenBox5Ges.Aktiv=Boxen.Box5Out.BoxBereit);
(fbMinutenBox5Ges.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenBox5Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box5Min)));
fbLascoBmin(&fbMinutenBox5Ges);

((*(unsigned long*)&(fbStundenBox5Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box5Min)));
((*(unsigned long*)&(fbStundenBox5Ges.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box5Std)));
fbLascoStdMin(&fbStundenBox5Ges);



(fbMinutenBox6Ges.Aktiv=Boxen.Box6Out.BoxBereit);
(fbMinutenBox6Ges.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenBox6Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box6Min)));
fbLascoBmin(&fbMinutenBox6Ges);

((*(unsigned long*)&(fbStundenBox6Ges.Minuten))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box6Min)));
((*(unsigned long*)&(fbStundenBox6Ges.Stunden))=((unsigned long)(&hmiNutzungsdaten.BstGes.Box6Std)));
fbLascoStdMin(&fbStundenBox6Ges);








(fbMinutenVentilator1.Aktiv=(diVentilator1InBetrieb&doVentilator1Ein));
(fbMinutenVentilator1.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenVentilator1.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Ventilator1Min)));
fbLascoBmin(&fbMinutenVentilator1);

((*(unsigned long*)&(fbStundenVentilator1.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Ventilator1Min)));
((*(unsigned long*)&(fbStundenVentilator1.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.Ventilator1Std)));
fbLascoStdMin(&fbStundenVentilator1);



(fbMinutenVentilator2.Aktiv=(diVentilator2InBetrieb&doVentilator2Ein));
(fbMinutenVentilator2.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenVentilator2.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Ventilator2Min)));
fbLascoBmin(&fbMinutenVentilator2);

((*(unsigned long*)&(fbStundenVentilator2.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Ventilator2Min)));
((*(unsigned long*)&(fbStundenVentilator2.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.Ventilator2Std)));
fbLascoStdMin(&fbStundenVentilator2);



(fbMinutenOelsumpfh.Aktiv=doOelsumpfheizungEinModul1);
(fbMinutenOelsumpfh.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenOelsumpfh.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.OelsumpfheizungMin)));
fbLascoBmin(&fbMinutenOelsumpfh);

((*(unsigned long*)&(fbStundenOelsumpfh.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.OelsumpfheizungMin)));
((*(unsigned long*)&(fbStundenOelsumpfh.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.OelsumpfheizungStd)));
fbLascoStdMin(&fbStundenOelsumpfh);



(fbMinutenKompressor1.Aktiv=(doKompressorEinModul1|doEntfFremdFreigabe));
(fbMinutenKompressor1.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenKompressor1.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Kompressor1Min)));
fbLascoBmin(&fbMinutenKompressor1);

((*(unsigned long*)&(fbStundenKompressor1.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Kompressor1Min)));
((*(unsigned long*)&(fbStundenKompressor1.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.Kompressor1Std)));
fbLascoStdMin(&fbStundenKompressor1);



(fbMinutenKompressor2.Aktiv=doKompressorEinModul2);
(fbMinutenKompressor2.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenKompressor2.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Kompressor2Min)));
fbLascoBmin(&fbMinutenKompressor2);

((*(unsigned long*)&(fbStundenKompressor2.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Kompressor2Min)));
((*(unsigned long*)&(fbStundenKompressor2.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.Kompressor2Std)));
fbLascoStdMin(&fbStundenKompressor2);



(fbMinutenWarmluftofen.Aktiv=Aktoren.Warmluftofen.WarmluftofenAktiv);
(fbMinutenWarmluftofen.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenWarmluftofen.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.WarmluftofenMin)));
fbLascoBmin(&fbMinutenWarmluftofen);

((*(unsigned long*)&(fbStundenWarmluftofen.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.WarmluftofenMin)));
((*(unsigned long*)&(fbStundenWarmluftofen.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.WarmluftofenStd)));
fbLascoStdMin(&fbStundenWarmluftofen);



(fbMinutenHeizregister.Aktiv=doHeizregisterEin);
(fbMinutenHeizregister.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenHeizregister.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.HeizregisterMin)));
fbLascoBmin(&fbMinutenHeizregister);

((*(unsigned long*)&(fbStundenHeizregister.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.HeizregisterMin)));
((*(unsigned long*)&(fbStundenHeizregister.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.HeizregisterStd)));
fbLascoStdMin(&fbStundenHeizregister);



(fbMinutenScheitholzofen.Aktiv=Aktoren.Scheitholzofen.ScheitholzofenAktiv);
(fbMinutenScheitholzofen.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenScheitholzofen.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.ScheitholzofenMin)));
fbLascoBmin(&fbMinutenScheitholzofen);

((*(unsigned long*)&(fbStundenScheitholzofen.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.ScheitholzofenMin)));
((*(unsigned long*)&(fbStundenScheitholzofen.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.ScheitholzofenStd)));
fbLascoStdMin(&fbStundenScheitholzofen);



(fbMinutenAbtauung1.Aktiv=Aktoren.KompressorModul1.AbtauungAktiv);
(fbMinutenAbtauung1.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenAbtauung1.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Abtauung1Min)));
fbLascoBmin(&fbMinutenAbtauung1);

((*(unsigned long*)&(fbStundenAbtauung1.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Abtauung1Min)));
((*(unsigned long*)&(fbStundenAbtauung1.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.Abtauung1Std)));
fbLascoStdMin(&fbStundenAbtauung1);



(fbMinutenAbtauung2.Aktiv=Aktoren.KompressorModul2.AbtauungAktiv);
(fbMinutenAbtauung2.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenAbtauung2.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Abtauung2Min)));
fbLascoBmin(&fbMinutenAbtauung2);

((*(unsigned long*)&(fbStundenAbtauung2.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Abtauung2Min)));
((*(unsigned long*)&(fbStundenAbtauung2.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.Abtauung2Std)));
fbLascoStdMin(&fbStundenAbtauung2);



(fbMinutenAbluftvent.Aktiv=(Betriebsparameter.Ausstattung.Abluftventilator&diAbluftventInBetrieb));
(fbMinutenAbluftvent.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenAbluftvent.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.AbluftventMin)));
fbLascoBmin(&fbMinutenAbluftvent);

((*(unsigned long*)&(fbStundenAbluftvent.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.AbluftventMin)));
((*(unsigned long*)&(fbStundenAbluftvent.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.AbluftventStd)));
fbLascoStdMin(&fbStundenAbluftvent);



(fbMinutenFrischluftbetr.Aktiv=(gStatusAnlage.FrischluftbetriebAktiv&(((signed long)gAktModus==(signed long)1))));
(fbMinutenFrischluftbetr.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenFrischluftbetr.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.FrischluftbetrMin)));
fbLascoBmin(&fbMinutenFrischluftbetr);

((*(unsigned long*)&(fbStundenFrischluftbetr.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.FrischluftbetrMin)));
((*(unsigned long*)&(fbStundenFrischluftbetr.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.FrischluftbetrStd)));
fbLascoStdMin(&fbStundenFrischluftbetr);



(fbMinutenUmluftbetr.Aktiv=(gStatusAnlage.UmluftbetriebAktiv&(((signed long)gAktModus==(signed long)1))));
(fbMinutenUmluftbetr.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenUmluftbetr.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.UmluftbetrMin)));
fbLascoBmin(&fbMinutenUmluftbetr);

((*(unsigned long*)&(fbStundenUmluftbetr.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.UmluftbetrMin)));
((*(unsigned long*)&(fbStundenUmluftbetr.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.UmluftbetrStd)));
fbLascoStdMin(&fbStundenUmluftbetr);











(fbMinutenBox1.Aktiv=Boxen.Box1Out.BoxBereit);
(fbMinutenBox1.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenBox1.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Box1Min)));
fbLascoBmin(&fbMinutenBox1);

((*(unsigned long*)&(fbStundenBox1.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Box1Min)));
((*(unsigned long*)&(fbStundenBox1.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.Box1Std)));
fbLascoStdMin(&fbStundenBox1);



(fbMinutenVentBox1.Aktiv=(Boxen.Box1Out.BoxBereit&((diVentilator1InBetrieb&Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Ventilator1)|(diVentilator2InBetrieb&Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Ventilator2))));
(fbMinutenVentBox1.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenVentBox1.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox1)));
fbLascoBmin(&fbMinutenVentBox1);

((*(unsigned long*)&(fbStundenVentBox1.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox1)));
((*(unsigned long*)&(fbStundenVentBox1.Stunden))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox1)));
fbLascoStdMin(&fbStundenVentBox1);




(fbMinutenLuftaufbBox1.Aktiv=(Boxen.Box1Out.BoxBereit&(((diBetriebsmldgKompressorModul1|diEntfeuchterFremdInBetrieb)&Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Luftentfeuchter)|(diScheitholzofenInBetrieb&Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Scheitholzofen)|(doHeizregisterEin&Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Heizregister)|(Aktoren.Warmluftofen.WarmluftofenAktiv&Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Warmluftofen))));
(fbMinutenLuftaufbBox1.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenLuftaufbBox1.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox1)));
fbLascoBmin(&fbMinutenLuftaufbBox1);

((*(unsigned long*)&(fbStundenLuftaufbBox1.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox1)));
((*(unsigned long*)&(fbStundenLuftaufbBox1.Stunden))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox1)));
fbLascoStdMin(&fbStundenLuftaufbBox1);






(fbMinutenBox2.Aktiv=Boxen.Box2Out.BoxBereit);
(fbMinutenBox2.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenBox2.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Box2Min)));
fbLascoBmin(&fbMinutenBox2);

((*(unsigned long*)&(fbStundenBox2.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Box2Min)));
((*(unsigned long*)&(fbStundenBox2.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.Box2Std)));
fbLascoStdMin(&fbStundenBox2);



(fbMinutenVentBox2.Aktiv=(Boxen.Box2Out.BoxBereit&((diVentilator1InBetrieb&Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Ventilator1)|(diVentilator2InBetrieb&Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Ventilator2))));
(fbMinutenVentBox2.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenVentBox2.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox2)));
fbLascoBmin(&fbMinutenVentBox2);

((*(unsigned long*)&(fbStundenVentBox2.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox2)));
((*(unsigned long*)&(fbStundenVentBox2.Stunden))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox2)));
fbLascoStdMin(&fbStundenVentBox2);




(fbMinutenLuftaufbBox2.Aktiv=(Boxen.Box2Out.BoxBereit&(((diBetriebsmldgKompressorModul1|diEntfeuchterFremdInBetrieb)&Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Luftentfeuchter)|(diScheitholzofenInBetrieb&Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Scheitholzofen)|(doHeizregisterEin&Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Heizregister)|(Aktoren.Warmluftofen.WarmluftofenAktiv&Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Warmluftofen))));
(fbMinutenLuftaufbBox2.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenLuftaufbBox2.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox2)));
fbLascoBmin(&fbMinutenLuftaufbBox2);

((*(unsigned long*)&(fbStundenLuftaufbBox2.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox2)));
((*(unsigned long*)&(fbStundenLuftaufbBox2.Stunden))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox2)));
fbLascoStdMin(&fbStundenLuftaufbBox2);





(fbMinutenBox3.Aktiv=Boxen.Box3Out.BoxBereit);
(fbMinutenBox3.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenBox3.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Box3Min)));
fbLascoBmin(&fbMinutenBox3);

((*(unsigned long*)&(fbStundenBox3.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Box3Min)));
((*(unsigned long*)&(fbStundenBox3.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.Box3Std)));
fbLascoStdMin(&fbStundenBox3);



(fbMinutenVentBox3.Aktiv=(Boxen.Box3Out.BoxBereit&((diVentilator1InBetrieb&Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Ventilator1)|(diVentilator2InBetrieb&Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Ventilator2))));
(fbMinutenVentBox3.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenVentBox3.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox3)));
fbLascoBmin(&fbMinutenVentBox3);

((*(unsigned long*)&(fbStundenVentBox3.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox3)));
((*(unsigned long*)&(fbStundenVentBox3.Stunden))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox3)));
fbLascoStdMin(&fbStundenVentBox3);




(fbMinutenLuftaufbBox3.Aktiv=(Boxen.Box3Out.BoxBereit&(((diBetriebsmldgKompressorModul1|diEntfeuchterFremdInBetrieb)&Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Luftentfeuchter)|(diScheitholzofenInBetrieb&Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Scheitholzofen)|(doHeizregisterEin&Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Heizregister)|(Aktoren.Warmluftofen.WarmluftofenAktiv&Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Warmluftofen))));
(fbMinutenLuftaufbBox3.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenLuftaufbBox3.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox3)));
fbLascoBmin(&fbMinutenLuftaufbBox3);

((*(unsigned long*)&(fbStundenLuftaufbBox3.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox3)));
((*(unsigned long*)&(fbStundenLuftaufbBox3.Stunden))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox3)));
fbLascoStdMin(&fbStundenLuftaufbBox3);





(fbMinutenBox4.Aktiv=Boxen.Box4Out.BoxBereit);
(fbMinutenBox4.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenBox4.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Box4Min)));
fbLascoBmin(&fbMinutenBox4);

((*(unsigned long*)&(fbStundenBox4.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Box4Min)));
((*(unsigned long*)&(fbStundenBox4.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.Box4Std)));
fbLascoStdMin(&fbStundenBox4);



(fbMinutenVentBox4.Aktiv=(Boxen.Box4Out.BoxBereit&((diVentilator1InBetrieb&Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Ventilator1)|(diVentilator2InBetrieb&Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Ventilator2))));
(fbMinutenVentBox4.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenVentBox4.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox4)));
fbLascoBmin(&fbMinutenVentBox4);

((*(unsigned long*)&(fbStundenVentBox4.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox4)));
((*(unsigned long*)&(fbStundenVentBox4.Stunden))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox4)));
fbLascoStdMin(&fbStundenVentBox4);




(fbMinutenLuftaufbBox4.Aktiv=(Boxen.Box4Out.BoxBereit&(((diBetriebsmldgKompressorModul1|diEntfeuchterFremdInBetrieb)&Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Luftentfeuchter)|(diScheitholzofenInBetrieb&Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Scheitholzofen)|(doHeizregisterEin&Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Heizregister)|(Aktoren.Warmluftofen.WarmluftofenAktiv&Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Warmluftofen))));
(fbMinutenLuftaufbBox4.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenLuftaufbBox4.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox4)));
fbLascoBmin(&fbMinutenLuftaufbBox4);

((*(unsigned long*)&(fbStundenLuftaufbBox4.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox4)));
((*(unsigned long*)&(fbStundenLuftaufbBox4.Stunden))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox4)));
fbLascoStdMin(&fbStundenLuftaufbBox4);






(fbMinutenBox5.Aktiv=Boxen.Box5Out.BoxBereit);
(fbMinutenBox5.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenBox5.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Box5Min)));
fbLascoBmin(&fbMinutenBox5);

((*(unsigned long*)&(fbStundenBox5.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Box5Min)));
((*(unsigned long*)&(fbStundenBox5.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.Box5Std)));
fbLascoStdMin(&fbStundenBox5);



(fbMinutenVentBox5.Aktiv=(Boxen.Box5Out.BoxBereit&((diVentilator1InBetrieb&Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Ventilator1)|(diVentilator2InBetrieb&Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Ventilator2))));
(fbMinutenVentBox5.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenVentBox5.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox5)));
fbLascoBmin(&fbMinutenVentBox5);

((*(unsigned long*)&(fbStundenVentBox5.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox5)));
((*(unsigned long*)&(fbStundenVentBox5.Stunden))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox5)));
fbLascoStdMin(&fbStundenVentBox5);




(fbMinutenLuftaufbBox5.Aktiv=(Boxen.Box5Out.BoxBereit&(((diBetriebsmldgKompressorModul1|diEntfeuchterFremdInBetrieb)&Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Luftentfeuchter)|(diScheitholzofenInBetrieb&Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Scheitholzofen)|(doHeizregisterEin&Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Heizregister)|(Aktoren.Warmluftofen.WarmluftofenAktiv&Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Warmluftofen))));
(fbMinutenLuftaufbBox5.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenLuftaufbBox5.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox5)));
fbLascoBmin(&fbMinutenLuftaufbBox5);

((*(unsigned long*)&(fbStundenLuftaufbBox5.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox5)));
((*(unsigned long*)&(fbStundenLuftaufbBox5.Stunden))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox5)));
fbLascoStdMin(&fbStundenLuftaufbBox5);






(fbMinutenBox6.Aktiv=Boxen.Box6Out.BoxBereit);
(fbMinutenBox6.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenBox6.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Box6Min)));
fbLascoBmin(&fbMinutenBox6);

((*(unsigned long*)&(fbStundenBox6.Minuten))=((unsigned long)(&hmiNutzungsdaten.Bst.Box6Min)));
((*(unsigned long*)&(fbStundenBox6.Stunden))=((unsigned long)(&hmiNutzungsdaten.Bst.Box6Std)));
fbLascoStdMin(&fbStundenBox6);



(fbMinutenVentBox6.Aktiv=(Boxen.Box6Out.BoxBereit&((diVentilator1InBetrieb&Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Ventilator1)|(diVentilator2InBetrieb&Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Ventilator2))));
(fbMinutenVentBox6.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenVentBox6.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox6)));
fbLascoBmin(&fbMinutenVentBox6);

((*(unsigned long*)&(fbStundenVentBox6.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox6)));
((*(unsigned long*)&(fbStundenVentBox6.Stunden))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox6)));
fbLascoStdMin(&fbStundenVentBox6);




(fbMinutenLuftaufbBox6.Aktiv=(Boxen.Box6Out.BoxBereit&(((diBetriebsmldgKompressorModul1|diEntfeuchterFremdInBetrieb)&Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Luftentfeuchter)|(diScheitholzofenInBetrieb&Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Scheitholzofen)|(doHeizregisterEin&Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Heizregister)|(Aktoren.Warmluftofen.WarmluftofenAktiv&Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Warmluftofen))));
(fbMinutenLuftaufbBox6.sekTick=sekTick);
((*(unsigned long*)&(fbMinutenLuftaufbBox6.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox6)));
fbLascoBmin(&fbMinutenLuftaufbBox6);

((*(unsigned long*)&(fbStundenLuftaufbBox6.Minuten))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox6)));
((*(unsigned long*)&(fbStundenLuftaufbBox6.Stunden))=((unsigned long)(&hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox6)));
fbLascoStdMin(&fbStundenLuftaufbBox6);







(fbRestzeitBox1.AktuelleMinute=Echtzeit.Minute);
(fbRestzeitBox1.AktuelleStunde=Echtzeit.Stunde);
(fbRestzeitBox1.Freigabe=(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebEin|Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungEin));
if(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebEin){
((*(unsigned long*)&(fbRestzeitBox1.ZeitfensterIn))=((unsigned long)(&Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten)));
}else{
((*(unsigned long*)&(fbRestzeitBox1.ZeitfensterIn))=((unsigned long)(&Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten)));
}
fbRestzeit(&fbRestzeitBox1);

(gStatusAnlage.RestlaufzeitenBoxen.Box1Minuten=fbRestzeitBox1.RestzeitMinutenOut);
(gStatusAnlage.RestlaufzeitenBoxen.Box1Stunden=fbRestzeitBox1.RestzeitStundenOut);



(fbRestzeitBox2.AktuelleMinute=Echtzeit.Minute);
(fbRestzeitBox2.AktuelleStunde=Echtzeit.Stunde);
(fbRestzeitBox2.Freigabe=(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebEin|Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungEin));
if(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebEin){
((*(unsigned long*)&(fbRestzeitBox2.ZeitfensterIn))=((unsigned long)(&Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten)));
}else{
((*(unsigned long*)&(fbRestzeitBox2.ZeitfensterIn))=((unsigned long)(&Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten)));
}
fbRestzeit(&fbRestzeitBox2);

(gStatusAnlage.RestlaufzeitenBoxen.Box2Minuten=fbRestzeitBox2.RestzeitMinutenOut);
(gStatusAnlage.RestlaufzeitenBoxen.Box2Stunden=fbRestzeitBox2.RestzeitStundenOut);



(fbRestzeitBox3.AktuelleMinute=Echtzeit.Minute);
(fbRestzeitBox3.AktuelleStunde=Echtzeit.Stunde);
(fbRestzeitBox3.Freigabe=(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebEin|Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungEin));
if(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebEin){
((*(unsigned long*)&(fbRestzeitBox3.ZeitfensterIn))=((unsigned long)(&Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten)));
}else{
((*(unsigned long*)&(fbRestzeitBox3.ZeitfensterIn))=((unsigned long)(&Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten)));
}
fbRestzeit(&fbRestzeitBox3);

(gStatusAnlage.RestlaufzeitenBoxen.Box3Minuten=fbRestzeitBox3.RestzeitMinutenOut);
(gStatusAnlage.RestlaufzeitenBoxen.Box3Stunden=fbRestzeitBox3.RestzeitStundenOut);



(fbRestzeitBox4.AktuelleMinute=Echtzeit.Minute);
(fbRestzeitBox4.AktuelleStunde=Echtzeit.Stunde);
(fbRestzeitBox4.Freigabe=(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebEin|Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungEin));
if(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebEin){
((*(unsigned long*)&(fbRestzeitBox4.ZeitfensterIn))=((unsigned long)(&Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten)));
}else{
((*(unsigned long*)&(fbRestzeitBox4.ZeitfensterIn))=((unsigned long)(&Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten)));
}
fbRestzeit(&fbRestzeitBox4);

(gStatusAnlage.RestlaufzeitenBoxen.Box4Minuten=fbRestzeitBox4.RestzeitMinutenOut);
(gStatusAnlage.RestlaufzeitenBoxen.Box4Stunden=fbRestzeitBox4.RestzeitStundenOut);


(fbRestzeitBox5.AktuelleMinute=Echtzeit.Minute);
(fbRestzeitBox5.AktuelleStunde=Echtzeit.Stunde);
(fbRestzeitBox5.Freigabe=(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebEin|Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungEin));
if(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebEin){
((*(unsigned long*)&(fbRestzeitBox5.ZeitfensterIn))=((unsigned long)(&Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten)));
}else{
((*(unsigned long*)&(fbRestzeitBox5.ZeitfensterIn))=((unsigned long)(&Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten)));
}
fbRestzeit(&fbRestzeitBox5);

(gStatusAnlage.RestlaufzeitenBoxen.Box5Minuten=fbRestzeitBox5.RestzeitMinutenOut);
(gStatusAnlage.RestlaufzeitenBoxen.Box5Stunden=fbRestzeitBox5.RestzeitStundenOut);



(fbRestzeitBox6.AktuelleMinute=Echtzeit.Minute);
(fbRestzeitBox6.AktuelleStunde=Echtzeit.Stunde);
(fbRestzeitBox6.Freigabe=(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebEin|Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungEin));
if(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebEin){
((*(unsigned long*)&(fbRestzeitBox6.ZeitfensterIn))=((unsigned long)(&Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten)));
}else{
((*(unsigned long*)&(fbRestzeitBox6.ZeitfensterIn))=((unsigned long)(&Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten)));
}
fbRestzeit(&fbRestzeitBox6);

(gStatusAnlage.RestlaufzeitenBoxen.Box6Minuten=fbRestzeitBox6.RestzeitMinutenOut);
(gStatusAnlage.RestlaufzeitenBoxen.Box6Stunden=fbRestzeitBox6.RestzeitStundenOut);





(hmiParameter.Servicebereich.KontrollintervallUhrzeit=200000);

(fbSrvcUhrzeit.Aktiv=1);
(fbSrvcUhrzeit.Tick=minTick);
((*(unsigned long*)&(fbSrvcUhrzeit.ZeitBisSrvc))=((unsigned long)(&hmiNutzungsdaten.Serviceintervalle.RestzeitKontrolleUhrzeit)));
(fbSrvcUhrzeit.SrvcIntervall=Betriebsparameter.Servicebereich.KontrollintervallUhrzeit);
(fbSrvcUhrzeit.SrvcReset=hmiButtons.ResetServiceUhrzeit);
fbLascoSrvcInterv(&fbSrvcUhrzeit);
(hmiNutzungsdaten.Serviceintervalle.KontrolleUhrzeitErforderlich=fbSrvcUhrzeit.SrvcErforderl);

if(hmiButtons.ResetServiceUhrzeit){
(hmiButtons.ResetServiceUhrzeit=0);
}

(TON_ResetInit.IN=1);;(TON_ResetInit.PT=(1000));;TON(&TON_ResetInit);
(initOk=TON_ResetInit.Q);


}}
#line 780 "C:/SharedFolder/CControl/Logical/Util/Nutzung/Nutzung.nodebug"

void __AS__ImplInitNutzung_st(void){__BUR__ENTRY_INIT_FUNCT__();}

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
__asm__(".ascii \"iecfile \\\"Logical/Util/Nutzung/Nutzung.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/Nutzung/Nutzung.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/Nutzung/Nutzung.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Util/Nutzung/Nutzung.st\\\"\\n\"");
__asm__(".previous");
