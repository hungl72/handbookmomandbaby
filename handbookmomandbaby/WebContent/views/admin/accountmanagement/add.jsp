<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/templates/admin/inc/header.jsp" %>
 <div class="container">
 	<div class="row">
 		<div class="col-md-6">
    	<form method="post" action="<%=request.getContextPath()%>/accountadd">
    	 	<%
    	 	String msg = String.valueOf(request.getParameter("result"));
 		if(msg.equals("success")){
 	%>
 	<h3 style="color: red;">Thêm tài khoản chuyên gia thành công </h3>
 	<%}else if(msg.equals("error")){
 	%>
 	<h3 style="color: red;">Email đã tồn tại hoặc nhập liệu không hợp lệ !</h3>
 	<%
 	}else{}%>
        <label>Họ và tên</label>
        <input class="form-control" required="required" name="name" onkeypress='return event.charCode >= 48 && event.charCode <= 57 || event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode  <= 122'/>
         <label>Email</label>
        <input class="form-control" type="email" required="required" name="email"/>
        <button class="btn btn-primary" style="margin: 1rem 0;">Tạo tài khoản</button>
      </form>
      </div>
 	</div>
 </div>
 </div>
  <%@ include file="/templates/admin/inc/footer.jsp" %>