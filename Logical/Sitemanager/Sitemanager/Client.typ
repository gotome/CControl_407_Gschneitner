
TYPE
	Client_typ : 	STRUCT 
		sStep : UINT;
		TcpOpen_0 : TcpOpen;
		TcpClient_0 : TcpClient;
		TcpRecv_0 : TcpRecv;
		TcpSend_0 : TcpSend;
		TcpIoctl_0 : TcpIoctl;
		TcpClose_0 : TcpClose;
		linger_opt : tcpLINGER_typ;
	END_STRUCT;
END_TYPE
