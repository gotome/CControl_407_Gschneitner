#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/io407/Mainst.h"
#line 1 "C:/SharedFolder/CControl_Gschneitner/Logical/IO/io407/Main.nodebug"
#line 2 "C:/SharedFolder/CControl_Gschneitner/Logical/IO/io407/Main.st"
void __BUR__ENTRY_INIT_FUNCT__(void){{

(hmiStatus.NameSteuerung=0);

}}
#line 6 "C:/SharedFolder/CControl_Gschneitner/Logical/IO/io407/Main.nodebug"
#line 10 "C:/SharedFolder/CControl_Gschneitner/Logical/IO/io407/Main.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){{


(hmiParameter.Ausstattung.Entfeuchter=0);
(hmiParameter.Ausstattung.Bypassklappe=0);
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



(diVentilator1InBetrieb=cmModul02.di01);
(di24VDCinternIstOk=cmModul02.di02);



(cmModul02.do01=doVentilator1Ein);
(cmModul02.do02=doTrocknungInBetrieb);


if(sekTick){
(LCRMovAvgFlt_0.enable=1);;(LCRMovAvgFlt_0.x=cmModul02.ai01);;(LCRMovAvgFlt_0.base=Betriebsparameter.Sensoren.FilterzeitFrischluft);;LCRMovAvgFlt(&LCRMovAvgFlt_0);
}



(LCRLimScal_0.x=LCRMovAvgFlt_0.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.FrischlTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.FrischlTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiFrischluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetFrischluftTemp));



(LCRLimScal_0.x=aoDrehzahlvorgVentilator1);;(LCRLimScal_0.x1=Betriebsparameter.Ventilator1.DrehzahlMin);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Ventilator1.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul02.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(diBox1Offen=cmModul03.di01);
(diBox1Geschl=cmModul03.di02);
(diBox2Offen=cmModul03.di03);
(diBox2Geschl=cmModul03.di04);

(cmModul03.do01=doFreigabeBox1);
(cmModul03.do02=doFreigabeBox2);


if(sekTick){
(LCRMovAvgFlt_1.enable=1);;(LCRMovAvgFlt_1.x=cmModul03.ai01);;(LCRMovAvgFlt_1.base=Betriebsparameter.Sensoren.FilterzeitFrischluft);;LCRMovAvgFlt(&LCRMovAvgFlt_1);
}



(LCRLimScal_0.x=LCRMovAvgFlt_1.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.FrischlFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiFrischluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetFrischluftFeuchte));



(LCRLimScal_0.x=aoTemperaturvorgWarmluftofen);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=100);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul03.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(diVentilator2InBetrieb=cmModul04.di01);
(diDrehzahlbegrVentilator1=cmModul04.di02);
(diDrehzahlbegrVentilator2=cmModul04.di03);


(cmModul04.do01=doTrocknungStoerung);
(cmModul04.do02=doVentilator2Ein);


if(sekTick){
(LCRMovAvgFlt_2.enable=1);;(LCRMovAvgFlt_2.x=cmModul04.ai01);;(LCRMovAvgFlt_2.base=Betriebsparameter.Sensoren.FilterzeitTrockenluft);;LCRMovAvgFlt(&LCRMovAvgFlt_2);
}



(LCRLimScal_0.x=LCRMovAvgFlt_2.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.TrockenlTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.TrockenlTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiTrockenluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetTrockenluftTemp));



(LCRLimScal_0.x=aoDrehzahlvorgVentilator2);;(LCRLimScal_0.x1=Betriebsparameter.Ventilator2.DrehzahlMin);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Ventilator2.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul04.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));





(diWarmluftofenInBetrieb=cmModul05.di01);
(diScheitholzofenInBetrieb=cmModul05.di02);
(diHeizregisterFrostschutz=cmModul05.di03);


(cmModul05.do01=doWarmluftofenEin);
(cmModul05.do02=doHeizregisterEin);


if(sekTick){
(LCRMovAvgFlt_3.enable=1);;(LCRMovAvgFlt_3.x=cmModul05.ai01);;(LCRMovAvgFlt_3.base=Betriebsparameter.Sensoren.FilterzeitTrockenluft);;LCRMovAvgFlt(&LCRMovAvgFlt_3);
}



(LCRLimScal_0.x=LCRMovAvgFlt_3.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.TrockenlFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.TrockenlFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiTrockenluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetTrockenluftFeuchte));


