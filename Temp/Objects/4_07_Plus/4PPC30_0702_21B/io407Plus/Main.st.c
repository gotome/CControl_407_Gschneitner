#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/io407Plus/Mainst.h"
#line 1 "C:/SharedFolder/CControl/Logical/IO/io407Plus/Main.nodebug"
#line 2 "C:/SharedFolder/CControl/Logical/IO/io407Plus/Main.st"
void __BUR__ENTRY_INIT_FUNCT__(void){{

(hmiStatus.NameSteuerung=1);

}}
#line 6 "C:/SharedFolder/CControl/Logical/IO/io407Plus/Main.nodebug"
#line 10 "C:/SharedFolder/CControl/Logical/IO/io407Plus/Main.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){{




(hmiParameter.Ausstattung.Entfeuchter=1);
(hmiParameter.Ausstattung.Box5=0);
(hmiParameter.Ausstattung.Box6=0);

if(hmiParameter.Ausstattung.Abluftklappe){
(hmiParameter.Ausstattung.Abluftventilator=0);
}else if(hmiParameter.Ausstattung.Abluftventilator){
(hmiParameter.Ausstattung.Abluftklappe=0);
}



(fbLascoZdxx_0.IN=Echtzeit.Sekunde);;fbLascoZdxx(&fbLascoZdxx_0);
(sekTick=fbLascoZdxx_0.Q);








if((((signed long)gAktModus!=(signed long)2))){



*((char volatile*)&(brModul01)) = *((char*)&(brModul01));



(diNiederdruckOkModul1=diModul02.di01);
(diHochdruckOkModul1=diModul02.di02);
(diKopftempKompressorModul1=diModul02.di03);
(diOeldruckKompressorModul1=diModul02.di04);
(diVollschutzKompressorModul1=diModul02.di05);
(diBetriebsmldgKompressorModul1=diModul02.di06);



(diBypassklappeOffen=diModul02.di10);
(diBypassklappeGeschl=diModul02.di11);
(diLeistungsvorgKompressorExtMod1=diModul02.di12);
(di24VDCinternIstOk=diModul02.di13);







(doModul03.do01=doTrocknungInBetrieb);
(doModul03.do02=doTrocknungStoerung);
(doModul03.do03=doKompressorEinModul1);
(doModul03.do04=doMagnetventilEinModul1);
(doModul03.do05=doOelsumpfheizungEinModul1);
(doModul03.do06=doBypassklappeOeffnen);
(doModul03.do07=0);
(doModul03.do08=0);





if(sekTick){
(LCRMovAvgFlt_0.enable=1);;(LCRMovAvgFlt_0.x=aiModul04.ai01);;(LCRMovAvgFlt_0.base=Betriebsparameter.Sensoren.FilterzeitNiederdruck);;LCRMovAvgFlt(&LCRMovAvgFlt_0);
(LCRMovAvgFlt_1.enable=1);;(LCRMovAvgFlt_1.x=aiModul04.ai02);;(LCRMovAvgFlt_1.base=Betriebsparameter.Sensoren.FilterzeitHochdruck);;LCRMovAvgFlt(&LCRMovAvgFlt_1);
(LCRMovAvgFlt_2.enable=1);;(LCRMovAvgFlt_2.x=aiModul04.ai03);;(LCRMovAvgFlt_2.base=Betriebsparameter.Sensoren.FilterzeitEintritt);;LCRMovAvgFlt(&LCRMovAvgFlt_2);
(LCRMovAvgFlt_3.enable=1);;(LCRMovAvgFlt_3.x=aiModul04.ai04);;(LCRMovAvgFlt_3.base=Betriebsparameter.Sensoren.FilterzeitEintritt);;LCRMovAvgFlt(&LCRMovAvgFlt_3);
(LCRMovAvgFlt_4.enable=1);;(LCRMovAvgFlt_4.x=aiModul04.ai05);;(LCRMovAvgFlt_4.base=Betriebsparameter.Sensoren.FilterzeitAustritt);;LCRMovAvgFlt(&LCRMovAvgFlt_4);
(LCRMovAvgFlt_5.enable=1);;(LCRMovAvgFlt_5.x=aiModul04.ai06);;(LCRMovAvgFlt_5.base=Betriebsparameter.Sensoren.FilterzeitAustritt);;LCRMovAvgFlt(&LCRMovAvgFlt_5);
(LCRMovAvgFlt_6.enable=1);;(LCRMovAvgFlt_6.x=aiModul04.ai07);;(LCRMovAvgFlt_6.base=Betriebsparameter.Sensoren.FilterzeitNiederdruck);;LCRMovAvgFlt(&LCRMovAvgFlt_6);
(LCRMovAvgFlt_7.enable=1);;(LCRMovAvgFlt_7.x=aiModul04.ai08);;(LCRMovAvgFlt_7.base=Betriebsparameter.Sensoren.FilterzeitHochdruck);;LCRMovAvgFlt(&LCRMovAvgFlt_7);
}



(LCRLimScal_0.x=LCRMovAvgFlt_0.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.NiederdruckMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.NiederdruckMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiNiederdruckModul1=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetNiederdruckModul1));



(LCRLimScal_0.x=LCRMovAvgFlt_1.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.HochdruckMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.HochdruckMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiHochdruckModul1=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetHochdruckModul1));



(LCRLimScal_0.x=LCRMovAvgFlt_2.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.EintrittTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.EintrittTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiEintrittTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetEintrittTemp));



(LCRLimScal_0.x=LCRMovAvgFlt_3.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.EintrittFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.EintrittFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiEintrittFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetEintrittFeuchte));



(LCRLimScal_0.x=LCRMovAvgFlt_4.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.AustrittTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.AustrittTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiAustrittTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetAustrittTemp));



(LCRLimScal_0.x=LCRMovAvgFlt_5.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.AustrittFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.AustrittFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiAustrittFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetAustrittFeuchte));



(LCRLimScal_0.x=LCRMovAvgFlt_6.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.NiederdruckMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.NiederdruckMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiNiederdruckModul2=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetNiederdruckModul2));



