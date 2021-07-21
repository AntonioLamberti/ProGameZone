<%@ page language="java" 
      contentType="text/html; charset=windows-1256"
      pageEncoding="windows-1256"
   %>

   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
      "http://www.w3.org/TR/html4/loose.dtd">

   <html>

      <head>
         <meta http-equiv="Content-Type" 
            content="text/html; charset=windows-1256">
         <title>Invalid Login</title>
         <link rel="stylesheet" href="<%= request.getContextPath() %>/stili/stile8.css" type="text/css">
      </head>
	
      <body>
      <%@ include file="../frammenti/header.jsp" %>
      <br><br><br>
         <center>
           Ci dispiace, sembra che i dati inseriti non corrispondano ad un utente registrato.<br>
           <a href="./LoginPage.jsp">Riprova</a>
           oppure
           <a href="./LoginPage.jsp">Registrati</a>
         </center>
         <br><br><br>
         <%@ include file="../frammenti/footer.jsp" %>
      </body>
	
   </html>