(LCRLimScal_0.x=aoLeistungsvorgHeizregister);;(LCRLimScal_0.x1=(0.00000000000000000000E+00));;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=(1.00000000000000000000E+02));;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul05.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));





(diBox3Offen=cmModul06.di01);
(diBox3Geschl=cmModul06.di02);
(diBox4Offen=cmModul06.di03);
(diBox4Geschl=cmModul06.di04);

(cmModul06.do01=doFreigabeBox3);
(cmModul06.do02=doFreigabeBox4);


if(sekTick){
(LCRMovAvgFlt_4.enable=1);;(LCRMovAvgFlt_4.x=cmModul06.ai01);;(LCRMovAvgFlt_4.base=Betriebsparameter.Sensoren.FilterzeitAbluft);;LCRMovAvgFlt(&LCRMovAvgFlt_4);
}



(LCRLimScal_0.x=LCRMovAvgFlt_4.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.AbluftTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.AbluftTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiAbluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetAbluftTemp));


(cmModul06.ao01=0);





(diBox5Offen=cmModul07.di01);
(diBox5Geschl=cmModul07.di02);
(diBox6Offen=cmModul07.di03);
(diBox6Geschl=cmModul07.di04);

(cmModul07.do01=doFreigabeBox5);
(cmModul07.do02=doFreigabeBox6);


if(sekTick){
(LCRMovAvgFlt_5.enable=1);;(LCRMovAvgFlt_5.x=cmModul07.ai01);;(LCRMovAvgFlt_5.base=Betriebsparameter.Sensoren.FilterzeitAbluft);;LCRMovAvgFlt(&LCRMovAvgFlt_5);
}



(LCRLimScal_0.x=LCRMovAvgFlt_5.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.AbluftFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.AbluftFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiAbluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetAbluftFeuchte));


(cmModul07.ao01=0);





(diAbluftventInBetrieb=cmModul08.di01);




(cmModul08.do01=doBrandschutzklappeAuf);
(cmModul08.do02=doAbluftventilatorEin);


if(sekTick){
(LCRMovAvgFlt_6.enable=1);;(LCRMovAvgFlt_6.x=cmModul08.ai01);;(LCRMovAvgFlt_6.base=Betriebsparameter.Sensoren.FilterzeitDachluft);;LCRMovAvgFlt(&LCRMovAvgFlt_6);
}



(LCRLimScal_0.x=LCRMovAvgFlt_6.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.DachTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.DachTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiDachluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetDachTemp));



(LCRLimScal_0.x=aoDrehzahlvorgAbluftventilator);;(LCRLimScal_0.x1=Betriebsparameter.Abluftventilator.DrehzahlMin);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Abluftventilator.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul08.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(diAbluftklappeOffen=cmModul09.di01);
(diAbluftklappeGeschl=cmModul09.di02);



(cmModul09.do01=doAbluftklappeFreigabe);
(cmModul09.do02=0);


if(sekTick){
(LCRMovAvgFlt_7.enable=1);;(LCRMovAvgFlt_7.x=cmModul09.ai01);;(LCRMovAvgFlt_7.base=Betriebsparameter.Sensoren.FilterzeitDachluft);;LCRMovAvgFlt(&LCRMovAvgFlt_7);
}



(LCRLimScal_0.x=LCRMovAvgFlt_7.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.DachFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.DachFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiDachluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetDachFeuchte));


(cmModul09.ao01=0);




(diUmschaltklappe1Offen=cmModul10.di01);
(diUmschaltklappe1Geschl=cmModul10.di02);
(diUmschaltklappe2Offen=cmModul10.di03);
(diUmschaltklappe2Geschl=cmModul10.di04);

(cmModul10.do01=doUmluftklappe1Freigabe);
(cmModul10.do02=doUmluftklappe2Freigabe);


if(sekTick){
(LCRMovAvgFlt_8.enable=1);;(LCRMovAvgFlt_8.x=cmModul10.ai01);;(LCRMovAvgFlt_8.base=Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);;LCRMovAvgFlt(&LCRMovAvgFlt_8);
}



(LCRLimScal_0.x=LCRMovAvgFlt_8.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.LuftgeschwMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.LuftgeschwMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiLuftgeschwindigkeit=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetLuftgeschw));


(cmModul10.ao01=0);




