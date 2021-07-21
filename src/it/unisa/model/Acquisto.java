package it.unisa.model;

import java.io.Serializable;
import java.sql.*;

public class Acquisto implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	 Date data;
	 double importo;
	 String users;
	 String dettaglio;
	 
	 public Acquisto() {
		 data = null;
		 importo = 0;
		 users = "";
		 dettaglio = "";
	 }
	
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public double getImporto() {
		return importo;
	}
	public void setImporto(double importo) {
		this.importo = importo;
	}
	public String getUsers() {
		return users;
	}
	public void setUsers(String users) {
		this.users = users;
	}
	public String getDettaglio() {
		return dettaglio;
	}
	public void setDettaglio(String dettaglio) {
		this.dettaglio = dettaglio;
	}

	public String toString() {
		return users + " " + importo + " " + data + " " + dettaglio;
	}
	
}
