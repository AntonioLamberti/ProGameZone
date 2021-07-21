<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile8.css" type="text/css">
<title>Checkout</title>
  <style>
    legend {font-size:2em}
    
    </style>
    
    
</head>
<body>
<%@ include file="../frammenti/header.jsp" %>
	<div id="principale" align="center">
	<fieldset>
	<legend>Sei un Utente Registrato?</legend>
	<form action="TTC">
	
	<h2>Username:</h2><input type="text" name="Username" value="" placeholder="username" required><br>
	<h2>Password:</h2><input type="password" name="Password" id="psw" value="" placeholder="password" required><br>
	<img src="./images/occhio2.png" width="18" height="18" id="psw"  onclick="myFunction()"> Mostra Password<br>
	<input type="submit" value="Login">
	</form>
	<script>
function myFunction() {
	  var x = document.getElementById("psw");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}</script>
	<br>
	</fieldset>
	
	<fieldset>
    <legend>Non sei registrato?</legend>
    <table>
        <tr>
            <td>
    <form action="LoginPage.jsp">
        <button type="submit">REGISTRATI ADESSO</button>
     </form>
    </td>
    <td>
	<form action="Checkout2.jsp">
	<button type="submit">CONTINUA COME OSPITE</button>
	</form>
</td>
</tr>
</table>
	</fieldset>
	<br><br><br>
	<%@ include file="../frammenti/footer.jsp" %>
	</div>
</body>
</html>