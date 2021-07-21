<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*,it.unisa.model.*"%>

<%
	Collection<?> lista = (Collection<?>) request.getAttribute("lista");

	if (lista == null){
		response.sendRedirect(request.getContextPath()+"/LoginServlet");
		return;
	}
	
	Acquisto acquisto = (Acquisto) request.getAttribute("acquisto");
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile8.css" type="text/css">
<title>Lista Ordini</title>
</head>
<body>
 <%@ include file="../frammenti/header.jsp" %>
	<div id="principale">
	<h2>Lista degli ordini</h2>
	<div class="cata">
	<table>
	<tr>
		<th>Data</th>
		<th>Importo Totale</th>
		<th>Dettagli Ordine</th>
	</tr>
	<%
		if (lista != null && lista.size() != 0) {
			Iterator<?> it = lista.iterator();
			while (it.hasNext()) {
				Acquisto acq = (Acquisto) it.next();
	%>
	<tr>
		<td><%=acq.getData() %></td>
		<td><%=acq.getImporto() %></td>
		<td><a href="LoginServlet?boh=ok&data=<%=acq.getData()%>&tot=<%=acq.getImporto()%>">Dettagli ordine</a></td>
	</tr>
	<%
			}
		} else {
	%>
	<tr>
		<td colspan="6">Non sono stati effettuati ordini</td>
	</tr>
	<%
		}
	%>
	</table>
	<br>
	<form action="userHome.jsp">
		<button type="submit">Torna al falò</button>
	</form>
	</div>
	<%@ include file="../frammenti/footer.jsp" %>
	</div>
</body>
</html>