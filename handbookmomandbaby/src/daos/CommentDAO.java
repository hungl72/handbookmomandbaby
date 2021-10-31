package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Comment;
import models.CommentChildren;
import utils.DBConnectionUtil;
import utils.DefineUtil;

public class CommentDAO extends AbstractDAO{
	public void insertComment(String comment_content,String comment_datecreated,int IDAccount,String NameAccount,int IDListnews) {
		con = DBConnectionUtil.getConnection();
		String sql = "insert into comment (comment_content,comment_datecreated,IDAccount,NameAccount,IDListnews) values(?,?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, comment_content);pst.setString(2, comment_datecreated);pst.setInt(3, IDAccount);pst.setString(4, NameAccount);pst.setInt(5, IDListnews);
			int result = pst.executeUpdate();
			if(result > 0) {
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
	}
	public ArrayList<Comment> findAllComment() {
		ArrayList<Comment> listComment = new ArrayList<Comment>();
		Comment comment = null;
		con = DBConnectionUtil.getConnection();
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT * FROM comment");
			while (rs.next()) {
				comment = new Comment(rs.getInt("comment_id"), 
														  rs.getString("comment_content"), 
														  rs.getString("comment_datecreated"), 
														  rs.getInt("IDAccount"),
														  rs.getString("NameAccount"),
														  rs.getInt("IDListnews"));
				listComment.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, st, con);}
		return listComment;
	}

	public ArrayList<Comment> findAllCommentByIDListNews(int id) {
		ArrayList<Comment> listComment = new ArrayList<Comment>();
		Comment comment = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM comment WHERE IDListnews = ?");
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				comment = new Comment(rs.getInt("comment_id"), 
														  rs.getString("comment_content"), 
														  rs.getString("comment_datecreated"), 
														  rs.getInt("IDAccount"),
														  rs.getString("NameAccount"),
														  rs.getInt("IDListnews"));
				listComment.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return listComment;
	}
	
	public ArrayList<CommentChildren> findAllCommentChildren(int IDComment,int comment_children_id) {
		ArrayList<CommentChildren> listComment = new ArrayList<CommentChildren>();
		CommentChildren commentChildren = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT commentchildren.comment_children_id,commentchildren.comment_children_content,commentchildren.comment_children_datecreated,commentchildren.IDAccount,commentchildren.NameAccount,commentchildren.IDListNews,commentchildren.IDComment FROM commentchildren INNER JOIN comment ON commentchildren.IDComment = comment.comment_id WHERE commentchildren.IDComment = ? AND comment_children_id = ?");
			pst.setInt(1, IDComment);
			pst.setInt(2, comment_children_id);
			rs = pst.executeQuery();
			while (rs.next()) {
				commentChildren = new CommentChildren(rs.getInt("comment_children_id"), 
														  rs.getString("comment_children_content"), 
														  rs.getString("comment_children_datecreated"), 
														  rs.getInt("IDAccount"),
														  rs.getString("NameAccount"),
														  rs.getInt("IDListnews"),
														  rs.getInt("IDComment"));
				listComment.add(commentChildren);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return listComment;
	}
	
	public ArrayList<CommentChildren> findAllCommentChildrennn(int IDComment) {
		ArrayList<CommentChildren> listComment = new ArrayList<CommentChildren>();
		CommentChildren commentChildren = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT commentchildren.comment_children_id,commentchildren.comment_children_content,commentchildren.comment_children_datecreated,commentchildren.IDAccount,commentchildren.NameAccount,commentchildren.IDListNews,commentchildren.IDComment FROM commentchildren INNER JOIN comment ON commentchildren.IDComment = comment.comment_id WHERE commentchildren.IDComment = ?");
			pst.setInt(1, IDComment);
			rs = pst.executeQuery();
			while (rs.next()) {
				commentChildren = new CommentChildren(rs.getInt("comment_children_id"), 
														  rs.getString("comment_children_content"), 
														  rs.getString("comment_children_datecreated"), 
														  rs.getInt("IDAccount"),
														  rs.getString("NameAccount"),
														  rs.getInt("IDListnews"),
														  rs.getInt("IDComment"));
				listComment.add(commentChildren);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return listComment;
	}
	public void insertCommentChildren(String comment_children_content,String comment_children_datecreated,int IDAccount,String NameAccount,int IDListNews,int IDComment) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("INSERT INTO commentchildren (comment_children_content,comment_children_datecreated,IDAccount,NameAccount,IDListNews,IDComment) VALUES(?,?,?,?,?,?)");
			pst.setString(1, comment_children_content);
			pst.setString(2, comment_children_datecreated);
			pst.setInt(3, IDAccount);
			pst.setString(4, NameAccount);
			pst.setInt(5,IDListNews);
			pst.setInt(6, IDComment);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}

	}
	
