package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.*;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.util.List;

public class ProductModelDS implements ProductModel {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/progettotsw");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "videogioco";
	private String nomis = "-";

	@Override
	public synchronized void doSave(ProductBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductModelDS.TABLE_NAME
				+ " (Codice, Nome, Genere, Piattaforma, Costo, Tipologia, Quantita, Flag) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, product.getCode());
			preparedStatement.setString(2, product.getName());
			preparedStatement.setString(3, product.getGenre());
			preparedStatement.setString(4, product.getPlatform());
			preparedStatement.setDouble(5, product.getPrice());
			preparedStatement.setString(6, product.getTipologia());
			preparedStatement.setInt(7, product.getQuantity());
			preparedStatement.setInt(8, product.getFlag());

			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	@Override
	public synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME + " WHERE Codice = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getInt("Codice"));
				bean.setName(rs.getString("Nome"));
				bean.setGenre(rs.getString("Genere"));
				bean.setPlatform(rs.getString("Piattaforma"));
				bean.setPrice(rs.getInt("Costo"));
				bean.setTipologia(rs.getString("Tipologia"));
				bean.setQuantity(rs.getInt("Quantita"));
				bean.setImmagine(rs.getString("Immagine"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}
	
	
	public synchronized Collection<ProductBean> doRetrieveByName(String name) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME + " WHERE Nome = '"+name+"'";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("Codice"));
				bean.setName(rs.getString("Nome"));
				bean.setGenre(rs.getString("Genere"));
				bean.setPrice(rs.getDouble("Costo"));
				bean.setQuantity(rs.getInt("Quantita"));
				bean.setPlatform(rs.getString("Piattaforma"));
				bean.setTipologia(rs.getString("Tipologia"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	
	
	@Override
	public synchronized void doDelete(int code) throws SQLException {
		Connection connection = null;
		Statement stmt = null;

		int value = 0;

		String deleteQuery = "UPDATE progettotsw.videogioco SET progettotsw.videogioco.Flag = '"+value+"' WHERE progettotsw.videogioco.Codice = '"+code+"'";

		try {
			connection = ds.getConnection();
			stmt = connection.createStatement();
			stmt.executeUpdate(deleteQuery);
			}
			catch(Exception e) {
				System.out.println(e);
			}
	}
	
	public synchronized void doReadd(int code) throws SQLException {
		Connection connection = null;
		Statement stmt = null;

		int value = 1;

		String deleteQuery = "UPDATE progettotsw.videogioco SET progettotsw.videogioco.Flag = '"+value+"' WHERE progettotsw.videogioco.Codice = '"+code+"'";

		try {
			connection = ds.getConnection();
			stmt = connection.createStatement();
			stmt.executeUpdate(deleteQuery);
			}
			catch(Exception e) {
				System.out.println(e);
			}
	}

	@Override
	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT *"
							+ "FROM " + ProductModelDS.TABLE_NAME;
		
		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("Codice"));
				bean.setName(rs.getString("Nome"));
				bean.setGenre(rs.getString("Genere"));
				bean.setPrice(rs.getDouble("Costo"));
				bean.setQuantity(rs.getInt("Quantita"));
				bean.setPlatform(rs.getString("Piattaforma"));
				bean.setTipologia(rs.getString("Tipologia"));
				bean.setFlag(rs.getInt("Flag"));
				bean.setImmagine(rs.getString("Immagine"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	
	public synchronized void insertCart(Cart cart, String username) {
		Connection connection = null;
		Statement stmt = null;
		
		int codice = 0;
		int quantita = 0;
		String nick = username;
		int iva = 4;
		
		ProductBean[] cartProducts = cart.getProducts().toArray(new ProductBean[0]);
		for( ProductBean aCartProduct : cartProducts ) {
			codice = aCartProduct.getCode();
			quantita = quantita + aCartProduct.getQuantitaC();
			nomis += aCartProduct.getName() + ", ";
		}
		double tot = cart.Totale();
		LocalDate data = LocalDate.now();
		LocalTime tempo = LocalTime.now();
		
		String insertQuery ="INSERT INTO acquistato(codice, username, data_acquisto, orario_acquisto, iva_vendita, prezzo_vendita, quantita, descrizione)"
			     +" VALUES('"+codice+"','"+nick+"','"+data+"','"+tempo+"','"+iva+"','"+tot+"', '"+quantita+"', '"+nomis+"')";
		try {
		connection = ds.getConnection();
		stmt = connection.createStatement();
		stmt.executeUpdate(insertQuery);
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	public synchronized void insertCart2(Cart cart, String id) {
		Connection connection = null;
		Statement stmt = null;
		
		int codice = 0;
		int quantita = 0;
		String ident = id;
		int iva = 4;
		
		ProductBean[] cartProducts = cart.getProducts().toArray(new ProductBean[0]);
		for( ProductBean aCartProduct : cartProducts ) {
			codice = aCartProduct.getCode();
			quantita = quantita + aCartProduct.getQuantitaC();
			nomis += aCartProduct.getName() + ", ";
		}
		double tot = cart.Totale();
		LocalDate data = LocalDate.now();
		LocalTime tempo = LocalTime.now();
		
		String insertQuery ="INSERT INTO acquistato(codice, id, data_acquisto, orario_acquisto, iva_vendita, prezzo_vendita, quantita, descrizione)"
			     +" VALUES('"+codice+"','"+ident+"','"+data+"','"+tempo+"','"+iva+"','"+tot+"', '"+quantita+"', '"+nomis+"')";
		try {
		connection = ds.getConnection();
		stmt = connection.createStatement();
		stmt.executeUpdate(insertQuery);
		System.out.println("CIAO SONO QUI");
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	public synchronized void UpdateStore(Cart cart) {
		Connection connection = null;
		Statement stmt = null;
		
		int codice = 0;
		int quantita = 0;
		
		ProductBean[] cartProducts = cart.getProducts().toArray(new ProductBean[0]);
		for( ProductBean aCartProduct : cartProducts ) {
			if (codice == aCartProduct.getCode()) {
				break;
			}
			else {
				codice = aCartProduct.getCode();
				quantita = aCartProduct.getQuantity() - aCartProduct.getQuantitaC();
			
				String updateQuery = "UPDATE progettotsw.videogioco SET progettotsw.videogioco.Quantita = '"+quantita+"' WHERE progettotsw.videogioco.Codice = '"+codice+"'";
				try {
					connection = ds.getConnection();
					stmt = connection.createStatement();
					stmt.executeUpdate(updateQuery);
					System.out.println("CIAO SONO QUI");
					}
				catch(Exception e) {
					System.out.println(e);
					}
			}
		}
	}
	
	public synchronized void UpdateGame(int code, double price) {
		Connection connection = null;
		Statement stmt = null;
		
		int codice = code;
		double prezzo = price;
			
		String updateQuery = "UPDATE progettotsw.videogioco SET progettotsw.videogioco.Costo = '"+prezzo+"' WHERE progettotsw.videogioco.Codice = '"+codice+"'";
		try {
			connection = ds.getConnection();
			stmt = connection.createStatement();
			stmt.executeUpdate(updateQuery);
			System.out.println("CIAO SONO QUI");
			}
		catch(Exception e) {
			System.out.println(e);
			}
		}
		

}