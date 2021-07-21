<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*,it.unisa.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile8.css" type="text/css">
<title>Dettaglio</title>
</head>
<body>
<%@ include file="../frammenti/header.jsp" %>
	<div id="principale">
	<% Acquisto acquisto = (Acquisto) request.getAttribute("acquisto"); %>
	<div class="cata">
	<table border=1>
	
		<tr>
		<th>Giochi Acquistati</th>
		</tr>
		
		<tr>
		<td><%= acquisto.getDettaglio() %></td>
		</tr>
		
	</table>
	<br><br>
	</div>
	<%@ include file="../frammenti/footer.jsp" %>
	</div>
</body>
</html>