(LCRLimScal_0.x=LCRMovAvgFlt_7.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.HochdruckMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.HochdruckMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiHochdruckModul2=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetHochdruckModul2));




(diNiederdruckOkModul2=cmModul05.di01);
(diHochdruckOkModul2=cmModul05.di02);
(diBetriebsmldgKompressorModul2=cmModul05.di03);


(cmModul05.do01=doKompressorEinModul2);
(cmModul05.do02=doMagnetventilEinModul2);


if(sekTick){
(LCRMovAvgFlt_8.enable=1);;(LCRMovAvgFlt_8.x=cmModul05.ai01);;(LCRMovAvgFlt_8.base=Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);;LCRMovAvgFlt(&LCRMovAvgFlt_8);
}



(LCRLimScal_0.x=LCRMovAvgFlt_8.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.LuftgeschwMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.LuftgeschwMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiLuftgeschwindigkeit=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetLuftgeschw));



(LCRLimScal_0.x=aoDrehzahlvorgKompressorModul1);;(LCRLimScal_0.x1=0.00000000000000000000E+00);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Kompressor1.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul05.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(diVollschutzKompressorModul2=cmModul06.di01);
(diOeldruckKompressorModul2=cmModul06.di02);
(diKopftempKompressorModul2=cmModul06.di03);


(cmModul06.do01=doOelsumpfheizungEinModul2);
(cmModul06.do02=0);






(LCRLimScal_0.x=aoDrehzahlvorgKompressorModul2);;(LCRLimScal_0.x1=0.00000000000000000000E+00);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Kompressor2.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul06.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));





(diVentilator1InBetrieb=cmModul07.di01);
(diNotstromaggregatInBetrieb=cmModul07.di02);



(cmModul07.do01=doVentilator1Ein);
(cmModul07.do02=doNotstromaggregatEin);


if(sekTick){
(LCRMovAvgFlt_9.enable=1);;(LCRMovAvgFlt_9.x=cmModul07.ai01);;(LCRMovAvgFlt_9.base=Betriebsparameter.Sensoren.FilterzeitFrischluft);;LCRMovAvgFlt(&LCRMovAvgFlt_9);
}



(LCRLimScal_0.x=LCRMovAvgFlt_9.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.FrischlTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.FrischlTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiFrischluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetFrischluftTemp));



(LCRLimScal_0.x=aoDrehzahlvorgVentilator1);;(LCRLimScal_0.x1=Betriebsparameter.Ventilator1.DrehzahlMin);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Ventilator1.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul07.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(diBox1Offen=cmModul08.di01);
(diBox1Geschl=cmModul08.di02);
(diBox2Offen=cmModul08.di03);
(diBox2Geschl=cmModul08.di04);

(cmModul08.do01=doFreigabeBox1);
(cmModul08.do02=doFreigabeBox2);


if(sekTick){
(LCRMovAvgFlt_10.enable=1);;(LCRMovAvgFlt_10.x=cmModul08.ai01);;(LCRMovAvgFlt_10.base=Betriebsparameter.Sensoren.FilterzeitFrischluft);;LCRMovAvgFlt(&LCRMovAvgFlt_10);
}



(LCRLimScal_0.x=LCRMovAvgFlt_10.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.FrischlFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiFrischluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetFrischluftFeuchte));



(LCRLimScal_0.x=aoTemperaturvorgWarmluftofen);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=100);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul08.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(diVentilator2InBetrieb=cmModul09.di01);
(diDrehzahlbegrVentilator1=cmModul09.di02);
(diDrehzahlbegrVentilator2=cmModul09.di03);


(cmModul09.do01=doVentilator2Ein);
(cmModul09.do02=0);


if(sekTick){
(LCRMovAvgFlt_11.enable=1);;(LCRMovAvgFlt_11.x=cmModul09.ai01);;(LCRMovAvgFlt_11.base=Betriebsparameter.Sensoren.FilterzeitTrockenluft);;LCRMovAvgFlt(&LCRMovAvgFlt_11);
}



(LCRLimScal_0.x=LCRMovAvgFlt_11.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.TrockenlTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.TrockenlTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiTrockenluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetTrockenluftTemp));



(LCRLimScal_0.x=aoDrehzahlvorgVentilator2);;(LCRLimScal_0.x1=Betriebsparameter.Ventilator2.DrehzahlMin);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Ventilator2.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul09.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));





(diWarmluftofenInBetrieb=cmModul10.di01);
(diScheitholzofenInBetrieb=cmModul10.di02);



(cmModul10.do01=doWarmluftofenEin);
(cmModul10.do02=doHeizregisterEin);


if(sekTick){
(LCRMovAvgFlt_12.enable=1);;(LCRMovAvgFlt_12.x=cmModul10.ai01);;(LCRMovAvgFlt_12.base=Betriebsparameter.Sensoren.FilterzeitTrockenluft);;LCRMovAvgFlt(&LCRMovAvgFlt_12);
}



(LCRLimScal_0.x=LCRMovAvgFlt_12.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.TrockenlFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.TrockenlFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiTrockenluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetTrockenluftFeuchte));


(LCRLimScal_0.x=aoLeistungsvorgHeizregister);;(LCRLimScal_0.x1=0.00000000000000000000E+00);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=1.00000000000000000000E+02);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul10.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(diBox3Offen=cmModul11.di01);
(diBox3Geschl=cmModul11.di02);
(diBox4Offen=cmModul11.di03);
(diBox4Geschl=cmModul11.di04);

(cmModul11.do01=doFreigabeBox3);
(cmModul11.do02=doFreigabeBox4);


if(sekTick){
(LCRMovAvgFlt_13.enable=1);;(LCRMovAvgFlt_13.x=cmModul11.ai01);;(LCRMovAvgFlt_13.base=Betriebsparameter.Sensoren.FilterzeitAbluft);;LCRMovAvgFlt(&LCRMovAvgFlt_13);
}



(LCRLimScal_0.x=LCRMovAvgFlt_13.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.AbluftTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.AbluftTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiAbluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetAbluftTemp));


