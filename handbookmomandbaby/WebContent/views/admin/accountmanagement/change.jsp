 <%@page import="models.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/templates/admin/inc/header.jsp" %>
 <div class="container-fluid">
 	<h2>Sửa thông tin</h2>
    <%
    	if(request.getAttribute("selectAccount") != null){
    		Account a = (Account)request.getAttribute("selectAccount");
    %>
    <div class="row">
    <div class="col-md-4">
    	<form action="">
        <label>Mã tài khoản</label>
        <input class="form-control" name="id" value="<%=a.getAccount_id()%>"/>
         <label>Tên tài khoản</label>
        <input class="form-control" name="name" value="<%=a.getAccount_name()%>"/>
         <label>Email</label>
        <input class="form-control" name="email" value="<%=a.getAccount_email()%>"/>
         <label>Ngày sinh</label>
        <input class="form-control" name="date" value="<%=a.getAccount_date()%>"/>
         <label>Địa chỉ</label>
        <input class="form-control" name="address" value="<%=a.getAccount_address()%>"/>
         <label>Số điện thoại</label>
        <input class="form-control" name="phone" value="<%=a.getAccount_phone()%>"/>
         <label>Ngày tạo tài khoản</label>
        <input class="form-control" name="datecreated" value="<%=a.getAccount_datecreated()%>"/>
         <label>Lần thay đổi gần nhất</label>
        <input class="form-control" name="datemodifired" value="<%=a.getAccount_datemodified()%>"/>
         <label>Trạng thái tài khoản</label>
        <input class="form-control" name="status" value="<%=a.getAccount_status()%>"/>
         <label>Hình ảnh</label>
        <input class="form-control" name="image" value="<%=a.getAccount_image()%>"/>
         <label>Quyền</label>
        <input class="form-control" name="idgroup" value="<%=a.getIDUserGroup()%>"/>
        <a><button class="btn btn-primary" style="margin: 1rem 0;">Cập nhật thông tin</button></a>
      <%} %>
      </form>
      </div>
      </div>
 </div>
  <%@ include file="/templates/admin/inc/footer.jsp" %>