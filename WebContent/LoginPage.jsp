<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"
%>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile8.css" type="text/css">
<!DOCTYPE html>
<head>
    <title>Login</title>
     <style>
    legend {font-size:2em}
    #thispage{
     font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
     font-size:2em;
     }
     
/* La finestra di messaggio viene visualizzata quando l'utente fa clic sul campo della password */
#message {
  display:none;
  background:   #bab3ba;
  color: #000;
  position: relative;
  padding: 20px;
  margin-top: 10px;
}

#message p {
  padding: 10px 35px;
  font-size: 18px;
}

/* Aggiungi un colore di testo verde e un segno di spunta quando i requisiti sono corretta */
.valid {
  color: green;
}

.valid:before {
  position: relative;
  left: -35px;
  content: "V";
}

/* Aggiungi un colore di testo rosso e una "x" quando i requisiti sono sbagliati*/
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -35px;
  content: "X";
    }
    
    </style>
    
</head>

<body>
<%@ include file="../frammenti/header.jsp" %>
<div id="principale" >
 
    <form action="LoginServlet?login=ok">
        <h2 id="thispage" >Sei un utente registrato? Effettua il login:</h2>
        <fieldset>
            <legend>Login</legend>
            <h3 >Username: </h3> <input type="text" name="Username" value="" placeholder="username" required><br><br>
             <h3>Password</h3> <input type="password"  name="Password" value="" placeholder="password" required><br>
            <input type="checkbox" name="amni" value="ok" checked hidden> <br>
            <input type="submit" value="Login"><br>
        </fieldset>
    </form>
    <br><br><br>
   
    <form action="RegisterServlet">
        <h2 id="thispage" >Altrimenti puoi registrarti qui!</h2><br>
         <fieldset>
            <legend>Username e Password</legend>
            <h3 >Username: </h3> <input type="text" name="Username" value="" placeholder="username" required><br><br><!-- <input type="password" name="Password" value="" placeholder="password" required><br>-->
            <input type="password" id="psw" name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="password" required>
          
                   </fieldset>
                    <div id="message">
  <h3>La password deve contenere quanto segue:</h3>
  <p id="letter" class="invalid">Una lettera <b>minuscola</b></p>
  <p id="capital" class="invalid">La <b>prima lettera maiuscola</b></p>
  <p id="number" class="invalid">Un <b>numero</b></p>
  <p id="length" class="invalid">Minimo <b>8 caratteri</b></p>
</div>
<script>
var myInput = document.getElementById("psw");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

// Quando l'utente fa clic sul campo della password, mostra la finestra del messaggio
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// Quando l'utente fa clic al di fuori del campo della password, nascondi la finestra del messaggio
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// Quando l'utente inizia a digitare qualcosa nel campo della password
myInput.onkeyup = function() {
  //Convalida le lettere minuscole
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }
  
  // Convalida lettere maiuscole
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Convalida i numeri
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Convalida la lunghezza
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}


</script>
        <fieldset>
            <legend>Dati Personali</legend>
            <h3>Nome: </h3> <input type="text" name="Nome" value="" placeholder="Mario" required><br><br>
            <h3 >Cognome: </h3> <input type="text" name="Cognome" value="" placeholder="Rossi" required><br><br>
            <h3>Data di Nascita: </h3> <input type="date" name="DataN" value="" placeholder="GG/MM/AAA" required><br>
        </fieldset>
        <fieldset>
            <legend>Indirizzo di spedizione</legend>
            <h3>Via: </h3> <input type="text" name="Via" value="" placeholder="Via Giuseppe Verdi, 140"><br><br>
            <h3 >CAP: </h3> <input type="text" name="CAP" value="" placeholder="80123"><br><br>
            <h3>Citta': </h3> <input type="text" name="Citta" value="" placeholder="Milano"><br>
        </fieldset>
         <input type="checkbox" name="TerminiServizio" value="1" required><h4>Accetto i termini di servizio</h4>
         <input type="submit" value="Registrati">
    </form>
    <br><br>
    <%@ include file="../frammenti/footer.jsp" %>

    </div>
</body>