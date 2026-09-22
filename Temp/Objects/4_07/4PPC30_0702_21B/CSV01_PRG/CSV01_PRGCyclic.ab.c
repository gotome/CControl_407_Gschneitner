#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/CSV01_PRG/CSV01_PRGCyclicab.h"
#line 1 "C:/SharedFolder/CControl_Gschneitner/Logical/CSV/CSV01_PRG/CSV01_PRGCyclic.nodebug"
#line 3 "C:/SharedFolder/CControl_Gschneitner/Logical/CSV/CSV01_PRG/CSV01_PRGCyclic.ab"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){

(RTC_gettime_Status=RTC_gettime(((unsigned long)(&CSV_Uhr))));
















(CSV01.IW.SWarnung=0);
(CSV01.IW.SWarnung_Nr=0);
for((i=0);i<=1;i++){
(P_Warnung=(((unsigned long)(&CSV01.WA))+i));
if((((unsigned long)(unsigned char)(CheckReadAccess(P_Warnung),(*(P_Warnung)))==(unsigned long)(unsigned char)1))){
(CSV01.IW.SWarnung=1);
(CSV01.IW.SWarnung_Nr=(unsigned char)i);
if((((unsigned long)(unsigned char)1==(unsigned long)(unsigned char)1)))break;
}
if(i>=1)break;}







(Fub0000100000.IN=InitOK);;(Fub0000100000.PT=300);;TON_10ms(&Fub0000100000);(M_InitOK=Fub0000100000.Q);(ET=Fub0000100000.ET);
if(((((unsigned long)(CSV01.SW.DATA_WRITE_T&M_InitOK)==(unsigned long)(unsigned char)1))&~Edge0000100000&1?((Edge0000100000=(((unsigned long)(CSV01.SW.DATA_WRITE_T&M_InitOK)==(unsigned long)(unsigned char)1))&1),1):((Edge0000100000=(((unsigned long)(CSV01.SW.DATA_WRITE_T&M_InitOK)==(unsigned long)(unsigned char)1))&1),0))){
if((((unsigned long)(unsigned char)CSV01.IW.DATA_WRITE_BEREIT==(unsigned long)(unsigned char)0))){
(CSV01.FE.Datensatz_Fehler=1);
}
}



if((((unsigned long)(unsigned short)DatObjInfo_01.status!=(unsigned long)(unsigned short)0))){
(CSV01.FE.DatObj_CFG=1);
}else{
(CSV01.FE.DatObj_CFG=0);
}



































