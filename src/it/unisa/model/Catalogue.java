package it.unisa.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Catalogue implements Serializable {

	private static final long serialVersionUID = 1L;

	private List<ProductBean> items = new ArrayList<ProductBean>();

	public List<ProductBean> getItems() {
		return items;
	}

	public void empty() {
		this.items = new ArrayList<ProductBean>();
	}

}
