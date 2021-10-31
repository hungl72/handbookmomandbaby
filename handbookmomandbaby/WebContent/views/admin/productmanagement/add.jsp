 <%@page import="models.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/templates/admin/inc/header.jsp" %>
 <div class="container-fluid">

 	<h2>Thêm sản phẩm</h2>
		 	<form method="post" action="<%=request.getContextPath()%>/productadd" enctype="multipart/form-data">
<div class="row">
		 	 	<div class="form-group col-md-4 col-xs-12">
                        <label>Tên sản phẩm</label>
				 		<input type="text" class="form-control" name="name" required/>
                 </div>
				 <div class="form-group col-md-4 col-xs-12">
				 		<label>Giá tiền</label>
				 		<input type="text" class="form-control" name="money" required/>
				 </div>
				 <div class="form-group col-md-4 col-xs-12">
				 		<label>Danh mục</label>
				 		    <select class="custom-select" id="inputGroupSelect02" name="category">
							 <option value="<%=1%>">Trước mang thai</option>
							 <option value="<%=2%>">Đang mang thai</option>
							 <option value="<%=3%>">Sau mang thai</option>
                            </select>
                  </div>
                  <div class="form-group col-md-4 col-xs-12">
				 		<label>Chọn ảnh</label>
				 		<input type="file" class="form-control" id="customFile" name="picture" required />
				 </div>

				<div class="col-md-12 col-xs-12">
				 	<label>Giới thiệu sản phẩm</label>
				 	<textarea class="ckeditor" name="introduce" required></textarea>
				 </div>
				 
				 <div class="col-md-12 col-xs-12">
				 	<label>Nội dung</label>
				 	<textarea class="ckeditor" name="content" required></textarea>
				 </div>
				 </div>
				 <button type="submit" class="btn btn-primary" style="margin: 1rem 0;">Thêm sản phẩm</button>
		 	</form>

	 	</div>
  <%@ include file="/templates/admin/inc/footer.jsp" %>