if((((unsigned long)(unsigned short)CSV01.IW.RPS_DirCreate_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.RPS_DirCreate=1);
}else{
(CSV01.FE.RPS_DirCreate=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.RPS_FileCreate_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.RPS_FileCreate=1);
}else{
(CSV01.FE.RPS_FileCreate=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.RPS_FileOpen_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.RPS_FileOpen=1);
}else{
(CSV01.FE.RPS_FileOpen=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.RPS_FileWrite_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.RPS_FileWrite=1);
}else{
(CSV01.FE.RPS_FileWrite=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.RPS_FileRead_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.RPS_FileRead=1);
}else{
(CSV01.FE.RPS_FileRead=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.RPS_FileClose_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.RPS_FileClose=1);
}else{
(CSV01.FE.RPS_FileClose=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.RPS_MemInfo_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.RPS_MemInfo=1);
}else{
(CSV01.FE.RPS_MemInfo=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.RPS_DirInfo_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.RPS_DirInfo=1);
}else{
(CSV01.FE.RPS_DirInfo=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.RPS_DirRead_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.RPS_DirRead=1);
}else{
(CSV01.FE.RPS_DirRead=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.RPS_FileDelete_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.RPS_FileDelete=1);
}else{
(CSV01.FE.RPS_FileDelete=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.RPS_DirDeleteEx_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.RPS_DirDeleteEx=1);
}else{
(CSV01.FE.RPS_DirDeleteEx=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.PC_DevLink_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.PC_DevLink=1);
}else{
(CSV01.FE.PC_DevLink=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.PC_DirCreate_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.PC_DirCreate=1);
}else{
(CSV01.FE.PC_DirCreate=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.PC_FileCopy_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.PC_FileCopy=1);
}else{
(CSV01.FE.PC_FileCopy=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.PC_DirCopy_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.PC_DirCopy=1);
}else{
(CSV01.FE.PC_DirCopy=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.EXT_DirCreate_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.EXT_DirCreate=1);
}else{
(CSV01.FE.EXT_DirCreate=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.EXT_FileCopy_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.EXT_FileCopy=1);
}else{
(CSV01.FE.EXT_FileCopy=0);
}



if((((unsigned long)(unsigned short)CSV01.IW.EXT_DirCopy_FehlerNr!=(unsigned long)(unsigned short)0))){
(CSV01.FE.EXT_DirCopy=1);
}else{
(CSV01.FE.EXT_DirCopy=0);
}



(CSV01.IW.SFehler=0);
(CSV01.IW.SFehler_Nr=0);
for((i=0);i<=27;i++){
(P_Fehler=(((unsigned long)(&CSV01.FE))+i));
if((((unsigned long)(unsigned char)(CheckReadAccess(P_Fehler),(*(P_Fehler)))==(unsigned long)(unsigned char)1))){
(CSV01.IW.SFehler=1);
(CSV01.IW.SFehler_Nr=(unsigned char)i);
if((((unsigned long)(unsigned char)1==(unsigned long)(unsigned char)1)))break;
}
if(i>=27)break;}



if((((unsigned long)(unsigned char)CSV01.SW.F_Quitt_T==(unsigned long)(unsigned char)1))){
(CSV01.SW.F_Quitt_T=0);
__AS__MEMSET(((unsigned long)(&CSV01.FE)),0,28);
__AS__MEMSET(((unsigned long)(&CSV01.WA)),0,2);
(CSV01.IW.RPS_DirCreate_FehlerNr=0);
(CSV01.IW.RPS_FileCreate_FehlerNr=0);
(CSV01.IW.RPS_FileOpen_FehlerNr=0);
(CSV01.IW.RPS_FileWrite_FehlerNr=0);
(CSV01.IW.RPS_FileRead_FehlerNr=0);
(CSV01.IW.RPS_FileClose_FehlerNr=0);
(CSV01.IW.RPS_MemInfo_FehlerNr=0);
(CSV01.IW.RPS_DirInfo_FehlerNr=0);
(CSV01.IW.RPS_DirRead_FehlerNr=0);
(CSV01.IW.RPS_FileDelete_FehlerNr=0);
(CSV01.IW.RPS_DirCopy_FehlerNr=0);
(CSV01.IW.RPS_DirDeleteEx_FehlerNr=0);
(CSV01.IW.PC_DevLink_FehlerNr=0);
(CSV01.IW.PC_DirCreate_FehlerNr=0);
(CSV01.IW.PC_FileCopy_FehlerNr=0);
(CSV01.IW.DatObj_Tag_ID_ZeileNr=0);
(CSV01.IW.DatObj_Tag_Variable_ZeileNr=0);
(CSV01.IW.DatObj_Tag_Datentyp_ZeileNr=0);
(CSV01.IW.DatObj_Tag_MIN_ZeileNr=0);
(CSV01.IW.DatObj_Tag_MAX_ZeileNr=0);
}






if((((unsigned long)(unsigned char)CSV01.SW.Gruebl_Reporting_T==(unsigned long)(unsigned char)1))){
(CSV01.SW.Kopf_Version_T=1);
(CSV01.SW.Kopf_Anlagenname_T=1);
(CSV01.SW.Kopf_ID_T=1);
(CSV01.SW.Kopf_Bezeichnung_T=1);
(CSV01.SW.Kopf_Einheit_T=1);
(CSV01.SW.Kopf_Datentyp_T=1);
(CSV01.SW.Kopf_MIN_MAX_T=1);
(CSV01.SW.Zeitstempel_lang_T=1);
(CSV01.SW.Begrenzung_MINMAX_T=1);
}else if((((unsigned long)(unsigned char)CSV01.SW.QM_HeizW_T==(unsigned long)(unsigned char)1))){
(CSV01.SW.QM_HeizW_BetrJahr_Mon=3);
(CSV01.SW.Kopf_Version_T=1);
(CSV01.SW.Kopf_Anlagenname_T=1);
(CSV01.SW.Kopf_ID_T=0);
(CSV01.SW.Kopf_Bezeichnung_T=1);
(CSV01.SW.Kopf_Einheit_T=1);
(CSV01.SW.Kopf_Datentyp_T=0);
(CSV01.SW.Kopf_MIN_MAX_T=0);
(CSV01.SW.Zeitstempel_lang_T=0);
(CSV01.SW.Begrenzung_MINMAX_T=0);
}







if((((unsigned long)(CSV01.SW.KOPF_WRITE_T&CSV01.IW.RPS_DirRead_Start_OK)==(unsigned long)(unsigned char)1))){
(CSV01.SW.KOPF_WRITE_T=0);
(CSV01.IW.KOPF_WRITE=1);
}



if((((unsigned long)(CSV01.SW.DATA_WRITE_T&CSV01.IW.RPS_DirRead_Start_OK)==(unsigned long)(unsigned char)1))){
(CSV01.SW.DATA_WRITE_T=0);
(CSV01.IW.DATA_WRITE=1);
}



if((((unsigned long)(unsigned short)CSV01.IW.RPS_SAVE_STEP_Nr!=(unsigned long)(unsigned short)0))){
(CSV01.IW.Zyklus_t_akt=(CSV01.IW.Zyklus_t_akt+ZyklTime));
}else if((((unsigned long)CSV01.IW.Zyklus_t_akt>(unsigned long)0))){
(CSV01.IW.Zyklus_t_letzt=CSV01.IW.Zyklus_t_akt);
(CSV01.IW.Zyklus_t_akt=0);
}






(DatObjInfo_01.enable=1);
(DatObjInfo_01.pName=((unsigned long)(&DatObjInfo_01_Name)));
DatObjInfo(&DatObjInfo_01);

(DatObj1_Size=300);
(DatObj2_Size=176);

if(((((unsigned long)(unsigned short)DatObjInfo_01.status==(unsigned long)(unsigned short)0))&(((unsigned long)(DatObj2_Size==0?0:((unsigned long)((DatObjInfo_01.len-DatObj1_Size)))%((unsigned long)(CheckDivUdint(DatObj2_Size))))!=(unsigned long)0)))){
(CSV01.FE.DatObj_CFG_length=1);
(CSV01.IW.RPS_SAVE_STEP_Nr=0);
}





if(((((unsigned long)(unsigned short)DatObjInfo_01.status==(unsigned long)(unsigned short)0))&(((unsigned long)(unsigned char)CSV01.FE.DatObj_CFG_length==(unsigned long)(unsigned char)0))&(((unsigned long)DiffDT(DatObjInfo_01.ChangeDate,M_DatObj_ChangDate)>(unsigned long)0)))){
(M_DatObj_ChangDate=DatObjInfo_01.ChangeDate);
__AS__MEMCPY(((unsigned long)(&CSV_DatObj1)),DatObjInfo_01.pDatObjMem,300);
for((ii=19);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj1.Anlagename[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj1.Anlagename[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj1.Anlagename[CheckBounds(ii,0,19)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj1.Anlagename[CheckBounds(ii,0,19)]=0);
}
if(ii<=0)break;}
for((ii=19);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj1.Version[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj1.Version[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj1.Version[CheckBounds(ii,0,19)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj1.Version[CheckBounds(ii,0,19)]=0);
}
if(ii<=0)break;}
for((ii=19);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj1.RPS_Device[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj1.RPS_Device[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj1.RPS_Device[CheckBounds(ii,0,19)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj1.RPS_Device[CheckBounds(ii,0,19)]=0);
}
if(ii<=0)break;}
for((ii=19);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj1.RPS_Zielpfad[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj1.RPS_Zielpfad[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj1.RPS_Zielpfad[CheckBounds(ii,0,19)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj1.RPS_Zielpfad[CheckBounds(ii,0,19)]=0);
}
if(ii<=0)break;}
for((ii=19);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj1.EXT_Device[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj1.EXT_Device[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj1.EXT_Device[CheckBounds(ii,0,19)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj1.EXT_Device[CheckBounds(ii,0,19)]=0);
}
if(ii<=0)break;}
for((ii=19);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj1.EXT_Zielpfad[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj1.EXT_Zielpfad[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj1.EXT_Zielpfad[CheckBounds(ii,0,19)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj1.EXT_Zielpfad[CheckBounds(ii,0,19)]=0);
}
if(ii<=0)break;}
for((ii=99);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj1.PC_Zielpfad[CheckBounds(ii,0,99)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj1.PC_Zielpfad[CheckBounds(ii,0,99)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj1.PC_Zielpfad[CheckBounds(ii,0,99)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj1.PC_Zielpfad[CheckBounds(ii,0,99)]=0);
}
if(ii<=0)break;}
for((ii=19);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj1.PC_IP_Adresse[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj1.PC_IP_Adresse[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj1.PC_IP_Adresse[CheckBounds(ii,0,19)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj1.PC_IP_Adresse[CheckBounds(ii,0,19)]=0);
}
if(ii<=0)break;}
for((ii=19);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj1.PC_Ordnerfreigabe[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj1.PC_Ordnerfreigabe[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj1.PC_Ordnerfreigabe[CheckBounds(ii,0,19)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj1.PC_Ordnerfreigabe[CheckBounds(ii,0,19)]=0);
}
if(ii<=0)break;}
for((ii=19);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj1.PC_Username[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj1.PC_Username[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj1.PC_Username[CheckBounds(ii,0,19)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj1.PC_Username[CheckBounds(ii,0,19)]=0);
}
if(ii<=0)break;}
for((ii=19);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj1.PC_Userpassword[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj1.PC_Userpassword[CheckBounds(ii,0,19)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj1.PC_Userpassword[CheckBounds(ii,0,19)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj1.PC_Userpassword[CheckBounds(ii,0,19)]=0);
}
if(ii<=0)break;}



__AS__STRCPY(((unsigned long)(&CSV01.IW.Version)),((unsigned long)(&CSV_DatObj1.Version)));
__AS__STRCPY(((unsigned long)(&CSV01.IW.Anlagename)),((unsigned long)(&CSV_DatObj1.Anlagename)));
__AS__STRCPY(((unsigned long)(&CSV01.IW.RPS_Device)),((unsigned long)(&CSV_DatObj1.RPS_Device)));
__AS__STRCPY(((unsigned long)(&CSV01.IW.RPS_Zielpfad)),((unsigned long)(&CSV_DatObj1.RPS_Zielpfad)));
__AS__STRCPY(((unsigned long)(&CSV01.IW.EXT_Device)),((unsigned long)(&CSV_DatObj1.EXT_Device)));
__AS__STRCPY(((unsigned long)(&CSV01.IW.EXT_Zielpfad)),((unsigned long)(&CSV_DatObj1.EXT_Zielpfad)));
__AS__STRCPY(((unsigned long)(&CSV01.IW.PC_Zielpfad)),((unsigned long)(&CSV_DatObj1.PC_Zielpfad)));

(nxt_adr=__AS__STRCPY(((unsigned long)(&CSV01.IW.PC_DevLink_Param)),((unsigned long)(&"/SIP="))));
(nxt_adr=__AS__STRCAT(((unsigned long)(&CSV01.IW.PC_DevLink_Param)),((unsigned long)(&CSV_DatObj1.PC_IP_Adresse))));
(nxt_adr=__AS__STRCAT(((unsigned long)(&CSV01.IW.PC_DevLink_Param)),((unsigned long)(&" /PROTOCOL=cifs /SHARE="))));
(nxt_adr=__AS__STRCAT(((unsigned long)(&CSV01.IW.PC_DevLink_Param)),((unsigned long)(&CSV_DatObj1.PC_Ordnerfreigabe))));
(nxt_adr=__AS__STRCAT(((unsigned long)(&CSV01.IW.PC_DevLink_Param)),((unsigned long)(&" /USER="))));
(nxt_adr=__AS__STRCAT(((unsigned long)(&CSV01.IW.PC_DevLink_Param)),((unsigned long)(&CSV_DatObj1.PC_Username))));
(nxt_adr=__AS__STRCAT(((unsigned long)(&CSV01.IW.PC_DevLink_Param)),((unsigned long)(&" /PASSWORD="))));
(nxt_adr=__AS__STRCAT(((unsigned long)(&CSV01.IW.PC_DevLink_Param)),((unsigned long)(&CSV_DatObj1.PC_Userpassword))));

(CSV01.IW.DatObj_Zeilen_Anz=(unsigned short)(((unsigned long)((DatObjInfo_01.len-DatObj1_Size)))/((unsigned long)(CheckDivUdint(DatObj2_Size)))));
if((((unsigned long)(unsigned short)CSV01.IW.DatObj_Zeilen_Anz>(unsigned long)(unsigned short)300))){
(CSV01.IW.DatObj_Zeilen_Anz=300);
(CSV01.FE.DatObj_ZeilenMAX=1);
}

__AS__MEMSET(((unsigned long)(&M_Tag_ID)),0,10000);
for((i=1);i<=CSV01.IW.DatObj_Zeilen_Anz;i++){
(DatObj_Offset=((DatObjInfo_01.pDatObjMem+DatObj1_Size)+(DatObj2_Size*(i-1))));
__AS__MEMCPY(((unsigned long)(&CSV_DatObj2)),DatObj_Offset,176);
(status_adr=PV_xgetadr(((unsigned long)(&CSV_DatObj2.Tag_Variablenname)),((unsigned long)(&pv_adr)),((unsigned long)(&data_len))));
(status_ninfo=PV_ninfo(((unsigned long)(&CSV_DatObj2.Tag_Variablenname)),((unsigned long)(&data_typ)),((unsigned long)(&data_len2)),((unsigned long)(&dimension))));
if((((signed long)CSV_DatObj2.Tag_ID>(signed long)0))){
if(((((unsigned long)(unsigned char)M_Tag_ID[CheckBounds(CSV_DatObj2.Tag_ID,0,9999)]==(unsigned long)(unsigned char)0))&(((signed long)CSV_DatObj2.Tag_ID<=(signed long)9999)))){
(M_Tag_ID[CheckBounds(CSV_DatObj2.Tag_ID,0,9999)]=1);
}else{
(CSV01.FE.DatObj_Tag_ID=1);
(CSV01.IW.DatObj_Tag_ID_ZeileNr=i);
}
}
if(i>=CSV01.IW.DatObj_Zeilen_Anz)break;}

}

























switch(CSV01.IW.RPS_SAVE_STEP_Nr){


case 0:{


if(((((unsigned long)(unsigned short)DatObjInfo_01.status==(unsigned long)(unsigned short)0))&(((unsigned long)(unsigned char)CSV01.FE.DatObj_CFG_length==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV01.IW.RPS_DirRead_Start_OK==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)CSV01.FE.RPS_kein_Speicherplatz==(unsigned long)(unsigned char)0)))){
(CSV01.IW.DATA_WRITE_BEREIT=1);
}else{
(CSV01.IW.DATA_WRITE_BEREIT=0);
}

if((((unsigned long)(unsigned char)CSV01.IW.DATA_WRITE_BEREIT==(unsigned long)(unsigned char)1))){

if(((((unsigned long)(unsigned char)CSV01.IW.KOPF_WRITE==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV01.IW.DATA_WRITE==(unsigned long)(unsigned char)1))&(((unsigned long)strlen(((unsigned long)(&CSV01.IW.File_Name)))==(unsigned long)(unsigned short)0)))){
if((((unsigned long)strlen(((unsigned long)(&CSV01.IW.DirRead_FileName_neu)))>(unsigned long)(unsigned short)0))){
__AS__MEMCPY(((unsigned long)(&CSV01.IW.File_Name)),((unsigned long)(&CSV01.IW.DirRead_FileName_neu)),101);
__AS__MEMSET(((unsigned long)(&CSV01.IW.RPS_File_Name)),0,201);
__AS__STRCPY(((unsigned long)(&CSV01.IW.RPS_File_Name)),((unsigned long)(&CSV01.IW.RPS_Zielpfad)));
__AS__STRCAT(((unsigned long)(&CSV01.IW.RPS_File_Name)),((unsigned long)(&"/")));
__AS__STRCAT(((unsigned long)(&CSV01.IW.RPS_File_Name)),((unsigned long)(&CSV01.IW.File_Name)));
}else{
(CSV01.WA.File_not_found=1);
(CSV01.IW.KOPF_WRITE=1);
}
}

if((((unsigned long)(unsigned char)CSV01.IW.KOPF_WRITE==(unsigned long)(unsigned char)1))){

(CSV01.IW.RPS_FileWrite_OK_Z=0);

(CSV01.IW.KOPF_WRITE=1);
__AS__MEMSET(((unsigned long)(&CSV01.IW.File_Name)),0,101);

(Fub0000100001.Eing_Tag=CSV_Uhr.day);;(Fub0000100001.Eing_Monat=CSV_Uhr.month);;(Fub0000100001.Eing_Jahr=CSV_Uhr.year);;(Fub0000100001.Ausg_date_adr=((unsigned long)(&Str_date)));;(Fub0000100001.Ausg_date_len=11);;CSV_GRP_date(&Fub0000100001);(M_date_Fehler=Fub0000100001.Ausg_Fehler);

(Fub0000100002.Eing_DINT=CSV_Uhr.hour);;(Fub0000100002.Eing_Anz_VK=2);;(Fub0000100002.Eing_Anz_NK=0);;(Fub0000100002.Eing_Vorz_Plus=0);;(Fub0000100002.Eing_Komma_Punkt=0);;(Fub0000100002.Ausg_ASCII_adr=((unsigned long)(&Str_Std)));;(Fub0000100002.Ausg_ASCII_len=12);;CSV_itoa(&Fub0000100002);(M_Fehler=Fub0000100002.Ausg_Fehler);
(Fub0000100003.Eing_DINT=CSV_Uhr.minute);;(Fub0000100003.Eing_Anz_VK=2);;(Fub0000100003.Eing_Anz_NK=0);;(Fub0000100003.Eing_Vorz_Plus=0);;(Fub0000100003.Eing_Komma_Punkt=0);;(Fub0000100003.Ausg_ASCII_adr=((unsigned long)(&Str_Min)));;(Fub0000100003.Ausg_ASCII_len=12);;CSV_itoa(&Fub0000100003);(M_Fehler=Fub0000100003.Ausg_Fehler);
(Fub0000100004.Eing_DINT=CSV_Uhr.second);;(Fub0000100004.Eing_Anz_VK=2);;(Fub0000100004.Eing_Anz_NK=0);;(Fub0000100004.Eing_Vorz_Plus=0);;(Fub0000100004.Eing_Komma_Punkt=0);;(Fub0000100004.Ausg_ASCII_adr=((unsigned long)(&Str_Sek)));;(Fub0000100004.Ausg_ASCII_len=12);;CSV_itoa(&Fub0000100004);(M_Fehler=Fub0000100004.Ausg_Fehler);

__AS__STRCPY(((unsigned long)(&CSV01.IW.File_Name)),((unsigned long)(&Str_date)));
__AS__STRCAT(((unsigned long)(&CSV01.IW.File_Name)),((unsigned long)(&"-")));
__AS__STRCAT(((unsigned long)(&CSV01.IW.File_Name)),((unsigned long)(&Str_Std)));
__AS__STRCAT(((unsigned long)(&CSV01.IW.File_Name)),((unsigned long)(&"-")));
__AS__STRCAT(((unsigned long)(&CSV01.IW.File_Name)),((unsigned long)(&Str_Min)));
__AS__STRCAT(((unsigned long)(&CSV01.IW.File_Name)),((unsigned long)(&"-")));
__AS__STRCAT(((unsigned long)(&CSV01.IW.File_Name)),((unsigned long)(&Str_Sek)));
__AS__STRCAT(((unsigned long)(&CSV01.IW.File_Name)),((unsigned long)(&"_")));
__AS__STRCAT(((unsigned long)(&CSV01.IW.File_Name)),((unsigned long)(&CSV01.IW.Anlagename)));
__AS__STRCAT(((unsigned long)(&CSV01.IW.File_Name)),((unsigned long)(&".csv")));

__AS__MEMSET(((unsigned long)(&CSV01.IW.RPS_File_Name)),0,201);
__AS__STRCPY(((unsigned long)(&CSV01.IW.RPS_File_Name)),((unsigned long)(&CSV01.IW.RPS_Zielpfad)));
__AS__STRCAT(((unsigned long)(&CSV01.IW.RPS_File_Name)),((unsigned long)(&"/")));
__AS__STRCAT(((unsigned long)(&CSV01.IW.RPS_File_Name)),((unsigned long)(&CSV01.IW.File_Name)));

(CSV01.IW.RPS_DirCreate_OK_Z=0);
(CSV01.IW.RPS_FileCreate_OK_Z=0);
(CSV01.IW.RPS_FileCreate_OK_Z=0);
(CSV01.IW.RPS_FileWrite_OK_Z=0);
(CSV01.IW.RPS_FileRead_OK_Z=0);
(CSV01.IW.RPS_FileClose_OK_Z=0);

(CSV01.IW.DATA_WRITE_BEREIT=0);
(CSV01.IW.RPS_SAVE_STEP_Nr=1);

}else if((((unsigned long)(unsigned char)CSV01.IW.DATA_WRITE==(unsigned long)(unsigned char)1))){

(CSV01.IW.RPS_DirCreate_OK=0);
(CSV01.IW.RPS_FileCreate_OK=0);
(CSV01.IW.RPS_FileOpen_OK=0);
(CSV01.IW.RPS_FileWrite_OK=0);
(CSV01.IW.RPS_FileRead_OK=0);
(CSV01.IW.RPS_FileClose_OK=0);

(CSV01.IW.DATA_WRITE_BEREIT=0);
(CSV01.IW.RPS_SAVE_STEP_Nr=3);

}

}

}break;


case 1:{

(DirCreate_0.enable=1);
(DirCreate_0.pDevice=((unsigned long)(&CSV01.IW.RPS_Device)));
(DirCreate_0.pName=((unsigned long)(&CSV01.IW.RPS_Zielpfad)));
DirCreate(&DirCreate_0);

if(((((unsigned long)(unsigned short)DirCreate_0.status==(unsigned long)(unsigned short)0))|(((unsigned long)(unsigned short)DirCreate_0.status==(unsigned long)(unsigned short)20725)))){
(CSV01.IW.RPS_DirCreate_OK=1);
(CSV01.IW.RPS_DirCreate_OK_Z=(CSV01.IW.RPS_DirCreate_OK_Z+1));
(CSV01.IW.RPS_SAVE_STEP_Nr=2);
}else if((((unsigned long)(unsigned short)DirCreate_0.status!=(unsigned long)(unsigned short)65535))){
(CSV01.IW.RPS_DirCreate_FehlerNr=DirCreate_0.status);
(CSV01.IW.RPS_DirCreate_FEHLER_Z=(CSV01.IW.RPS_DirCreate_FEHLER_Z+1));
(CSV01.IW.KOPF_WRITE=0);
(CSV01.IW.DATA_WRITE=0);
(CSV01.IW.RPS_SAVE_STEP_Nr=0);
}

}break;


case 2:{

(FileCreate_0.enable=1);
(FileCreate_0.pDevice=((unsigned long)(&CSV01.IW.RPS_Device)));
(FileCreate_0.pFile=((unsigned long)(&CSV01.IW.RPS_File_Name)));
FileCreate(&FileCreate_0);

(FileIdent=FileCreate_0.ident);
(FileLength=0);

if((((unsigned long)(unsigned short)FileCreate_0.status==(unsigned long)(unsigned short)0))){
(CSV01.IW.RPS_FileCreate_OK=1);
(CSV01.IW.RPS_FileCreate_OK_Z=(CSV01.IW.RPS_FileCreate_OK_Z+1));
(FileLength=0);
__AS__MEMSET(((unsigned long)(&Datensatz)),0,60001);
(CSV01.IW.RPS_SAVE_STEP_Nr=5);
}else if((((unsigned long)(unsigned short)FileCreate_0.status==(unsigned long)(unsigned short)20705))){
(CSV01.IW.RPS_FileCreate_FehlerNr=0);
(CSV01.IW.RPS_FileCreate_OK=1);
(CSV01.IW.RPS_FileCreate_OK_Z=(CSV01.IW.RPS_FileCreate_OK_Z+1));
(CSV01.IW.RPS_SAVE_STEP_Nr=3);
}else if((((unsigned long)(unsigned short)FileCreate_0.status!=(unsigned long)(unsigned short)65535))){
(CSV01.IW.RPS_FileCreate_FehlerNr=FileCreate_0.status);
(CSV01.IW.RPS_FileCreate_FEHLER_Z=(CSV01.IW.RPS_FileCreate_FEHLER_Z+1));
(CSV01.IW.KOPF_WRITE=0);
(CSV01.IW.DATA_WRITE=0);
(CSV01.IW.RPS_SAVE_STEP_Nr=0);
}

}break;


case 3:{

(FileOpen_0.enable=1);
(FileOpen_0.pDevice=((unsigned long)(&CSV01.IW.RPS_Device)));
(FileOpen_0.pFile=((unsigned long)(&CSV01.IW.RPS_File_Name)));
(FileOpen_0.mode=fiREAD_WRITE);
FileOpen(&FileOpen_0);

(FileIdent=FileOpen_0.ident);
(FileLength=FileOpen_0.filelen);

if((((unsigned long)(unsigned short)FileOpen_0.status==(unsigned long)(unsigned short)0))){
(CSV01.IW.RPS_FileOpen_OK=1);
(CSV01.IW.RPS_FileOpen_OK_Z=(CSV01.IW.RPS_FileOpen_OK_Z+1));
(CSV01.IW.RPS_SAVE_STEP_Nr=4);
}else if(((((unsigned long)(unsigned short)FileOpen_0.status==(unsigned long)(unsigned short)20700))|(((unsigned long)(unsigned short)FileOpen_0.status==(unsigned long)(unsigned short)20708)))){
(CSV01.IW.DATA_WRITE=1);
(CSV01.IW.KOPF_WRITE=1);
(CSV01.IW.RPS_SAVE_STEP_Nr=0);
}else if((((unsigned long)(unsigned short)FileOpen_0.status!=(unsigned long)(unsigned short)65535))){
(CSV01.IW.RPS_FileOpen_FehlerNr=FileOpen_0.status);
(CSV01.IW.RPS_FileOpen_FEHLER_Z=(CSV01.IW.RPS_FileOpen_FEHLER_Z+1));
(CSV01.IW.KOPF_WRITE=0);
(CSV01.IW.DATA_WRITE=0);
(CSV01.IW.RPS_SAVE_STEP_Nr=0);
}

}break;


case 4:{



if((((unsigned long)FileLength>(unsigned long)2))){
(Offset_Ende=(FileLength-2));
(FileRead_0.enable=1);
(FileRead_0.ident=FileIdent);
(FileRead_0.offset=Offset_Ende);
(FileRead_0.pDest=((unsigned long)(&Datei_Ende)));
(FileRead_0.len=2);
FileRead(&FileRead_0);

if((((unsigned long)(unsigned short)FileRead_0.status==(unsigned long)(unsigned short)0))){
(CSV01.IW.RPS_FileRead_OK=1);
(CSV01.IW.RPS_FileRead_OK_Z=(CSV01.IW.RPS_FileRead_OK_Z+1));
if(((((unsigned long)(unsigned char)Datei_Ende[CheckBounds(0,0,1)]==(unsigned long)(unsigned char)CR))&(((unsigned long)(unsigned char)Datei_Ende[CheckBounds(1,0,1)]==(unsigned long)(unsigned char)LF)))){
(Zeile_Fertig=1);
}else{
(Zeile_Fertig=0);
}
__AS__MEMSET(((unsigned long)(&Datensatz)),0,60001);
(CSV01.IW.RPS_SAVE_STEP_Nr=5);
}else if((((unsigned long)(unsigned short)FileRead_0.status!=(unsigned long)(unsigned short)65535))){
(CSV01.IW.RPS_FileRead_OK=0);
(CSV01.IW.RPS_FileRead_FehlerNr=FileRead_0.status);
(CSV01.IW.RPS_FileRead_FEHLER_Z=(CSV01.IW.RPS_FileRead_FEHLER_Z+1));
(CSV01.IW.KOPF_WRITE=0);
(CSV01.IW.DATA_WRITE=0);
(CSV01.IW.RPS_SAVE_STEP_Nr=0);
}
}else{
(Zeile_Fertig=1);
(CSV01.IW.KOPF_WRITE=1);
__AS__MEMSET(((unsigned long)(&Datensatz)),0,60001);
(CSV01.IW.RPS_SAVE_STEP_Nr=5);
}

}break;


case 5:{

if((((unsigned long)(unsigned char)CSV01.IW.KOPF_WRITE==(unsigned long)(unsigned char)1))){

if((((unsigned long)(unsigned char)CSV01.SW.Kopf_Version_T==(unsigned long)(unsigned char)1))){
__AS__STRCPY(((unsigned long)(&Datensatz)),((unsigned long)(&CSV01.IW.Version)));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrCRLF)));
}
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_Anlagenname_T==(unsigned long)(unsigned char)1))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&CSV01.IW.Anlagename)));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrCRLF)));
}
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_ID_T==(unsigned long)(unsigned char)1))){
for((i=1);i<=CSV01.IW.DatObj_Zeilen_Anz;i++){
(DatObj_Offset=((DatObjInfo_01.pDatObjMem+DatObj1_Size)+(DatObj2_Size*(i-1))));
__AS__MEMCPY(((unsigned long)(&CSV_DatObj2)),DatObj_Offset,176);
itoa((signed long)CSV_DatObj2.Tag_ID,((unsigned long)(&Str_ID)));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
if((((signed long)CSV_DatObj2.Tag_ID>(signed long)0))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&Str_ID)));
}
if(i>=CSV01.IW.DatObj_Zeilen_Anz)break;}
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrCRLF)));
}