(diNotstromaggregatInBetrieb=cmModul11.di01);




(cmModul11.do01=doNotstromaggregatEin);
(cmModul11.do02=0);


if(sekTick){
(LCRMovAvgFlt_9.enable=1);;(LCRMovAvgFlt_9.x=cmModul11.ai01);;(LCRMovAvgFlt_9.base=Betriebsparameter.Sensoren.FilterzeitKanaldruck);;LCRMovAvgFlt(&LCRMovAvgFlt_9);
}



(LCRLimScal_0.x=LCRMovAvgFlt_9.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.KanaldruckMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.KanaldruckMessberMax);;LCRLimScal(&LCRLimScal_0);
(aiDifferenzdruck=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetKanaldruck));


(cmModul11.ao01=0);







if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul02.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul02.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusFrischluftTempMin=1);
}else{
(diStatusFrischluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul02.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul02.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusFrischluftTempMax=1);
}else{
(diStatusFrischluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul03.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul03.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusFrischluftFeuchteMin=1);
}else{
(diStatusFrischluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul03.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul03.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusFrischluftFeuchteMax=1);
}else{
(diStatusFrischluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul04.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul04.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusTrockenluftTempMin=1);
}else{
(diStatusTrockenluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul04.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul04.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusTrockenluftTempMax=1);
}else{
(diStatusTrockenluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusTrockenluftFeuchteMin=1);
}else{
(diStatusTrockenluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusTrockenluftFeuchteMax=1);
}else{
(diStatusTrockenluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul06.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul06.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusAbluftTempMin=1);
}else{
(diStatusAbluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul06.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul06.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusAbluftTempMax=1);
}else{
(diStatusAbluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusAbluftFeuchteMin=1);
}else{
(diStatusAbluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusAbluftFeuchteMax=1);
}else{
(diStatusAbluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusDachluftTempMin=1);
}else{
(diStatusDachluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusDachluftTempMax=1);
}else{
(diStatusDachluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusDachluftFeuchteMin=1);
}else{
(diStatusDachluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusDachluftFeuchteMax=1);
}else{
(diStatusDachluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusLuftgeschwMin=1);
}else{
(diStatusLuftgeschwMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(diStatusLuftgeschwMax=1);
}else{
(diStatusLuftgeschwMax=0);
}
if((((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))|(((signed long)(signed long)(short)cmModul10.ai01>=(signed long)(signed long)(short)32767)))){
(diStatusLuftgeschwDrahtbruch=1);
}else{
(diStatusLuftgeschwDrahtbruch=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(diStatusDifferenzdruckMin=1);
}else{
(diStatusDifferenzdruckMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
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

(hmiIoTest.AnalogOut.aoDrehzahlvorgAbluftventilator=(0.00000000000000000000E+00));
(hmiIoTest.AnalogOut.aoDrehzahlvorgKompressorModul1=(0.00000000000000000000E+00));
(hmiIoTest.AnalogOut.aoDrehzahlvorgKompressorModul2=(0.00000000000000000000E+00));
(hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator1=(0.00000000000000000000E+00));
(hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator2=(0.00000000000000000000E+00));
(hmiIoTest.AnalogOut.aoLeistungsvorgHeizregister=(0.00000000000000000000E+00));
(hmiIoTest.AnalogOut.aoTemperaturvorgWarmluftofen=(0.00000000000000000000E+00));





}else{







(hmiIoTest.DigitalIn.diVentilator1InBetrieb=cmModul02.di01);
(hmiIoTest.DigitalIn.di24VDCinternIstOk=cmModul02.di02);



(cmModul02.do01=hmiIoTest.DigitalOut.doVentilator1Ein);
(cmModul02.do02=hmiIoTest.DigitalOut.doTrocknungInBetrieb);


if(sekTick){
(LCRMovAvgFlt_0.enable=1);;(LCRMovAvgFlt_0.x=cmModul02.ai01);;(LCRMovAvgFlt_0.base=Betriebsparameter.Sensoren.FilterzeitFrischluft);;LCRMovAvgFlt(&LCRMovAvgFlt_0);
}



(LCRLimScal_0.x=LCRMovAvgFlt_0.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.FrischlTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.FrischlTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiFrischluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetFrischluftTemp));



(LCRLimScal_0.x=hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator1);;(LCRLimScal_0.x1=Betriebsparameter.Ventilator1.DrehzahlMin);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Ventilator1.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul02.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(hmiIoTest.DigitalIn.diBox1Offen=cmModul03.di01);
(hmiIoTest.DigitalIn.diBox1Geschl=cmModul03.di02);
(hmiIoTest.DigitalIn.diBox2Offen=cmModul03.di03);
(hmiIoTest.DigitalIn.diBox2Geschl=cmModul03.di04);

(cmModul03.do01=hmiIoTest.DigitalOut.doFreigabeBox1);
(cmModul03.do02=hmiIoTest.DigitalOut.doFreigabeBox2);


if(sekTick){
(LCRMovAvgFlt_1.enable=1);;(LCRMovAvgFlt_1.x=cmModul03.ai01);;(LCRMovAvgFlt_1.base=Betriebsparameter.Sensoren.FilterzeitFrischluft);;LCRMovAvgFlt(&LCRMovAvgFlt_1);
}



(LCRLimScal_0.x=LCRMovAvgFlt_1.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.FrischlFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiFrischluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetFrischluftFeuchte));



(LCRLimScal_0.x=hmiIoTest.AnalogOut.aoTemperaturvorgWarmluftofen);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=100);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul03.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(hmiIoTest.DigitalIn.diVentilator2InBetrieb=cmModul04.di01);
(hmiIoTest.DigitalIn.diDrehzahlbegrVentilator1=cmModul04.di02);
(hmiIoTest.DigitalIn.diDrehzahlbegrVentilator2=cmModul04.di03);


(cmModul04.do01=hmiIoTest.DigitalOut.doTrocknungStoerung);
(cmModul04.do02=hmiIoTest.DigitalOut.doVentilator2Ein);


if(sekTick){
(LCRMovAvgFlt_2.enable=1);;(LCRMovAvgFlt_2.x=cmModul04.ai01);;(LCRMovAvgFlt_2.base=Betriebsparameter.Sensoren.FilterzeitTrockenluft);;LCRMovAvgFlt(&LCRMovAvgFlt_2);
}



(LCRLimScal_0.x=LCRMovAvgFlt_2.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.TrockenlTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.TrockenlTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiTrockenluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetTrockenluftTemp));



