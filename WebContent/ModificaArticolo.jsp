<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"
%>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile8.css" type="text/css">
<!DOCTYPE html>
<head>
    <title>Aggiungi Gioco</title>
</head>

<body>
 <%@ include file="../frammenti/header.jsp" %>
<div id="principale">
    <form action="product">
        <h2>Aggiorna il prezzo di un articolo</h2><br>
            <h2>Codice: </h2> <input type="number" name="Codice" value="" placeholder="Codice gioco" required><br>
            <h2>Costo: </h2> <input type="text" name="Costo" value="" placeholder="59.99" required><br>
            <input type="checkbox" name="Modifica" value="ok" checked hidden><br>
        <input type="submit" value="Modifica Gioco"><br><br>
    </form>
    <%@ include file="../frammenti/footer.jsp" %>
    </div>
</body>