if((((unsigned long)(unsigned char)CSV01.SW.Kopf_Bezeichnung_T==(unsigned long)(unsigned char)1))){
for((i=1);i<=CSV01.IW.DatObj_Zeilen_Anz;i++){
(DatObj_Offset=((DatObjInfo_01.pDatObjMem+DatObj1_Size)+(DatObj2_Size*(i-1))));
__AS__MEMCPY(((unsigned long)(&CSV_DatObj2)),DatObj_Offset,176);
for((ii=59);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj2.Tag_Bezeichnung[CheckBounds(ii,0,59)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj2.Tag_Bezeichnung[CheckBounds(ii,0,59)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj2.Tag_Bezeichnung[CheckBounds(ii,0,59)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj2.Tag_Bezeichnung[CheckBounds(ii,0,59)]=0);
}
if(ii<=0)break;}

__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
if((((signed long)CSV_DatObj2.Tag_ID>(signed long)0))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&CSV_DatObj2.Tag_Bezeichnung)));
}
if(i>=CSV01.IW.DatObj_Zeilen_Anz)break;}
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrCRLF)));
}

if((((unsigned long)(unsigned char)CSV01.SW.Kopf_Einheit_T==(unsigned long)(unsigned char)1))){
for((i=1);i<=CSV01.IW.DatObj_Zeilen_Anz;i++){
(DatObj_Offset=((DatObjInfo_01.pDatObjMem+DatObj1_Size)+(DatObj2_Size*(i-1))));
__AS__MEMCPY(((unsigned long)(&CSV_DatObj2)),DatObj_Offset,176);
for((ii=31);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj2.Tag_Einheit[CheckBounds(ii,0,31)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj2.Tag_Einheit[CheckBounds(ii,0,31)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj2.Tag_Einheit[CheckBounds(ii,0,31)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj2.Tag_Einheit[CheckBounds(ii,0,31)]=0);
}
if(ii<=0)break;}

__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
if((((signed long)CSV_DatObj2.Tag_ID>(signed long)0))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&CSV_DatObj2.Tag_Einheit)));
}
if(i>=CSV01.IW.DatObj_Zeilen_Anz)break;}
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrCRLF)));
}

if((((unsigned long)(unsigned char)CSV01.SW.Kopf_Datentyp_T==(unsigned long)(unsigned char)1))){
for((i=1);i<=CSV01.IW.DatObj_Zeilen_Anz;i++){
(DatObj_Offset=((DatObjInfo_01.pDatObjMem+DatObj1_Size)+(DatObj2_Size*(i-1))));
__AS__MEMCPY(((unsigned long)(&CSV_DatObj2)),DatObj_Offset,176);
(status_adr=PV_xgetadr(((unsigned long)(&CSV_DatObj2.Tag_Variablenname)),((unsigned long)(&pv_adr)),((unsigned long)(&data_len))));
(status_ninfo=PV_ninfo(((unsigned long)(&CSV_DatObj2.Tag_Variablenname)),((unsigned long)(&data_typ)),((unsigned long)(&data_len2)),((unsigned long)(&dimension))));

if(((((signed long)CSV_DatObj2.Tag_ID==(signed long)0))|(((unsigned long)(unsigned char)CSV_DatObj2.Tag_Variablenname[CheckBounds(0,0,47)]==(unsigned long)(unsigned char)0))|(((unsigned long)(unsigned char)CSV_DatObj2.Tag_Variablenname[CheckBounds(0,0,47)]==(unsigned long)(unsigned char)32)))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
}else if(((((unsigned long)(unsigned short)status_adr==(unsigned long)(unsigned short)0))&(((unsigned long)(unsigned short)status_ninfo==(unsigned long)(unsigned short)0)))){
if(((((unsigned long)data_typ==(unsigned long)9))|((((unsigned long)data_typ==(unsigned long)5))&(((unsigned long)data_len>(unsigned long)1))))){
__AS__MEMCPY(((unsigned long)(&Wert_STRING)),pv_adr,25);
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
if(((((unsigned long)(unsigned char)Wert_STRING[CheckBounds(2,0,24)]==(unsigned long)(unsigned char)58))&(((unsigned long)(unsigned char)Wert_STRING[CheckBounds(5,0,24)]==(unsigned long)(unsigned char)58)))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&"time")));
}else if(((((unsigned long)(unsigned char)Wert_STRING[CheckBounds(4,0,24)]==(unsigned long)(unsigned char)45))&(((unsigned long)(unsigned char)Wert_STRING[CheckBounds(7,0,24)]==(unsigned long)(unsigned char)45))&(((unsigned long)(unsigned char)Wert_STRING[CheckBounds(13,0,24)]==(unsigned long)(unsigned char)58))&(((unsigned long)(unsigned char)Wert_STRING[CheckBounds(16,0,24)]==(unsigned long)(unsigned char)58)))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&"timestamp")));
}else if(((((unsigned long)(unsigned char)Wert_STRING[CheckBounds(4,0,24)]==(unsigned long)(unsigned char)45))&(((unsigned long)(unsigned char)Wert_STRING[CheckBounds(7,0,24)]==(unsigned long)(unsigned char)45)))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&"date")));
}else{
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&"string(512)")));
}
}else if((((unsigned long)data_typ==(unsigned long)1))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&"bool")));
}else if((((unsigned long)data_typ==(unsigned long)2))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&"tinyint")));
}else if(((((unsigned long)data_typ==(unsigned long)3))|(((unsigned long)data_typ==(unsigned long)5)))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&"smallint")));
}else if(((((unsigned long)data_typ==(unsigned long)4))|(((unsigned long)data_typ==(unsigned long)6)))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&"int")));
}else if((((unsigned long)data_typ==(unsigned long)7))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&"bigint")));
}else if((((unsigned long)data_typ==(unsigned long)8))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));