(LCRLimScal_0.x=hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator2);;(LCRLimScal_0.x1=Betriebsparameter.Ventilator2.DrehzahlMin);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Ventilator2.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul04.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));





(hmiIoTest.DigitalIn.diWarmluftofenInBetrieb=cmModul05.di01);
(hmiIoTest.DigitalIn.diScheitholzofenInBetrieb=cmModul05.di02);
(hmiIoTest.DigitalIn.diHeizregisterFrostschutz=cmModul05.di03);


(cmModul05.do01=hmiIoTest.DigitalOut.doWarmluftofenEin);
(cmModul05.do02=hmiIoTest.DigitalOut.doHeizregisterEin);


if(sekTick){
(LCRMovAvgFlt_3.enable=1);;(LCRMovAvgFlt_3.x=cmModul05.ai01);;(LCRMovAvgFlt_3.base=Betriebsparameter.Sensoren.FilterzeitTrockenluft);;LCRMovAvgFlt(&LCRMovAvgFlt_3);
}



(LCRLimScal_0.x=LCRMovAvgFlt_3.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.TrockenlFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.TrockenlFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiTrockenluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetTrockenluftFeuchte));


(LCRLimScal_0.x=hmiIoTest.AnalogOut.aoLeistungsvorgHeizregister);;(LCRLimScal_0.x1=(0.00000000000000000000E+00));;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=(1.00000000000000000000E+02));;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul05.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));





(hmiIoTest.DigitalIn.diBox3Offen=cmModul06.di01);
(hmiIoTest.DigitalIn.diBox3Geschl=cmModul06.di02);
(hmiIoTest.DigitalIn.diBox4Offen=cmModul06.di03);
(hmiIoTest.DigitalIn.diBox4Geschl=cmModul06.di04);

(cmModul06.do01=hmiIoTest.DigitalOut.doFreigabeBox3);
(cmModul06.do02=hmiIoTest.DigitalOut.doFreigabeBox4);


if(sekTick){
(LCRMovAvgFlt_4.enable=1);;(LCRMovAvgFlt_4.x=cmModul06.ai01);;(LCRMovAvgFlt_4.base=Betriebsparameter.Sensoren.FilterzeitAbluft);;LCRMovAvgFlt(&LCRMovAvgFlt_4);
}



