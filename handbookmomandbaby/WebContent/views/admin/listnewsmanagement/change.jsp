<%@page import="daos.MenuDAO"%>
<%@page import="models.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.ListNewsDAO"%>
<%@page import="models.ListNews"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/templates/admin/inc/header.jsp" %>
 <div class="container-fluid">
 	<h2>Thay đổi thông tin bài viết</h2>
    <%
    	if(request.getAttribute("listNewsById") != null){
    		ListNews l = (ListNews)request.getAttribute("listNewsById");
    %>
    <div class="row">
    <div class="col-md-12">
    	<form method="post" action="<%=request.getContextPath()%>/changenews" enctype="multipart/form-data">
    	<%
    		if(request.getAttribute("result").equals("1")){
    	%>
    	<h3 style="color: red;">Sửa bài viết thành công</h3>
    	<%
    		}else{}
    	%>
    	<div class="row">
    	<div class="col-md-4">
	        <label>Mã tin tức</label>
	        <input class="form-control" name="id" value="<%=l.getListnews_id()%>" readonly="readonly"/>
        </div>
        <div class="col-md-4">
	         <label>Tên tin tức</label>
	        <input class="form-control" name="news" value="<%=l.getListnews_name()%>" onkeypress="return event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode  <= 122"/>
	     </div>
	     <div class="col-md-4">
	         <label>Người đăng</label>
	        <input class="form-control" name="person" value="<%=l.getListnews_uploader()%>" readonly="readonly"/>
        </div>
        </div>
        <div class="row">
	        <div class="col-md-4">
		         <label>Ảnh</label>
		         <div class="col-md-12">
		         <img src="<%=request.getContextPath()%>/uploads/images/<%=l.getListnews_image()%>" class="img-responsive" style="width: 380px;height: auto;padding-bottom: 1rem;"/>
		        <input class="form-control" type="file" name="picture"/>
		        </div>
	        </div>
	        <div class="col-md-4">
		         <label>Ngày đăng</label>
		        <input class="form-control" name="date" value="<%=l.getListnews_date()%>" readonly="readonly"/>
	        </div>
	        <div class="col-md-4">
		          <div class="form-group">
				  <label for="sel1">Danh mục</label>
				  <select class="form-control" name="menu_id">
				  
				  <option selected="selected" value="<%=new ListNewsDAO().nameMenu(l.getMenu_id())+","+l.getMenu_id()%>"><%=new ListNewsDAO().nameMenu(l.getMenu_id())%></option>
				  <%
				  		ArrayList<Menu> listMenuSon = new MenuDAO().listMenuSon();
						  for(Menu lms : listMenuSon){
							  if(lms.getMenu_id() != l.getMenu_id()){
				  %>
				    <option value="<%=new ListNewsDAO().nameMenu(lms.getMenu_id())+","+lms.getMenu_id()%>"><%=lms.getMenu_name()%></option>
				    <%}}%>
  					</select>
				</div>
	        </div>
        </div>
        <div>
        </div>
         <label>Nội dung</label>
        <textarea class="ckeditor" name="content"><%=l.getListnews_content()%></textarea>
        <a><button class="btn btn-primary" type="submit" style="margin: 1rem 0;">Cập nhật thông tin</button></a>
      <%} %>
      </form>
      </div>
      </div>
 </div>
  <%@ include file="/templates/admin/inc/footer.jsp" %>