(Tag_MIN_Stellen=0);
(Tag_MIN_Nachkomma=0);
(Tag_MIN_Komma=0);
for((ii=0);ii<=14;ii++){
if(((((unsigned long)(unsigned char)CSV_DatObj2.Tag_MIN[CheckBounds(ii,0,15)]!=(unsigned long)(unsigned char)32))&(((unsigned long)(unsigned char)CSV_DatObj2.Tag_MIN[CheckBounds(ii,0,15)]!=(unsigned long)(unsigned char)43))&(((unsigned long)(unsigned char)CSV_DatObj2.Tag_MIN[CheckBounds(ii,0,15)]!=(unsigned long)(unsigned char)45))&(((unsigned long)(unsigned char)CSV_DatObj2.Tag_MIN[CheckBounds(ii,0,15)]!=(unsigned long)(unsigned char)46)))){
(Tag_MIN_Stellen=(Tag_MIN_Stellen+1));
if((((unsigned long)(unsigned char)Tag_MIN_Komma==(unsigned long)(unsigned char)1))){
(Tag_MIN_Nachkomma=(Tag_MIN_Nachkomma+1));
}
}
if((((unsigned long)(unsigned char)CSV_DatObj2.Tag_MIN[CheckBounds(ii,0,15)]==(unsigned long)(unsigned char)46))){
(Tag_MIN_Komma=1);
}
if(ii>=14)break;}
(Tag_MAX_Stellen=0);
(Tag_MAX_Nachkomma=0);
(Tag_MAX_Komma=0);
for((ii=0);ii<=14;ii++){
if(((((unsigned long)(unsigned char)CSV_DatObj2.Tag_MAX[CheckBounds(ii,0,15)]!=(unsigned long)(unsigned char)32))&(((unsigned long)(unsigned char)CSV_DatObj2.Tag_MAX[CheckBounds(ii,0,15)]!=(unsigned long)(unsigned char)43))&(((unsigned long)(unsigned char)CSV_DatObj2.Tag_MAX[CheckBounds(ii,0,15)]!=(unsigned long)(unsigned char)45))&(((unsigned long)(unsigned char)CSV_DatObj2.Tag_MAX[CheckBounds(ii,0,15)]!=(unsigned long)(unsigned char)46)))){
(Tag_MAX_Stellen=(Tag_MAX_Stellen+1));
if((((unsigned long)(unsigned char)Tag_MAX_Komma==(unsigned long)(unsigned char)1))){
(Tag_MAX_Nachkomma=(Tag_MAX_Nachkomma+1));
}
}
if((((unsigned long)(unsigned char)CSV_DatObj2.Tag_MAX[CheckBounds(ii,0,15)]==(unsigned long)(unsigned char)46))){
(Tag_MAX_Komma=1);
}
if(ii>=14)break;}
__AS__MEMSET(((unsigned long)(&Str_Stellen)),0,12);
__AS__MEMSET(((unsigned long)(&Str_Nachkomma)),0,12);
if((((unsigned long)(unsigned char)Tag_MAX_Stellen>(unsigned long)(unsigned char)Tag_MIN_Stellen))){
itoa(Tag_MAX_Stellen,((unsigned long)(&Str_Stellen)));
}else{
itoa(Tag_MIN_Stellen,((unsigned long)(&Str_Stellen)));
}
if((((unsigned long)(unsigned char)Tag_MAX_Nachkomma>(unsigned long)(unsigned char)Tag_MIN_Nachkomma))){
itoa(Tag_MAX_Nachkomma,((unsigned long)(&Str_Nachkomma)));
}else{
itoa(Tag_MIN_Nachkomma,((unsigned long)(&Str_Nachkomma)));
}
if(((((unsigned long)(unsigned char)Tag_MAX_Stellen==(unsigned long)(unsigned char)0))|(((unsigned long)(unsigned char)Tag_MIN_Stellen==(unsigned long)(unsigned char)0)))){
(CSV01.FE.DatObj_Tag_MIN=1);
(CSV01.FE.DatObj_Tag_MAX=1);
(CSV01.IW.DatObj_Tag_MAX_ZeileNr=i);
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&"decimal(10,2)")));
}else{
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&"decimal(")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&Str_Stellen)));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&",")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&Str_Nachkomma)));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&")")));
}
}else{
(CSV01.FE.DatObj_Tag_Datentyp=1);
(CSV01.IW.DatObj_Tag_Datentyp_ZeileNr=i);
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
}
}else{
(CSV01.FE.DatObj_Tag_Variable=1);
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
}
if(i>=CSV01.IW.DatObj_Zeilen_Anz)break;}
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrCRLF)));
}

if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)1))){
for((i=1);i<=CSV01.IW.DatObj_Zeilen_Anz;i++){
(DatObj_Offset=((DatObjInfo_01.pDatObjMem+DatObj1_Size)+(DatObj2_Size*(i-1))));
__AS__MEMCPY(((unsigned long)(&CSV_DatObj2)),DatObj_Offset,176);
for((ii=15);ii>=0;ii--){
if((((unsigned long)(unsigned char)CSV_DatObj2.Tag_MIN[CheckBounds(ii,0,15)]==(unsigned long)(unsigned char)46))){
(CSV_DatObj2.Tag_MIN[CheckBounds(ii,0,15)]=44);
if((((unsigned long)(unsigned char)1==(unsigned long)(unsigned char)1)))break;
}
if(ii<=0)break;}
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
if((((signed long)CSV_DatObj2.Tag_ID>(signed long)0))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&CSV_DatObj2.Tag_MIN)));
}
if(i>=CSV01.IW.DatObj_Zeilen_Anz)break;}
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrCRLF)));
}

if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)1))){
for((i=1);i<=CSV01.IW.DatObj_Zeilen_Anz;i++){
(DatObj_Offset=((DatObjInfo_01.pDatObjMem+DatObj1_Size)+(DatObj2_Size*(i-1))));
__AS__MEMCPY(((unsigned long)(&CSV_DatObj2)),DatObj_Offset,176);
for((ii=15);ii>=0;ii--){
if((((unsigned long)(unsigned char)CSV_DatObj2.Tag_MAX[CheckBounds(ii,0,15)]==(unsigned long)(unsigned char)46))){
(CSV_DatObj2.Tag_MAX[CheckBounds(ii,0,15)]=44);
if((((unsigned long)(unsigned char)1==(unsigned long)(unsigned char)1)))break;
}
if(ii<=0)break;}
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
if((((signed long)CSV_DatObj2.Tag_ID>(signed long)0))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&CSV_DatObj2.Tag_MAX)));
}
if(i>=CSV01.IW.DatObj_Zeilen_Anz)break;}
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrCRLF)));
}

(CSV01.IW.Kopf_length=strlen(((unsigned long)(&Datensatz))));

}else{


__AS__MEMSET(((unsigned long)(&CSV01.IW.Datensatz_TimeStamp)),0,25);
if((((unsigned long)(unsigned char)CSV01.SW.Zeitstempel_lang_T==(unsigned long)(unsigned char)1))){
(Fub0000100005.Eing_Tag=CSV_Uhr.day);;(Fub0000100005.Eing_Monat=CSV_Uhr.month);;(Fub0000100005.Eing_Jahr=CSV_Uhr.year);;(Fub0000100005.Eing_Stunde=CSV_Uhr.hour);;(Fub0000100005.Eing_Minute=CSV_Uhr.minute);;(Fub0000100005.Eing_Sekunde=CSV_Uhr.second);;(Fub0000100005.Eing_MilliSek=CSV_Uhr.millisec);;(Fub0000100005.Ausg_timestamp_adr=((unsigned long)(&Str_timestamp)));;(Fub0000100005.Ausg_timestamp_len=24);;CSV_GRP_timestamp(&Fub0000100005);(M_timestamp_Fehler=Fub0000100005.Ausg_Fehler);
__AS__STRCPY(((unsigned long)(&CSV01.IW.Datensatz_TimeStamp)),((unsigned long)(&Str_timestamp)));
}else{
(Fub0000100006.Eing_Tag=CSV_Uhr.day);;(Fub0000100006.Eing_Monat=CSV_Uhr.month);;(Fub0000100006.Eing_Jahr=(CSV_Uhr.year-2000));;(Fub0000100006.Eing_Stunde=CSV_Uhr.hour);;(Fub0000100006.Eing_Minute=CSV_Uhr.minute);;(Fub0000100006.Ausg_timestamp_adr=((unsigned long)(&Str_QM_timestamp)));;(Fub0000100006.Ausg_timestamp_len=15);;CSV_QM_timestamp(&Fub0000100006);(M_timestamp_QM_Fehler=Fub0000100006.Ausg_Fehler);
__AS__STRCPY(((unsigned long)(&CSV01.IW.Datensatz_TimeStamp)),((unsigned long)(&Str_QM_timestamp)));
}
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&CSV01.IW.Datensatz_TimeStamp)));

