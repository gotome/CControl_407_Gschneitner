(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: CSV01
 * File: CSV01.fun
 * Author: Herwig
 * Created: February 24, 2011
 ********************************************************************
 * Functions and function blocks of library CSV01
 ********************************************************************)

FUNCTION_BLOCK CSV_Tick
	VAR_INPUT
		Enable : BOOL;
		Wert : REAL;
	END_VAR
	VAR_OUTPUT
		Ausg : BOOL;
	END_VAR
	VAR
		SpWert : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CSV_itoa
	VAR_INPUT
		Eing_DINT : DINT;
		Eing_Anz_VK : USINT;
		Eing_Anz_NK : USINT;
		Eing_Vorz_Plus : BOOL;
		Eing_Komma_Punkt : BOOL;
		Ausg_ASCII_adr : UDINT;
		Ausg_ASCII_len : UDINT;
	END_VAR
	VAR_OUTPUT
		Ausg_Fehler : BOOL;
	END_VAR
	VAR
		Eing_DINT_VK : DINT;
		Eing_DINT_NK : DINT;
		Str_VK_len : UINT;
		Str_NK_len : UINT;
		Str_Ges_len : UINT;
		Str_VK : ARRAY[0..11] OF USINT;
		Str_NK : ARRAY[0..11] OF USINT;
		M_ASCII : ARRAY[0..24] OF USINT;
		i : USINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CSV_GRP_date
	VAR_INPUT
		Eing_Tag : USINT;
		Eing_Monat : USINT;
		Eing_Jahr : UINT;
		Ausg_date_adr : UDINT;
		Ausg_date_len : UDINT;
	END_VAR
	VAR_OUTPUT
		Ausg_Fehler : BOOL;
	END_VAR
	VAR
		M_DATE : ARRAY[0..10] OF USINT;
		Str_Jahr : ARRAY[0..11] OF USINT;
		Str_Mon : ARRAY[0..11] OF USINT;
		Str_Tag : ARRAY[0..11] OF USINT;
		M_Fehler : BOOL;
		zzCSV_itoa00000 : CSV_itoa;
		zzCSV_itoa00001 : CSV_itoa;
		zzCSV_itoa00002 : CSV_itoa;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CSV_GRP_time
	VAR_INPUT
		Eing_Stunde : USINT;
		Eing_Minute : USINT;
		Eing_Sekunde : USINT;
		Ausg_time_adr : UDINT;
		Ausg_time_len : UDINT;
	END_VAR
	VAR_OUTPUT
		Ausg_Fehler : BOOL;
	END_VAR
	VAR
		M_TIME : ARRAY[0..8] OF USINT;
		Str_Stunde : ARRAY[0..11] OF USINT;
		Str_Minute : ARRAY[0..11] OF USINT;
		Str_Sekunde : ARRAY[0..11] OF USINT;
		M_Fehler : BOOL;
		zzCSV_itoa00000 : CSV_itoa;
		zzCSV_itoa00001 : CSV_itoa;
		zzCSV_itoa00002 : CSV_itoa;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CSV_GRP_timestamp
	VAR_INPUT
		Eing_Tag : USINT;
		Eing_Monat : USINT;
		Eing_Jahr : UINT;
		Eing_Stunde : USINT;
		Eing_Minute : USINT;
		Eing_Sekunde : USINT;
		Eing_MilliSek : UINT;
		Ausg_timestamp_adr : UDINT;
		Ausg_timestamp_len : UDINT;
	END_VAR
	VAR_OUTPUT
		Ausg_Fehler : BOOL;
	END_VAR
	VAR
		M_TIMESTAMP : ARRAY[0..23] OF USINT;
		Str_Jahr : ARRAY[0..11] OF USINT;
		Str_Mon : ARRAY[0..11] OF USINT;
		Str_Tag : ARRAY[0..11] OF USINT;
		Str_Stunde : ARRAY[0..11] OF USINT;
		Str_Minute : ARRAY[0..11] OF USINT;
		Str_Sekunde : ARRAY[0..11] OF USINT;
		Str_MilliSek : ARRAY[0..11] OF USINT;
		M_Fehler : BOOL;
		zzCSV_itoa00000 : CSV_itoa;
		zzCSV_itoa00001 : CSV_itoa;
		zzCSV_itoa00002 : CSV_itoa;
		zzCSV_itoa00003 : CSV_itoa;
		zzCSV_itoa00004 : CSV_itoa;
		zzCSV_itoa00005 : CSV_itoa;
		zzCSV_itoa00006 : CSV_itoa;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CSV_QM_timestamp
	VAR_INPUT
		Eing_Tag : USINT;
		Eing_Monat : USINT;
		Eing_Jahr : UINT;
		Eing_Stunde : USINT;
		Eing_Minute : USINT;
		Ausg_timestamp_adr : UDINT;
		Ausg_timestamp_len : UDINT;
	END_VAR
	VAR_OUTPUT
		Ausg_Fehler : BOOL;
	END_VAR
	VAR
		M_TIMESTAMP : ARRAY[0..14] OF USINT;
		Str_Tag : ARRAY[0..11] OF USINT;
		Str_Mon : ARRAY[0..11] OF USINT;
		Str_Jahr : ARRAY[0..11] OF USINT;
		Str_Stunde : ARRAY[0..11] OF USINT;
		Str_Minute : ARRAY[0..11] OF USINT;
		M_Fehler : BOOL;
		zzCSV_itoa00000 : CSV_itoa;
		zzCSV_itoa00001 : CSV_itoa;
		zzCSV_itoa00002 : CSV_itoa;
		zzCSV_itoa00003 : CSV_itoa;
		zzCSV_itoa00004 : CSV_itoa;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CSV_atoLREAL
	VAR_INPUT
		Eing_ASCII_adr : UDINT;
		Eing_ASCII_len : UDINT;
	END_VAR
	VAR_OUTPUT
		Ausg_Fehler : BOOL;
		Ausg_LREAL : LREAL;
	END_VAR
	VAR
		M_ASCII : ARRAY[0..40] OF USINT;
		ii : USINT;
		M_Stellen : SINT;
		M_Vorkomma : SINT;
		M_Komma : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK CSV_UDINTtoa
	VAR_INPUT
		Eing_UDINT : UDINT;
		Ausg_ASCII_adr : UDINT;
		Ausg_ASCII_len : UDINT;
	END_VAR
	VAR_OUTPUT
		Ausg_Fehler : BOOL;
	END_VAR
	VAR
		Ausg_ASCII : ARRAY[0..10] OF USINT;
		i : SINT;
		ii : SINT;
		M_Start : BOOL;
	END_VAR
END_FUNCTION_BLOCK