(LCRLimScal_0.x=LCRMovAvgFlt_4.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.AbluftTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.AbluftTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiAbluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetAbluftTemp));


(cmModul06.ao01=0);





(hmiIoTest.DigitalIn.diBox5Offen=cmModul07.di01);
(hmiIoTest.DigitalIn.diBox5Geschl=cmModul07.di02);
(hmiIoTest.DigitalIn.diBox6Offen=cmModul07.di03);
(hmiIoTest.DigitalIn.diBox6Geschl=cmModul07.di04);

(cmModul07.do01=hmiIoTest.DigitalOut.doFreigabeBox5);
(cmModul07.do02=hmiIoTest.DigitalOut.doFreigabeBox6);


if(sekTick){
(LCRMovAvgFlt_5.enable=1);;(LCRMovAvgFlt_5.x=cmModul07.ai01);;(LCRMovAvgFlt_5.base=Betriebsparameter.Sensoren.FilterzeitAbluft);;LCRMovAvgFlt(&LCRMovAvgFlt_5);
}



(LCRLimScal_0.x=LCRMovAvgFlt_5.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.AbluftFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.AbluftFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiAbluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetAbluftFeuchte));


(cmModul07.ao01=0);





(hmiIoTest.DigitalIn.diAbluftventInBetrieb=cmModul08.di01);




(cmModul08.do01=hmiIoTest.DigitalOut.doBrandschutzklappeAuf);
(cmModul08.do02=hmiIoTest.DigitalOut.doAbluftventilatorEin);


if(sekTick){
(LCRMovAvgFlt_6.enable=1);;(LCRMovAvgFlt_6.x=cmModul08.ai01);;(LCRMovAvgFlt_6.base=Betriebsparameter.Sensoren.FilterzeitDachluft);;LCRMovAvgFlt(&LCRMovAvgFlt_6);
}



(LCRLimScal_0.x=LCRMovAvgFlt_6.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.DachTempMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.DachTempMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiDachluftTemperatur=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetDachTemp));



(LCRLimScal_0.x=hmiIoTest.AnalogOut.aoDrehzahlvorgAbluftventilator);;(LCRLimScal_0.x1=Betriebsparameter.Abluftventilator.DrehzahlMin);;(LCRLimScal_0.y1=0);;(LCRLimScal_0.x2=Betriebsparameter.Abluftventilator.DrehzahlMax);;(LCRLimScal_0.y2=32767);;LCRLimScal(&LCRLimScal_0);
(cmModul08.ao01=(signed short)(LCRLimScal_0.y>=0.0?LCRLimScal_0.y+0.5:LCRLimScal_0.y-0.5));




(hmiIoTest.DigitalIn.diAbluftklappeOffen=cmModul09.di01);
(hmiIoTest.DigitalIn.diAbluftklappeGeschl=cmModul09.di02);



(cmModul09.do01=hmiIoTest.DigitalOut.doAbluftklappeFreigabe);
(cmModul09.do02=0);


if(sekTick){
(LCRMovAvgFlt_7.enable=1);;(LCRMovAvgFlt_7.x=cmModul09.ai01);;(LCRMovAvgFlt_7.base=Betriebsparameter.Sensoren.FilterzeitDachluft);;LCRMovAvgFlt(&LCRMovAvgFlt_7);
}



(LCRLimScal_0.x=LCRMovAvgFlt_7.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.DachFeuchteMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.DachFeuchteMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiDachluftFeuchte=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetDachFeuchte));


(cmModul09.ao01=0);




(hmiIoTest.DigitalIn.diUmschaltklappe1Offen=cmModul10.di01);
(hmiIoTest.DigitalIn.diUmschaltklappe1Geschl=cmModul10.di02);
(hmiIoTest.DigitalIn.diUmschaltklappe2Offen=cmModul10.di03);
(hmiIoTest.DigitalIn.diUmschaltklappe2Geschl=cmModul10.di04);

(cmModul10.do01=hmiIoTest.DigitalOut.doUmluftklappe1Freigabe);
(cmModul10.do02=hmiIoTest.DigitalOut.doUmluftklappe2Freigabe);