for((i=1);i<=CSV01.IW.DatObj_Zeilen_Anz;i++){
(DatObj_Offset=((DatObjInfo_01.pDatObjMem+DatObj1_Size)+(DatObj2_Size*(i-1))));
__AS__MEMCPY(((unsigned long)(&CSV_DatObj2)),DatObj_Offset,176);
__AS__MEMSET(((unsigned long)(&StrWork)),0,31);
for((ii=47);ii>=0;ii--){
if(((((unsigned long)(unsigned char)CSV_DatObj2.Tag_Variablenname[CheckBounds(0,0,47)]==(unsigned long)(unsigned char)0))|(((unsigned long)(unsigned char)CSV_DatObj2.Tag_Variablenname[CheckBounds(0,0,47)]==(unsigned long)(unsigned char)32))))break;
if(((((unsigned long)(unsigned char)CSV_DatObj2.Tag_Variablenname[CheckBounds(ii,0,47)]!=(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV_DatObj2.Tag_Variablenname[CheckBounds(ii,0,47)]!=(unsigned long)(unsigned char)32))))break;
if((((unsigned long)(unsigned char)CSV_DatObj2.Tag_Variablenname[CheckBounds(ii,0,47)]==(unsigned long)(unsigned char)32))){
(CSV_DatObj2.Tag_Variablenname[CheckBounds(ii,0,47)]=0);
}
if(ii<=0)break;}
(status_adr=PV_xgetadr(((unsigned long)(&CSV_DatObj2.Tag_Variablenname)),((unsigned long)(&pv_adr)),((unsigned long)(&data_len))));
(status_ninfo=PV_ninfo(((unsigned long)(&CSV_DatObj2.Tag_Variablenname)),((unsigned long)(&data_typ)),((unsigned long)(&data_len2)),((unsigned long)(&dimension))));

(Fub0000100007.Eing_ASCII_adr=((unsigned long)(&CSV_DatObj2.Tag_MIN)));;(Fub0000100007.Eing_ASCII_len=16);;CSV_atoLREAL(&Fub0000100007);(M_MIN_Fehler=Fub0000100007.Ausg_Fehler);(M_Tag_MIN=Fub0000100007.Ausg_LREAL);
if((((unsigned long)(unsigned char)M_MIN_Fehler==(unsigned long)(unsigned char)1))){
(CSV01.FE.DatObj_Tag_MIN=1);
(CSV01.IW.DatObj_Tag_MIN_ZeileNr=i);
}
(Fub0000100008.Eing_ASCII_adr=((unsigned long)(&CSV_DatObj2.Tag_MAX)));;(Fub0000100008.Eing_ASCII_len=16);;CSV_atoLREAL(&Fub0000100008);(M_MAX_Fehler=Fub0000100008.Ausg_Fehler);(M_Tag_MAX=Fub0000100008.Ausg_LREAL);
if((((unsigned long)(unsigned char)M_MAX_Fehler==(unsigned long)(unsigned char)1))){
(CSV01.FE.DatObj_Tag_MAX=1);
(CSV01.IW.DatObj_Tag_MAX_ZeileNr=i);
}


if(((((unsigned long)(unsigned char)CSV_DatObj2.Tag_Variablenname[CheckBounds(0,0,47)]==(unsigned long)(unsigned char)0))|(((unsigned long)(unsigned char)CSV_DatObj2.Tag_Variablenname[CheckBounds(0,0,47)]==(unsigned long)(unsigned char)32)))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
}else if(((((unsigned long)(unsigned short)status_adr==(unsigned long)(unsigned short)0))&(((unsigned long)(unsigned short)status_ninfo==(unsigned long)(unsigned short)0)))){
if(((((unsigned long)data_typ==(unsigned long)9))|((((unsigned long)data_typ==(unsigned long)5))&(((unsigned long)data_len>(unsigned long)1))))){
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),pv_adr);
}else if((((unsigned long)data_typ==(unsigned long)1))){
(Wert_BOOL=pv_adr);
itoa((CheckReadAccess(Wert_BOOL),(*(Wert_BOOL))),((unsigned long)(&StrWork)));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrWork)));
}else if((((unsigned long)data_typ==(unsigned long)2))){
__AS__MEMCPY(((unsigned long)(&Wert_SINT)),pv_adr,1);
if((((signed long)(signed long)(char)Wert_SINT<(signed long)(signed char)(M_Tag_MIN>=0.0?M_Tag_MIN+0.5:M_Tag_MIN-0.5)))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_SINT=(signed char)(M_Tag_MIN>=0.0?M_Tag_MIN+0.5:M_Tag_MIN-0.5));
}else if((((signed long)(signed long)(char)Wert_SINT>(signed long)(signed char)(M_Tag_MAX>=0.0?M_Tag_MAX+0.5:M_Tag_MAX-0.5)))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_SINT=(signed char)(M_Tag_MAX>=0.0?M_Tag_MAX+0.5:M_Tag_MAX-0.5));
}
itoa(Wert_SINT,((unsigned long)(&StrWork)));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrWork)));
}else if((((unsigned long)data_typ==(unsigned long)3))){
__AS__MEMCPY(((unsigned long)(&Wert_INT)),pv_adr,2);
if((((signed long)(signed long)(short)Wert_INT<(signed long)(signed short)(M_Tag_MIN>=0.0?M_Tag_MIN+0.5:M_Tag_MIN-0.5)))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_INT=(signed short)(M_Tag_MIN>=0.0?M_Tag_MIN+0.5:M_Tag_MIN-0.5));
}else if((((signed long)(signed long)(short)Wert_INT>(signed long)(signed short)(M_Tag_MAX>=0.0?M_Tag_MAX+0.5:M_Tag_MAX-0.5)))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_INT=(signed short)(M_Tag_MAX>=0.0?M_Tag_MAX+0.5:M_Tag_MAX-0.5));
}
itoa(Wert_INT,((unsigned long)(&StrWork)));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrWork)));
}else if((((unsigned long)data_typ==(unsigned long)4))){
__AS__MEMCPY(((unsigned long)(&Wert_DINT)),pv_adr,4);
if((((signed long)Wert_DINT<(signed long)(signed long)(M_Tag_MIN>=0.0?M_Tag_MIN+0.5:M_Tag_MIN-0.5)))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_DINT=(signed long)(M_Tag_MIN>=0.0?M_Tag_MIN+0.5:M_Tag_MIN-0.5));
}else if((((signed long)Wert_DINT>(signed long)(signed long)(M_Tag_MAX>=0.0?M_Tag_MAX+0.5:M_Tag_MAX-0.5)))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_DINT=(signed long)(M_Tag_MAX>=0.0?M_Tag_MAX+0.5:M_Tag_MAX-0.5));
}
itoa(Wert_DINT,((unsigned long)(&StrWork)));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrWork)));
}else if((((unsigned long)data_typ==(unsigned long)5))){
__AS__MEMCPY(((unsigned long)(&Wert_USINT)),pv_adr,1);
if((((unsigned long)(unsigned char)Wert_USINT<(unsigned long)(unsigned char)(M_Tag_MIN>=0.0?M_Tag_MIN+0.5:M_Tag_MIN-0.5)))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_USINT=(unsigned char)(M_Tag_MIN>=0.0?M_Tag_MIN+0.5:M_Tag_MIN-0.5));
}else if((((unsigned long)(unsigned char)Wert_USINT>(unsigned long)(unsigned char)(M_Tag_MAX>=0.0?M_Tag_MAX+0.5:M_Tag_MAX-0.5)))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_USINT=(unsigned char)(M_Tag_MAX>=0.0?M_Tag_MAX+0.5:M_Tag_MAX-0.5));
}
itoa(Wert_USINT,((unsigned long)(&StrWork)));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrWork)));
}else if((((unsigned long)data_typ==(unsigned long)6))){
__AS__MEMCPY(((unsigned long)(&Wert_UINT)),pv_adr,2);
if((((unsigned long)(unsigned short)Wert_UINT<(unsigned long)(unsigned short)(M_Tag_MIN>=0.0?M_Tag_MIN+0.5:M_Tag_MIN-0.5)))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_UINT=(unsigned short)(M_Tag_MIN>=0.0?M_Tag_MIN+0.5:M_Tag_MIN-0.5));
}else if((((unsigned long)(unsigned short)Wert_UINT>(unsigned long)(unsigned short)(M_Tag_MAX>=0.0?M_Tag_MAX+0.5:M_Tag_MAX-0.5)))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_UINT=(unsigned short)(M_Tag_MAX>=0.0?M_Tag_MAX+0.5:M_Tag_MAX-0.5));
}
itoa(Wert_UINT,((unsigned long)(&StrWork)));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrWork)));
}else if((((unsigned long)data_typ==(unsigned long)7))){
__AS__MEMCPY(((unsigned long)(&Wert_UDINT)),pv_adr,4);
if((((unsigned long)Wert_UDINT<(unsigned long)(unsigned long)(M_Tag_MIN>=0.0?M_Tag_MIN+0.5:M_Tag_MIN-0.5)))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_UDINT=(unsigned long)(M_Tag_MIN>=0.0?M_Tag_MIN+0.5:M_Tag_MIN-0.5));
}else if((((unsigned long)Wert_UDINT>(unsigned long)(unsigned long)(M_Tag_MAX>=0.0?M_Tag_MAX+0.5:M_Tag_MAX-0.5)))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_UDINT=(unsigned long)(M_Tag_MAX>=0.0?M_Tag_MAX+0.5:M_Tag_MAX-0.5));
}
(Fub0000100009.Eing_UDINT=Wert_UDINT);;(Fub0000100009.Ausg_ASCII_adr=((unsigned long)(&StrWork)));;(Fub0000100009.Ausg_ASCII_len=31);;CSV_UDINTtoa(&Fub0000100009);(M_UDINT_Fehler=Fub0000100009.Ausg_Fehler);
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrWork)));
}else if((((unsigned long)data_typ==(unsigned long)8))){
__AS__MEMCPY(((unsigned long)(&Wert_REAL)),pv_adr,4);
if(((Wert_REAL<(float)M_Tag_MIN))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_REAL=(float)M_Tag_MIN);
}else if(((Wert_REAL>(float)M_Tag_MAX))){
if((((unsigned long)(unsigned char)CSV01.SW.Kopf_MIN_MAX_T==(unsigned long)(unsigned char)0))){
goto Sprung_MINMAX;
}
(Wert_REAL=(float)M_Tag_MAX);
}
(Tag_MIN_Nachkomma=0);
(Tag_MIN_Komma=0);
for((ii=0);ii<=14;ii++){
if((((unsigned long)(unsigned char)Tag_MIN_Komma==(unsigned long)(unsigned char)1))){
(Tag_MIN_Nachkomma=(Tag_MIN_Nachkomma+1));
}
if((((unsigned long)(unsigned char)CSV_DatObj2.Tag_MIN[CheckBounds(ii,0,15)]==(unsigned long)(unsigned char)46))){
(Tag_MIN_Komma=1);
}
if(ii>=14)break;}
(Tag_MAX_Nachkomma=0);
(Tag_MAX_Komma=0);
for((ii=0);ii<=14;ii++){
if((((unsigned long)(unsigned char)Tag_MAX_Komma==(unsigned long)(unsigned char)1))){
(Tag_MAX_Nachkomma=(Tag_MAX_Nachkomma+1));
}
if((((unsigned long)(unsigned char)CSV_DatObj2.Tag_MAX[CheckBounds(ii,0,15)]==(unsigned long)(unsigned char)46))){
(Tag_MAX_Komma=1);
}
if(ii>=14)break;}
if((((unsigned long)(unsigned char)Tag_MAX_Nachkomma>(unsigned long)(unsigned char)Tag_MIN_Nachkomma))){
(Tag_Nachkomma=Tag_MAX_Nachkomma);
}else{
(Tag_Nachkomma=Tag_MAX_Nachkomma);
}
(Wert_DINT=(signed long)((Wert_REAL*RealExpt(10,Tag_Nachkomma))>=0.0?(Wert_REAL*RealExpt(10,Tag_Nachkomma))+0.5:(Wert_REAL*RealExpt(10,Tag_Nachkomma))-0.5));
(Wert_REAL=((float)Wert_DINT/CheckDivReal(RealExpt(10,Tag_Nachkomma))));
ftoa(Wert_REAL,((unsigned long)(&StrWork)));
for((ii=0);ii<=30;ii++){
if((((unsigned long)(unsigned char)StrWork[CheckBounds(ii,0,30)]==(unsigned long)(unsigned char)46))){
(StrWork[CheckBounds(ii,0,30)]=44);
if((((unsigned long)(unsigned char)1==(unsigned long)(unsigned char)1)))break;
}
if(ii>=30)break;}
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrWork)));

}else{
(CSV01.FE.DatObj_Tag_Datentyp=1);
(CSV01.IW.DatObj_Tag_Datentyp_ZeileNr=i);

Sprung_MINMAX:;
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
}
}else{
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&";")));
(CSV01.FE.DatObj_Tag_Variable=1);
(CSV01.IW.DatObj_Tag_Variable_ZeileNr=i);
}

if(i>=CSV01.IW.DatObj_Zeilen_Anz)break;}
__AS__STRCAT(((unsigned long)(&Datensatz)),((unsigned long)(&StrCRLF)));

}

(CSV01.IW.Datensatz_length=strlen(((unsigned long)(&Datensatz))));

if((((unsigned long)(unsigned char)CSV01.IW.KOPF_WRITE==(unsigned long)(unsigned char)1))){
(CSV01.IW.RPS_SAVE_STEP_Nr=7);
}else if(((((unsigned long)(unsigned char)CSV01.SW.RPS_COPY_AUTO_T==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned short)CSV01.IW.RPS_CPYDEL_STEP_Nr>=(unsigned long)(unsigned short)4))&(((unsigned long)CSV01.IW.Datensatz_length<(unsigned long)38000)))){
(CSV01.IW.DATA_WRITE=0);
(CSV01.IW.RPS_SAVE_STEP_Nr=6);
}else if(((((unsigned long)(unsigned char)CSV01.SW.PC_FileCopy_neu_HAND_T==(unsigned long)(unsigned char)1))&(((unsigned long)CSV01.IW.Datensatz_length<(unsigned long)38000)))){
(CSV01.IW.DATA_WRITE=0);
(CSV01.IW.RPS_SAVE_STEP_Nr=6);
}else{
(CSV01.IW.RPS_SAVE_STEP_Nr=7);
}

}break;


case 6:{

(CSV01.IW.DATA_WRITE_BEREIT=1);

if((((unsigned long)(unsigned char)CSV01.IW.DATA_WRITE==(unsigned long)(unsigned char)1))){
(CSV01.IW.RPS_SAVE_STEP_Nr=5);
(CSV01.IW.DATA_WRITE_BEREIT=0);
}else if((((unsigned long)(unsigned short)CSV01.IW.RPS_CPYDEL_STEP_Nr==(unsigned long)(unsigned short)0))){
(CSV01.IW.RPS_SAVE_STEP_Nr=7);
}

}break;


case 7:{


(FileWrite_0.enable=1);
(FileWrite_0.ident=FileIdent);
(FileWrite_0.offset=FileLength);
(FileWrite_0.pSrc=((unsigned long)(&Datensatz)));
(FileWrite_0.len=strlen(((unsigned long)(&Datensatz))));
FileWrite(&FileWrite_0);

if((((unsigned long)(unsigned short)FileWrite_0.status==(unsigned long)(unsigned short)0))){
(CSV01.IW.RPS_FileWrite_OK=1);
(CSV01.IW.RPS_FileWrite_OK_Z=(CSV01.IW.RPS_FileWrite_OK_Z+1));
if((((unsigned long)(CSV01.IW.KOPF_WRITE&CSV01.IW.DATA_WRITE)==(unsigned long)(unsigned char)1))){
(CSV01.IW.KOPF_WRITE=0);
(FileLength=(FileLength+CSV01.IW.Datensatz_length));
__AS__MEMSET(((unsigned long)(&Datensatz)),0,60001);
(CSV01.IW.RPS_SAVE_STEP_Nr=5);
}else if((((unsigned long)(unsigned char)CSV01.IW.DATA_WRITE==(unsigned long)(unsigned char)1))){
if((((unsigned long)(unsigned char)CSV01.SW.RPS_COPY_AUTO_T==(unsigned long)(unsigned char)1))){
(CSV01.IW.RPS_COPY_AUTO_Start=1);
}
(CSV01.IW.DATA_WRITE=0);
(CSV01.IW.RPS_SAVE_STEP_Nr=8);
}else{
(CSV01.IW.KOPF_WRITE=0);
(CSV01.IW.RPS_SAVE_STEP_Nr=8);
}
}else if((((unsigned long)(unsigned short)FileWrite_0.status==(unsigned long)(unsigned short)20710))){
(CSV01.FE.RPS_kein_Speicherplatz=1);
(CSV01.IW.RPS_SAVE_STEP_Nr=0);
}else if((((unsigned long)(unsigned short)FileWrite_0.status!=(unsigned long)(unsigned short)65535))){
(CSV01.IW.RPS_FileWrite_FehlerNr=FileWrite_0.status);
(CSV01.IW.RPS_FileWrite_OK=0);
(CSV01.IW.RPS_FileWrite_FEHLER_Z=(CSV01.IW.RPS_FileWrite_FEHLER_Z+1));
(CSV01.IW.KOPF_WRITE=0);
(CSV01.IW.DATA_WRITE=0);
(CSV01.IW.RPS_SAVE_STEP_Nr=8);
}

}break;