(cmModul11.ao01=0);




(diBox5Offen=cmModul12.di01);
(diBox5Geschl=cmModul12.di02);
(diBox6Offen=cmModul12.di03);
(diBox6Geschl=cmModul12.di04);

(cmModul12.do01=doFreigabeBox5);
(cmModul12.do02=doFreigabeBox6);


if(sekTick){
(LCRMovAvgFlt_14.enable=1);;(LCRMovAvgFlt_14.x=cmModul12.ai01);;(LCRMovAvgFlt_14.base=Betriebsparameter.Sensoren.FilterzeitAbluft);;LCRMovAvgFlt(&LCRMovAvgFlt_14);
}



(LCRLimScal_0.x=LCRMovAvgFlt_14.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.AbluftFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.AbluftFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiAbluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetAbluftFeuchte));


(cmModul12.ao01=0);




(diAbluftventInBetrieb=cmModul13.di01);




(cmModul13.do01=doBrandschutzklappeAuf);
(cmModul13.do02=doAbluftventilatorEin);


if(sekTick){
(LCRMovAvgFlt_15.enable=1);;(LCRMovAvgFlt_15.x=cmModul13.ai01);;(LCRMovAvgFlt_15.base=Betriebsparameter.Sensoren.FilterzeitDachluft);;LCRMovAvgFlt(&LCRMovAvgFlt_15);
}



(LCRLimScal_0.x=LCRMovAvgFlt_15.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.DachTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.DachTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiDachluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetDachTemp));



(LCRLimScal_0.x=aoDrehzahlvorgAbluftventilator);;(LCRLimScal_0.x1=Betriebsparameter.Abluftventilator.DrehzahlMin);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Abluftventilator.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul13.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(diAbluftklappeOffen=cmModul14.di01);
(diAbluftklappeGeschl=cmModul14.di02);



(cmModul14.do01=doAbluftklappeFreigabe);
(cmModul14.do02=0);


if(sekTick){
(LCRMovAvgFlt_16.enable=1);;(LCRMovAvgFlt_16.x=cmModul14.ai01);;(LCRMovAvgFlt_16.base=Betriebsparameter.Sensoren.FilterzeitDachluft);;LCRMovAvgFlt(&LCRMovAvgFlt_16);
}



(LCRLimScal_0.x=LCRMovAvgFlt_16.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.DachFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.DachFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiDachluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetDachFeuchte));


(cmModul14.ao01=0);





(diUmschaltklappe1Offen=cmModul15.di01);
(diUmschaltklappe1Geschl=cmModul15.di02);
(diUmschaltklappe2Offen=cmModul15.di03);
(diUmschaltklappe2Geschl=cmModul15.di04);


(cmModul15.do01=doUmluftklappe1Freigabe);
(cmModul15.do02=doUmluftklappe2Freigabe);


if(sekTick){
(LCRMovAvgFlt_17.enable=1);;(LCRMovAvgFlt_17.x=cmModul15.ai01);;(LCRMovAvgFlt_17.base=Betriebsparameter.Sensoren.FilterzeitKanaldruck);;LCRMovAvgFlt(&LCRMovAvgFlt_17);
}



(LCRLimScal_0.x=LCRMovAvgFlt_17.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.KanaldruckMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.KanaldruckMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiDifferenzdruck=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetKanaldruck));


(cmModul15.ao01=0);







if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusNiederdruckMinMod1=1);
}else{
(diStatusNiederdruckMinMod1=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusNiederdruckMaxMod1=1);
}else{
(diStatusNiederdruckMaxMod1=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit3==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit2==(unsigned long)(unsigned char)1)))){
(diStatusHochdruckMinMod1=1);
}else{
(diStatusHochdruckMinMod1=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit3==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit2==(unsigned long)(unsigned char)0)))){
(diStatusHochdruckMaxMod1=1);
}else{
(diStatusHochdruckMaxMod1=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit5==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit4==(unsigned long)(unsigned char)1)))){
(diStatusEintrittTempMin=1);
}else{
(diStatusEintrittTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit5==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit4==(unsigned long)(unsigned char)0)))){
(diStatusEintrittTempMax=1);
}else{
(diStatusEintrittTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit7==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit6==(unsigned long)(unsigned char)1)))){
(diStatusEintrittFeuchteMin=1);
}else{
(diStatusEintrittFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit7==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit6==(unsigned long)(unsigned char)0)))){
(diStatusEintrittFeuchteMax=1);
}else{
(diStatusEintrittFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusAustrittTempMin=1);
}else{
(diStatusAustrittTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusAustrittTempMax=1);
}else{
(diStatusAustrittTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit3==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit2==(unsigned long)(unsigned char)1)))){
(diStatusAustrittFeuchteMin=1);
}else{
(diStatusAustrittFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit3==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit2==(unsigned long)(unsigned char)0)))){
(diStatusAustrittFeuchteMax=1);
}else{
(diStatusAustrittFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit5==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit4==(unsigned long)(unsigned char)1)))){
(diStatusNiederdruckMinMod2=1);
}else{
(diStatusNiederdruckMinMod2=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit5==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit4==(unsigned long)(unsigned char)0)))){
(diStatusNiederdruckMaxMod2=1);
}else{
(diStatusNiederdruckMaxMod2=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit7==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit6==(unsigned long)(unsigned char)1)))){
(diStatusHochdruckMinMod2=1);
}else{
(diStatusHochdruckMinMod2=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit7==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit6==(unsigned long)(unsigned char)0)))){
(diStatusHochdruckMaxMod2=1);
}else{
(diStatusHochdruckMaxMod2=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusLuftgeschwMin=1);
}else{
(diStatusLuftgeschwMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusLuftgeschwMax=1);
}else{
(diStatusLuftgeschwMax=0);
}
if((((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))|(((signed long)(signed long)(short)cmModul05.ai01>=(signed long)(signed long)(short)32767)))){
(diStatusLuftgeschwDrahtbruch=1);
}else{
(diStatusLuftgeschwDrahtbruch=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusFrischluftTempMin=1);
}else{
(diStatusFrischluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusFrischluftTempMax=1);
}else{
(diStatusFrischluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusFrischluftFeuchteMin=1);
}else{
(diStatusFrischluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusFrischluftFeuchteMax=1);
}else{
(diStatusFrischluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusTrockenluftTempMin=1);
}else{
(diStatusTrockenluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusTrockenluftTempMax=1);
}else{
(diStatusTrockenluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusTrockenluftFeuchteMin=1);
}else{
(diStatusTrockenluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusTrockenluftFeuchteMax=1);
}else{
(diStatusTrockenluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusAbluftTempMin=1);
}else{
(diStatusAbluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusAbluftTempMax=1);
}else{
(diStatusAbluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul12.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul12.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusAbluftFeuchteMin=1);
}else{
(diStatusAbluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul12.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul12.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusAbluftFeuchteMax=1);
}else{
(diStatusAbluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul13.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul13.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusDachluftTempMin=1);
}else{
(diStatusDachluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul13.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul13.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusDachluftTempMax=1);
}else{
(diStatusDachluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul14.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul14.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusDachluftFeuchteMin=1);
}else{
(diStatusDachluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul14.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul14.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusDachluftFeuchteMax=1);
}else{
(diStatusDachluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul15.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul15.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusDifferenzdruckMin=1);
}else{
(diStatusDifferenzdruckMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul15.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul15.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusDifferenzdruckMax=1);
}else{
(diStatusDifferenzdruckMax=0);
}





