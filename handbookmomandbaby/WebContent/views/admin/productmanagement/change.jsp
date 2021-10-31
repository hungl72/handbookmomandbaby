<%@page import="models.Category"%>
<%@page import="models.Product"%>
<%@page import="daos.MenuDAO"%>
<%@page import="models.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.ProductDAO"%>
<%@page import="models.ListNews"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/templates/admin/inc/header.jsp" %>
 <div class="container-fluid">
 	<h2>Thay đổi thông tin sản phẩm</h2>
    <%
    	if(request.getAttribute("selectProduct") != null){
    		Product p = (Product)request.getAttribute("selectProduct");
    %>
    <div class="row">
    <div class="col-md-12">
    	<form method="post" action="<%=request.getContextPath()%>/productchange" enctype="multipart/form-data">
    	<%
    		if(String.valueOf(request.getParameter("result")).equals("1")){
    	%>
    	<h3 style="color: red;">Sửa sản phẩm thành công</h3>
    	<%
    		}else{}
    	%>
    	<%
    		if(String.valueOf(request.getParameter("id")).equals("1") && String.valueOf(request.getParameter("result")).equals("error")){
    	%>
    	<h3 style="color: red;">Có lỗi khi sửa sản phẩm</h3>
    	<%
    		}else{}
    	%>
    	<div class="row">
    	<div class="col-md-4">
	        <label>Mã sản phẩm</label>
	        <input class="form-control" name="id" value="<%=p.getProduct_id()%>" readonly="readonly"/>
        </div>
        <div class="col-md-4">
	         <label>Tên sản phẩm</label>
	        <input class="form-control" name="product" value="<%=p.getProduct_name()%>" onkeypress='return event.charCode >= 48 && event.charCode <= 57 || event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode  <= 122'/>
	     </div>
         <div class="col-md-4">
		          <div class="form-group">
				  <label for="sel1">Danh mục</label>
				  <select class="form-control" name="menu_id">
				  <option selected="selected" value="<%=new ProductDAO().nameMenu(p.getCategory_id())+","+p.getCategory_id()%>"><%=new ProductDAO().nameMenu(p.getCategory_id())%></option>
				  <%
				  		ArrayList<Category> listNameMenu = new ProductDAO().listNameMenu();
						  for(Category c : listNameMenu){
							  if(c.getCategory_id() != p.getCategory_id()){
				  %>
				    <option value="<%=new ProductDAO().nameMenu(c.getCategory_id())+","+c.getCategory_id()%>"><%=c.getCategory_name()%></option>
				    <%}}%>
  					</select>
				</div>
	        </div>
	        <div class="col-md-4">
	         <label>Giá</label>
	        <input id="price" class="form-control" name="price" value="<%=p.getProduct_price()%> " onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
	     </div>
	        <div class="col-md-4">
		         <label>Ảnh</label>
		         <div class="col-md-12">
		         <img src="<%=request.getContextPath()%>/uploads/images/<%=p.getProduct_image()%>" class="img-responsive" style="width: 300px;height: auto;padding-bottom: 1rem;"/>
		        <input class="form-control" type="file" name="picture"/>
		        </div>
	        </div>
		 <div class="col-md-12 col-xs-12">
         <label>Giới thiệu</label>
        <textarea class="ckeditor" name="introduce"><%=p.getProduct_introduce()%></textarea>
        </div>

        <div>
        </div>
        <div class="col-md-12 col-xs-12">
         <label>Nội dung</label>
        <textarea class="ckeditor" name="description"><%=p.getProduct_description()%></textarea>
        <a><button class="btn btn-primary" type="submit" style="margin: 1rem 0;">Cập nhật thông tin</button></a>
        </div>
      <%} %>
      </div>
      </form>
      </div>
      </div>
 </div>
 <script>
 $('#price').bind('copy paste', function (e) {
     e.preventDefault();
 });
 </script>
  <%@ include file="/templates/admin/inc/footer.jsp" %>