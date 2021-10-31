package daos;

import java.sql.SQLException;
import java.util.ArrayList;

import models.Product;
import models.Star;
import utils.DBConnectionUtil;

public class StarDAO extends AbstractDAO{
	public void insertStar(float averagestar) {
		con = DBConnectionUtil.getConnection();
		String sql = "insert into stars(star_average) values(?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setFloat(1, averagestar);
			int result = pst.executeUpdate();
			if(result > 0) {
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
	}
	public float selectValueFinal(int product_id) {
		float value = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "select star_average from stars WHERE product_id = ? ORDER BY star_id DESC limit 1";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, product_id);
			rs = pst.executeQuery();
			while(rs.next()) {
				value = rs.getFloat("star_average");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return value;
	}
	public int countFinal(int product_id) {
		int count = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "select count from stars WHERE product_id = ? ORDER BY star_id DESC limit 1";
		try {
			pst = con.prepareStatement("select count from stars WHERE product_id = ? ORDER BY star_id DESC limit 1");
			pst.setInt(1, product_id);
			rs = pst.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return count;
	}
	public void insertTamCount(float star_average,float star_temporary, int count, int product_id) {
		con = DBConnectionUtil.getConnection();
		String sql = "insert into stars(star_average,star_temporary,count,product_id) values(?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setFloat(1, star_average);pst.setFloat(2, star_temporary);pst.setInt(3, count);pst.setInt(4, product_id);
			int result = pst.executeUpdate();
			if(result > 0) {
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
	}
	public Star selectTamCountFinal(int product_id) {
		Star star = new Star();
		con = DBConnectionUtil.getConnection();
		String sql = "select star_temporary,count from stars WHERE product_id = ? ORDER BY star_id DESC limit 1";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, product_id);
			rs = pst.executeQuery();
			while(rs.next()) {
				star = new Star(rs.getFloat("star_temporary"),rs.getInt("count"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return star;
	}
	public ArrayList<Product> listProductId(){
		ArrayList<Product> listProductId = new ArrayList<Product>();
		Product product = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT DISTINCT product_id FROM stars");
			while(rs.next()) {
				product = new Product(rs.getInt("product_id"));
				listProductId.add(product);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {DBConnectionUtil.close(rs, st, con);}
		return listProductId;
	}
}
