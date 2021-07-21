package it.unisa.control;

import java.io.IOException; 
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductModel;
import it.unisa.model.ProductModelDS;
import it.unisa.model.UserBean;
import it.unisa.model.Cart;
import it.unisa.model.ProductBean;


@WebServlet("/product")
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static boolean isDataSource = true;
	
	private static ProductModelDS model = new ProductModelDS();
	
	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher;
		
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");
		
		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					ProductBean prodotto = model.doRetrieveByKey(id);
					int qta = Integer.parseInt(request.getParameter("qta"));
					prodotto.setQuantitaC(qta);
					cart.addProduct(prodotto);
				} else if (action.equalsIgnoreCase("deleteC")) {
					/*int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(model.doRetrieveByKey(id));
					dispatcher = getServletContext().getRequestDispatcher("/pages/cart.jsp");
					dispatcher.forward(request, response);*/
				} else if (action.equalsIgnoreCase("dettaglio")) {
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					request.setAttribute("product", model.doRetrieveByKey(id));
					
					dispatcher = getServletContext().getRequestDispatcher("/pages/dettaglio.jsp");
					dispatcher.forward(request, response);
				}
			}			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);

		String order = request.getParameter("order");
		
		try {
			request.removeAttribute("products");
			request.setAttribute("products", model.doRetrieveAll(order));
		}
		catch(SQLException e) {
			System.out.println("Error" + e.getMessage());
		}
		
		String checkout = request.getParameter("checkout");
		try {
			if (checkout != null) {
				/*request.removeAttribute("cart");
				request.getSession().removeAttribute("cart");*/
				dispatcher = getServletContext().getRequestDispatcher("/CompletaAcquisto.jsp");
				dispatcher.forward(request, response);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		String completato = request.getParameter("completato");
		String username = request.getParameter("username");
		try {
		if(completato != null && username != null) {
			model.UpdateStore(cart);
			model.insertCart(cart, username);
			request.removeAttribute("cart");
			request.getSession().removeAttribute("cart");
			dispatcher = getServletContext().getRequestDispatcher("/OrdineCompletato.jsp");
			dispatcher.forward(request, response);
			}
		}
		catch(Exception e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		String completo = request.getParameter("completo");
		String ident = request.getSession().getId();
		try {
		if(completo != null && ident != null) {
			model.UpdateStore(cart);
			model.insertCart2(cart, ident);
			request.removeAttribute("cart");
			request.getSession().removeAttribute("cart");
			dispatcher = getServletContext().getRequestDispatcher("/OrdineCompletato.jsp");
			dispatcher.forward(request, response);
			}
		}
		catch(Exception e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		String NomeV = request.getParameter("NomeV");
		try {
			if (NomeV != null) {
				request.removeAttribute("products");
				request.setAttribute("products", model.doRetrieveByName(NomeV));
				dispatcher = getServletContext().getRequestDispatcher("/GiocoCercato.jsp");
				dispatcher.forward(request, response);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		String aggiungi = request.getParameter("Aggiungi");
		try {
			if (aggiungi != null) {
				ProductBean prod = new ProductBean();
				prod.setCode(Integer.parseInt(request.getParameter("Codice")));
				prod.setFlag(Integer.parseInt(request.getParameter("Flag")));
				prod.setGenre(request.getParameter("Genere"));
				prod.setName(request.getParameter("Nome"));
				prod.setPlatform(request.getParameter("Piattaforma"));
				prod.setPrice(Double.parseDouble(request.getParameter("Costo")));
				prod.setQuantity(Integer.parseInt(request.getParameter("Quantita")));
				prod.setTipologia(request.getParameter("Tipologia"));
				model.doSave(prod);
				request.removeAttribute("products");
				request.setAttribute("products", model.doRetrieveAll(order));
				dispatcher = getServletContext().getRequestDispatcher("/Amministratore.jsp");
				dispatcher.forward(request, response);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		String modifica = request.getParameter("Modifica");
		try {
			if (modifica != null) {
				ProductBean prod = new ProductBean();
				int code = (Integer.parseInt(request.getParameter("Codice")));
				double price = (Double.parseDouble(request.getParameter("Costo")));
				model.UpdateGame(code, price);
				request.removeAttribute("products");
				request.setAttribute("products", model.doRetrieveAll(order));
				dispatcher = getServletContext().getRequestDispatcher("/Amministratore.jsp");
				dispatcher.forward(request, response);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		String remove = request.getParameter("remove");
		try {
			if(remove != null) {
				int code = Integer.parseInt(request.getParameter("id"));
				model.doDelete(code);
				request.removeAttribute("products");
				request.setAttribute("products", model.doRetrieveAll(order));
				dispatcher = getServletContext().getRequestDispatcher("/Amministratore.jsp");
				dispatcher.forward(request, response);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		String addA = request.getParameter("addA");
		try {
			if(addA != null) {
				int code = Integer.parseInt(request.getParameter("id"));
				model.doReadd(code);
				request.removeAttribute("products");
				request.setAttribute("products", model.doRetrieveAll(order));
				dispatcher = getServletContext().getRequestDispatcher("/Amministratore.jsp");
				dispatcher.forward(request, response);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		UserBean us = (UserBean) request.getSession().getAttribute("user");
		UserBean admin = new UserBean();
		admin.setUsername("root");
		admin.setPassword("password");
		if (us != null) {
		String temp = us.toString();
		String temp2 = admin.toString();
		if (temp.equals(temp2)) {
			dispatcher = getServletContext().getRequestDispatcher("/Amministratore.jsp");
			dispatcher.forward(request, response);
		} 
		else 	{
			dispatcher = getServletContext().getRequestDispatcher("/pages/ProductView.jsp");
			dispatcher.forward(request, response);
			}
		}
		else  {
			dispatcher = getServletContext().getRequestDispatcher("/pages/ProductView.jsp");
			dispatcher.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