(hmiIoTest.DigitalOut.doAbluftklappeFreigabe=0);
(hmiIoTest.DigitalOut.doAbluftventilatorEin=0);
(hmiIoTest.DigitalOut.doBrandschutzklappeAuf=0);
(hmiIoTest.DigitalOut.doBypassklappeOeffnen=0);
(hmiIoTest.DigitalOut.doFreigabeBox1=0);
(hmiIoTest.DigitalOut.doFreigabeBox2=0);
(hmiIoTest.DigitalOut.doFreigabeBox3=0);
(hmiIoTest.DigitalOut.doFreigabeBox4=0);
(hmiIoTest.DigitalOut.doFreigabeBox5=0);
(hmiIoTest.DigitalOut.doFreigabeBox6=0);
(hmiIoTest.DigitalOut.doHeizregisterEin=0);
(hmiIoTest.DigitalOut.doKompressorEinModul1=0);
(hmiIoTest.DigitalOut.doKompressorEinModul2=0);
(hmiIoTest.DigitalOut.doMagnetventilEinModul1=0);
(hmiIoTest.DigitalOut.doMagnetventilEinModul2=0);
(hmiIoTest.DigitalOut.doNotstromaggregatEin=0);
(hmiIoTest.DigitalOut.doOelsumpfheizungEinModul1=0);
(hmiIoTest.DigitalOut.doOelsumpfheizungEinModul2=0);
(hmiIoTest.DigitalOut.doTrocknungInBetrieb=0);
(hmiIoTest.DigitalOut.doTrocknungStoerung=0);
(hmiIoTest.DigitalOut.doUmluftklappe1Freigabe=0);
(hmiIoTest.DigitalOut.doUmluftklappe2Freigabe=0);
(hmiIoTest.DigitalOut.doVentilator1Ein=0);
(hmiIoTest.DigitalOut.doVentilator2Ein=0);
(hmiIoTest.DigitalOut.doWarmluftofenEin=0);

(hmiIoTest.AnalogOut.aoDrehzahlvorgAbluftventilator=0.00000000000000000000E+00);
(hmiIoTest.AnalogOut.aoDrehzahlvorgKompressorModul1=0.00000000000000000000E+00);
(hmiIoTest.AnalogOut.aoDrehzahlvorgKompressorModul2=0.00000000000000000000E+00);
(hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator1=0.00000000000000000000E+00);
(hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator2=0.00000000000000000000E+00);
(hmiIoTest.AnalogOut.aoLeistungsvorgHeizregister=0.00000000000000000000E+00);
(hmiIoTest.AnalogOut.aoTemperaturvorgWarmluftofen=0.00000000000000000000E+00);






}else{







(hmiIoTest.DigitalIn.diNiederdruckOkModul1=diModul02.di01);
(hmiIoTest.DigitalIn.diHochdruckOkModul1=diModul02.di02);
(hmiIoTest.DigitalIn.diKopftempKompressorModul1=diModul02.di03);
(hmiIoTest.DigitalIn.diOeldruckKompressorModul1=diModul02.di04);
(hmiIoTest.DigitalIn.diVollschutzKompressorModul1=diModul02.di05);
(hmiIoTest.DigitalIn.diBetriebsmldgKompressorModul1=diModul02.di06);



(hmiIoTest.DigitalIn.diBypassklappeOffen=diModul02.di10);
(hmiIoTest.DigitalIn.diBypassklappeGeschl=diModul02.di11);
(hmiIoTest.DigitalIn.diLeistungsvorgKompressorExtMod1=diModul02.di12);
(hmiIoTest.DigitalIn.di24VDCinternIstOk=diModul02.di13);







(doModul03.do01=hmiIoTest.DigitalOut.doTrocknungInBetrieb);
(doModul03.do02=hmiIoTest.DigitalOut.doTrocknungStoerung);
(doModul03.do03=hmiIoTest.DigitalOut.doKompressorEinModul1);
(doModul03.do04=hmiIoTest.DigitalOut.doMagnetventilEinModul1);
(doModul03.do05=hmiIoTest.DigitalOut.doOelsumpfheizungEinModul1);
(doModul03.do06=hmiIoTest.DigitalOut.doBypassklappeOeffnen);
(doModul03.do07=0);
(doModul03.do08=0);





if(sekTick){
(LCRMovAvgFlt_0.enable=1);;(LCRMovAvgFlt_0.x=aiModul04.ai01);;(LCRMovAvgFlt_0.base=Betriebsparameter.Sensoren.FilterzeitNiederdruck);;LCRMovAvgFlt(&LCRMovAvgFlt_0);
(LCRMovAvgFlt_1.enable=1);;(LCRMovAvgFlt_1.x=aiModul04.ai02);;(LCRMovAvgFlt_1.base=Betriebsparameter.Sensoren.FilterzeitHochdruck);;LCRMovAvgFlt(&LCRMovAvgFlt_1);
(LCRMovAvgFlt_2.enable=1);;(LCRMovAvgFlt_2.x=aiModul04.ai03);;(LCRMovAvgFlt_2.base=Betriebsparameter.Sensoren.FilterzeitEintritt);;LCRMovAvgFlt(&LCRMovAvgFlt_2);
(LCRMovAvgFlt_3.enable=1);;(LCRMovAvgFlt_3.x=aiModul04.ai04);;(LCRMovAvgFlt_3.base=Betriebsparameter.Sensoren.FilterzeitEintritt);;LCRMovAvgFlt(&LCRMovAvgFlt_3);
(LCRMovAvgFlt_4.enable=1);;(LCRMovAvgFlt_4.x=aiModul04.ai05);;(LCRMovAvgFlt_4.base=Betriebsparameter.Sensoren.FilterzeitAustritt);;LCRMovAvgFlt(&LCRMovAvgFlt_4);
(LCRMovAvgFlt_5.enable=1);;(LCRMovAvgFlt_5.x=aiModul04.ai06);;(LCRMovAvgFlt_5.base=Betriebsparameter.Sensoren.FilterzeitAustritt);;LCRMovAvgFlt(&LCRMovAvgFlt_5);
(LCRMovAvgFlt_6.enable=1);;(LCRMovAvgFlt_6.x=aiModul04.ai07);;(LCRMovAvgFlt_6.base=Betriebsparameter.Sensoren.FilterzeitNiederdruck);;LCRMovAvgFlt(&LCRMovAvgFlt_6);
(LCRMovAvgFlt_7.enable=1);;(LCRMovAvgFlt_7.x=aiModul04.ai08);;(LCRMovAvgFlt_7.base=Betriebsparameter.Sensoren.FilterzeitHochdruck);;LCRMovAvgFlt(&LCRMovAvgFlt_7);
}



(LCRLimScal_0.x=LCRMovAvgFlt_0.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.NiederdruckMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.NiederdruckMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiNiederdruckModul1=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetNiederdruckModul1));



