package daos;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import models.ListNews;
import models.Product;
import utils.DBConnectionUtil;


public class ListNewsDAO extends AbstractDAO{
	
	public ArrayList<ListNews> fullListNews(){
		ArrayList<ListNews> fullListNews = new ArrayList<ListNews>();
		ListNews ln = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM listnews");
			while(rs.next()) {
				ln = new ListNews(rs.getInt("listnews_id"),
						   rs.getString("listnews_name"), 
						   rs.getString("listnews_uploader"), 
						   rs.getString("listnews_image"), 
						   rs.getDate("date"),
						   rs.getString("listnews_content"), 
						   rs.getInt("menu_id"));
				fullListNews.add(ln);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,st,con);}
		return fullListNews;
	}
	
	public ArrayList<ListNews> fullListNewsByMenuId(int menu_id){
		ArrayList<ListNews> fullListNewsByMenuId = new ArrayList<ListNews>();
		ListNews ln = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM listnews WHERE menu_id = ?");
			pst.setInt(1, menu_id);
			rs = pst.executeQuery();
			while(rs.next()) {
				ln = new ListNews(rs.getInt("listnews_id"),
						   rs.getString("listnews_name"), 
						   rs.getString("listnews_uploader"), 
						   rs.getString("listnews_image"), 
						   rs.getDate("date"),
						   rs.getString("listnews_content"), 
						   rs.getInt("menu_id"));
				fullListNewsByMenuId.add(ln);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return fullListNewsByMenuId;
	}
	
	public ListNews listNewsById(int id){
		ListNews ln = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM listnews WHERE listnews_id = ?");
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				ln = new ListNews(rs.getInt("listnews_id"),
									   rs.getString("listnews_name"), 
									   rs.getString("listnews_uploader"), 
									   rs.getString("listnews_image"), 
									   rs.getDate("date"),
									   rs.getString("listnews_content"), 
									   rs.getInt("menu_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return ln;
		}
	
	public ArrayList<ListNews> listNews(int menu_id,int listnews_id){
		ArrayList<ListNews> listNews = new ArrayList<ListNews>();
		ListNews ln = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM listnews WHERE menu_id = ? AND listnews_id = ?");
			pst.setInt(1, menu_id);
			pst.setInt(2, listnews_id);
			rs = pst.executeQuery();
			if(rs.next()) {
				ln = new ListNews(rs.getInt("listnews_id"),
									   rs.getString("listnews_name"), 
									   rs.getString("listnews_uploader"), 
									   rs.getString("listnews_image"), 
									   rs.getDate("date"),
									   rs.getString("listnews_content"), 
									   rs.getInt("menu_id"));
				listNews.add(ln);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return listNews;
		}
	public ArrayList<ListNews> listNewsMin(int menu_id,int offset){
		ArrayList<ListNews> listNews = new ArrayList<ListNews>();
		ListNews ln = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT listnews_id,listnews_name,listnews_uploader,listnews_image,date,listnews_content,menu_id,listnews_views FROM listnews WHERE menu_id = ? LIMIT ?,?");
			pst.setInt(1, menu_id);
			pst.setInt(2, offset);
			pst.setInt(3, 3);
			rs = pst.executeQuery();
			while(rs.next()) {
				ln = new ListNews(rs.getInt("listnews_id"),
									   rs.getString("listnews_name"), 
									   rs.getString("listnews_uploader"), 
									   rs.getString("listnews_image"), 
									   rs.getDate("date"),
									   rs.getString("listnews_content"), 
									   rs.getInt("menu_id"),
									   rs.getInt("listnews_views"));
				listNews.add(ln);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return listNews;
	}
	
	public ListNews checkLike(int IDAccount,int listnews_id){
		ListNews ln = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT favourite.favourite_status,favourite.listnews_id FROM favourite WHERE favourite.IDAccount = ? AND favourite.listnews_id = ?");
			pst.setInt(1, IDAccount);
			pst.setInt(2, listnews_id);
			rs = pst.executeQuery();
			while(rs.next()) {
				ln = new ListNews(rs.getInt("favourite_status"),
									   rs.getInt("listnews_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return ln;
	}
	
	public String nameMenu(int menu_id) {
		String str = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT menu_name FROM menu WHERE menu_id = ?");
			pst.setInt(1, menu_id);
			rs = pst.executeQuery();
			if(rs.next()) {
				str = rs.getString("menu_name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return str;
	}
	public ArrayList<ListNews> findListNews(String query){
		ArrayList<ListNews> listNews = new ArrayList<ListNews>();
		ListNews ln = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT listnews.listnews_id,listnews.listnews_name,listnews.listnews_uploader,listnews.listnews_image,listnews.date,SUBSTRING(listnews.listnews_content,1,100),listnews.menu_id FROM listnews WHERE listnews.listnews_name LIKE ?");
			pst.setString(1, "%"+ query+"%");
			rs = pst.executeQuery();
			while(rs.next()) {
				ln = new ListNews(rs.getInt("listnews_id"),
						   rs.getString("listnews_name"), 
						   rs.getString("listnews_uploader"), 
						   rs.getString("listnews_image"), 
						   rs.getDate("date"),
						   rs.getString("SUBSTRING(listnews.listnews_content,1,100)"), 
						   rs.getInt("menu_id"));
				listNews.add(ln);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return listNews;
	}
	
	public String addPost(String picture, String title,String uploader, String content, int menuSonId) {
		String result = "";
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("INSERT INTO listnews (listnews_name,listnews_uploader,listnews_image,date,listnews_content,menu_id) VALUES(?,?,?,?,?,?)");
			pst.setString(1, title);
			pst.setString(2, uploader);
			pst.setString(3, picture);
			pst.setString(4, new SimpleDateFormat("yyyy-MM-dd").format(new Date().getTime()));
			pst.setString(5, content);
			pst.setInt(6, menuSonId);
			result = pst.executeUpdate() > 0?"5":"6";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst, con);}
		return result;
	}
	
	public int deleteListNews(int id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("DELETE FROM listnews WHERE listnews_id = ?");
			pst.setInt(1, id);
			result = pst.executeUpdate();
			result = result>0?1:0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		return result;
	}

	public int updateNews(int listnews_id,String listnews_name,String listnews_image,String listnews_content,int menu_id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE listnews SET listnews_id = ?,listnews_name = ?,listnews_image = ?,listnews_content = ?,menu_id  = ? WHERE listnews_id = ?");
			pst.setInt(1, listnews_id);
			pst.setString(2, listnews_name);
			pst.setString(3, listnews_image);
			pst.setString(4, listnews_content);
			pst.setInt(5, menu_id);
			pst.setInt(6, listnews_id);
			result = pst.executeUpdate()>0?1:0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
		return result;
	}

	public ArrayList<ListNews> getItemPagination(int offset) {
		ArrayList<ListNews> fullListNews = new ArrayList<ListNews>();
		ListNews ln = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM listnews ORDER BY listnews_id LIMIT ?,?");
			pst.setInt(1, offset);
			pst.setInt(2, 3);
			rs = pst.executeQuery();
			while(rs.next()) {
				ln = new ListNews(rs.getInt("listnews_id"),
						   rs.getString("listnews_name"), 
						   rs.getString("listnews_uploader"), 
						   rs.getString("listnews_image"), 
						   rs.getDate("date"),
						   rs.getString("listnews_content"), 
						   rs.getInt("menu_id"));
				fullListNews.add(ln);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return fullListNews;
	}
	
	public ArrayList<Integer> idListNews(){
		ArrayList<Integer> idListNews = new ArrayList<Integer>();
		Integer id = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT DISTINCT IDListnews FROM comment");
			while(rs.next()) {
				id = new Integer(rs.getInt("IDListnews"));
				idListNews.add(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,st,con);}
		return idListNews;
	}
	
	public void updateViews(int id) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE listnews SET listnews_views = listnews_views + 1 WHERE listnews_id = ?");
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst, con);}
	}
	
	public ArrayList<ListNews> listNewsViews(){
		ArrayList<ListNews> listNewsViews = new ArrayList<ListNews>();
		ListNews ln = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM listnews ORDER BY listnews_views DESC LIMIT 0,3");
			while(rs.next()) {
				ln = new ListNews(rs.getInt("listnews_id"),
						   rs.getString("listnews_name"), 
						   rs.getString("listnews_uploader"), 
						   rs.getString("listnews_image"), 
						   rs.getDate("date"),
						   rs.getString("listnews_content"), 
						   rs.getInt("menu_id"),
						   rs.getInt("listnews_views"));
				listNewsViews.add(ln);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,st,con);}
		return listNewsViews;
	}
	
	public ArrayList<ListNews> listNewsRelate(int menu_id,int listnews_id){
		ArrayList<ListNews> listNewsRelate = new ArrayList<ListNews>();
		ListNews ln = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM listnews INNER JOIN menu ON listnews.menu_id = menu.menu_id WHERE listnews.menu_id = ? AND listnews.listnews_id != ? LIMIT 4");
			pst.setInt(1, menu_id);
			pst.setInt(2, listnews_id);
			rs = pst.executeQuery();
			while(rs.next()) {
				ln = new ListNews(rs.getInt("listnews_id"),
						   rs.getString("listnews_name"), 
						   rs.getString("listnews_uploader"), 
						   rs.getString("listnews_image"), 
						   rs.getDate("date"),
						   rs.getString("listnews_content"), 
						   rs.getInt("menu_id"),
						   rs.getInt("listnews_views"));
				listNewsRelate.add(ln);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return listNewsRelate;
	}
}
