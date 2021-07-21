<html>
	<head>
		<meta name="Author" content="pisi79">
		<title>ProGameZone</title>
		<style>
			p,b {text-align: center;}
		</style>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/styles/default.css" type="text/css"/>
	</head>

	<body>	

		<%@ include file="../fragments/menu.jsp" %>
	
		<div id="main" class="clear">
		<p>
			<b>BENVENUTI IN ProGameZone IL SITO FATTO DA <br>
			VIDEOGIOCATORI PER VIDEOGIOCATORI.</b>
			</p>
		</div>
		
		<a href="./cart.jsp">Vai al carrello</a> <br>
		<a href="../LoginPage.jsp">Effettua il Login o Registrati</a> <br>
		<a href="../CheckUser.jsp">Lista ordini effettuati</a>
	


	</body>
</html>
