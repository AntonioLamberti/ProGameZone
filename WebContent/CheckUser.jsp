<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile8.css" type="text/css">
<title>Ricerca ordini</title>
</head>
<body>
<%@ include file="../frammenti/header.jsp" %>
	<div id="principale" align="center">
	<form action="LoginServlet" id="form">
	<h3>Inserire l'username e la password per ricercare gli ordini effettuati sul nostro sito:</h3>
	<fieldset>
	<br>
	<input type="text" name="Username" value="" placeholder="username" required><br><br>
	<input type="password" name="Password" id="psw" value="" placeholder="password" required><br>
	  <img src="./images/occhio2.png" width="18" height="18" id="psw"  onclick="myFunction()"> Mostra Password   <br>
	<input type="checkbox" name="check" value="ok" checked hidden><br>
	<input type="submit" value="Invia">
	</fieldset>
	<script>
function myFunction() {
	  var x = document.getElementById("psw");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}</script>
	</form>
	<br><br><br><br><%@ include file="../frammenti/footer.jsp" %>
	</div>
</body>
</html>