package it.unisa.model;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int code;
	String name;
	String genre;
	double price;
	int quantity;
	String platform;
	String tipologia;
	int quantitaC;
	int flag;
	String immagine;

	public ProductBean() {
		code = -1;
		name = "";
		genre = "";
		quantity = 0;
		platform = "";
		tipologia = "";
		quantitaC = 0;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public String getTipologia() {
		return tipologia;
	}

	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}

	public int getQuantitaC() {
		return quantitaC;
	}

	public void setQuantitaC(int quantitaC) {
		this.quantitaC = quantitaC;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}
	
	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	@Override
	public String toString() {
		return name + " (" + code + "), " + price + " " + quantity + ". " + genre + " " + platform + " " + tipologia + " " + flag + " " + immagine;
	}

}