(LCRLimScal_0.x=LCRMovAvgFlt_1.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.HochdruckMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.HochdruckMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiHochdruckModul1=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetHochdruckModul1));



(LCRLimScal_0.x=LCRMovAvgFlt_2.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.EintrittTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.EintrittTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiEintrittTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetEintrittTemp));



(LCRLimScal_0.x=LCRMovAvgFlt_3.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.EintrittFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.EintrittFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiEintrittFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetEintrittFeuchte));



(LCRLimScal_0.x=LCRMovAvgFlt_4.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.AustrittTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.AustrittTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiAustrittTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetAustrittTemp));



(LCRLimScal_0.x=LCRMovAvgFlt_5.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.AustrittFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.AustrittFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiAustrittFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetAustrittFeuchte));



(LCRLimScal_0.x=LCRMovAvgFlt_6.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.NiederdruckMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.NiederdruckMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiNiederdruckModul2=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetNiederdruckModul2));



(LCRLimScal_0.x=LCRMovAvgFlt_7.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.HochdruckMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.HochdruckMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiHochdruckModul2=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetHochdruckModul2));




(hmiIoTest.DigitalIn.diNiederdruckOkModul2=cmModul05.di01);
(hmiIoTest.DigitalIn.diHochdruckOkModul2=cmModul05.di02);
(hmiIoTest.DigitalIn.diBetriebsmldgKompressorModul2=cmModul05.di03);


(cmModul05.do01=hmiIoTest.DigitalOut.doKompressorEinModul2);
(cmModul05.do02=hmiIoTest.DigitalOut.doMagnetventilEinModul2);


if(sekTick){
(LCRMovAvgFlt_8.enable=1);;(LCRMovAvgFlt_8.x=cmModul05.ai01);;(LCRMovAvgFlt_8.base=Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);;LCRMovAvgFlt(&LCRMovAvgFlt_8);
}



(LCRLimScal_0.x=LCRMovAvgFlt_8.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.LuftgeschwMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.LuftgeschwMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiLuftgeschwindigkeit=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetLuftgeschw));



(LCRLimScal_0.x=hmiIoTest.AnalogOut.aoDrehzahlvorgKompressorModul1);;(LCRLimScal_0.x1=0.00000000000000000000E+00);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Kompressor1.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul05.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(hmiIoTest.DigitalIn.diVollschutzKompressorModul2=cmModul06.di01);
(hmiIoTest.DigitalIn.diOeldruckKompressorModul2=cmModul06.di02);
(hmiIoTest.DigitalIn.diKopftempKompressorModul2=cmModul06.di03);


(cmModul06.do01=hmiIoTest.DigitalOut.doOelsumpfheizungEinModul2);
(cmModul06.do02=0);







(LCRLimScal_0.x=hmiIoTest.AnalogOut.aoDrehzahlvorgKompressorModul2);;(LCRLimScal_0.x1=0.00000000000000000000E+00);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Kompressor2.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul06.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));





(hmiIoTest.DigitalIn.diVentilator1InBetrieb=cmModul07.di01);
(hmiIoTest.DigitalIn.diNotstromaggregatInBetrieb=cmModul07.di02);



(cmModul07.do01=hmiIoTest.DigitalOut.doVentilator1Ein);
(cmModul07.do02=hmiIoTest.DigitalOut.doNotstromaggregatEin);


if(sekTick){
(LCRMovAvgFlt_9.enable=1);;(LCRMovAvgFlt_9.x=cmModul07.ai01);;(LCRMovAvgFlt_9.base=Betriebsparameter.Sensoren.FilterzeitFrischluft);;LCRMovAvgFlt(&LCRMovAvgFlt_9);
}



