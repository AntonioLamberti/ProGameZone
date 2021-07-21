
<!-- ----RIADATTARE IL CODICE CON CART E PRODUCTBEAN----- -->



<!-- pagina per la gestione di errori -->
<%@ page errorPage="../errors/failure.jsp"%>

<!-- accesso alla sessione -->
<%@ page session="true"%>

<!-- import di classi Java -->
<%@ page import="it.unisa.model.Catalogue" %>
<%@ page import="it.unisa.model.Cart"%>
<%@ page import="it.unisa.model.ProductBean"%>
<%@ page import="java.util.List"%>

<!-- metodi richiamati nel seguito -->


<!-- codice html restituito al client -->
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile8.css" type="text/css">
		<title>Cart JSP</title>
	</head>

	<body>	
	<%@ include file="../frammenti/headerhome.jsp" %>
	<jsp:useBean id="cart" class="it.unisa.model.Cart" scope="session" />
	<jsp:useBean id="prodotto" class="it.unisa.model.ProductBean" scope="session" />
	
	<%

if ( request.getParameter("empty") != null && request.getParameter("empty").equals("ok") ) {
	int a = Integer.parseInt(request.getParameter("id"));
	cart.deleteProduct(a);
}
	
	if (request.getParameter("meno") != null && request.getParameter("meno").equals("ok") ){
		int a = Integer.parseInt(request.getParameter("id"));
		int q = Integer.parseInt(request.getParameter("quantita"));
		ProductBean[] p = cart.getProducts().toArray(new ProductBean[0]);
		for(ProductBean prod : p) {
			if (prod.getCode() == a){
				q = q-1;
				if (q < 1){
					cart.deleteProduct(a);
				}
				prod.setQuantitaC(q);
			}
		}
	}
	
	if (request.getParameter("piu") != null && request.getParameter("piu").equals("ok") ){
		int a = Integer.parseInt(request.getParameter("id"));
		int q = Integer.parseInt(request.getParameter("quantita"));
		ProductBean[] p = cart.getProducts().toArray(new ProductBean[0]);
		for(ProductBean prod : p) {
			if (prod.getCode() == a){
				q = q+1;
				prod.setQuantitaC(q);
			}
		}
	}

%>
	
	
		<div id="principale">
			<div class="navbar">
			
		</div>
			<!--<jsp:useBean id="catalogue" class="it.unisa.model.Catalogue" scope="application" />-->
			
			<h2 id="catalogo">Contenuto del carrello:</h2>

			<div class="cata">
				<table>
					<tr>
						<th style="width: 20%">Titoli</th>
						<th style="width: 20%">Prezzo</th>
						<th style="width: 20%">Quantità</th>
						<th style="width: 20%">Azioni</th>
					</tr>
					<% 
					ProductBean[] cartProducts = cart.getProducts().toArray(new ProductBean[0]);
					for( ProductBean aCartProduct : cartProducts ){  
					%> 
						<tr>
							<td><%= aCartProduct.getName() %></td>
							<td><%= aCartProduct.getPrice() + aCartProduct.getPrice() * 4 / 100 %> &#8364;</td>
							<td><%= aCartProduct.getQuantitaC() %></td>
							<td><a href="?empty=ok&id=<%= aCartProduct.getCode() %>">Rimuovi dal carrello</a>
							 <a href="?meno=ok&id=<%= aCartProduct.getCode() %>&quantita=<%= aCartProduct.getQuantitaC()%>" style="padding: 5px;">Riduci</a> 
							 <a href="?piu=ok&id=<%= aCartProduct.getCode() %>&quantita=<%= aCartProduct.getQuantitaC()%>" style="padding: 5px;">Aggiungi</a></td>
						</tr>
					<% 
					} 
					%>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>			
				<br/>
				<p>
				Total: <span style="font-size: x-large; color: #ffcc5f;"><%= cart.Totale() %> &#8364;</span>
				</p>
				
				<%
				if ( cart.getProducts().size() > 0 ) {
				%>
					<br/>
					<a href="../product?checkout=ok">Checkout</a>
				<%
				}
				%>
			</div>
		
			<div class="clear">
				<p>&nbsp;</p>
			</div>
			<div id="footcarrello">
			<%@ include file="../frammenti/footer.jsp" %>
			</div>
		</div>
	
	

	</body>
</html>