if(sekTick){
(LCRMovAvgFlt_8.enable=1);;(LCRMovAvgFlt_8.x=cmModul10.ai01);;(LCRMovAvgFlt_8.base=Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);;LCRMovAvgFlt(&LCRMovAvgFlt_8);
}



(LCRLimScal_0.x=LCRMovAvgFlt_8.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.LuftgeschwMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.LuftgeschwMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiLuftgeschwindigkeit=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetLuftgeschw));


(cmModul10.ao01=0);




(hmiIoTest.DigitalIn.diNotstromaggregatInBetrieb=cmModul11.di01);




(cmModul11.do01=hmiIoTest.DigitalOut.doNotstromaggregatEin);
(cmModul11.do02=0);


if(sekTick){
(LCRMovAvgFlt_9.enable=1);;(LCRMovAvgFlt_9.x=cmModul11.ai01);;(LCRMovAvgFlt_9.base=Betriebsparameter.Sensoren.FilterzeitKanaldruck);;LCRMovAvgFlt(&LCRMovAvgFlt_9);
}



(LCRLimScal_0.x=LCRMovAvgFlt_9.y);;(LCRLimScal_0.x1=0);;(LCRLimScal_0.y1=Betriebsparameter.Sensoren.KanaldruckMessberMin);;(LCRLimScal_0.x2=32767);;(LCRLimScal_0.y2=Betriebsparameter.Sensoren.KanaldruckMessberMax);;LCRLimScal(&LCRLimScal_0);
(hmiIoTest.AnalogIn.aiDifferenzdruck=(LCRLimScal_0.y+Betriebsparameter.Sensoren.OffsetKanaldruck));


(cmModul11.ao01=0);







if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul02.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul02.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusFrischluftTempMin=1);
}else{
(diStatusFrischluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul02.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul02.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusFrischluftTempMax=1);
}else{
(hmiIoTest.StatusIn.diStatusFrischluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul03.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul03.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin=1);
}else{
(hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul03.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul03.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax=1);
}else{
(hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul04.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul04.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusTrockenluftTempMin=1);
}else{
(hmiIoTest.StatusIn.diStatusTrockenluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul04.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul04.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusTrockenluftTempMax=1);
}else{
(hmiIoTest.StatusIn.diStatusTrockenluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMin=1);
}else{
(hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul05.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMax=1);
}else{
(hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul06.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul06.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusAbluftTempMin=1);
}else{
(hmiIoTest.StatusIn.diStatusAbluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul06.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul06.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusAbluftTempMax=1);
}else{
(hmiIoTest.StatusIn.diStatusAbluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusAbluftFeuchteMin=1);
}else{
(hmiIoTest.StatusIn.diStatusAbluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul07.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusAbluftFeuchteMax=1);
}else{
(hmiIoTest.StatusIn.diStatusAbluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusDachluftTempMin=1);
}else{
(hmiIoTest.StatusIn.diStatusDachluftTempMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul08.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusDachluftTempMax=1);
}else{
(hmiIoTest.StatusIn.diStatusDachluftTempMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusDachluftFeuchteMin=1);
}else{
(hmiIoTest.StatusIn.diStatusDachluftFeuchteMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul09.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusDachluftFeuchteMax=1);
}else{
(hmiIoTest.StatusIn.diStatusDachluftFeuchteMax=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusLuftgeschwMin=1);
}else{
(hmiIoTest.StatusIn.diStatusLuftgeschwMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusLuftgeschwMax=1);
}else{
(hmiIoTest.StatusIn.diStatusLuftgeschwMax=0);
}
if((((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul10.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))|(((signed long)(signed long)(short)cmModul10.ai01>=(signed long)(signed long)(short)32767)))){
(hmiIoTest.StatusIn.diStatusLuftgeschwDrahtbruch=1);
}else{
(hmiIoTest.StatusIn.diStatusLuftgeschwDrahtbruch=0);
}


if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit1==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit0==(unsigned long)(unsigned char)1)))){
(hmiIoTest.StatusIn.diStatusDifferenzdruckMin=1);
}else{
(hmiIoTest.StatusIn.diStatusDifferenzdruckMin=0);
}
if(((((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit1==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)((_1byte_bit_field_*)(&cmModul11.StatusInput01))->bit0==(unsigned long)(unsigned char)0)))){
(hmiIoTest.StatusIn.diStatusDifferenzdruckMax=1);
}else{
(hmiIoTest.StatusIn.diStatusDifferenzdruckMax=0);
}


}






