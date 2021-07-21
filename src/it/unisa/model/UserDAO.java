package it.unisa.model;

import java.text.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.*;
import java.sql.Date;

public class UserDAO 	
{
   static Connection currentCon = null;	
   static DataSource ds;
   static ResultSet rs = null;  
	
   static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/progettotsw");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	} 
   
   public static UserBean doRetrieve(UserBean bean) {
	
      //preparing some objects for connection 
      Statement stmt = null;    
      PreparedStatement preparedStatement = null;
	
      String username = bean.getUsername();    
      String password = bean.getPassword();   
	    
      String searchQuery =
            "select * from registrato where Username='"
                     + username
                     + "' AND Password='"
                     + password
                     + "'";
	    
   // "System.out.println" prints in the console; Normally used to trace the process
   System.out.println("Your user name is " + username);          
   System.out.println("Your password is " + password);
   System.out.println("Query: "+searchQuery);
   
 
	    
   try 
   {
      //connect to DB 
      Connection currentCon = ds.getConnection();
      preparedStatement=currentCon.prepareStatement(searchQuery);
      rs = preparedStatement.executeQuery(searchQuery);	        
      boolean more = rs.next();
	       
      // if user does not exist set the isValid variable to false
      if (!more) 
      {
         System.out.println("Sorry, you are not a registered user! Please sign up first");
         bean.setValid(false);
      } 
	        
      //if user exists set the isValid variable to true
      else if (more) 
      {
         String userN = rs.getString("Username");
	     	
         System.out.println("Welcome " + userN);
         bean.setUsername(userN);
         bean.setValid(true);
      }
   } 

   catch (Exception ex) 
   {
      System.out.println("Log In failed: An Exception has occurred! " + ex);
   } 
	    
   //some exception handling
   finally 
   {
      if (rs != null)	{
         try {
            rs.close();
         } catch (Exception e) {}
            rs = null;
         }
	
      if (stmt != null) {
         try {
            stmt.close();
         } catch (Exception e) {}
            stmt = null;
         }
	
      if (currentCon != null) {
         try {
            currentCon.close();
         } catch (Exception e) {
         }

         currentCon = null;
      }
   }

return bean;
	
   }	
  
   public static UserBean Ricerca(UserBean bean) {
		
	      //preparing some objects for connection 
	      Statement stmt = null;    
	      PreparedStatement preparedStatement = null;
		
	      String username = bean.getUsername();    
	      String password = bean.getPassword();   
		    
	      String searchQuery =
	            "select * from registrato where Username='"
	                     + username
	                     + "' AND Password='"
	                     + password
	                     + "'";
	 
		    
	   try 
	   {
	      //connect to DB 
	      Connection currentCon = ds.getConnection();
	      preparedStatement=currentCon.prepareStatement(searchQuery);
	      rs = preparedStatement.executeQuery(searchQuery);	        
	      boolean more = rs.next();
		       
	      // if user does not exist set the isValid variable to false
	      if (!more) 
	      {
	         System.out.println("Username o Password errati");
	         bean.setValid(false);
	      } 
		        
	      //if user exists set the isValid variable to true
	      else if (more) 
	      {
	         String userN = rs.getString("Username");
	         String CAP = rs.getString("CAP");
	         String Citta = rs.getString("Citta");
	         String Via = rs.getString("Via");
		     	
	         bean.setUsername(userN);
	         bean.setCAP(CAP);
	         bean.setCitta(Citta);
	         bean.setVia(Via);
	         bean.setValid(true);
	      }
	   } 

	   catch (Exception ex) 
	   {
	      System.out.println("Log In failed: An Exception has occurred! " + ex);
	   } 
		    
	   //some exception handling
	   finally 
	   {
	      if (rs != null)	{
	         try {
	            rs.close();
	         } catch (Exception e) {}
	            rs = null;
	         }
		
	      if (stmt != null) {
	         try {
	            stmt.close();
	         } catch (Exception e) {}
	            stmt = null;
	         }
		
	      if (currentCon != null) {
	         try {
	            currentCon.close();
	         } catch (Exception e) {
	         }

	         currentCon = null;
	      }
	   }

	return bean;
		
	   }
   
