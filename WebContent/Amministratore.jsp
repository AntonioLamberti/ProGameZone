<%@ page import="java.util.*,it.unisa.model.ProductBean, it.unisa.model.*"%>

<%@ page session="true"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	
	if (products == null){
		response.sendRedirect(request.getContextPath()+"/product");
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
	
	UserBean admin = new UserBean();
	admin.setUsername("root");
	admin.setPassword("password");
	
	//UserBean us = (UserBean) request.getSession().getAttribute("user");
	
	//String temp = us.toString();
	
%>

<!DOCTYPE html>
<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile8.css" type="text/css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/ricercaa.css" type="text/css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/responsive.css" type="text/css">
 <link rel="stylesheet" href="<%= request.getContextPath() %>/stili/tab.css" type="text/css">
	<title>Catalogo ProGameZone</title>
</head>

<body>
	<%@ include file="../frammenti/header.jsp" %>
	<div id="principale">
		<h2 id="catalogo">Cerca il tuo gioco</h2>
		<form autocomplete="off" action="product">
  <div class="autocomplete" style="width:300px;">
    <input id="myInput" type="text" name="NomeV" value="" placeholder="Cerca il gioco">
  </div>
    <button type="submit" >Cerca</button>
</form>
		<script>
		function autocomplete(inp, arr) {
			  var currentFocus;
			  inp.addEventListener("input", function(e) {
			      var a, b, i, val = this.value;
			      closeAllLists();
			      if (!val) { return false;}
			      currentFocus = -1;
			      a = document.createElement("DIV");
			      a.setAttribute("id", this.id + "autocomplete-list");
			      a.setAttribute("class", "autocomplete-items");
			      this.parentNode.appendChild(a);
			      for (i = 0; i < arr.length; i++) {
			        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
			          b = document.createElement("DIV");
			          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
			          b.innerHTML += arr[i].substr(val.length);
			          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
			          b.addEventListener("click", function(e) {
			              inp.value = this.getElementsByTagName("input")[0].value;
			              closeAllLists();
			          });
			          a.appendChild(b);
			        }
			      }
			  });
			  inp.addEventListener("keydown", function(e) {
			      var x = document.getElementById(this.id + "autocomplete-list");
			      if (x) x = x.getElementsByTagName("div");
			      if (e.keyCode == 40) {
			        currentFocus++;
			        addActive(x);
			      } else if (e.keyCode == 38) { //up
			        currentFocus--;
			        addActive(x);
			      } else if (e.keyCode == 13) {
			        e.preventDefault();
			        if (currentFocus > -1) {
			          if (x) x[currentFocus].click();
			        }
			      }
			  });
			  function addActive(x) {
			    if (!x) return false;
			    removeActive(x);
			    if (currentFocus >= x.length) currentFocus = 0;
			    if (currentFocus < 0) currentFocus = (x.length - 1);
			    x[currentFocus].classList.add("autocomplete-active");
			  }
			  function removeActive(x) {
			    for (var i = 0; i < x.length; i++) {
			      x[i].classList.remove("autocomplete-active");
			    }
			  }
			  function closeAllLists(elmnt) {
			    var x = document.getElementsByClassName("autocomplete-items");
			    for (var i = 0; i < x.length; i++) {
			      if (elmnt != x[i] && elmnt != inp) {
			        x[i].parentNode.removeChild(x[i]);
			      }
			    }
			  }
			  document.addEventListener("click", function (e) {
			      closeAllLists(e.target);
			  });
			}

				var countries = ["NieR Replicant","Pokémon spada","Tekken 7"];
				
			autocomplete(document.getElementById("myInput"), countries);
			</script>
	
		<h2 id="catalogo">Leggenda: </h2>
		<p>
		Flag = 0: oggetto non presente nel catalogo dell'utente<br>
		Flag = 1: oggetto presente nel catalogo dell'utente<br>
		</p>
		<h2 id="catalogo">Catalogo</h2>
		<div class="cata">
		<table>
		<thead>
		<tr>
			<th>Immagine</th>
			<th>Nome</th>
			<th>Genere</th>
			<th>Costo</th>
			<th>Tipologia</th>
			<th>Azione</th>
			<th>Flag</th>
			<% /*if(us != null && temp.equals(admin)){ */ 
				if (request.getSession().getAttribute("user") != null){
					UserBean us = (UserBean) request.getSession().getAttribute("user");
					String temp = us.toString();
					String temp2 = admin.toString();
					if (temp.equals(temp2)){
				%> <th> Amministratore </th> <% }  } %>
		</tr>
		</thead>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
		<tr>
			<td><img src="<%=bean.getImmagine()%>" class="prod" alt="prodotto"></td>
			<td><%=bean.getName()%></td>
			<td><%=bean.getGenre()%></td>
			<td><%=bean.getPrice()%></td>
			<td><%=bean.getTipologia()%></td>
			<td><a href="product?action=dettaglio&id=<%=bean.getCode()%>" style="margin-right: 15px">Dettagli</a>
				<a href="product?action=addC&id=<%=bean.getCode()%>&qta=1" style="margin-right: 15px">Aggiungi al carrello</a></td>
			<td><%=bean.getFlag()%></td>
			<td><%if (request.getSession().getAttribute("user") != null){
				UserBean us = (UserBean) request.getSession().getAttribute("user");
				String temp = us.toString();
				String temp2 = admin.toString();
				if (temp.equals(temp2)){ %><a href="product?remove=ok&id=<%=bean.getCode() %>" style="margin-right: 15px">Rimuovi articolo</a>
										   <a href="product?addA=ok&id=<%=bean.getCode()%>"style="margin-right: 15px">Riaggiungi articolo</a>
										   <a href="./ModificaArticolo.jsp">Modifica Prezzo</a><% }  } %></td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">No products available</td>
		</tr>
		<%
			}
		%>
	</table>
	
	<a href="pages/cart.jsp" style="margin-right: 10px;">Vai al carrello</a>
	<a href="./AggiungiArticolo.jsp">Aggiungi articolo</a> 
	
	</div>
	<br><br><br><br><br><br><br><br>
		<div>
	<%@ include file="../frammenti/footer.jsp" %>
	</div>
	</div>
	
</body>
</html>