(LCRLimScal_0.x=LCRMovAvgFlt_9.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.FrischlTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.FrischlTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiFrischluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetFrischluftTemp));



(LCRLimScal_0.x=hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator1);;(LCRLimScal_0.x1=Betriebsparameter.Ventilator1.DrehzahlMin);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Ventilator1.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul07.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(hmiIoTest.DigitalIn.diBox1Offen=cmModul08.di01);
(hmiIoTest.DigitalIn.diBox1Geschl=cmModul08.di02);
(hmiIoTest.DigitalIn.diBox2Offen=cmModul08.di03);
(hmiIoTest.DigitalIn.diBox2Geschl=cmModul08.di04);

(cmModul08.do01=hmiIoTest.DigitalOut.doFreigabeBox1);
(cmModul08.do02=hmiIoTest.DigitalOut.doFreigabeBox2);


if(sekTick){
(LCRMovAvgFlt_10.enable=1);;(LCRMovAvgFlt_10.x=cmModul08.ai01);;(LCRMovAvgFlt_10.base=Betriebsparameter.Sensoren.FilterzeitFrischluft);;LCRMovAvgFlt(&LCRMovAvgFlt_10);
}



(LCRLimScal_0.x=LCRMovAvgFlt_10.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.FrischlFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiFrischluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetFrischluftFeuchte));



(LCRLimScal_0.x=hmiIoTest.AnalogOut.aoTemperaturvorgWarmluftofen);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=100);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul08.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(hmiIoTest.DigitalIn.diVentilator2InBetrieb=cmModul09.di01);
(hmiIoTest.DigitalIn.diDrehzahlbegrVentilator1=cmModul09.di02);
(hmiIoTest.DigitalIn.diDrehzahlbegrVentilator2=cmModul09.di03);


(cmModul09.do01=hmiIoTest.DigitalOut.doVentilator2Ein);
(cmModul09.do02=0);


if(sekTick){
(LCRMovAvgFlt_11.enable=1);;(LCRMovAvgFlt_11.x=cmModul09.ai01);;(LCRMovAvgFlt_11.base=Betriebsparameter.Sensoren.FilterzeitTrockenluft);;LCRMovAvgFlt(&LCRMovAvgFlt_11);
}



(LCRLimScal_0.x=LCRMovAvgFlt_11.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.TrockenlTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.TrockenlTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiTrockenluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetTrockenluftTemp));



(LCRLimScal_0.x=hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator2);;(LCRLimScal_0.x1=Betriebsparameter.Ventilator2.DrehzahlMin);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Ventilator2.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul09.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));





(hmiIoTest.DigitalIn.diWarmluftofenInBetrieb=cmModul10.di01);
(hmiIoTest.DigitalIn.diScheitholzofenInBetrieb=cmModul10.di02);



(cmModul10.do01=hmiIoTest.DigitalOut.doWarmluftofenEin);
(cmModul10.do02=hmiIoTest.DigitalOut.doHeizregisterEin);


if(sekTick){
(LCRMovAvgFlt_12.enable=1);;(LCRMovAvgFlt_12.x=cmModul10.ai01);;(LCRMovAvgFlt_12.base=Betriebsparameter.Sensoren.FilterzeitTrockenluft);;LCRMovAvgFlt(&LCRMovAvgFlt_12);
}



(LCRLimScal_0.x=LCRMovAvgFlt_12.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.TrockenlFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.TrockenlFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiTrockenluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetTrockenluftFeuchte));


(LCRLimScal_0.x=hmiIoTest.AnalogOut.aoLeistungsvorgHeizregister);;(LCRLimScal_0.x1=0.00000000000000000000E+00);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=1.00000000000000000000E+02);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul10.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(hmiIoTest.DigitalIn.diBox3Offen=cmModul11.di01);
(hmiIoTest.DigitalIn.diBox3Geschl=cmModul11.di02);
(hmiIoTest.DigitalIn.diBox4Offen=cmModul11.di03);
(hmiIoTest.DigitalIn.diBox4Geschl=cmModul11.di04);

(cmModul11.do01=hmiIoTest.DigitalOut.doFreigabeBox3);
(cmModul11.do02=hmiIoTest.DigitalOut.doFreigabeBox4);


if(sekTick){
(LCRMovAvgFlt_13.enable=1);;(LCRMovAvgFlt_13.x=cmModul11.ai01);;(LCRMovAvgFlt_13.base=Betriebsparameter.Sensoren.FilterzeitAbluft);;LCRMovAvgFlt(&LCRMovAvgFlt_13);
}



(LCRLimScal_0.x=LCRMovAvgFlt_13.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.AbluftTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.AbluftTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiAbluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetAbluftTemp));


(cmModul11.ao01=0);




(hmiIoTest.DigitalIn.diBox5Offen=cmModul12.di01);
(hmiIoTest.DigitalIn.diBox5Geschl=cmModul12.di02);
(hmiIoTest.DigitalIn.diBox6Offen=cmModul12.di03);
(hmiIoTest.DigitalIn.diBox6Geschl=cmModul12.di04);

(cmModul12.do01=hmiIoTest.DigitalOut.doFreigabeBox5);
(cmModul12.do02=hmiIoTest.DigitalOut.doFreigabeBox6);


if(sekTick){
(LCRMovAvgFlt_14.enable=1);;(LCRMovAvgFlt_14.x=cmModul12.ai01);;(LCRMovAvgFlt_14.base=Betriebsparameter.Sensoren.FilterzeitAbluft);;LCRMovAvgFlt(&LCRMovAvgFlt_14);
}



(LCRLimScal_0.x=LCRMovAvgFlt_14.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.AbluftFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.AbluftFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiAbluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetAbluftFeuchte));


(cmModul12.ao01=0);




(hmiIoTest.DigitalIn.diAbluftventInBetrieb=cmModul13.di01);




(cmModul13.do01=hmiIoTest.DigitalOut.doBrandschutzklappeAuf);
(cmModul13.do02=hmiIoTest.DigitalOut.doAbluftventilatorEin);