   public static UserBean Registrazione(UserBean bean) {
	   
	   try {
		   
		 Connection currentCon = ds.getConnection();
		
	     String username = bean.getUsername();    
	     String password = bean.getPassword();   
	     String name = bean.getFirstName();
	     String surname = bean.getLastName();
	     String date = bean.getDataN();
	     String way = bean.getVia();
	     String CAP = bean.getCAP();
	     String town = bean.getCitta();
		    
	     String insertQuery ="INSERT INTO registrato(Username, Nome, Cognome, Password, Citta, CAP, DataNascita, Via)"
			     +" VALUES('"+username+"','"+name+"','"+surname+"','"+password+"','"+town+"','"+CAP+"','"+date+"', '"+way+"')";
	     
	     Statement stmt = currentCon.createStatement();
			stmt.executeUpdate(insertQuery);
			
			bean.setValid(true);
	   }
	   catch(Exception e) {
		   System.out.println(e);
	   }
	   return bean;
   }
   
   
   public static String retrieveUser(UserBean bean) {
		
	      //preparing some objects for connection 
	      Statement stmt = null;    
	      PreparedStatement preparedStatement = null;
		
	      String username = bean.getUsername();   
	      String usn = null;
		    
	      String searchQuery =
	            "select * from registrato where Username='" + username +"' ";
	      
	      try 
	      {
	         //connect to DB 
	         Connection currentCon = ds.getConnection();
	         preparedStatement=currentCon.prepareStatement(searchQuery);
	         rs = preparedStatement.executeQuery(searchQuery);	        
	         boolean more = rs.next();
	   	       
	         if (more) 
	         {
	            String userN = rs.getString("Username");
	            usn = userN;
	         }
	         
	      } 

	      catch (Exception ex) 
	      {
	         System.out.println(ex);
	      } 
	      
		   finally 
		   {
		      if (rs != null)	{
		         try {
		            rs.close();
		         } catch (Exception e) {}
		            rs = null;
		         }
			
		      if (stmt != null) {
		         try {
		            stmt.close();
		         } catch (Exception e) {}
		            stmt = null;
		         }
			
		      if (currentCon != null) {
		         try {
		            currentCon.close();
		         } catch (Exception e) {
		         }

		         currentCon = null;
		      }
		   }
	      return usn;
   
   }
   
   public static Collection<Acquisto> retrieveOrdini(UserBean bean) throws SQLException {
		
	      Connection connection = null;   
	      PreparedStatement preparedStatement = null;
		
	      String username = bean.getUsername();
		    
	      String searchQuery =
	            "select * from acquistato where username='" + username +"' ";
	      Collection<Acquisto> lista = new LinkedList<Acquisto>();
	      try 
	      {
	         //connect to DB 
	         connection = ds.getConnection();
	         preparedStatement=connection.prepareStatement(searchQuery);
	         System.out.println(preparedStatement.toString());
	         rs = preparedStatement.executeQuery();	        
	         while(rs.next()) {
	          Acquisto acq = new Acquisto();
	          
	          acq.setData(rs.getDate("data_acquisto"));
	          acq.setImporto(rs.getDouble("prezzo_vendita"));
	          acq.setUsers(rs.getString("username"));
	          lista.add(acq);
	         }
	      }
	      catch (Exception ex) 
	      {
	         System.out.println(ex);
	      } 
	      
		   finally 
		   {
			   try {
					if (preparedStatement != null)
						preparedStatement.close();
				} finally {
					if (connection != null)
						connection.close();
				}
		   }
	      return lista;

}
   
   public synchronized Acquisto retrieveDettaglio(String user, Date data, double tot) {
	   Statement stmt = null;    
	      PreparedStatement preparedStatement = null;
		
	      String username = user;   
	      Date date = data;
	      double totale = tot;
	      Acquisto acquisto = new Acquisto();
		    
	      String searchQuery =
	            "select * from acquistato where username='" + username +"'	"
	            		+ "and data_acquisto='" + date +"'"
	            				+ "and prezzo_vendita='" + totale +"' ";
	      
	      try 
	      {
	         //connect to DB 
	         Connection currentCon = ds.getConnection();
	         preparedStatement=currentCon.prepareStatement(searchQuery);
	         rs = preparedStatement.executeQuery(searchQuery);	        
	         boolean more = rs.next();
	   	       
	         if (more) 
	         {
	        	 acquisto.setData(date);
	        	 acquisto.setImporto(totale);
	        	 acquisto.setUsers(username);
	        	 acquisto.setDettaglio(rs.getString("descrizione"));
	         }
	         
	      } 
	      catch (Exception ex) 
	      {
	         System.out.println(ex);
	      } 
	      
		   finally 
		   {
		      if (rs != null)	{
		         try {
		            rs.close();
		         } catch (Exception e) {}
		            rs = null;
		         }
			
		      if (stmt != null) {
		         try {
		            stmt.close();
		         } catch (Exception e) {}
		            stmt = null;
		         }
			
		      if (currentCon != null) {
		         try {
		            currentCon.close();
		         } catch (Exception e) {
		         }

		         currentCon = null;
		      }
		   }
	      return acquisto;
   }
   
}