	public ArrayList<Comment> findAll(int IDListnew) {
		ArrayList<Comment> listComment = new ArrayList<Comment>();
		Comment comment = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM comment WHERE IDListnews = ?");
			pst.setInt(1, IDListnew);
			rs = pst.executeQuery();
			while (rs.next()) {
				comment = new Comment(rs.getInt("comment_id"), 
						  rs.getString("comment_content"), 
						  rs.getString("comment_datecreated"), 
						  rs.getInt("IDAccount"),
						  rs.getString("NameAccount"),
						  rs.getInt("IDListnews"));
				listComment.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return listComment;
	}
	
	public int findIdCommentParent(int IDListnew) {
		int comment_id = 0;
		Comment comment = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT DISTINCT commentchildren.IDComment FROM commentchildren WHERE IDListnews = ?");
			pst.setInt(1, IDListnew);
			rs = pst.executeQuery();
			while (rs.next()) {
				comment = new Comment(rs.getInt("IDComment"));
			}
			if(comment == null) {
				comment_id = 0;
			}else {
				comment_id  = comment.getComment_id();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs, pst, con);}
		return comment_id;
	}
	
	public void updateComment(int comment_id, String comment_content) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE comment SET comment_content = ? WHERE comment_id = ?");
			pst.setString(1, comment_content);
			pst.setInt(2, comment_id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
	}
	
	public Comment findCommentParentById(int comment_id) {
		Comment comment = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM comment WHERE comment_id = ?");
			pst.setInt(1, comment_id);
			rs = pst.executeQuery();
			if(rs.next()) {
				comment = new Comment(rs.getInt("comment_id"), 
														  rs.getString("comment_content"), 
														  rs.getString("comment_datecreated"), 
														  rs.getInt("IDAccount"), 
														  rs.getString("NameAccount"), 
														  rs.getInt("IDListnews"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return comment;
	}
	
	public CommentChildren findCommentChildrenById(int comment_children_id) {
		CommentChildren commentChildren = null;
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("SELECT * FROM commentchildren WHERE comment_children_id = ?");
			pst.setInt(1, comment_children_id);
			rs = pst.executeQuery();
			if(rs.next()) {
				commentChildren = new CommentChildren(rs.getInt("comment_children_id"), 
																					 rs.getString("comment_children_content"), 
																					 rs.getString("comment_children_datecreated"), 
																					 rs.getInt("IDAccount"), 
																					 rs.getString("NameAccount"), 
																					 rs.getInt("IDListNews"), 
																					 rs.getInt("IDComment"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(rs,pst,con);}
		return commentChildren;
	}
	
	public void updateCommentChildren(int comment_children_id, String comment_children_content) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("UPDATE commentchildren SET comment_children_content = ? WHERE comment_children_id = ?");
			pst.setString(1, comment_children_content);
			pst.setInt(2, comment_children_id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
	}
	
	public void delCommentParent(int comment_id) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("DELETE FROM comment WHERE comment_id = ?");
			pst.setInt(1, comment_id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
	}
	
	public void delCommentChildren(int comment_children_id) {
		con = DBConnectionUtil.getConnection();
		try {
			pst = con.prepareStatement("DELETE FROM commentchildren WHERE comment_children_id = ?");
			pst.setInt(1, comment_children_id);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {DBConnectionUtil.close(pst,con);}
	}
	/*
	public ArrayList<Comment> getItemPagination(int offset) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM comments ORDER BY comment_id DESC LIMIT ?,?";
		ArrayList<Comment> listComment = new ArrayList<Comment>();
		Comment comment = null;
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				comment = new Comment(rs.getString("comment_user"),
						rs.getString("comment_detail"),
						rs.getString("comment_time"),
						rs.getInt("product_id"),
						rs.getString("product_name"));
				listComment.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return listComment;
	}
	public List<Comment> findAllComments() {
		Comment comment = null;
		List<Comment> listComment = new ArrayList<Comment>();
		con = DBConnectionUtil.getConnection();
		String sql = "select * from comments";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				comment = new Comment(rs.getInt("comment_id"),
						rs.getString("comment_user"), 
						rs.getString("comment_detail"), 
						rs.getString("comment_time"), 
						rs.getInt("product_id"),
						rs.getString("product_name"));
				listComment.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			DBConnectionUtil.close(rs, st, con);
		}
		return listComment;
	}
	*/
}
