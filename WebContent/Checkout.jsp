 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="it.unisa.model.UserBean, it.unisa.model.Cart, java.util.*, it.unisa.model.ProductBean"%>
    
    <% 

  UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
if ((currentUser==null)||(!currentUser.isValid()))
{	
    response.sendRedirect("./invalidLogin.jsp");
    return;
}

%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile8.css" type="text/css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/stili/fattura.css" type="text/css">
<title>Checkout</title>
<style>
#message {
  display:none;
  background: grey;
  color: #000;
  position: relative; 
}
.valid {
  color: green;
}
.invalid {
  color: red;
}  
  /*email*/
  .invalid { border-color: red; }
  #error { color: red }

</style>
</head>
<body>
<%@ include file="../frammenti/header.jsp" %>
<div id="principale" align="center">
	 <h1 id="saluto"> CIAO <%= currentUser.getUsername()%> </h1>
	<div class="cata">
	<table> <legend><h2>Dati Spedizione</h2></legend>
	<tr>Città:<%= currentUser.getCitta() %><br>
	<tr>Via:<%= currentUser.getVia()%><br>
	<tr>Cap:<%= currentUser.getCAP() %><br><br>
	</table>
     <p>Nel caso in cui vuoi far arrivare questo ordine ad un indirizzo diveso da quello
      sopraindicato [inserito nella registrazione del sito],<br> puoi compilare i seguenti campi, altrimenti<br>
      inserisci solo i dati di pagamento. </p><br>
     <div class="row">
  <div class="col-75">
    <div class="container">
      <form action="./product">
      
        <div class="row">
          <div class="col-50">
            <h3>Indirizzo di fatturazione</h3>
            <label for="fname"><i class="fa fa-user"></i> Nome completo</label>
            <input type="text" id="fname" name="firstname" placeholder="Marco Immaginario" required>
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="email" id="input" name="email" placeholder="marco@google.com" required>
            <label for="adr"><i class="fa fa-address-card-o"></i> Indirizzo</label>
            <input type="text" id="adr" name="address" placeholder="Via Federico II, 40" required>
           <div class="row">
              <div class="col-50">
            <label for="city"><i class="fa fa-institution"></i> Città</label>
            <input type="text" id="city" name="city" placeholder="Firenze" required>
			</div>
			<div class="col-50">
                <label for="zip">Cap</label>
                <input type="text" id="zip" name="zip" placeholder="85085" required>
              </div>
              </div>
			
            <div class="row">
              <div class="col-50">
                <label for="state">Stato</label>
                <input type="text" id="state" name="state" placeholder="Italia" required>
              </div>
              <div class="col-50">
                <label for="phone">Cellulare</label>
                <input type="text" id="phone" name="phone" placeholder="330303030"  pattern="(?=.{10,12}" required>
          
              <div id="message">
  				<p id="length" class="invalid">Range [10-12] caratteri</p>
			</div>
             </div> 
            </div>
          </div>

          <div class="col-50">
            <h3>Pagamento</h3>
          
            <label for="cname">Nome del proprietario della carta</label>
            <input type="text" id="cname" name="cardname" placeholder="Marco Immaginario" required>
            <label for="ccnum">Numero carta di credito </label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="xxxx-xxxx-xxxx-xxxx" required>
            
            <div class="row">
              <div class="col-50">
                <label for="expmonth">Scadenza</label>
            <input class="inputCard" name="expiry" id="expiry" type="month" required/> 
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352" required>
                <input type="text" name="completato" value="ok" hidden>
                <input type="text" name="username" value="<%= currentUser.getUsername()%>" hidden>
              </div>
            </div>
          </div>
          
        </div>
        <label>

        </label>
           <!--  <input type="submit" value="Completa Acquisto" class="btn">-->
           <button type="submit" class="btn">Completa Acquisto</button>
              </form>
         </div>
  </div>
 </div>
</div>

   <script>
   //NUMERO DI TELEFONO
   var myInput = document.getElementById("phone");
   var length = document.getElementById("length");

   myInput.onfocus = function() {
     document.getElementById("message").style.display = "block";
   }


   myInput.onblur = function() {
     document.getElementById("message").style.display = "none";
   }

   myInput.onkeyup = function() {
     if((myInput.value.length >= 10) && (myInput.value.length <= 12)) {
       length.classList.remove("invalid");
       length.classList.add("valid");
     } else {
       length.classList.remove("valid");
       length.classList.add("invalid");
     }
   }
   
   //EMAIL
   input.onblur = function() {
  if (!input.value.includes('@')) { // non si tratta di una email
    input.classList.add('invalid');
    error.innerHTML = 'Per favore inserire un indirizzo email valido.'
  }
};

input.onfocus = function() {
  if (this.classList.contains('invalid')) {
    // rimuove il messaggio di "errore", in quanto l'utente vuole reinserire qualcosa
    this.classList.remove('invalid');
    error.innerHTML = "";
  }
};
   </script>
 <!--<a href="product?completato=ok&username=<%= currentUser.getUsername()%>">Completa Acquisto</a>-->
     
          <br><br><br>
          <%@ include file="../frammenti/footer.jsp" %>
	</div>
</body>
</html>