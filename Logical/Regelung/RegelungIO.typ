
TYPE
	typ_PidControl : 	STRUCT 
		Enable : BOOL;
		Sollgroesse : REAL;
		Stellgroesse : REAL;
		FehlerReglerMax : BOOL;
		FehlerReglerMin : BOOL;
		WarnungReglerMax : BOOL;
		WarnungReglerMin : BOOL;
	END_STRUCT;
END_TYPE
