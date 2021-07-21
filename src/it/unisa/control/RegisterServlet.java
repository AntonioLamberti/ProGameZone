package it.unisa.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.UserBean;
import it.unisa.model.UserDAO;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserBean user = new UserBean();
		user.setFirstName(request.getParameter("Nome"));
		user.setLastName(request.getParameter("Cognome"));
		user.setDataN(request.getParameter("DataN"));
		user.setCitta(request.getParameter("Citta"));
		user.setCAP(request.getParameter("CAP"));
		user.setVia(request.getParameter("Via"));
		user.setUsername(request.getParameter("Username"));
		user.setPassword(request.getParameter("Password"));
		
		try
		{	
			
			if(user.getUsername().equals(UserDAO.retrieveUser(user))) {
				response.sendRedirect("usernameNotValid.jsp");
			}
			
		    System.out.println("QUI 1");
		    
		    user = UserDAO.Registrazione(user);
			   		    
		     if (user.isValid())
		     {
			        
		          HttpSession session = request.getSession(true);	    
		          session.setAttribute("currentSessionUser",user); 
		          response.sendRedirect("userRegistered.jsp");    		
		     }
				
		}		
		catch (Throwable theException) 	    
		{
		     System.out.println(theException); 
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
