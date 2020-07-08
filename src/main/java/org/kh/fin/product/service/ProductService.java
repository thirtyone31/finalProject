package org.kh.fin.product.service;

import java.util.ArrayList;

import org.kh.fin.product.domain.Product;

public interface ProductService {
	
	public int productInsert(Product product);
	
	public int productDelete(int productNum);
	
	public ArrayList<Product> productSearchAll(int categoryNum);
	
	public Product productSelectOne(int productNum);
	
	public int productModify(int productNum);
	
	
}
