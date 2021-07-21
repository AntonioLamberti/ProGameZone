<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Registrazione effettuata</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile8.css"/>
<style>
h1,h2,form {text-align: center;}
</style>
</head>
<body>
 <%@ include file="../frammenti/header.jsp" %>
	<h2>Benvenuto Chosen One</h2>
	<h2>Dirigiti al falò per iniziare la tua avventura</h2> <br>
	
	<form action="./userHome.jsp">
		<button type="submit">Torna al Falò</button>		
	</form>
	<br><br>
	<%@ include file="../frammenti/footer.jsp" %>
</body>
</html>