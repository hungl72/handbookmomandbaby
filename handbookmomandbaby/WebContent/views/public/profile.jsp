<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/public/inc/header.jsp" %>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/public/styles/responsive.css">
    <style>
  body{
    margin-top:20px;
    color: #1a202c;
    text-align: left;
    background-color: #e2e8f0;    
}
.main-body {
    padding: 15px;
}
.card {
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: .25rem;
}

.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1rem;
}

.gutters-sm {
    margin-right: -8px;
    margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
    padding-right: 8px;
    padding-left: 8px;
    margin-top: 10rem;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
}

.bg-gray-300 {
    background-color: #e2e8f0;
}
.h-100 {
    height: 100%!important;
}
.shadow-none {
    box-shadow: none!important;
}
</style>
<div class="container">
    <div class="main-body">
    
          <!-- Breadcrumb -->
          <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item"><a href="javascript:void(0)">User</a></li>
              <li class="breadcrumb-item active" aria-current="page">User Profile</li>
            </ol>
          </nav>
          <!-- /Breadcrumb -->
    		<%
    			Account a = null;
    			if(request.getAttribute("profile") != null){
    				a = (Account)request.getAttribute("profile");
    		%>
    		<form method="post" action="<%=request.getContextPath()%>/profile" enctype="multipart/form-data">
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="<%=request.getContextPath()%>/uploads/images/<%=a.getAccount_image()%>" alt="Admin" class="rounded-circle" width="150">
                    <div class="mt-3">
                      <button class="btn btn-primary" type="submit">Cập nhật</button>
                    </div>
                    <%
                    	if(request.getParameter(a.getAccount_id()+"success") != null){
                    %>
                    <p style="color: red;">Cập nhật thành công</p>
                    <%}%>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                    		<%
    		try{
    			String update = request.getParameter("update");
    			if(update.equals("updated")){
    		%>
    		<h4 style="color: red;">Cập nhật thông tin thành công</h4>
    		<%
    			}else{
    			}
    		}catch(Exception e){e.printStackTrace();}
    		%>
                   <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Mã người dùng</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input class="form-control" type="text" value="<%=a.getAccount_id()%>" name="id" readonly="readonly"/>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Họ tên</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <input class="form-control" type="text" value="<%=a.getAccount_name()%>" name="name" required="required" onkeypress='return event.charCode >= 48 && event.charCode <= 57 || event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode  <= 122'/>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input class="form-control" type="text" value="<%=a.getAccount_email()%>" name="email" disabled/>
                    </div>
                  </div>
                  <hr>
                  	<div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Đổi mật khẩu</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="password" class="form-control" name="pass" pattern=".{0}|.{8,}"  title="Mật khẩu tối thiểu là 8 ký tự"/>
                    </div>
                  </div>
                  <hr>
                   <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Ngày sinh</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input class="form-control" type="date" value="<%=a.getAccount_date()%>" name="birthday" id="example-date-input" disabled>
                    </div>
                  </div>
                  <hr>
                    <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Ngày sửa đổi gần nhất</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input class="form-control" type="date" value="<%=a.getAccount_datemodified()%>" id="example-date-input" disabled>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Địa chỉ</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <input class="form-control" type="text" value="<%=a.getAccount_address()%>" name="address" onkeypress='return event.charCode >= 48 && event.charCode <= 57 || event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode  <= 122'/>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Phone</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <input class="form-control" type="text" value="<%=a.getAccount_phone()%>" name="phone" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
                    </div>
                  </div>
                  <hr>	
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Cập nhật ảnh đại diện</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     	<input type="file" class="form-control" id="customFile" name="picture" />
                    </div>
                    
                  </div>
                </div>
              </div>
<hr>
</form>
<%} %>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
 <%@ include file="/templates/public/inc/footer.jsp" %>