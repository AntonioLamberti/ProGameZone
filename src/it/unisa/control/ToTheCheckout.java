package it.unisa.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.Cart;
import it.unisa.model.UserBean;
import it.unisa.model.UserDAO;

/**
 * Servlet implementation class ToTheCheckout
 */
@WebServlet("/TTC")
public class ToTheCheckout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ToTheCheckout() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserBean user = new UserBean();
	    user.setUsername(request.getParameter("Username"));
	    user.setPassword(request.getParameter("Password"));
	    System.out.println("QUI 1");
	    user = UserDAO.Ricerca(user);
	    
	    if (user.isValid()) {
	    	 HttpSession session = request.getSession(true);	    
	          session.setAttribute("currentSessionUser",user);
	          Cart cart = (Cart) request.getSession().getAttribute("cart");
	  		if (cart == null) {
	  			cart = new Cart();
	  			request.getSession().setAttribute("cart", cart);
	  		}
	          response.sendRedirect("Checkout.jsp");
	    } 
	    else {
	    	 response.sendRedirect("invalidLogin.jsp");
	    }
	    
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
