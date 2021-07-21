package it.unisa.control;

import java.io.IOException;
import java.sql.Date;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import it.unisa.model.*;
import javax.servlet.annotation.*;
@WebServlet("/LoginServlet")

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {

private static UserDAO ciccio = new UserDAO();

static boolean isDataSource = true;

public LoginServlet() {
	super();
}
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public void doGet(HttpServletRequest request, HttpServletResponse response) 
			           throws ServletException, java.io.IOException {
	UserBean user = new UserBean();
	RequestDispatcher dispatcher;
	if (request.getSession().getAttribute("user")==null || user.getUsername()!=request.getParameter("Username")) {
		user.setUsername(request.getParameter("Username"));
	    user.setPassword(request.getParameter("Password"));
	    request.getSession().setAttribute("user", user);
	}
	else {
		user = (UserBean) request.getSession().getAttribute("user");
	}
    
	String boh = request.getParameter("boh");
    if (boh != null) {
    	String username = user.getUsername();
    	String data = request.getParameter("data");
    	Date date = Date.valueOf(data);
    	String tot = request.getParameter("tot");
    	double totale = Double.parseDouble(tot);
    	Acquisto acq = new Acquisto();
    	acq = ciccio.retrieveDettaglio(username, date, totale);
    	System.out.println(acq);
    	request.removeAttribute("acquisto");
    	request.setAttribute("acquisto", acq);
    	dispatcher = getServletContext().getRequestDispatcher("/dettaglioAcquisto.jsp");
		dispatcher.forward(request, response);
    }  
    
    String check = request.getParameter("check");
    try {
    if (check != null) {
    	Collection<Acquisto> collection = ciccio.retrieveOrdini(user);
    	System.out.println(collection.size());
    	request.removeAttribute("lista");
    	request.setAttribute("lista", collection);
    	dispatcher = getServletContext().getRequestDispatcher("/ListaOrdini.jsp");
		dispatcher.forward(request, response);
    	}
    }
    catch(Exception e) {
    	System.out.println(e);
    }
    
    String login =  request.getParameter("amni");
    if(login != null && request.getParameter("Username").equals("root") && request.getParameter("Password").equals("password")) {
    	System.out.println("sono qui");
    	 HttpSession session = request.getSession(true);
    	 user.setUsername(request.getParameter("Username"));
 	     user.setPassword(request.getParameter("Password"));
 	     System.out.println(user);
 	     request.getSession().setAttribute("user", user);; 
         response.sendRedirect("userHome2.jsp"); //creare homepage e catalogo per l'amministratore
    }
    else if (login != null){
try
{	    
    System.out.println("QUI 1");
    user = ciccio.doRetrieve(user);
	   		    
     if (user.isValid())
     {
	        
          HttpSession session = request.getSession(true);	    
          session.setAttribute("user",user); 
          response.sendRedirect("userHome.jsp"); //logged-in page      		
     }
	        
     else 
          response.sendRedirect("invalidLogin.jsp"); //error page 
} 
		
		
catch (Throwable theException) 	    
{
     System.out.println(theException); 
}
    }

       }
	}
