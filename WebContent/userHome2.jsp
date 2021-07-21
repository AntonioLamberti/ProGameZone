<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="it.unisa.model.UserBean"
   %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>ProGameZone</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile9.css"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/home5.css"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/responsive.css"/>
	</head>
<script>
function bigImg(x) {
  x.style.height = "130%";
  x.style.width = "130%";
}

function normalImg(x) {
  x.style.width = "100%";
}
</script>
	<body>	

 <%@ include file="../frammenti/headerhome.jsp" %>
	<div id="principale" class="clear">
	<div class="col" style="text-align:center;  background-image: url('./images/home15.png'); background-repeat: no-repeat; background-size: 100% 100%">
				<h1>Pro</h1><h1>Game</h1><h1>Zone</h1>
				<p>Il sito per videogiocatori, creato da videogiocatori</p>
			  </div>
			  </div>
   <div class="about-section">
  <h2 id="prova">CHI SIAMO</h2>
  <p>Siamo studenti e videogiocatori e vogliamo offrirti le nostre qualità in un sito pensato per te.</p>
  <p>Qui puoi trovare videogiochi fisici e digitali. Per ogni piattaforma e per ogni console.</p>
</div>


<div class="riga">
<h2 style="text-align:center">Il nostro Team</h2>
  <div class="colonna">
    <div class="card">
      <img onmouseover="bigImg(this)" onmouseout="normalImg(this)" border="0" src="./images/Sellitto.png"  width="100%" >
      <div class="container">
        <h2>Antonio Sellitto</h2><br>
        <p class="title">Creatore del sito</p><br>
        <p align="center">
        <a href="https://www.instagram.com/_cocidio_/?hl=it" target="_blank" >
           <button><img id="noi" src="./images/3.png" alt="Avatar" width="30" height="30" ></button></a>
             <a href="https://www.facebook.com/antonio.sellitto.77" target="_blank"  >
            <button><img id="noi" src="./images/fb.png" alt="Avatar" width="30" height="30" ></button></a>
      </p>
      </div>
    </div>
  </div>

  <div class="colonna">
    <div class="card">
      <img onmouseover="bigImg(this)" onmouseout="normalImg(this)" border="0" src="./images/Bianco.png"  width="100%" >
      <div class="container">
        <h2>Mariagiovanna Bianco</h2><br>
        <p class="title">Creatore del sito</p><br>
          <p align="center">
          <a href="https://www.instagram.com/_mariagiovanna_46/?hl=it" target="_blank" >
            <button><img id="noi" src="./images/3.png" alt="Avatar" width="30" height="30"></button></a>
            <a href="https://www.facebook.com/nicola.bianco.50" target="_blank" >
            <button><img id="noi" src="./images/fb.png" alt="Avatar" width="30" height="30"></button></a>
     </p>
      </div>
    </div>
  </div>
  
  <div class="colonna">
    <div class="card">
      <img onmouseover="bigImg(this)" onmouseout="normalImg(this)" border="0" src="./images/Lamberti2.png"  width="100%" >
      <div class="container">
        <h2>Antonio Lamberti</h2><br>
        <p class="title">Creatore del sito</p><br>
          <p align="center">
        <a href="https://www.instagram.com/lamberti6883/?hl=it" target="_blank" >
            <button><img id="noi" src="./images/3.png" alt="Avatar" width="30" height="30"></button></a>
             <a href="https://m.facebook.com/profile.php?id=1503336665&ref=content_filter" target="_blank" >
            <button><img id="noi" src="./images/fb.png" alt="Avatar"  width="30" height="30"></button></a>
     </p>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div style="text-align:center">
    <h2 id="prova">CONTATTACI</h2>
    <p>Digita qui il tuo messaggio:</p>
  </div>
  <div class="row">
    <div class="column">
    <p>
    
    <ul>
    Se:
        <li>vuoi porgere una domanda a tutto il nostro teams</li>
        <li>non ti va di contattarci tramite social</li>
        <li>non hai i social</li>
        <li>vuoi fare un reclamo</li>
        <li>vuoi parlarci delle tue idee</li>
        <li>hai problemi</li>
      </ul>
	<br><br>
      Puoi scrivere qui, <b>noi ti leggiamo!</b>
   </p>
  </div>
      <div class="column">
      <form>
        <label for="fname">Nome</label>
        <input type="text" id="fname" name="nome" placeholder="Il tuo nome..">
        <label for="lname">Cognome</label>
        <input type="text" id="lname" name="nome" placeholder="Il tuo cognome..">
        <label for="subject">Oggetto</label>
        <textarea id="subject" name="subject" placeholder="Digita qui..." style="height:170px"></textarea>
        <input type="submit" value="Invia">
      </form>
    
    </div>
  </div>
</div>
		<div class="foothome2">
		<%@ include file="../frammenti/footer.jsp" %>
		</div>
		

	</body>
</html>

