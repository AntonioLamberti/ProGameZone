<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*,it.unisa.model.ProductBean"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile8.css" type="text/css">
<title>Dettaglio gioco</title>
</head>
<body>
<%@ include file="../frammenti/header.jsp" %>
	<% ProductBean product = (ProductBean) request.getAttribute("product"); %>
	<div id="principale">
	
		</div>
		<h2 id="catalogo">Dettaglio gioco</h2>
		<div class="cata">
	<table>
	
		<tr>
		<th>Genere</th>
		<th>Piattaforma</th>
		<th>Tipologia</th>
		<th>Azioni</th>
		</tr>
		
		<tr>
		<td><%= product.getGenre() %></td>
		<td><%= product.getPlatform() %></td>
		<td><%= product.getTipologia() %></td>
		<td><a href="product?action=addC&id=<%=product.getCode()%>&qta=1">Aggiungi al carrello</a></td>
		<td><a href="<%= request.getContextPath() %>/pages/ProductView.jsp">Torna al catalogo</a>
		</tr>
		
	</table>
	<br><br>
	</div>
	<%@ include file="../frammenti/footer.jsp" %>

</body>
</html>