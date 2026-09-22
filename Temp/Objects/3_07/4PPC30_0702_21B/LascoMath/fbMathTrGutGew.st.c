#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/LascoMath/fbMathTrGutGewst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Libraries/LascoMath/fbMathTrGutGew.nodebug"
#line 13 "C:/SharedFolder/CControl/Logical/Libraries/LascoMath/fbMathTrGutGew.st"
void fbMathTrGutGew(struct fbMathTrGutGew* inst){struct fbMathTrGutGew* __inst__=inst;{

if((((unsigned long)(unsigned char)__inst__->Freigabe==(unsigned long)(unsigned char)1))){


if((((unsigned long)(unsigned char)__inst__->Anlagentyp==(unsigned long)(unsigned char)0))){






if(((((unsigned long)(unsigned char)__inst__->Trocknungsgut==(unsigned long)(unsigned char)0))&((__inst__->FeuchteBeiStart!=0))&((__inst__->FeuchteBeiStart<100)))){
(__inst__->TrockengutSpezGewicht=((((((2.37000007182359695435E-02)*__inst__->FeuchteBeiStart)*__inst__->FeuchteBeiStart)-((3.95000010728836059570E-01)*__inst__->FeuchteBeiStart))+(6.05000000000000000000E+01))*(1.10000002384185791016E+00)));

}else if(((((unsigned long)(unsigned char)__inst__->Trocknungsgut==(unsigned long)(unsigned char)1))&((__inst__->FeuchteBeiStart!=0))&((__inst__->FeuchteBeiStart<100)))){
(__inst__->TrockengutSpezGewicht=(((((3.13000008463859558105E-02)*__inst__->FeuchteBeiStart)*__inst__->FeuchteBeiStart)+((1.22449994087219238281E+00)*__inst__->FeuchteBeiStart))+(1.51320007324218750000E+02)));

}else if(((((unsigned long)(unsigned char)__inst__->Trocknungsgut==(unsigned long)(unsigned char)2))&((__inst__->FeuchteBeiStart!=0))&((__inst__->FeuchteBeiStart<100)))){
(__inst__->TrockengutSpezGewicht=(((((4.61999997496604919434E-02)*__inst__->FeuchteBeiStart)*__inst__->FeuchteBeiStart)+((1.78830003738403320313E+00)*__inst__->FeuchteBeiStart))+(2.22470001220703125000E+02)));

}else if(((((unsigned long)(unsigned char)__inst__->Trocknungsgut==(unsigned long)(unsigned char)3))&((__inst__->FeuchteBeiStart!=0))&((__inst__->FeuchteBeiStart<100)))){
(__inst__->TrockengutSpezGewicht=(730+(476*(__inst__->FeuchteBeiStart/CheckDivReal((100-__inst__->FeuchteBeiStart))))));

}else if(((((unsigned long)(unsigned char)__inst__->Trocknungsgut==(unsigned long)(unsigned char)4))&((__inst__->FeuchteBeiStart!=0))&((__inst__->FeuchteBeiStart<100)))){
(__inst__->TrockengutSpezGewicht=(680+(476*(__inst__->FeuchteBeiStart/CheckDivReal((100-__inst__->FeuchteBeiStart))))));
}else if(((((unsigned long)(unsigned char)__inst__->Trocknungsgut==(unsigned long)(unsigned char)5))&((__inst__->SpezGewichtUser!=0))&((__inst__->FeuchteBeiStart!=0))&((__inst__->FeuchteBeiStart<100)))){
(__inst__->TrockengutSpezGewicht=((__inst__->SpezGewichtUser-476)+(476*(__inst__->FeuchteBeiStart/CheckDivReal((100-__inst__->FeuchteBeiStart))))));
}else{
(__inst__->TrockengutSpezGewicht=(9.99999900000000000000E+06));
}





if((((__inst__->TrockengutSpezGewicht!=0))&((__inst__->TrockengutSpezGewicht<(9.99999900000000000000E+06)))&((__inst__->FuellhoeheTrockengut>0))&((__inst__->Boxenflaeche>0)))){
(__inst__->TrockengutGewichtStart=((__inst__->Boxenflaeche*__inst__->FuellhoeheTrockengut)*__inst__->TrockengutSpezGewicht));
}else{
(__inst__->TrockengutGewichtStart=0);
}



}else{



if((((__inst__->GewichtProBallen>0))&((__inst__->AnzahlBallen>0)))){
(__inst__->TrockengutGewichtStart=(__inst__->GewichtProBallen*__inst__->AnzahlBallen));
}else{
(__inst__->TrockengutGewichtStart=0);
}

}




if((((__inst__->TrockengutGewichtStart!=0))&((__inst__->FeuchteBeiStart>0)))){
(__inst__->TrockengutGewichtSubstanz=(__inst__->TrockengutGewichtStart-((__inst__->TrockengutGewichtStart*__inst__->FeuchteBeiStart)/CheckDivReal(100))));
}else{
(__inst__->TrockengutGewichtSubstanz=0);
}

if(((__inst__->TrockengutGewichtSubstanz<0))){
(__inst__->TrockengutGewichtSubstanz=0);
}




if((((__inst__->TrockengutGewichtSubstanz!=0))&((__inst__->FeuchteEnde>0)))){
(__inst__->loc_TrockengutGewichtEnde=((100-__inst__->FeuchteEnde)/CheckDivReal(100)));
if(((__inst__->loc_TrockengutGewichtEnde!=0))){
(__inst__->TrockengutGewichtEnde=(__inst__->TrockengutGewichtSubstanz/CheckDivReal(__inst__->loc_TrockengutGewichtEnde)));
}else{
(__inst__->TrockengutGewichtEnde=0);
}
}else{
(__inst__->TrockengutGewichtEnde=0);
}

if(((__inst__->TrockengutGewichtEnde<0))){
(__inst__->TrockengutGewichtEnde=0);
}




if((((__inst__->TrockengutGewichtStart>0))&((__inst__->TrockengutGewichtEnde>0)))){
(__inst__->TrockengutWasserentzug=(__inst__->TrockengutGewichtStart-__inst__->TrockengutGewichtEnde));
}else{
(__inst__->TrockengutWasserentzug=0);
}




if((__inst__->VentilatorInBetrieb&((__inst__->WasserentzugProStunde<(9.99999900000000000000E+06)))&__inst__->sekTick)){
(CheckWriteAccess(__inst__->WasserentzugSeitStart),(*(__inst__->WasserentzugSeitStart))=((CheckReadAccess(__inst__->WasserentzugSeitStart),(*(__inst__->WasserentzugSeitStart)))+(__inst__->WasserentzugProStunde/CheckDivReal(3600))));
}




(__inst__->TrockengutGewichtAktuell=(__inst__->TrockengutGewichtStart-(CheckReadAccess(__inst__->WasserentzugSeitStart),(*(__inst__->WasserentzugSeitStart)))));




(__inst__->RestgewichtWasser=(__inst__->TrockengutWasserentzug-(CheckReadAccess(__inst__->WasserentzugSeitStart),(*(__inst__->WasserentzugSeitStart)))));





if((__inst__->CmdKorrekturFeuchte&~__inst__->zzEdge00000&1?((__inst__->zzEdge00000=__inst__->CmdKorrekturFeuchte&1),1):((__inst__->zzEdge00000=__inst__->CmdKorrekturFeuchte&1),0))){
(__inst__->loc_cmdKorrekturFeuchte=1);
}


if(((__inst__->TrockengutGewichtEnde>0))){


if((((__inst__->FeuchteAktuell!=__inst__->KorrekturWertFeuchte))&(__inst__->loc_cmdKorrekturFeuchte&~__inst__->zzEdge00001&1?((__inst__->zzEdge00001=__inst__->loc_cmdKorrekturFeuchte&1),1):((__inst__->zzEdge00001=__inst__->loc_cmdKorrekturFeuchte&1),0)))){


(__inst__->temp2=(__inst__->FeuchteEnde-__inst__->FeuchteBeiStart));
if(((__inst__->temp2==0))){
(__inst__->temp2=(__inst__->temp2+(9.99999977648258209229E-03)));
}

(__inst__->temp1=(__inst__->TrockengutGewichtEnde-__inst__->TrockengutGewichtStart));
if(((__inst__->temp1==0))){
(__inst__->temp1=(__inst__->temp1+(9.99999977648258209229E-03)));
}


if((((__inst__->KorrekturWertFeuchte-__inst__->FeuchteBeiStart)==0))){
(__inst__->KorrekturWertFeuchte=(__inst__->KorrekturWertFeuchte+(9.99999977648258209229E-03)));
}



if(((__inst__->temp2!=0))){
(__inst__->TrockengutGewichtAktuell=(__inst__->TrockengutGewichtStart+(((__inst__->TrockengutGewichtEnde-__inst__->TrockengutGewichtStart)/CheckDivReal(__inst__->temp2))*(__inst__->KorrekturWertFeuchte-__inst__->FeuchteBeiStart))));
(CheckWriteAccess(__inst__->WasserentzugSeitStart),(*(__inst__->WasserentzugSeitStart))=(__inst__->TrockengutGewichtStart-__inst__->TrockengutGewichtAktuell));
}


if((((__inst__->TrockengutGewichtAktuell-__inst__->TrockengutGewichtStart)==0))){
(__inst__->TrockengutGewichtAktuell=(__inst__->TrockengutGewichtAktuell+(9.99999977648258209229E-03)));
}



if(((__inst__->temp1!=0))){
(__inst__->FeuchteAktuell=(__inst__->FeuchteBeiStart+(((__inst__->FeuchteEnde-__inst__->FeuchteBeiStart)/CheckDivReal(__inst__->temp1))*(__inst__->TrockengutGewichtAktuell-__inst__->TrockengutGewichtStart))));
}

(__inst__->loc_cmdKorrekturFeuchte=0);
(__inst__->KorrekturWertFeuchte=(0.00000000000000000000E+00));



}else if((((__inst__->FeuchteAktuell!=__inst__->KorrekturWertFeuchteRicht))&(__inst__->CmdKorrekturFeuchteRicht&~__inst__->zzEdge00002&1?((__inst__->zzEdge00002=__inst__->CmdKorrekturFeuchteRicht&1),1):((__inst__->zzEdge00002=__inst__->CmdKorrekturFeuchteRicht&1),0)))){


(__inst__->temp1=(__inst__->TrockengutGewichtEnde-__inst__->TrockengutGewichtStart));
if(((__inst__->temp1==0))){
(__inst__->temp1=(__inst__->temp1+(9.99999977648258209229E-03)));
}

(__inst__->temp2=(__inst__->FeuchteEnde-__inst__->FeuchteBeiStart));
if(((__inst__->temp2==0))){
(__inst__->temp2=(__inst__->temp2+(9.99999977648258209229E-03)));
}


if((((__inst__->KorrekturWertFeuchteRicht-__inst__->FeuchteBeiStart)==0))){
(__inst__->KorrekturWertFeuchteRicht=(__inst__->KorrekturWertFeuchteRicht+(9.99999977648258209229E-03)));
}


if(((__inst__->temp2!=0))){
(__inst__->TrockengutGewichtAktuell=(__inst__->TrockengutGewichtStart+(((__inst__->TrockengutGewichtEnde-__inst__->TrockengutGewichtStart)/CheckDivReal(__inst__->temp2))*(__inst__->KorrekturWertFeuchteRicht-__inst__->FeuchteBeiStart))));
(CheckWriteAccess(__inst__->WasserentzugSeitStart),(*(__inst__->WasserentzugSeitStart))=(__inst__->TrockengutGewichtStart-__inst__->TrockengutGewichtAktuell));
}


if((((__inst__->TrockengutGewichtAktuell-__inst__->TrockengutGewichtStart)==0))){
(__inst__->TrockengutGewichtAktuell=(__inst__->TrockengutGewichtAktuell+(9.99999977648258209229E-03)));
}


if(((__inst__->temp1!=0))){
(__inst__->FeuchteAktuell=(__inst__->FeuchteBeiStart+(((__inst__->FeuchteEnde-__inst__->FeuchteBeiStart)/CheckDivReal(__inst__->temp1))*(__inst__->TrockengutGewichtAktuell-__inst__->TrockengutGewichtStart))));
}

(__inst__->CmdKorrekturFeuchteRicht=0);
(__inst__->KorrekturWertFeuchteRicht=(0.00000000000000000000E+00));



}else if((((unsigned long)(unsigned char)__inst__->KeinStroemungsfuehler==(unsigned long)(unsigned char)0))){

(__inst__->temp1=(__inst__->TrockengutGewichtEnde-__inst__->TrockengutGewichtStart));
if(((__inst__->temp1==0))){
(__inst__->temp1=(__inst__->temp1+(9.99999977648258209229E-03)));
}


if((((__inst__->TrockengutGewichtAktuell-__inst__->TrockengutGewichtStart)==0))){
(__inst__->TrockengutGewichtAktuell=(__inst__->TrockengutGewichtAktuell+(9.99999977648258209229E-03)));
}

if(((__inst__->temp1!=0))){
(__inst__->FeuchteAktuell=(__inst__->FeuchteBeiStart+(((__inst__->FeuchteEnde-__inst__->FeuchteBeiStart)/CheckDivReal(__inst__->temp1))*(__inst__->TrockengutGewichtAktuell-__inst__->TrockengutGewichtStart))));
}
}
}else{
(__inst__->FeuchteAktuell=0);
}




if((__inst__->KeinStroemungsfuehler&__inst__->Automatikbetrieb&__inst__->Freigabe&__inst__->VentilatorInBetrieb)){

if(((__inst__->Freigabe&~__inst__->zzEdge00003&1?((__inst__->zzEdge00003=__inst__->Freigabe&1),1):((__inst__->zzEdge00003=__inst__->Freigabe&1),0))|((__inst__->FeuchteBeiStart!=__inst__->FeuchteBeiStartMEM)))){
(__inst__->firstInit=1);
(__inst__->FeuchteBeiStartMEM=__inst__->FeuchteBeiStart);
}


(__inst__->RichtzeitAktStufeStunden=(__inst__->RichtzeitAktStufeTage*24));


if(((__inst__->firstInit|__inst__->CmdKorrekturFeuchteRicht)&(((unsigned long)__inst__->RichtzeitAktStufeStunden!=(unsigned long)0)))){
(__inst__->TeilungFeuchteRicht=(__inst__->FeuchteAktuell/CheckDivUdint(__inst__->RichtzeitAktStufeStunden)));
(__inst__->firstInit=0);
(__inst__->CmdKorrekturFeuchteRicht=0);
}


if(__inst__->stdTick){
(__inst__->CmdKorrekturFeuchteRicht=1);
(__inst__->KorrekturWertFeuchteRicht=(__inst__->FeuchteAktuell-__inst__->TeilungFeuchteRicht));
}



}else if((__inst__->KeinStroemungsfuehler&__inst__->Freigabe)){


(__inst__->temp1=(__inst__->TrockengutGewichtEnde-__inst__->TrockengutGewichtStart));
if(((__inst__->temp1==0))){
(__inst__->temp1=(__inst__->temp1+(9.99999977648258209229E-03)));
}


if((((__inst__->TrockengutGewichtAktuell-__inst__->TrockengutGewichtStart)==0))){
(__inst__->TrockengutGewichtAktuell=(__inst__->TrockengutGewichtAktuell+(9.99999977648258209229E-03)));
}

if(((__inst__->temp1!=0))){
(__inst__->FeuchteAktuell=(__inst__->FeuchteBeiStart+(((__inst__->FeuchteEnde-__inst__->FeuchteBeiStart)/CheckDivReal(__inst__->temp1))*(__inst__->TrockengutGewichtAktuell-__inst__->TrockengutGewichtStart))));
}

}



}else{

(__inst__->TrockengutSpezGewicht=0);
(__inst__->TrockengutGewichtStart=0);
(__inst__->TrockengutGewichtEnde=0);
(__inst__->TrockengutGewichtSubstanz=0);
(__inst__->TrockengutWasserentzug=0);
(__inst__->TrockengutGewichtAktuell=0);
(CheckWriteAccess(__inst__->WasserentzugSeitStart),(*(__inst__->WasserentzugSeitStart))=0);
(__inst__->loc_TrockengutGewichtEnde=0);

}



}imp1_end0_0:;}
#line 302 "C:/SharedFolder/CControl/Logical/Libraries/LascoMath/fbMathTrGutGew.nodebug"

void __AS__ImplInitfbMathTrGutGew_st(void){}

__asm__(".section \".plc\"");
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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/LascoMath/fbMathTrGutGew.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/LascoMath/fbMathTrGutGew.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Libraries/LascoMath/fbMathTrGutGew.st\\\"\\n\"");
__asm__(".ascii \"iecdep \\\"Logical/Libraries/LascoMath/LascoMath.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"plcexport \\\"fbMathLuft\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbMathTrGutGew\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbMathTrLftMenge\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbMathTrLftDruck\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbMathWetter\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbMathMessblende\\\" FUB\\n\"");
__asm__(".previous");

__asm__(".section \".plciec\"");
__asm__(".ascii \"plcdata_const 'CONST_MATH_MAX_VALUE'\\n\"");
__asm__(".previous");
