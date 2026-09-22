struct TcpOpen
{	unsigned long pIfAddr;
	unsigned short port;
	unsigned long options;
	unsigned short status;
	unsigned long ident;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void TcpOpen(struct TcpOpen* inst);
struct TcpClient
{	unsigned long ident;
	unsigned long pServer;
	unsigned short portserv;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void TcpClient(struct TcpClient* inst);
struct TcpRecv
{	unsigned long ident;
	unsigned long pData;
	unsigned long datamax;
	unsigned long flags;
	unsigned short status;
	unsigned long recvlen;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void TcpRecv(struct TcpRecv* inst);
struct TcpSend
{	unsigned long ident;
	unsigned long pData;
	unsigned long datalen;
	unsigned long flags;
	unsigned short status;
	unsigned long sentlen;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void TcpSend(struct TcpSend* inst);
struct TcpIoctl
{	unsigned long ident;
	unsigned long ioctl;
	unsigned long pData;
	unsigned long datalen;
	unsigned short status;
	unsigned long outlen;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void TcpIoctl(struct TcpIoctl* inst);
struct TcpClose
{	unsigned long ident;
	unsigned long how;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void TcpClose(struct TcpClose* inst);
#ifndef __AS__TYPE_tcpLINGER_typ
#define __AS__TYPE_tcpLINGER_typ
typedef struct tcpLINGER_typ
{	unsigned long lOnOff;
	unsigned long lLinger;
} tcpLINGER_typ;
#endif

#ifndef __AS__TYPE_Client_typ
#define __AS__TYPE_Client_typ
typedef struct Client_typ
{	unsigned short sStep;
	struct TcpOpen TcpOpen_0;
	struct TcpClient TcpClient_0;
	struct TcpRecv TcpRecv_0;
	struct TcpSend TcpSend_0;
	struct TcpIoctl TcpIoctl_0;
	struct TcpClose TcpClose_0;
	tcpLINGER_typ linger_opt;
} Client_typ;
#endif

_BUR_LOCAL plcstring Sendstring[351];
_BUR_LOCAL Client_typ Client;
_BUR_LOCAL plcstring EMailText[81];
_BUR_LOCAL plcstring SLASH[2];
_BUR_LOCAL plcstring LEFTBRACKET[2];
_BUR_LOCAL plcstring RIGHTBRACKET[2];
_BUR_LOCAL plcstring COMMA[2];
_BUR_LOCAL plcstring EMail[4][81];
_BUR_LOCAL plcbit UseComma;
_BUR_LOCAL plcstring CommaString[2];
_BUR_LOCAL plcbit Send;
_BUR_LOCAL plcstring resultString[351];
_BUR_LOCAL plcstring ErrorText[81];
_BUR_LOCAL unsigned short ErrNr;
_BUR_LOCAL unsigned short IP_PORT;
_BUR_LOCAL unsigned long IP_ADRESS;
_BUR_LOCAL unsigned long VC_HANDLE;
_BUR_LOCAL plcstring AlarmString[101];
_BUR_LOCAL signed long AlarmLen;
_BUR_LOCAL unsigned short uiAlarmType;
_BUR_LOCAL unsigned char cDateTimeFormat;
_BUR_LOCAL unsigned char cSeparator;
_BUR_LOCAL unsigned short Access_Status;
_BUR_LOCAL unsigned short GetActAlarmList_Status;
_BUR_LOCAL plcbit loc_FehlerAusgelesen;
_BUR_LOCAL plcbit loc_EMailAlarmierungEin;
