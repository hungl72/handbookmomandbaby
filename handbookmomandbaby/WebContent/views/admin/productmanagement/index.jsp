<%@page import="daos.ProductDAO"%>
<%@page import="models.Product"%>
<%@page import="daos.ListNewsDAO"%>
<%@page import="models.ListNews"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/templates/admin/inc/header.jsp" %>
 <div class="container-fluid" style="overflow: auto;">

 	<h2>Quản lý sản phẩm</h2>
 	<a href="<%=request.getContextPath()%>/productadd"><button class="btn btn-primary" style="margin-bottom: 1rem;">Thêm sản phẩm</button></a>
 	  <table class="table table-bordered" style="table-layout: fixed;">
 	  <%
 	  try{
 	  	if(request.getParameter("result").equals("1")){
 	  %>
 	 	 <h3 style="color: red;">Thêm sản phẩm thành công</h3>
 	  <%}else if(request.getParameter("result").equals("2")){
 	%>
 		<h3 style="color: red;">Xóa sản phẩm thành công</h3>
 	<%
 	  }else if(request.getParameter("result").equals("3")){
 	%>
 		 <h3 style="color: red;">Sửa sản phẩm thành công</h3>
 	<%
 	  }else{}
 	  	}catch(Exception e){}%>
    <thead>
      <tr>
        <th style="width: 10%;">Mã sản phẩm</th>
        <th style="width: 20%;">Tên sản phẩm</th>
        <th style="width: 40%;">Giới thiệu</th>
        <th style="width: 60%;">Nội dung</th>
        <th style="width: 34%;">Ảnh</th>
        <th style="width: 20%;">Giá (VNĐ)</th>
        <th style="width: 10%;">Danh mục</th>
        <th style="width: 24%;">Chức năng</th>
      </tr>
    </thead>
    <tbody>
    <%
   		 ArrayList<Product> listProduct = null;
    	if(request.getAttribute("listProduct") != null){
    		listProduct = (ArrayList)request.getAttribute("listProduct");
    			for(Product p : listProduct){
    %>
      <tr>
        <td><%=p.getProduct_id()%></td>
        <td><%=p.getProduct_name()%></td>
        <%
        	if(p.getProduct_introduce().length() >= 200){
        %>
        <td><p><%=p.getProduct_introduce().substring(0,200)%> ...</p></td>
        <%}else{
        %>
         <td><p><%=p.getProduct_introduce()%></p></td>
        <%
        }%>
                <%
        	if(p.getProduct_description().length() >= 350){
        %>
        <td><p><%=p.getProduct_description().substring(0, 350)%> ...</p></td>
                <%}else{
         %>
         <td><p><%=p.getProduct_description()%></p></td>
         <%
                }
        %>
        <td><img src="<%=request.getContextPath()%>/uploads/images/<%=p.getProduct_image()%>" class="img-responsive" style="width: 168px;height: auto;"/></td>
        <td><%=p.getProduct_price()%></td>
        <td><%=new ProductDAO().nameMenu(p.getCategory_id())%></td>
        <td style="display: flex;justify-content: space-between;border-bottom: none;"><a href="<%=request.getContextPath()%>/productchange?id=<%=p.getProduct_id()%>"><button class="btn btn-primary">Sửa</button></a><a href="<%=request.getContextPath()%>/productdel?id=<%=p.getProduct_id()%>"><button class="btn btn-primary">Xóa</button></a></td>
      </tr>
      <%}} %>
    </tbody>
  </table>
  <div class="container">
                   	<%
                          int numberOfPages=(Integer)request.getAttribute("numberOfPage");
                          int currentPage=(Integer)request.getAttribute("currentPage");
                           	if(listProduct != null && listProduct.size() > 0 && numberOfPages > 1){	
                    %>
                 	<h5 style="float: left;color: #4E73DF;font-weight: bold;">Trang <%=currentPage%> của <%=numberOfPages%></h5>
                    <div class="row" style="float: right;padding-bottom: 25px;">
                    <%
    					if (currentPage > 1) {
     						int back = currentPage - 1;
    				%>
                        <a href="<%=request.getContextPath()%>/productindex?page=<%=back%>">Trước</a>&nbsp;
                    <%
                          }
                    %>
                    <%
                        for(int i=1;i<=numberOfPages;i++){
                            if(currentPage==i){
                    %>
                        <a href="<%=request.getContextPath()%>/productindex?page=<%=i%>"><%=i%></a>&nbsp;
                    <%
                            }else{
                    %>
                        <a href="<%=request.getContextPath()%>/productindex?page=<%=i%>"><%=i%></a>&nbsp;
                    <%
                             }
                        }
                        if (currentPage < numberOfPages) {
                            int next = currentPage + 1;
					%>		
                        <a href="<%=request.getContextPath()%>/productindex?page=<%=next%>">Sau</a>&nbsp;
                    <%
    						}
                        }
   					%>
                    </div>
                </div>
 </div>
 </div>
  <%@ include file="/templates/admin/inc/footer.jsp" %>