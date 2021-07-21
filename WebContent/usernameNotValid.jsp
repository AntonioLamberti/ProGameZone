<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile8.css" type="text/css">
<title>Username Non Valido</title>
</head>
<body>
 <%@ include file="../frammenti/header.jsp" %>
	<div id="principale">
		<h3>Ci dispiace, ma sembra che esista già un giocatore con questo username</h3>
		<%@ include file="../frammenti/footer.jsp" %>
		</div>
</body>
</html>