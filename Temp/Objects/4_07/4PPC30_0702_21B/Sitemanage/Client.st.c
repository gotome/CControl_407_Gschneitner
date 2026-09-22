#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/Sitemanage/Clientst.h"
#line 1 "C:/SharedFolder/CControl_Gschneitner/Logical/Sitemanager/Sitemanager/Client.nodebug"
#line 7 "C:/SharedFolder/CControl_Gschneitner/Logical/Sitemanager/Sitemanager/Client.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){int __AS__Local0_00000;plcstring* __AS__Local3_00000;plcstring* __AS__Local4_00000;{


(loc_EMailAlarmierungEin=Betriebsparameter.Fernalarmierung.EMailAlarmierungEin);
__AS__Local3_00000=(plcstring*)EMail[0]; __AS__Local4_00000=(plcstring*)Betriebsparameter.Fernalarmierung.MailAdresse[0]; for(__AS__Local0_00000=0; __AS__Local0_00000<80l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
__AS__Local3_00000=(plcstring*)EMail[1]; __AS__Local4_00000=(plcstring*)Betriebsparameter.Fernalarmierung.MailAdresse[1]; for(__AS__Local0_00000=0; __AS__Local0_00000<80l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
__AS__Local3_00000=(plcstring*)EMail[2]; __AS__Local4_00000=(plcstring*)Betriebsparameter.Fernalarmierung.MailAdresse[2]; for(__AS__Local0_00000=0; __AS__Local0_00000<80l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
__AS__Local3_00000=(plcstring*)EMail[3]; __AS__Local4_00000=(plcstring*)Betriebsparameter.Fernalarmierung.MailAdresse[3]; for(__AS__Local0_00000=0; __AS__Local0_00000<80l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;



if((((unsigned long)VC_HANDLE==(unsigned long)0))){
(VC_HANDLE=VA_Setup(1,"Visu"));
}

if(hmiButtons.QuitFehler){
(loc_FehlerAusgelesen=0);
}

if((gStatusAnlage.Fehler.SummeFehler&(loc_FehlerAusgelesen^1)&loc_EMailAlarmierungEin)){
(Access_Status=VA_Saccess(1,VC_HANDLE));
if((((unsigned long)(unsigned short)Access_Status==(unsigned long)(unsigned short)0))){
(AlarmLen=80);
(cSeparator=45);
(uiAlarmType=1);
(cDateTimeFormat=6);

(GetActAlarmList_Status=VA_GetActAlarmList(1,VC_HANDLE,((unsigned long)(&AlarmString)),((unsigned long)(&AlarmLen)),uiAlarmType,cSeparator,cDateTimeFormat));

if((((unsigned long)(unsigned short)GetActAlarmList_Status==(unsigned long)(unsigned short)0))){
(loc_FehlerAusgelesen=1);
__AS__Local3_00000=(plcstring*)EMailText; __AS__Local4_00000=(plcstring*)AlarmString; for(__AS__Local0_00000=0; __AS__Local0_00000<80l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(Send=1);
}
VA_Srelease(1,VC_HANDLE);
}
}


(IP_ADRESS=((unsigned long)(&Betriebsparameter.Allgemein.DefaultGateway)));

(IP_PORT=26864);

__AS__Local3_00000=(plcstring*)Sendstring; __AS__Local4_00000=(plcstring*)SLASH; for(__AS__Local0_00000=0; __AS__Local0_00000<1l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(UseComma=0);
__AS__Local3_00000=(plcstring*)CommaString; __AS__Local4_00000=(plcstring*)""; for(__AS__Local0_00000=0; __AS__Local0_00000<0l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;


if(((__AS__STRING_CMP(EMail[0],"")!=0))){
__AS__Local3_00000=(plcstring*)resultString; __AS__Local4_00000=(plcstring*)CONCAT(LEFTBRACKET,EMail[0]); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
if((((__AS__STRING_CMP(EMail[1],"")==0))&((__AS__STRING_CMP(EMail[2],"")==0))&((__AS__STRING_CMP(EMail[3],"")==0)))){
__AS__Local3_00000=(plcstring*)resultString; __AS__Local4_00000=(plcstring*)CONCAT(resultString,RIGHTBRACKET); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}

__AS__Local3_00000=(plcstring*)Sendstring; __AS__Local4_00000=(plcstring*)CONCAT(Sendstring,resultString); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(UseComma=1);
}

if(((__AS__STRING_CMP(EMail[1],"")!=0))){
if(UseComma){
__AS__Local3_00000=(plcstring*)CommaString; __AS__Local4_00000=(plcstring*)COMMA; for(__AS__Local0_00000=0; __AS__Local0_00000<1l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
__AS__Local3_00000=(plcstring*)resultString; __AS__Local4_00000=(plcstring*)COMMA; for(__AS__Local0_00000=0; __AS__Local0_00000<1l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}
__AS__Local3_00000=(plcstring*)resultString; __AS__Local4_00000=(plcstring*)CONCAT(resultString,EMail[1]); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
if((((__AS__STRING_CMP(EMail[2],"")==0))&((__AS__STRING_CMP(EMail[3],"")==0)))){
__AS__Local3_00000=(plcstring*)resultString; __AS__Local4_00000=(plcstring*)CONCAT(resultString,RIGHTBRACKET); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}

__AS__Local3_00000=(plcstring*)Sendstring; __AS__Local4_00000=(plcstring*)CONCAT(Sendstring,resultString); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(UseComma=1);
}

if(((__AS__STRING_CMP(EMail[2],"")!=0))){
if(UseComma){
__AS__Local3_00000=(plcstring*)CommaString; __AS__Local4_00000=(plcstring*)COMMA; for(__AS__Local0_00000=0; __AS__Local0_00000<1l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
__AS__Local3_00000=(plcstring*)resultString; __AS__Local4_00000=(plcstring*)COMMA; for(__AS__Local0_00000=0; __AS__Local0_00000<1l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}
__AS__Local3_00000=(plcstring*)resultString; __AS__Local4_00000=(plcstring*)CONCAT(resultString,EMail[2]); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
if(((__AS__STRING_CMP(EMail[3],"")==0))){
__AS__Local3_00000=(plcstring*)resultString; __AS__Local4_00000=(plcstring*)CONCAT(resultString,RIGHTBRACKET); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}

__AS__Local3_00000=(plcstring*)Sendstring; __AS__Local4_00000=(plcstring*)CONCAT(Sendstring,resultString); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(UseComma=1);
}

if(((__AS__STRING_CMP(EMail[3],"")!=0))){
if(UseComma){
__AS__Local3_00000=(plcstring*)CommaString; __AS__Local4_00000=(plcstring*)COMMA; for(__AS__Local0_00000=0; __AS__Local0_00000<1l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
__AS__Local3_00000=(plcstring*)resultString; __AS__Local4_00000=(plcstring*)COMMA; for(__AS__Local0_00000=0; __AS__Local0_00000<1l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}
__AS__Local3_00000=(plcstring*)resultString; __AS__Local4_00000=(plcstring*)CONCAT(resultString,EMail[3]); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
__AS__Local3_00000=(plcstring*)resultString; __AS__Local4_00000=(plcstring*)CONCAT(resultString,RIGHTBRACKET); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
__AS__Local3_00000=(plcstring*)Sendstring; __AS__Local4_00000=(plcstring*)CONCAT(Sendstring,resultString); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(UseComma=1);
}

__AS__Local3_00000=(plcstring*)Sendstring; __AS__Local4_00000=(plcstring*)CONCAT(Sendstring,SLASH); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;

__AS__Local3_00000=(plcstring*)Sendstring; __AS__Local4_00000=(plcstring*)CONCAT(Sendstring,EMailText); for(__AS__Local0_00000=0; __AS__Local0_00000<255l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;


switch(Client.sStep){


case 0:{if(Send){
(ErrNr=0);
__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)""; for(__AS__Local0_00000=0; __AS__Local0_00000<0l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(Client.sStep=1);
}



}break;case 1:{(Client.TcpOpen_0.enable=1);
(Client.TcpOpen_0.pIfAddr=0);
(Client.TcpOpen_0.port=26864);
(Client.TcpOpen_0.options=0);
TcpOpen(&Client.TcpOpen_0);

if((((unsigned long)(unsigned short)Client.TcpOpen_0.status==(unsigned long)(unsigned short)0))){
(Client.sStep=5);
}else if((((unsigned long)(unsigned short)Client.TcpOpen_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){

}else{
(ErrNr=Client.TcpOpen_0.status);
(Client.sStep=100);
}



}break;case 5:{(Client.linger_opt.lLinger=0);
(Client.linger_opt.lOnOff=1);

(Client.TcpIoctl_0.enable=1);
(Client.TcpIoctl_0.ident=Client.TcpOpen_0.ident);
(Client.TcpIoctl_0.ioctl=tcpSO_LINGER_SET);
(Client.TcpIoctl_0.pData=((unsigned long)(&Client.linger_opt)));
(Client.TcpIoctl_0.datalen=8);
TcpIoctl(&Client.TcpIoctl_0);

if((((unsigned long)(unsigned short)Client.TcpIoctl_0.status==(unsigned long)(unsigned short)0))){
(Client.sStep=10);
}else if((((unsigned long)(unsigned short)Client.TcpIoctl_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){

}else{
(ErrNr=Client.TcpIoctl_0.status);
(Client.sStep=100);
}


}break;case 10:{
(Client.TcpClient_0.enable=1);
(Client.TcpClient_0.ident=Client.TcpOpen_0.ident);
(Client.TcpClient_0.portserv=IP_PORT);
(Client.TcpClient_0.pServer=IP_ADRESS);
TcpClient(&Client.TcpClient_0);

if((((unsigned long)(unsigned short)Client.TcpClient_0.status==(unsigned long)(unsigned short)0))){
(Client.sStep=20);
}else if((((unsigned long)(unsigned short)Client.TcpClient_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){

}else if((((unsigned long)(unsigned short)Client.TcpClient_0.status==(unsigned long)(unsigned short)tcpERR_INVALID))){
(ErrNr=Client.TcpClient_0.status);
__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_INVALID, Fehler Verbindungsaufbau"; for(__AS__Local0_00000=0; __AS__Local0_00000<37l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
(Client.sStep=40);
}else{
(ErrNr=Client.TcpClient_0.status);
(Client.sStep=100);
}

}break;case 20:{
(Client.TcpSend_0.enable=1);
(Client.TcpSend_0.ident=Client.TcpOpen_0.ident);
(Client.TcpSend_0.pData=((unsigned long)(&Sendstring)));
(Client.TcpSend_0.datalen=LEN(Sendstring));
(Client.TcpSend_0.flags=0);
TcpSend(&Client.TcpSend_0);

if((((unsigned long)(unsigned short)Client.TcpSend_0.status==(unsigned long)(unsigned short)0))){
(Client.sStep=40);
}else if((((unsigned long)(unsigned short)Client.TcpSend_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){

}else if(((((unsigned long)(unsigned short)Client.TcpSend_0.status==(unsigned long)(unsigned short)tcpERR_SENTLEN))|(((unsigned long)(unsigned short)Client.TcpSend_0.status==(unsigned long)(unsigned short)tcpERR_NOT_CONNECTED)))){
switch(Client.TcpSend_0.status){
case 32606:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_SENTLEN Die, übernommene Datenlänge entspricht nicht der angegebenen Datenlänge."; for(__AS__Local0_00000=0; __AS__Local0_00000<80l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 32609:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_NOT_CONNECTED, Die Verbindung wurde beendet (Gegenstelle)."; for(__AS__Local0_00000=0; __AS__Local0_00000<62l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;}
(ErrNr=Client.TcpSend_0.status);
(Client.sStep=40);
}else{
(ErrNr=Client.TcpSend_0.status);
(Client.sStep=100);
}

}break;case 40:{
(Client.TcpClose_0.enable=1);
(Client.TcpClose_0.ident=Client.TcpOpen_0.ident);
(Client.TcpClose_0.how=0);
TcpClose(&Client.TcpClose_0);

if((((unsigned long)(unsigned short)Client.TcpClose_0.status==(unsigned long)(unsigned short)0))){
(Client.sStep=0);
(Send=0);
}else if((((unsigned long)(unsigned short)Client.TcpClose_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){

}else{
(ErrNr=Client.TcpClose_0.status);
(Client.sStep=100);
}


}break;case 100:{
switch(ErrNr){
case 32600:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_INVALID_IDENT Der angegebene Ident ist nicht zulässig."; for(__AS__Local0_00000=0; __AS__Local0_00000<58l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 32601:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_NOMORE_IDENTS, Es konnte kein weiterer Ident reserviert werden."; for(__AS__Local0_00000=0; __AS__Local0_00000<67l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 32602:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_ALREADY_EXIST, Es existiert bereits ein Socket, der auf diese Portnummer"; for(__AS__Local0_00000=0; __AS__Local0_00000<76l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 32603:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_PARAMETER, Ungültige Parameter."; for(__AS__Local0_00000=0; __AS__Local0_00000<35l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 32604:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_INVALID_IOCTL, Ungültiges IO-Control."; for(__AS__Local0_00000=0; __AS__Local0_00000<41l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 32606:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_SENTLEN Die, übernommene Datenlänge entspricht nicht der angegebenen Datenlänge."; for(__AS__Local0_00000=0; __AS__Local0_00000<80l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 32607:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_WOULDBLOCK, Daten konnten nicht in den Sendepuffer des Sockets übernommen werden."; for(__AS__Local0_00000=0; __AS__Local0_00000<80l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 32608:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_INVALID, Fehler Verbindungsaufbau"; for(__AS__Local0_00000=0; __AS__Local0_00000<37l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 32609:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_NOT_CONNECTED, Die Verbindung wurde beendet (Gegenstelle)."; for(__AS__Local0_00000=0; __AS__Local0_00000<62l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 32650:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_SOCKET_CREATE, Ressourcenproblem im System. Es konnte kein Socket mehr angelegt werden."; for(__AS__Local0_00000=0; __AS__Local0_00000<80l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 32651:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_SOCKET_BIND, Problem beim Binden an die Portnummer bzw. an die ermittelte Ip-Adresse"; for(__AS__Local0_00000=0; __AS__Local0_00000<80l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 32612:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_INTERFACE, Die angegebene Interface-Adresse ist ungültig."; for(__AS__Local0_00000=0; __AS__Local0_00000<61l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 32699:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_SYSTEM, Interner Fehler beim Senden."; for(__AS__Local0_00000=0; __AS__Local0_00000<40l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 65534:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_FUB_ENABLE_FALSE, Fub nicht enabled. FUB enablen."; for(__AS__Local0_00000=0; __AS__Local0_00000<53l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;case 65535:{__AS__Local3_00000=(plcstring*)ErrorText; __AS__Local4_00000=(plcstring*)"ERR_FUB_BUSY, Fub arbeitet noch."; for(__AS__Local0_00000=0; __AS__Local0_00000<32l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
}break;}
(Send=0);
(Client.sStep=0);
}break;}


}imp1_case15_6:imp1_endcase15_0:;}
#line 241 "C:/SharedFolder/CControl_Gschneitner/Logical/Sitemanager/Sitemanager/Client.nodebug"

void __AS__ImplInitClient_st(void){}

signed long __AS__STRING_CMP(char* pstr1, char* pstr2)
{while (*pstr1 != 0 && *pstr1 == *pstr2){ pstr1++;pstr2++; } return (*pstr1 == 0 && *pstr2 != 0) ? -1 : (*pstr1 != 0 && *pstr2 == 0) ? 1 : *pstr1 - *pstr2;}

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
__asm__(".ascii \"iecfile \\\"Logical/Sitemanager/Sitemanager/Client.typ\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Sitemanager/Sitemanager/Client.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/Sitemanage/Client.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/Sitemanage/Client.st.c\\\" \\\"C:/SharedFolder/CControl_Gschneitner/Logical/Sitemanager/Sitemanager/Client.st\\\"\\n\"");
__asm__(".previous");

__asm__(".section \".plciec\"");
__asm__(".ascii \"plcdata_const 'Client'\\n\"");
__asm__(".ascii \"plcdata_const 'SLASH'\\n\"");
__asm__(".ascii \"plcdata_const 'LEFTBRACKET'\\n\"");
__asm__(".ascii \"plcdata_const 'RIGHTBRACKET'\\n\"");
__asm__(".ascii \"plcdata_const 'COMMA'\\n\"");
__asm__(".ascii \"plcdata_const 'ERR_FUB_BUSY'\\n\"");
__asm__(".ascii \"plcdata_const 'tcpERR_SENTLEN'\\n\"");
__asm__(".ascii \"plcdata_const 'tcpERR_INVALID'\\n\"");
__asm__(".ascii \"plcdata_const 'tcpERR_NOT_CONNECTED'\\n\"");
__asm__(".ascii \"plcdata_const 'tcpSO_LINGER_SET'\\n\"");
__asm__(".previous");
