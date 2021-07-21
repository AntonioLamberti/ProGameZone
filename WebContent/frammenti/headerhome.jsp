<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}


.topnav {
  overflow: hidden;
  background-color: grey;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ffcc5f;
  color: black;
}

/*.topnav a.active {
  background-color: #ffcc5f;
  color: white;
}*/

.topnav .icon {
  display: none;
}


/*.topnav input:focus{
	  background-color: #ffcc5f;
  color: white;
}
*/
@media screen and (max-width: 900px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 900px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}

.logo{
  border-radius: 50%;
}

</style>
</head>
<body>

<div class="topnav" id="myTopnav">

  <a href="<%= request.getContextPath() %>/userHome.jsp" class="active">Home</a>	
  <a href="./LoginPage.jsp">Login</a>
  <a href="./LoginPage.jsp">Registrati</a>
    <a href="./pages/ProductView.jsp">Catalogo</a>
    <a href="./CheckUser.jsp">Ordini Effettuati</a>
  
   
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
    
  </a>
</div>


<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>

</body>
</html>