(loc_Erforderl_Mod1=1);
(loc_Erforderl_Mod2=1);

(loc_Erforderl_Mod3=(Aktoren.VentUndKlappen.Boxenklappe1Vorhanden|Aktoren.VentUndKlappen.Boxenklappe2Vorhanden|Betriebsparameter.Ausstattung.SensorFrischluft|Betriebsparameter.Ausstattung.WarmluftofenTempVorgabe));
(loc_Erforderl_Mod4=1);

(loc_Erforderl_Mod5=(Betriebsparameter.Ausstattung.Warmluftofen|Betriebsparameter.Ausstattung.Scheitholzofen|Betriebsparameter.Ausstattung.Heizregister|Betriebsparameter.Ausstattung.SensorTrockenluft));
(loc_Erforderl_Mod6=(Aktoren.VentUndKlappen.Boxenklappe3Vorhanden|Aktoren.VentUndKlappen.Boxenklappe4Vorhanden|Betriebsparameter.Ausstattung.SensorAbluft));
(loc_Erforderl_Mod7=Betriebsparameter.Ausstattung.SensorAbluft);
(loc_Erforderl_Mod8=(Betriebsparameter.Ausstattung.Abluftventilator|Betriebsparameter.Ausstattung.Brandschutzklappe|Betriebsparameter.Ausstattung.SensorDachluft));
(loc_Erforderl_Mod9=(Betriebsparameter.Ausstattung.Abluftklappe|Betriebsparameter.Ausstattung.SensorDachluft));

(loc_Erforderl_Mod10=(Betriebsparameter.Ausstattung.Umschaltklappe1|Betriebsparameter.Ausstattung.Umschaltklappe2|Betriebsparameter.Ausstattung.SensorLuftgeschwindigkeit));
(loc_Erforderl_Mod11=(Betriebsparameter.Ausstattung.Notstromaggregat|Betriebsparameter.Ausstattung.SensorKanaldruck));
(loc_Erforderl_Mod12=Betriebsparameter.Ausstattung.Energiemessung);






(fbLascoFehl_0.FehlerIn=((loc_Erforderl_Mod1&(brModul01.ModulOk^1))|(loc_Erforderl_Mod2&(cmModul02.ModulOk^1))|(loc_Erforderl_Mod3&(cmModul03.ModulOk^1))|(loc_Erforderl_Mod4&(cmModul04.ModulOk^1))|(loc_Erforderl_Mod5&(cmModul05.ModulOk^1))|(loc_Erforderl_Mod6&(cmModul06.ModulOk^1))|(loc_Erforderl_Mod7&(cmModul07.ModulOk^1))|(loc_Erforderl_Mod8&(cmModul08.ModulOk^1))|(loc_Erforderl_Mod9&(cmModul09.ModulOk^1))|(loc_Erforderl_Mod10&(cmModul10.ModulOk^1))|(loc_Erforderl_Mod11&(cmModul11.ModulOk^1))|(loc_Erforderl_Mod12&(gEnergiemessungModulOk^1))));
(fbLascoFehl_0.Mode=2);
(fbLascoFehl_0.Quit=hmiButtons.QuitFehler);
(fbLascoFehl_0.Tick=sekTick);
fbLascoFehl(&fbLascoFehl_0);

(alarmSystem[CheckBounds(1,0,4)]=fbLascoFehl_0.FehlerOut);



}}
#line 889 "C:/SharedFolder/CControl_Gschneitner/Logical/IO/io407/Main.nodebug"
#line 895 "C:/SharedFolder/CControl_Gschneitner/Logical/IO/io407/Main.st"
void _EXIT __BUR__ENTRY_EXIT_FUNCT__(void){{


}}
#line 898 "C:/SharedFolder/CControl_Gschneitner/Logical/IO/io407/Main.nodebug"

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
__asm__(".ascii \"iecfile \\\"Logical/IO/io407/Types.typ\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/IO/io407/Variables.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/io407/Main.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/io407/Main.st.c\\\" \\\"C:/SharedFolder/CControl_Gschneitner/Logical/IO/io407/Main.st\\\"\\n\"");
__asm__(".previous");

__asm__(".section \".plciec\"");
__asm__(".ascii \"plcdata_const 'brModul01'\\n\"");
__asm__(".previous");