if(sekTick){
(LCRMovAvgFlt_15.enable=1);;(LCRMovAvgFlt_15.x=cmModul13.ai01);;(LCRMovAvgFlt_15.base=Betriebsparameter.Sensoren.FilterzeitDachluft);;LCRMovAvgFlt(&LCRMovAvgFlt_15);
}



(LCRLimScal_0.x=LCRMovAvgFlt_15.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.DachTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.DachTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiDachluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetDachTemp));



(LCRLimScal_0.x=hmiIoTest.AnalogOut.aoDrehzahlvorgAbluftventilator);;(LCRLimScal_0.x1=Betriebsparameter.Abluftventilator.DrehzahlMin);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Abluftventilator.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul13.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(hmiIoTest.DigitalIn.diAbluftklappeOffen=cmModul14.di01);
(hmiIoTest.DigitalIn.diAbluftklappeGeschl=cmModul14.di02);



(cmModul14.do01=hmiIoTest.DigitalOut.doAbluftklappeFreigabe);
(cmModul14.do02=0);


if(sekTick){
(LCRMovAvgFlt_16.enable=1);;(LCRMovAvgFlt_16.x=cmModul14.ai01);;(LCRMovAvgFlt_16.base=Betriebsparameter.Sensoren.FilterzeitDachluft);;LCRMovAvgFlt(&LCRMovAvgFlt_16);
}



(LCRLimScal_0.x=LCRMovAvgFlt_16.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.DachFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.DachFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiDachluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetDachFeuchte));


(cmModul14.ao01=0);





(hmiIoTest.DigitalIn.diUmschaltklappe1Offen=cmModul15.di01);
(hmiIoTest.DigitalIn.diUmschaltklappe1Geschl=cmModul15.di02);
(hmiIoTest.DigitalIn.diUmschaltklappe2Offen=cmModul15.di03);
(hmiIoTest.DigitalIn.diUmschaltklappe2Geschl=cmModul15.di04);

(cmModul15.do01=hmiIoTest.DigitalOut.doUmluftklappe1Freigabe);
(cmModul15.do02=hmiIoTest.DigitalOut.doUmluftklappe2Freigabe);


if(sekTick){
(LCRMovAvgFlt_17.enable=1);;(LCRMovAvgFlt_17.x=cmModul15.ai01);;(LCRMovAvgFlt_17.base=Betriebsparameter.Sensoren.FilterzeitKanaldruck);;LCRMovAvgFlt(&LCRMovAvgFlt_17);
}



(LCRLimScal_0.x=LCRMovAvgFlt_17.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.KanaldruckMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.KanaldruckMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiDifferenzdruck=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetKanaldruck));


(cmModul15.ao01=0);







if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusNiederdruckMinMod1=1);
}else{
(hmiIoTest.StatusIn.diStatusNiederdruckMinMod1=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusNiederdruckMaxMod1=1);
}else{
(hmiIoTest.StatusIn.diStatusNiederdruckMaxMod1=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit3==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit2==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusHochdruckMinMod1=1);
}else{
(hmiIoTest.StatusIn.diStatusHochdruckMinMod1=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit3==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit2==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusHochdruckMaxMod1=1);
}else{
(hmiIoTest.StatusIn.diStatusHochdruckMaxMod1=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit5==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit4==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusEintrittTempMin=1);
}else{
(hmiIoTest.StatusIn.diStatusEintrittTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit5==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit4==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusEintrittTempMax=1);
}else{
(hmiIoTest.StatusIn.diStatusEintrittTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit7==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit6==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusEintrittFeuchteMin=1);
}else{
(hmiIoTest.StatusIn.diStatusEintrittFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit7==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput01))->bit6==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusEintrittFeuchteMax=1);
}else{
(hmiIoTest.StatusIn.diStatusEintrittFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusAustrittTempMin=1);
}else{
(hmiIoTest.StatusIn.diStatusAustrittTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusAustrittTempMax=1);
}else{
(hmiIoTest.StatusIn.diStatusAustrittTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit3==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit2==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusAustrittFeuchteMin=1);
}else{
(hmiIoTest.StatusIn.diStatusAustrittFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit3==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit2==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusAustrittFeuchteMax=1);
}else{
(hmiIoTest.StatusIn.diStatusAustrittFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit5==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit4==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusNiederdruckMinMod2=1);
}else{
(hmiIoTest.StatusIn.diStatusNiederdruckMinMod2=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit5==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit4==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusNiederdruckMaxMod2=1);
}else{
(hmiIoTest.StatusIn.diStatusNiederdruckMaxMod2=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit7==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit6==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusHochdruckMinMod2=1);
}else{
(hmiIoTest.StatusIn.diStatusHochdruckMinMod2=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit7==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&aiModul04.StatusInput02))->bit6==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusHochdruckMaxMod2=1);
}else{
(hmiIoTest.StatusIn.diStatusHochdruckMaxMod2=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusLuftgeschwMin=1);
}else{
(hmiIoTest.StatusIn.diStatusLuftgeschwMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusLuftgeschwMax=1);
}else{
(hmiIoTest.StatusIn.diStatusLuftgeschwMax=0);
}
if((((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))|(((signed long)(signed long)(short)cmModul05.ai01>=(signed long)(signed long)(short)32767)))){
(hmiIoTest.StatusIn.diStatusLuftgeschwDrahtbruch=1);
}else{
(hmiIoTest.StatusIn.diStatusLuftgeschwDrahtbruch=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusFrischluftTempMin=1);
}else{
(hmiIoTest.StatusIn.diStatusFrischluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusFrischluftTempMax=1);
}else{
(hmiIoTest.StatusIn.diStatusFrischluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin=1);
}else{
(hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax=1);
}else{
(hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusTrockenluftTempMin=1);
}else{
(hmiIoTest.StatusIn.diStatusTrockenluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusTrockenluftTempMax=1);
}else{
(hmiIoTest.StatusIn.diStatusTrockenluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMin=1);
}else{
(hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMax=1);
}else{
(hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusAbluftTempMin=1);
}else{
(hmiIoTest.StatusIn.diStatusAbluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusAbluftTempMax=1);
}else{
(hmiIoTest.StatusIn.diStatusAbluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul12.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul12.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusAbluftFeuchteMin=1);
}else{
(hmiIoTest.StatusIn.diStatusAbluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul12.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul12.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusAbluftFeuchteMax=1);
}else{
(hmiIoTest.StatusIn.diStatusAbluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul13.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul13.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusDachluftTempMin=1);
}else{
(hmiIoTest.StatusIn.diStatusDachluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul13.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul13.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusDachluftTempMax=1);
}else{
(hmiIoTest.StatusIn.diStatusDachluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul14.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul14.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusDachluftFeuchteMin=1);
}else{
(hmiIoTest.StatusIn.diStatusDachluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul14.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul14.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusDachluftFeuchteMax=1);
}else{
(hmiIoTest.StatusIn.diStatusDachluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul15.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul15.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusDifferenzdruckMin=1);
}else{
(hmiIoTest.StatusIn.diStatusDifferenzdruckMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul15.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul15.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusDifferenzdruckMax=1);
}else{
(hmiIoTest.StatusIn.diStatusDifferenzdruckMax=0);
}


}






