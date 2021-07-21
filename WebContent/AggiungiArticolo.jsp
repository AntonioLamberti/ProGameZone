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
        <h2>Aggiungi un nuovo articolo</h2><br>
            <h2>Codice: </h2> <input type="number" name="Codice" value="" placeholder="Codice gioco" required><br>
            <h2>Nome: </h2> <input type="text" name="Nome" value="" placeholder="Nome gioco" required><br>
            <h2>Genere: </h2> <input type="text" name="Genere" value="" placeholder="Tipo1, Tipo2, ..." required><br>
            <h2>Piattaforma: </h2> <input type="text" name="Piattaforma" value="" placeholder="Playstation, Xbox, Nintendo"><br>
            <h2>Costo: </h2> <input type="text" name="Costo" value="" placeholder="59.99"><br>
            <h2>Tipologia: </h2> <input type="text" name="Tipologia" value="" placeholder="Fisico o Digitale"><br>
            <h2>Quantita': </h2> <input type="number" name="Quantita" value="" placeholder="Quantita' articoli" required><br>
            <h2>Flag: </h2> <input type="number" name="Flag" value="" placeholder="1 (visibile) o 0 (non visibile)" required><br>
            <input type="checkbox" name="Aggiungi" value="ok" checked hidden><br>
        <input type="submit" value="Aggiungi Gioco"><br><br>
    </form>
    <%@ include file="../frammenti/footer.jsp" %>
    </div>
</body>