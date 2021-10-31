package daos;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import models.Category;
import models.Product;
import utils.DBConnectionUtil;

public class ProductDAO extends AbstractDAO{
	
	public ArrayList<Product> listProductByCategoryId(int id){
		ArrayList<Product> listProduct = new ArrayList<Product>();
		Product product = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM product WHERE category_id = ?");
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				product = new Product(rs.getInt("product_id"), 
													rs.getString("product_name"), 
													rs.getString("product_introduce"), 
													rs.getString("product_description"), 
													rs.getString("product_image"), 
													rs.getDouble("product_price"), 
													rs.getInt("product_views"), 
													rs.getString("product_datecreated"), 
													rs.getString("product_datemodified"), 
													rs.getInt("category_id"));
				listProduct.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return listProduct;
	}
	
	public Product listProductById(int product_id){
		Product product = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM product WHERE product_id = ?");
			pst.setInt(1, product_id);
			rs = pst.executeQuery();
			if(rs.next()) {
				product = new Product(rs.getInt("product_id"), 
													rs.getString("product_name"), 
													rs.getString("product_introduce"), 
													rs.getString("product_description"), 
													rs.getString("product_image"), 
													rs.getDouble("product_price"), 
													rs.getInt("product_views"), 
													rs.getString("product_datecreated"), 
													rs.getString("product_datemodified"), 
													rs.getInt("category_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return product;
	}
	
	public ArrayList<Product> listAllProduct(){
		ArrayList<Product> listAllProduct = new ArrayList<Product>();
		Product product = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM product INNER JOIN category ON product.category_id = category.category_id");
			while(rs.next()) {
				product = new Product(rs.getInt("product_id"), 
													rs.getString("product_name"), 
													rs.getString("product_introduce"), 
													rs.getString("product_description"), 
													rs.getString("product_image"), 
													rs.getDouble("product_price"), 
													rs.getInt("product_views"), 
													rs.getString("product_datecreated"), 
													rs.getString("product_datemodified"), 
													rs.getInt("category_id"));
				listAllProduct.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, st, con);}
		return listAllProduct;
	}
	
	public int updatePlusProductById(int product_id){
		int quantity = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE product SET product_quantity = (product_quantity - 1) WHERE product.product_id = ?");
			pst.setInt(1, product_id);
			pst.executeUpdate();
			if(rs.next()) {
				quantity = rs.getInt("product_quantity");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return quantity;
	}
	
	public int updateMinusProductById(int product_id){
		int quantity = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE product SET product_quantity = (product_quantity + 1) WHERE product.product_id = ?");
			pst.setInt(1, product_id);
			pst.executeUpdate();
			if(rs.next()) {
				quantity = rs.getInt("product_quantity");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return quantity;
	}
	
	public int getQuantityProductById(int product_id){
		int quantity = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT product_quantity FROM product WHERE product_id = ?");
			pst.setInt(1, product_id);
			rs = pst.executeQuery();
			if(rs.next()) {
				quantity = rs.getInt("product_quantity");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return quantity;
	}
	
	public ArrayList<Product> findListProduct(String query){
		ArrayList<Product> findListProduct = new ArrayList<Product>();
		Product product = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM product WHERE product_name LIKE ?");
			pst.setString(1, "%"+ query+"%");
			rs = pst.executeQuery();
			while(rs.next()) {
				product = new Product(rs.getInt("product_id"), 
													rs.getString("product_name"), 
													rs.getString("product_introduce"), 
													rs.getString("product_description"), 
													rs.getString("product_image"), 
													rs.getDouble("product_price"), 
													rs.getInt("product_views"), 
													rs.getString("product_datecreated"), 
													rs.getString("product_datemodified"), 
													rs.getInt("category_id"));
				findListProduct.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return findListProduct;
	}
	
	public Product findProductDetailByProductId(int product_id){
		Product product = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM product WHERE product_id = ?");
			pst.setInt(1, product_id);
			rs = pst.executeQuery();
			while(rs.next()) {
				product = new Product(rs.getInt("product_id"), 
						rs.getString("product_name"), 
						rs.getString("product_introduce"), 
						rs.getString("product_description"), 
						rs.getString("product_image"), 
						rs.getDouble("product_price"), 
						rs.getInt("product_views"), 
						rs.getString("product_datecreated"), 
						rs.getString("product_datemodified"), 
						rs.getInt("category_id"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {DBConnectionUtil.close(rs, pst, con);}
		return product;
	}
	
	public int addProduct(String product_name,String product_introduce,String product_description, String product_image, double product_price, int category_id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("INSERT INTO product(product_name,product_introduce,product_description,product_image,product_price,product_views,product_datecreated,product_datemodified,category_id) VALUES(?,?,?,?,?,?,?,?,?)");
			pst.setString(1, product_name);
			pst.setString(2, product_introduce);
			pst.setString(3, product_description);
			pst.setString(4, product_image);
			pst.setDouble(5, product_price);
			pst.setInt(6, 0);
			pst.setString(7, new SimpleDateFormat("dd-MM-yyyy").format(new Date().getTime()));
			pst.setString(8, "");
			pst.setInt(9, category_id);
			result = pst.executeUpdate() > 0?1:0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		return result;
	}
	
	public String nameMenu(int category_id) {
		String str = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT category_name FROM category WHERE category_id = ?");
			pst.setInt(1, category_id);
			rs = pst.executeQuery();
			if(rs.next()) {
				str = rs.getString("category_name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return str;
	}

	public ArrayList<Category> listNameMenu() {
		ArrayList<Category> listNameMenu = new ArrayList<Category>();
		Category category = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM category");
			while(rs.next()) {
				category =  new Category(rs.getInt("category_id"), 
														rs.getString("category_name"));
				listNameMenu.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,st,con);}
		return listNameMenu;
	}
	
	public int updateProduct(int product_id,String product_name,String product_introduce,String product_description,String product_image,double product_price,int category_id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE product SET product_name = ?,product_introduce = ?,product_description = ?,product_image = ?,product_price = ?,product_datemodified = ?,category_id  = ? WHERE product_id = ?");
			pst.setString(1, product_name);
			pst.setString(2, product_introduce);
			pst.setString(3, product_description);
			pst.setString(4, product_image);
			pst.setDouble(5, product_price);
			pst.setString(6, new SimpleDateFormat("dd-MM-yyyy").format(new Date().getTime()));
			pst.setInt(7, category_id);
			pst.setInt(8, product_id);
			result = pst.executeUpdate()>0?1:0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		return result;
	}
	
	public int delProduct(int id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("DELETE  FROM product WHERE product_id = ?");
			pst.setInt(1, id);
			result = pst.executeUpdate() > 0?1:0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		return result;
	}

	public ArrayList<Product> getItemPagination(int offset) {
		ArrayList<Product> listProduct = new ArrayList<Product>();
		Product product = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM product ORDER BY product_id LIMIT ?,?");
			pst.setInt(1, offset);
			pst.setInt(2, 3);
			rs = pst.executeQuery();
			while(rs.next()) {
				product = new Product(rs.getInt("product_id"), 
						rs.getString("product_name"), 
						rs.getString("product_introduce"), 
						rs.getString("product_description"), 
						rs.getString("product_image"), 
						rs.getDouble("product_price"), 
						rs.getInt("product_views"), 
						rs.getString("product_datecreated"), 
						rs.getString("product_datemodified"), 
						rs.getInt("category_id"));
				listProduct.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return listProduct;
	}
	
	public int countProduct() {
		int count = 0;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(product_id) as product_id FROM product");
			if(rs.next()) {
				count = rs.getInt("product_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,st,con);}
		return count;
	}
	
	public void updateViews(int id) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE product SET product_views = product_views + 1 WHERE product_id = ?");
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst, con);}
	}
	
	public ArrayList<Product> listProductViews(){
		ArrayList<Product> listProductViews = new ArrayList<Product>();
		Product product = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM product ORDER BY product_views DESC LIMIT 0,3");
			while(rs.next()) {
				product = new Product(rs.getInt("product_id"), 
						rs.getString("product_name"), 
						rs.getString("product_introduce"), 
						rs.getString("product_description"), 
						rs.getString("product_image"), 
						rs.getDouble("product_price"), 
						rs.getInt("product_views"), 
						rs.getString("product_datecreated"), 
						rs.getString("product_datemodified"), 
						rs.getInt("category_id"));
				listProductViews.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,st,con);}
		return listProductViews;
	}
}
