package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<ProductBean> products;
	
	public Cart() {
		products = new ArrayList<ProductBean>();
	}
	
	public void addProduct(ProductBean product) {
		boolean alreadyInCart = false;
		
		for ( ProductBean productInCart : products ) {
			if ( productInCart.getCode() == product.getCode() ) {
				int n = product.getQuantitaC();
				alreadyInCart = true;
				productInCart.setQuantitaC(n + productInCart.getQuantitaC());
				return;
			}
		}
		products.add(product);
	}
	
	public void deleteProduct(int id) {
		for(ProductBean prod : products) {
			if(prod.getCode() == id) {
				products.remove(prod);
				break;
			}
		}
 	}
	
	public List<ProductBean> getProducts() {
		return  products;
	}
	
	public int getOrder(ProductBean product) {
		int tot = 0;
		for(ProductBean prod : products) {
			if(prod.getCode() == product.getCode() ) {
				tot++;
			}
		}
		return tot;
	}
	
	public double Totale() {
		double totale = 0;
		for (ProductBean prod : products) {
			totale += (prod.getPrice() + prod.getPrice() * 4 / 100) * prod.getQuantitaC();
		}
		return totale;
	}
	
	public void empty() {
		this.products = new ArrayList<ProductBean>();
	}
	
}
