<%@ page contentType='text/html; charset=EUC-KR' pageEncoding='EUC-KR'%>

<%
	request.setCharacterEncoding ( "utf-8" );
%>

<STYLE TYPE='TEXT/CSS'>
	BODY { BACKGROUND-COLOR: BLACK; }
	TD { COLOR: WHITE; PADDING: 0; }
	.ALL_CENTER { TEXT-ALIGN: CENTER; }
	.TITLE_FONT { TEXT-ALIGN: CENTER; COLOR: RED; FONT-WEIGHT: BOLD; FONT-SIZE: 40PX }
	.TITLE_DAN { PADDING: 0; FONT-WEIGHT: BOLD; FONT-SIZE: 18PX; }
</STYLE>

<P CLASS='TITLE_FONT'>THE RULES OF MULTIPLICATION</P>
<TABLE BORDER='1' CLASS='ALL_CENTER' ALIGN='CENTER'>
	<TR>
<%
	for ( int i = 1; i <= 9; i ++ ) {
%>
		<TD HEIGHT='55PX' WIDTH='130PX' STYLE='BACKGROUND-COLOR: GRAY'>
			<P CLASS='TITLE_DAN'>
				<%=
					i
				%>
			</P>
		</TD>
<%
	}
%>
	</TR>
<%
	for ( int i = 1; i <= 9; i ++ ) {
%>
	<TR>
<%
		for ( int x = 1; x <= 9; x ++ ) {
%>
		<TD HEIGHT='45PX' WIDTH='130PX'>
			<%=
				x + " ¡¿ " + i + " = " + ( x * i )
			%>
		</TD>
<%
		}
%>
	</TR>
<%
	}
%>
</TABLE>