case 8:{

(FileClose_0.enable=1);
(FileClose_0.ident=FileIdent);
FileClose(&FileClose_0);

if((((unsigned long)(unsigned short)FileClose_0.status==(unsigned long)(unsigned short)0))){
(CSV01.IW.RPS_FileClose_OK=1);
(CSV01.IW.RPS_FileClose_OK_Z=(CSV01.IW.RPS_FileClose_OK_Z+1));
(CSV01.IW.RPS_SAVE_STEP_Nr=0);
}else if((((unsigned long)(unsigned short)FileClose_0.status!=(unsigned long)(unsigned short)65535))){
(CSV01.IW.RPS_FileClose_FehlerNr=FileClose_0.status);
(CSV01.IW.RPS_FileClose_FEHLER_Z=(CSV01.IW.RPS_FileClose_FEHLER_Z+1));
(CSV01.IW.RPS_SAVE_STEP_Nr=0);
}

}break;

}























switch(CSV01.IW.RPS_CPYDEL_STEP_Nr){


case 0:{

if((((unsigned long)(unsigned char)CSV01.SW.RPS_DirDeleteEx_HAND_T==(unsigned long)(unsigned char)1))){
(CSV01.SW.RPS_FileDelete_alt_HAND_T=0);
(CSV01.SW.RPS_FileDelete_neu_HAND_T=0);
(CSV01.IW.RPS_DirDeleteEx_OK=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=9);
}else{
(CSV01.IW.RPS_MemInfo_OK=0);
(CSV01.IW.RPS_DirInfo_OK=0);
(CSV01.IW.RPS_DirRead_OK=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=1);
}



}break;


case 1:{

(DevMemInfo_0.enable=1);
(DevMemInfo_0.pDevice=((unsigned long)(&CSV01.IW.RPS_Device)));
DevMemInfo(&DevMemInfo_0);

if((((unsigned long)(unsigned short)DevMemInfo_0.status==(unsigned long)(unsigned short)0))){
(CSV01.IW.RPS_MemInfo_OK=1);
(CSV01.IW.RPS_Mem_frei=DevMemInfo_0.freemem);
(CSV01.IW.RPS_Mem_gesamt=DevMemInfo_0.memsize);
(CSV01.IW.RPS_Mem_frei_prz=(((1.00000000000000000000E+02)/CheckDivReal((float)CSV01.IW.RPS_Mem_gesamt))*(float)CSV01.IW.RPS_Mem_frei));
(CSV01.IW.RPS_MemInfo_OK_Z=(CSV01.IW.RPS_MemInfo_OK_Z+1));
(CSV01.IW.RPS_CPYDEL_STEP_Nr=2);
}else if((((unsigned long)(unsigned short)DevMemInfo_0.status!=(unsigned long)(unsigned short)65535))){
(CSV01.IW.RPS_Mem_frei=0);
(CSV01.IW.RPS_Mem_gesamt=0);
(CSV01.IW.RPS_MemInfo_FehlerNr=DevMemInfo_0.status);
(CSV01.IW.RPS_MemInfo_FEHLER_Z=(CSV01.IW.RPS_MemInfo_FEHLER_Z+1));
(CSV01.SW.RPS_FileDelete_alt_HAND_T=0);
(CSV01.SW.RPS_FileDelete_neu_HAND_T=0);
(CSV01.SW.PC_FileCopy_alt_HAND_T=0);
(CSV01.SW.PC_FileCopy_neu_HAND_T=0);
(CSV01.SW.EXT_FileCopy_alt_HAND_T=0);
(CSV01.SW.EXT_FileCopy_neu_HAND_T=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}
if((((unsigned long)CSV01.IW.RPS_Mem_frei<(unsigned long)1048576))){
(CSV01.FE.RPS_kein_Speicherplatz=1);
}else{
(CSV01.FE.RPS_kein_Speicherplatz=0);
}

}break;


case 2:{

(DirInfo_0.enable=1);
(DirInfo_0.pDevice=((unsigned long)(&CSV01.IW.RPS_Device)));
(DirInfo_0.pPath=((unsigned long)(&CSV01.IW.RPS_Zielpfad)));
DirInfo(&DirInfo_0);

if((((unsigned long)(unsigned short)DirInfo_0.status==(unsigned long)(unsigned short)0))){
(CSV01.IW.RPS_DirInfo_OK=1);
(CSV01.IW.RPS_DirInfo_FileNum=DirInfo_0.filenum);
(CSV01.IW.RPS_DirInfo_DirNum=DirInfo_0.dirnum);
(CSV01.IW.RPS_DirInfo_OK_Z=(CSV01.IW.RPS_DirInfo_OK_Z+1));
(DirRead_entry=0);
(DirRead_Nr=0);
(DirRead_alt_Date=4294967295);
(DirRead_neu_Date=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=3);
}else if((((unsigned long)(unsigned short)DirInfo_0.status==(unsigned long)(unsigned short)20723))){
(CSV01.IW.RPS_DirInfo_FileNum=0);
(CSV01.IW.RPS_DirInfo_DirNum=0);
(CSV01.IW.RPS_DirRead_Start_OK=1);
__AS__MEMSET(((unsigned long)(&CSV01.IW.File_Name)),0,101);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}else if((((unsigned long)(unsigned short)DirInfo_0.status!=(unsigned long)(unsigned short)65535))){
(CSV01.IW.RPS_DirInfo_FileNum=0);
(CSV01.IW.RPS_DirInfo_DirNum=0);
(CSV01.IW.RPS_DirInfo_FehlerNr=DirInfo_0.status);
(CSV01.IW.RPS_DirInfo_FEHLER_Z=(CSV01.IW.RPS_DirInfo_FEHLER_Z+1));
(CSV01.SW.RPS_FileDelete_alt_HAND_T=0);
(CSV01.SW.RPS_FileDelete_neu_HAND_T=0);
(CSV01.SW.PC_FileCopy_alt_HAND_T=0);
(CSV01.SW.PC_FileCopy_neu_HAND_T=0);
(CSV01.SW.EXT_FileCopy_alt_HAND_T=0);
(CSV01.SW.EXT_FileCopy_neu_HAND_T=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}

}break;



case 3:{

Schleife:;

(DirRead_0.enable=1);
(DirRead_0.pDevice=((unsigned long)(&CSV01.IW.RPS_Device)));
(DirRead_0.pPath=((unsigned long)(&CSV01.IW.RPS_Zielpfad)));
(DirRead_0.entry=DirRead_Nr);
(DirRead_0.option=fiFILE);
(DirRead_0.data_len=300);
(DirRead_0.pData=((unsigned long)(&CSV01.IW.RPS_DirRead_Data)));
DirRead(&DirRead_0);

if((((unsigned long)(unsigned short)DirRead_0.status==(unsigned long)(unsigned short)0))){
(CSV01.IW.RPS_DirRead_OK=1);
(CSV01.IW.RPS_DirRead_OK_Z=(CSV01.IW.RPS_DirRead_OK_Z+1));
if((((unsigned long)DiffDT(CSV01.IW.RPS_DirRead_Data.Date,DirRead_alt_Date)==(unsigned long)4294967295))){
(DirRead_alt_Date=CSV01.IW.RPS_DirRead_Data.Date);
(DirRead_alt_entry=DirRead_Nr);
__AS__MEMSET(((unsigned long)(&CSV01.IW.DirRead_FileName_alt)),0,261);
__AS__STRCPY(((unsigned long)(&CSV01.IW.DirRead_FileName_alt)),((unsigned long)(&CSV01.IW.RPS_DirRead_Data.Filename)));
}
if((((unsigned long)DiffDT(DirRead_neu_Date,CSV01.IW.RPS_DirRead_Data.Date)==(unsigned long)4294967295))){
(DirRead_neu_Date=CSV01.IW.RPS_DirRead_Data.Date);
(DirRead_neu_entry=DirRead_Nr);
__AS__MEMSET(((unsigned long)(&CSV01.IW.DirRead_FileName_neu)),0,261);
__AS__STRCPY(((unsigned long)(&CSV01.IW.DirRead_FileName_neu)),((unsigned long)(&CSV01.IW.RPS_DirRead_Data.Filename)));
}
if((((unsigned long)DirRead_Nr<(unsigned long)(DirInfo_0.filenum-1)))){
(DirRead_Nr=(DirRead_Nr+1));
goto Schleife;
}
}else if((((unsigned long)(unsigned short)DirInfo_0.status==(unsigned long)(unsigned short)20723))){
(CSV01.IW.RPS_DirRead_Start_OK=1);
__AS__MEMSET(((unsigned long)(&CSV01.IW.File_Name)),0,101);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}else if((((unsigned long)(unsigned short)DirRead_0.status!=(unsigned long)(unsigned short)65535))){
if((((unsigned long)(unsigned short)DirRead_0.status!=(unsigned long)(unsigned short)20702))){
(CSV01.IW.RPS_DirRead_FehlerNr=DirRead_0.status);
(CSV01.IW.RPS_DirRead_FEHLER_Z=(CSV01.IW.RPS_DirRead_FEHLER_Z+1));
}
(CSV01.SW.RPS_FileDelete_alt_HAND_T=0);
(CSV01.SW.RPS_FileDelete_neu_HAND_T=0);
(CSV01.SW.PC_FileCopy_alt_HAND_T=0);
(CSV01.SW.PC_FileCopy_neu_HAND_T=0);
(CSV01.SW.EXT_FileCopy_alt_HAND_T=0);
(CSV01.SW.EXT_FileCopy_neu_HAND_T=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}

if(((((unsigned long)(unsigned short)DirRead_0.status==(unsigned long)(unsigned short)0))&(((unsigned long)DirInfo_0.filenum<=(unsigned long)1)))){

(CSV01.IW.RPS_DirRead_Start_OK=1);
if((((unsigned long)(CSV01.SW.RPS_COPY_AUTO_T&CSV01.IW.RPS_COPY_AUTO_Start)==(unsigned long)(unsigned char)1))){
(CSV01.IW.RPS_COPY_AUTO_Start=0);
(CSV01.IW.PC_FileCopy_OK=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=4);
}else if((((unsigned long)(CSV01.SW.PC_DirCopy_HAND_T|CSV01.SW.PC_FileCopy_neu_HAND_T)==(unsigned long)(unsigned char)1))){
(CSV01.IW.RPS_CPYDEL_STEP_Nr=4);
}else if((((unsigned long)(CSV01.SW.EXT_DirCopy_HAND_T|CSV01.SW.EXT_FileCopy_neu_HAND_T)==(unsigned long)(unsigned char)1))){
(CSV01.IW.RPS_CPYDEL_STEP_Nr=5);
}else if((((unsigned long)(unsigned char)CSV01.SW.RPS_FileDelete_neu_HAND_T==(unsigned long)(unsigned char)1))){
(CSV01.IW.RPS_CPYDEL_STEP_Nr=8);
}else{
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}
(CSV01.SW.PC_FileCopy_alt_HAND_T=0);
(CSV01.SW.EXT_FileCopy_alt_HAND_T=0);

}else if(((((unsigned long)(unsigned short)DirRead_0.status==(unsigned long)(unsigned short)0))&(((unsigned long)DirRead_Nr>=(unsigned long)(DirInfo_0.filenum-1))))){

(CSV01.IW.RPS_DirRead_Start_OK=1);
if((((unsigned long)(unsigned char)CSV01.SW.RPS_COPY_AUTO_T==(unsigned long)(unsigned char)1))){
(CSV01.IW.PC_FileCopy_OK=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=4);
}else if(((((unsigned long)(unsigned char)CSV01.SW.RPS_MEMORY_AUTO_T==(unsigned long)(unsigned char)1))&((CSV01.IW.RPS_Mem_frei_prz<=CSV01.SW.RPS_Mem_frei_przN))&((CSV01.SW.RPS_Mem_frei_przN>0)))){
(M_File_neu=0);
(CSV01.IW.RPS_FileDelete_OK=0);
(CSV01.WA.RPS_Datei_alt_geloescht=1);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=8);
}else if((((unsigned long)(CSV01.SW.PC_DirCopy_HAND_T|CSV01.SW.PC_FileCopy_alt_HAND_T|CSV01.SW.PC_FileCopy_neu_HAND_T)==(unsigned long)(unsigned char)1))){
(CSV01.IW.RPS_CPYDEL_STEP_Nr=4);
}else if((((unsigned long)(CSV01.SW.EXT_DirCopy_HAND_T|CSV01.SW.EXT_FileCopy_alt_HAND_T|CSV01.SW.EXT_FileCopy_neu_HAND_T)==(unsigned long)(unsigned char)1))){
(CSV01.IW.RPS_CPYDEL_STEP_Nr=5);
}else if((((unsigned long)(unsigned char)CSV01.SW.RPS_FileDelete_alt_HAND_T==(unsigned long)(unsigned char)1))){
(M_File_neu=0);
(CSV01.IW.RPS_FileDelete_OK=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=8);
}else if((((unsigned long)(unsigned char)CSV01.SW.RPS_FileDelete_neu_HAND_T==(unsigned long)(unsigned char)1))){
(M_File_neu=1);
(CSV01.IW.RPS_FileDelete_OK=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=8);
}else{
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}

}else if((((unsigned long)(unsigned short)DirRead_0.status==(unsigned long)(unsigned short)0))){

(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);

}

}break;


case 4:{

(DevLink_0.enable=1);
(DevLink_0.pDevice=((unsigned long)(&CSV01.IW.PC_Device)));
(DevLink_0.pParam=((unsigned long)(&CSV01.IW.PC_DevLink_Param)));
DevLink(&DevLink_0);

if(((((unsigned long)(unsigned short)DevLink_0.status==(unsigned long)(unsigned short)0))|(((unsigned long)(unsigned short)DevLink_0.status==(unsigned long)(unsigned short)20730)))){
(CSV01.IW.PC_DevLink_OK=1);
(CSV01.IW.PC_DevLink_OK_Z=(CSV01.IW.PC_DevLink_OK_Z+1));
(CSV01.IW.RPS_CPYDEL_STEP_Nr=5);
}else if((((unsigned long)(unsigned short)DevLink_0.status!=(unsigned long)(unsigned short)65535))){
(CSV01.IW.PC_DevLink_FehlerNr=DevLink_0.status);
(CSV01.IW.PC_DevLink_FEHLER_Z=(CSV01.IW.PC_DevLink_FEHLER_Z+1));
(CSV01.SW.PC_FileCopy_neu_HAND_T=0);
(CSV01.SW.PC_FileCopy_alt_HAND_T=0);
(CSV01.SW.PC_DirCopy_HAND_T=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}

}break;



case 5:{

(DirCreate_0.enable=1);
if((((unsigned long)(CSV01.SW.RPS_COPY_AUTO_T|CSV01.SW.PC_DirCopy_HAND_T|CSV01.SW.PC_FileCopy_alt_HAND_T|CSV01.SW.PC_FileCopy_neu_HAND_T)==(unsigned long)(unsigned char)1))){
(DirCreate_0.pDevice=((unsigned long)(&CSV01.IW.PC_Device)));
(DirCreate_0.pName=((unsigned long)(&CSV01.IW.PC_Zielpfad)));
}else if((((unsigned long)(CSV01.SW.EXT_DirCopy_HAND_T|CSV01.SW.EXT_FileCopy_alt_HAND_T|CSV01.SW.EXT_FileCopy_neu_HAND_T)==(unsigned long)(unsigned char)1))){
(DirCreate_0.pDevice=((unsigned long)(&CSV01.IW.EXT_Device)));
(DirCreate_0.pName=((unsigned long)(&CSV01.IW.EXT_Zielpfad)));
}
DirCreate(&DirCreate_0);

if(((((unsigned long)(unsigned short)DirCreate_0.status==(unsigned long)(unsigned short)0))|(((unsigned long)(unsigned short)DirCreate_0.status==(unsigned long)(unsigned short)20725)))){
(CSV01.IW.PC_DirCreate_OK=1);
(CSV01.IW.PC_DirCreate_OK_Z=(CSV01.IW.PC_DirCreate_OK_Z+1));

if((((unsigned long)(unsigned char)CSV01.SW.PC_DirCopy_HAND_T==(unsigned long)(unsigned char)1))){
(CSV01.SW.PC_FileCopy_alt_HAND_T=0);
(CSV01.SW.PC_FileCopy_neu_HAND_T=0);
(CSV01.IW.PC_DirCopy_OK=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=7);
}else if((((unsigned long)(unsigned char)CSV01.SW.PC_FileCopy_alt_HAND_T==(unsigned long)(unsigned char)1))){
(M_File_neu=0);
(CSV01.IW.PC_FileCopy_OK=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=6);
}else if((((unsigned long)(unsigned char)CSV01.SW.PC_FileCopy_neu_HAND_T==(unsigned long)(unsigned char)1))){
(M_File_neu=1);
(CSV01.IW.PC_FileCopy_OK=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=6);
}else if((((unsigned long)(unsigned char)CSV01.SW.EXT_DirCopy_HAND_T==(unsigned long)(unsigned char)1))){
(CSV01.SW.EXT_FileCopy_alt_HAND_T=0);
(CSV01.SW.EXT_FileCopy_neu_HAND_T=0);
(CSV01.IW.EXT_DirCopy_OK=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=7);
}else if((((unsigned long)(unsigned char)CSV01.SW.EXT_FileCopy_alt_HAND_T==(unsigned long)(unsigned char)1))){
(M_File_neu=0);
(CSV01.IW.EXT_FileCopy_OK=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=6);
}else if((((unsigned long)(unsigned char)CSV01.SW.EXT_FileCopy_neu_HAND_T==(unsigned long)(unsigned char)1))){
(M_File_neu=1);
(CSV01.IW.EXT_FileCopy_OK=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=6);
}else if((((unsigned long)(unsigned char)CSV01.SW.RPS_COPY_AUTO_T==(unsigned long)(unsigned char)1))){
(M_File_neu=0);
(CSV01.IW.PC_FileCopy_OK=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=6);
}else{
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}

}else if((((unsigned long)(unsigned short)DirCreate_0.status!=(unsigned long)(unsigned short)65535))){
if((((unsigned long)(CSV01.SW.PC_DirCopy_HAND_T|CSV01.SW.PC_FileCopy_alt_HAND_T|CSV01.SW.PC_FileCopy_neu_HAND_T)==(unsigned long)(unsigned char)1))){
(CSV01.IW.PC_DirCreate_FehlerNr=DirCreate_0.status);
(CSV01.IW.PC_DirCreate_FEHLER_Z=(CSV01.IW.PC_DirCreate_FEHLER_Z+1));
(CSV01.SW.PC_FileCopy_alt_HAND_T=0);
(CSV01.SW.PC_FileCopy_neu_HAND_T=0);
(CSV01.SW.PC_DirCopy_HAND_T=0);
}else if((((unsigned long)(CSV01.SW.EXT_DirCopy_HAND_T|CSV01.SW.EXT_FileCopy_alt_HAND_T|CSV01.SW.EXT_FileCopy_neu_HAND_T)==(unsigned long)(unsigned char)1))){
(CSV01.IW.EXT_DirCreate_FehlerNr=DirCreate_0.status);
(CSV01.IW.EXT_DirCreate_FEHLER_Z=(CSV01.IW.EXT_DirCreate_FEHLER_Z+1));
(CSV01.SW.EXT_FileCopy_alt_HAND_T=0);
(CSV01.SW.EXT_FileCopy_neu_HAND_T=0);
(hmiButtons.DatenaufzeichnungAufUsb=0);
(CSV01.SW.EXT_DirCopy_HAND_T=0);
}
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}

}break;


case 6:{

if((((unsigned long)(unsigned char)M_File_neu==(unsigned long)(unsigned char)1))){
__AS__MEMSET(((unsigned long)(&Str_RPS_File_Name)),0,301);
__AS__STRCPY(((unsigned long)(&Str_RPS_File_Name)),((unsigned long)(&CSV01.IW.RPS_Zielpfad)));
__AS__STRCAT(((unsigned long)(&Str_RPS_File_Name)),((unsigned long)(&"/")));
__AS__STRCAT(((unsigned long)(&Str_RPS_File_Name)),((unsigned long)(&CSV01.IW.DirRead_FileName_neu)));
__AS__MEMSET(((unsigned long)(&Str_Ziel_File_Name)),0,301);
if((((unsigned long)(unsigned char)CSV01.SW.PC_FileCopy_neu_HAND_T==(unsigned long)(unsigned char)1))){
__AS__STRCPY(((unsigned long)(&Str_Ziel_File_Name)),((unsigned long)(&CSV01.IW.PC_Zielpfad)));
__AS__STRCAT(((unsigned long)(&Str_Ziel_File_Name)),((unsigned long)(&"/")));
__AS__STRCAT(((unsigned long)(&Str_Ziel_File_Name)),((unsigned long)(&CSV01.IW.DirRead_FileName_neu)));
}else if((((unsigned long)(unsigned char)CSV01.SW.EXT_FileCopy_neu_HAND_T==(unsigned long)(unsigned char)1))){
__AS__STRCPY(((unsigned long)(&Str_Ziel_File_Name)),((unsigned long)(&CSV01.IW.EXT_Zielpfad)));
__AS__STRCAT(((unsigned long)(&Str_Ziel_File_Name)),((unsigned long)(&"/")));
__AS__STRCAT(((unsigned long)(&Str_Ziel_File_Name)),((unsigned long)(&CSV01.IW.DirRead_FileName_neu)));
}
}else{
__AS__MEMSET(((unsigned long)(&Str_RPS_File_Name)),0,301);
__AS__STRCPY(((unsigned long)(&Str_RPS_File_Name)),((unsigned long)(&CSV01.IW.RPS_Zielpfad)));
__AS__STRCAT(((unsigned long)(&Str_RPS_File_Name)),((unsigned long)(&"/")));
__AS__STRCAT(((unsigned long)(&Str_RPS_File_Name)),((unsigned long)(&CSV01.IW.DirRead_FileName_alt)));
__AS__MEMSET(((unsigned long)(&Str_Ziel_File_Name)),0,301);
if((((unsigned long)(CSV01.SW.RPS_COPY_AUTO_T|CSV01.SW.PC_FileCopy_alt_HAND_T)==(unsigned long)(unsigned char)1))){
__AS__STRCPY(((unsigned long)(&Str_Ziel_File_Name)),((unsigned long)(&CSV01.IW.PC_Zielpfad)));
__AS__STRCAT(((unsigned long)(&Str_Ziel_File_Name)),((unsigned long)(&"/")));
__AS__STRCAT(((unsigned long)(&Str_Ziel_File_Name)),((unsigned long)(&CSV01.IW.DirRead_FileName_alt)));
}else if((((unsigned long)(unsigned char)CSV01.SW.EXT_FileCopy_alt_HAND_T==(unsigned long)(unsigned char)1))){
__AS__STRCPY(((unsigned long)(&Str_Ziel_File_Name)),((unsigned long)(&CSV01.IW.EXT_Zielpfad)));
__AS__STRCAT(((unsigned long)(&Str_Ziel_File_Name)),((unsigned long)(&"/")));
__AS__STRCAT(((unsigned long)(&Str_Ziel_File_Name)),((unsigned long)(&CSV01.IW.DirRead_FileName_alt)));
}
}

(FileCopy_0.enable=1);
(FileCopy_0.pSrcDev=((unsigned long)(&CSV01.IW.RPS_Device)));
(FileCopy_0.pSrc=((unsigned long)(&Str_RPS_File_Name)));
if((((unsigned long)(CSV01.SW.RPS_COPY_AUTO_T|CSV01.SW.PC_FileCopy_neu_HAND_T|CSV01.SW.PC_FileCopy_alt_HAND_T)==(unsigned long)(unsigned char)1))){
(FileCopy_0.pDestDev=((unsigned long)(&CSV01.IW.PC_Device)));
}else if((((unsigned long)(CSV01.SW.EXT_FileCopy_neu_HAND_T|CSV01.SW.EXT_FileCopy_alt_HAND_T)==(unsigned long)(unsigned char)1))){
(FileCopy_0.pDestDev=((unsigned long)(&CSV01.IW.EXT_Device)));
}
(FileCopy_0.pDest=((unsigned long)(&Str_Ziel_File_Name)));
(FileCopy_0.option=fiOVERWRITE);
FileCopy(&FileCopy_0);

if((((unsigned long)(unsigned short)FileCopy_0.status==(unsigned long)(unsigned short)0))){
(CSV01.IW.PC_FileCopy_OK=1);
if((((unsigned long)(CSV01.SW.PC_FileCopy_neu_HAND_T|CSV01.SW.PC_FileCopy_alt_HAND_T)==(unsigned long)(unsigned char)1))){
(CSV01.IW.PC_FileCopy_OK_Z=(CSV01.IW.PC_FileCopy_OK_Z+1));
(CSV01.SW.PC_FileCopy_alt_HAND_T=0);
(CSV01.SW.PC_FileCopy_neu_HAND_T=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}else if((((unsigned long)(CSV01.SW.EXT_FileCopy_neu_HAND_T|CSV01.SW.EXT_FileCopy_alt_HAND_T)==(unsigned long)(unsigned char)1))){
(CSV01.IW.EXT_FileCopy_OK_Z=(CSV01.IW.EXT_FileCopy_OK_Z+1));
(CSV01.SW.EXT_FileCopy_alt_HAND_T=0);
(CSV01.SW.EXT_FileCopy_neu_HAND_T=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}else if(((((unsigned long)(unsigned char)CSV01.SW.RPS_COPY_AUTO_T==(unsigned long)(unsigned char)1))&(((unsigned long)DirInfo_0.filenum>(unsigned long)1)))){
(CSV01.IW.PC_FileCopy_OK_Z=(CSV01.IW.PC_FileCopy_OK_Z+1));
(CSV01.IW.RPS_CPYDEL_STEP_Nr=8);
}else{
(CSV01.IW.PC_FileCopy_OK_Z=(CSV01.IW.PC_FileCopy_OK_Z+1));
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}
}else if((((unsigned long)(unsigned short)FileCopy_0.status!=(unsigned long)(unsigned short)65535))){
if((((unsigned long)(CSV01.SW.RPS_COPY_AUTO_T|CSV01.SW.PC_FileCopy_neu_HAND_T|CSV01.SW.PC_FileCopy_alt_HAND_T)==(unsigned long)(unsigned char)1))){
(CSV01.IW.PC_FileCopy_FehlerNr=FileCopy_0.status);
(CSV01.IW.PC_FileCopy_FEHLER_Z=(CSV01.IW.PC_FileCopy_FEHLER_Z+1));
(CSV01.SW.PC_FileCopy_alt_HAND_T=0);
(CSV01.SW.PC_FileCopy_neu_HAND_T=0);
}else if((((unsigned long)(CSV01.SW.EXT_FileCopy_neu_HAND_T|CSV01.SW.EXT_FileCopy_alt_HAND_T)==(unsigned long)(unsigned char)1))){
(CSV01.IW.EXT_FileCopy_FehlerNr=FileCopy_0.status);
(CSV01.IW.EXT_FileCopy_FEHLER_Z=(CSV01.IW.EXT_FileCopy_FEHLER_Z+1));
(CSV01.SW.EXT_FileCopy_alt_HAND_T=0);
(CSV01.SW.EXT_FileCopy_neu_HAND_T=0);
}
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}

}break;


case 7:{

(DirCopy_0.enable=1);
(DirCopy_0.pSrcDev=((unsigned long)(&CSV01.IW.RPS_Device)));
(DirCopy_0.pSrcDir=((unsigned long)(&CSV01.IW.RPS_Zielpfad)));
if((((unsigned long)(unsigned char)CSV01.SW.PC_DirCopy_HAND_T==(unsigned long)(unsigned char)1))){
(DirCopy_0.pDestDev=((unsigned long)(&CSV01.IW.PC_Device)));
(DirCopy_0.pDestDir=((unsigned long)(&CSV01.IW.PC_Zielpfad)));
}else if((((unsigned long)(unsigned char)CSV01.SW.EXT_DirCopy_HAND_T==(unsigned long)(unsigned char)1))){
(DirCopy_0.pDestDev=((unsigned long)(&CSV01.IW.EXT_Device)));
(DirCopy_0.pDestDir=((unsigned long)(&CSV01.IW.EXT_Zielpfad)));
}
(DirCopy_0.option=fiRECURSIVE);
DirCopy(&DirCopy_0);

if(((((unsigned long)(unsigned char)CSV01.SW.PC_DirCopy_HAND_T==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)CSV01.SW.EXT_DirCopy_HAND_T==(unsigned long)(unsigned char)0)))){
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}

if((((unsigned long)(unsigned short)DirCopy_0.status==(unsigned long)(unsigned short)0))){
if((((unsigned long)(unsigned char)CSV01.SW.PC_DirCopy_HAND_T==(unsigned long)(unsigned char)1))){
(CSV01.IW.PC_DirCopy_OK=1);
(CSV01.IW.PC_DirCopy_OK_Z=(CSV01.IW.PC_DirCopy_OK_Z+1));
(CSV01.SW.PC_DirCopy_HAND_T=0);
(CSV01.SW.PC_FileCopy_alt_HAND_T=0);
(CSV01.SW.PC_FileCopy_neu_HAND_T=0);
}else if((((unsigned long)(unsigned char)CSV01.SW.EXT_DirCopy_HAND_T==(unsigned long)(unsigned char)1))){
(CSV01.IW.EXT_DirCopy_OK=1);
(CSV01.IW.EXT_DirCopy_OK_Z=(CSV01.IW.EXT_DirCopy_OK_Z+1));
(hmiButtons.DatenaufzeichnungAufUsb=0);
(CSV01.SW.EXT_DirCopy_HAND_T=0);
(CSV01.SW.EXT_FileCopy_alt_HAND_T=0);
(CSV01.SW.EXT_FileCopy_neu_HAND_T=0);
}
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}else if((((unsigned long)(unsigned short)DirCopy_0.status!=(unsigned long)(unsigned short)65535))){
if((((unsigned long)(unsigned char)CSV01.SW.PC_DirCopy_HAND_T==(unsigned long)(unsigned char)1))){
(CSV01.IW.PC_DirCopy_FehlerNr=DirCopy_0.status);
(CSV01.IW.PC_DirCopy_FEHLER_Z=(CSV01.IW.PC_DirCopy_FEHLER_Z+1));
(CSV01.SW.PC_DirCopy_HAND_T=0);
(CSV01.SW.PC_FileCopy_alt_HAND_T=0);
(CSV01.SW.PC_FileCopy_neu_HAND_T=0);
}else if((((unsigned long)(unsigned char)CSV01.SW.EXT_DirCopy_HAND_T==(unsigned long)(unsigned char)1))){
(CSV01.IW.EXT_DirCopy_FehlerNr=DirCopy_0.status);
(CSV01.IW.EXT_DirCopy_FEHLER_Z=(CSV01.IW.EXT_DirCopy_FEHLER_Z+1));
(hmiButtons.DatenaufzeichnungAufUsb=0);
(CSV01.SW.EXT_DirCopy_HAND_T=0);
(CSV01.SW.EXT_FileCopy_alt_HAND_T=0);
(CSV01.SW.EXT_FileCopy_neu_HAND_T=0);
}
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}

}break;


case 8:{

if((((unsigned long)(unsigned char)M_File_neu==(unsigned long)(unsigned char)1))){
__AS__MEMSET(((unsigned long)(&Str_RPS_File_Name)),0,301);
__AS__STRCPY(((unsigned long)(&Str_RPS_File_Name)),((unsigned long)(&CSV01.IW.RPS_Zielpfad)));
__AS__STRCAT(((unsigned long)(&Str_RPS_File_Name)),((unsigned long)(&"/")));
__AS__STRCAT(((unsigned long)(&Str_RPS_File_Name)),((unsigned long)(&CSV01.IW.DirRead_FileName_neu)));
}else{
__AS__MEMSET(((unsigned long)(&Str_RPS_File_Name)),0,301);
__AS__STRCPY(((unsigned long)(&Str_RPS_File_Name)),((unsigned long)(&CSV01.IW.RPS_Zielpfad)));
__AS__STRCAT(((unsigned long)(&Str_RPS_File_Name)),((unsigned long)(&"/")));
__AS__STRCAT(((unsigned long)(&Str_RPS_File_Name)),((unsigned long)(&CSV01.IW.DirRead_FileName_alt)));
}

(FileDelete_0.enable=1);
(FileDelete_0.pDevice=((unsigned long)(&CSV01.IW.RPS_Device)));
(FileDelete_0.pName=((unsigned long)(&Str_RPS_File_Name)));
FileDelete(&FileDelete_0);

if((((unsigned long)(unsigned short)FileDelete_0.status==(unsigned long)(unsigned short)0))){
(CSV01.IW.RPS_FileDelete_OK=1);
(CSV01.IW.RPS_FileDelete_OK_Z=(CSV01.IW.RPS_FileDelete_OK_Z+1));
(CSV01.SW.RPS_FileDelete_alt_HAND_T=0);
(CSV01.SW.RPS_FileDelete_neu_HAND_T=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}else if((((unsigned long)(unsigned short)FileDelete_0.status!=(unsigned long)(unsigned short)65535))){
(CSV01.IW.RPS_FileDelete_FehlerNr=FileDelete_0.status);
(CSV01.IW.RPS_FileDelete_FEHLER_Z=(CSV01.IW.RPS_FileDelete_FEHLER_Z+1));
(CSV01.SW.RPS_FileDelete_alt_HAND_T=0);
(CSV01.SW.RPS_FileDelete_neu_HAND_T=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}

}break;


case 9:{

(DirDeleteEx_0.enable=1);
(DirDeleteEx_0.pDevice=((unsigned long)(&CSV01.IW.RPS_Device)));
(DirDeleteEx_0.pName=((unsigned long)(&CSV01.IW.RPS_Zielpfad)));
DirDeleteEx(&DirDeleteEx_0);

if((((unsigned long)(unsigned char)CSV01.SW.RPS_DirDeleteEx_HAND_T==(unsigned long)(unsigned char)0))){
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}
if((((unsigned long)(unsigned short)DirDeleteEx_0.status==(unsigned long)(unsigned short)0))){
(CSV01.IW.RPS_DirDeleteEx_OK=1);
(CSV01.IW.RPS_FileWrite_OK_Z=0);
(CSV01.IW.RPS_DirDeleteEx_OK_Z=(CSV01.IW.RPS_DirDeleteEx_OK_Z+1));
(CSV01.SW.RPS_DirDeleteEx_HAND_T=0);
(CSV01.SW.RPS_FileDelete_alt_HAND_T=0);
(CSV01.SW.RPS_FileDelete_neu_HAND_T=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}else if((((unsigned long)(unsigned short)DirDeleteEx_0.status!=(unsigned long)(unsigned short)65535))){
(CSV01.IW.RPS_DirDeleteEx_FehlerNr=DirDeleteEx_0.status);
(CSV01.IW.RPS_DirDeleteEx_FEHLER_Z=(CSV01.IW.RPS_DirDeleteEx_FEHLER_Z+1));
(CSV01.SW.RPS_DirDeleteEx_HAND_T=0);
(CSV01.SW.RPS_FileDelete_alt_HAND_T=0);
(CSV01.SW.RPS_FileDelete_neu_HAND_T=0);
(CSV01.IW.RPS_CPYDEL_STEP_Nr=0);
}

}break;

}

(InitOK=1);


}
#line 1738 "C:/SharedFolder/CControl_Gschneitner/Logical/CSV/CSV01_PRG/CSV01_PRGCyclic.nodebug"

void __AS__ImplInitCSV01_PRGCyclic_ab(void){}

unsigned long __AS__MEMCPY(unsigned long pDest, unsigned long pSrc, unsigned long length)
{memcpy((char*)pDest, (char*)pSrc, length); return pDest + length;}

unsigned long __AS__MEMSET(unsigned long pDest, unsigned char value, unsigned long length)
{memset((char*)pDest, value, length); return pDest + length;}

unsigned long __AS__STRCAT(unsigned long pDest, unsigned long pSrc)
{strcat((char*)pDest, (char*)pSrc); return pDest + strlen((char*)pDest);}

unsigned long __AS__STRCPY(unsigned long pDest, unsigned long pSrc)
{strcpy((char*)pDest, (char*)pSrc); return pDest + strlen((char*)pDest);}

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
__asm__(".ascii \"iecfile \\\"Logical/CSV/CSV01_PRG/CSV01_PRG.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/CSV01_PRG/CSV01_PRGCyclic.ab.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/CSV01_PRG/CSV01_PRGCyclic.ab.c\\\" \\\"C:/SharedFolder/CControl_Gschneitner/Logical/CSV/CSV01_PRG/CSV01_PRGCyclic.ab\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Temp/Objects/4_07/4PPC30_0702_21B/CSV01_PRG/CSV01_PRGCyclic.ab.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".previous");

__asm__(".section \".plciec\"");
__asm__(".ascii \"plcdata_const 'CSV_DatObj1'\\n\"");
__asm__(".ascii \"plcdata_const 'CSV_DatObj2'\\n\"");
__asm__(".ascii \"plcdata_const 'Datei_Ende'\\n\"");
__asm__(".ascii \"plcdata_const 'Datensatz'\\n\"");
__asm__(".ascii \"plcdata_const 'M_Tag_ID'\\n\"");
__asm__(".ascii \"plcdata_const 'Str_date'\\n\"");
__asm__(".ascii \"plcdata_const 'Str_Min'\\n\"");
__asm__(".ascii \"plcdata_const 'Str_Nachkomma'\\n\"");
__asm__(".ascii \"plcdata_const 'Str_QM_timestamp'\\n\"");
__asm__(".ascii \"plcdata_const 'Str_RPS_File_Name'\\n\"");
__asm__(".ascii \"plcdata_const 'Str_Sek'\\n\"");
__asm__(".ascii \"plcdata_const 'Str_Std'\\n\"");
__asm__(".ascii \"plcdata_const 'Str_Stellen'\\n\"");
__asm__(".ascii \"plcdata_const 'Str_timestamp'\\n\"");
__asm__(".ascii \"plcdata_const 'Str_Ziel_File_Name'\\n\"");
__asm__(".ascii \"plcdata_const 'StrWork'\\n\"");
__asm__(".ascii \"plcdata_const 'Wert_DINT'\\n\"");
__asm__(".ascii \"plcdata_const 'Wert_INT'\\n\"");
__asm__(".ascii \"plcdata_const 'Wert_REAL'\\n\"");
__asm__(".ascii \"plcdata_const 'Wert_SINT'\\n\"");
__asm__(".ascii \"plcdata_const 'Wert_STRING'\\n\"");
__asm__(".ascii \"plcdata_const 'Wert_UDINT'\\n\"");
__asm__(".ascii \"plcdata_const 'Wert_UINT'\\n\"");
__asm__(".ascii \"plcdata_const 'Wert_USINT'\\n\"");
__asm__(".ascii \"plcdata_const 'CSV01'\\n\"");
__asm__(".ascii \"plcdata_const 'fiRECURSIVE'\\n\"");
__asm__(".ascii \"plcdata_const 'fiOVERWRITE'\\n\"");
__asm__(".ascii \"plcdata_const 'fiREAD_WRITE'\\n\"");
__asm__(".ascii \"plcdata_const 'fiFILE'\\n\"");
__asm__(".previous");