(loc_Erforderl_Mod1=1);
(loc_Erforderl_Mod2=1);
(loc_Erforderl_Mod3=1);
(loc_Erforderl_Mod4=1);
(loc_Erforderl_Mod5=1);
(loc_Erforderl_Mod6=gModul2Vorhanden);
(loc_Erforderl_Mod7=1);

(loc_Erforderl_Mod8=(Aktoren.VentUndKlappen.Boxenklappe1Vorhanden|Aktoren.VentUndKlappen.Boxenklappe2Vorhanden|Betriebsparameter.Ausstattung.SensorFrischluft|Betriebsparameter.Ausstattung.WarmluftofenTempVorgabe));
(loc_Erforderl_Mod9=(Betriebsparameter.Ausstattung.Ventilator2|Betriebsparameter.Ausstattung.SensorTrockenluft));

(loc_Erforderl_Mod10=(Betriebsparameter.Ausstattung.Warmluftofen|Betriebsparameter.Ausstattung.Scheitholzofen|Betriebsparameter.Ausstattung.Heizregister|Betriebsparameter.Ausstattung.SensorTrockenluft));

(loc_Erforderl_Mod11=(Aktoren.VentUndKlappen.Boxenklappe3Vorhanden|Aktoren.VentUndKlappen.Boxenklappe4Vorhanden|Betriebsparameter.Ausstattung.SensorAbluft));
(loc_Erforderl_Mod12=Betriebsparameter.Ausstattung.SensorAbluft);

(loc_Erforderl_Mod13=(Betriebsparameter.Ausstattung.Abluftventilator|Betriebsparameter.Ausstattung.Brandschutzklappe|Betriebsparameter.Ausstattung.SensorDachluft));
(loc_Erforderl_Mod14=(Betriebsparameter.Ausstattung.Abluftklappe|Betriebsparameter.Ausstattung.SensorDachluft));
(loc_Erforderl_Mod15=(Betriebsparameter.Ausstattung.Umschaltklappe1|Betriebsparameter.Ausstattung.Umschaltklappe2|Betriebsparameter.Ausstattung.SensorKanaldruck));
(loc_Erforderl_Mod16=Betriebsparameter.Ausstattung.Energiemessung);






(fbLascoFehl_0.FehlerIn=((loc_Erforderl_Mod1&(brModul01.ModulOk^1))|(loc_Erforderl_Mod2&(diModul02.ModulOk^1))|(loc_Erforderl_Mod3&(doModul03.ModulOk^1))|(loc_Erforderl_Mod4&(aiModul04.ModulOk^1))|(loc_Erforderl_Mod5&(cmModul05.ModulOk^1))|(loc_Erforderl_Mod6&(cmModul06.ModulOk^1))|(loc_Erforderl_Mod7&(cmModul07.ModulOk^1))|(loc_Erforderl_Mod8&(cmModul08.ModulOk^1))|(loc_Erforderl_Mod9&(cmModul09.ModulOk^1))|(loc_Erforderl_Mod10&(cmModul10.ModulOk^1))|(loc_Erforderl_Mod11&(cmModul11.ModulOk^1))|(loc_Erforderl_Mod12&(cmModul12.ModulOk^1))|(loc_Erforderl_Mod13&(cmModul13.ModulOk^1))|(loc_Erforderl_Mod14&(cmModul14.ModulOk^1))|(loc_Erforderl_Mod15&(cmModul15.ModulOk^1))|(loc_Erforderl_Mod16&(gEnergiemessungModulOk^1))));
(fbLascoFehl_0.VerzZeit=Betriebsparameter.Allgemein.VerzoegerungWarnungen);
(fbLascoFehl_0.Mode=2);
(fbLascoFehl_0.Quit=hmiButtons.QuitFehler);
(fbLascoFehl_0.Tick=sekTick);
fbLascoFehl(&fbLascoFehl_0);

(alarmSystem[CheckBounds(1,0,4)]=fbLascoFehl_0.FehlerOut);


}}
#line 1308 "C:/SharedFolder/CControl/Logical/IO/io407Plus/Main.nodebug"

void __AS__ImplInitMain_st(void){__BUR__ENTRY_INIT_FUNCT__();}

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
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/Types.typ\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/CControl.fun\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Temp/Includes/AS_TempDecl/4_07_Plus/GlobalComponents/MpComponents.var\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/Constants.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/IO/io407Plus/Types.typ\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/IO/io407Plus/Variables.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/io407Plus/Main.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/io407Plus/Main.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/IO/io407Plus/Main.st\\\"\\n\"");
__asm__(".previous");

__asm__(".section \".plciec\"");
__asm__(".ascii \"plcdata_const 'brModul01'\\n\"");
__asm__(".previous");
