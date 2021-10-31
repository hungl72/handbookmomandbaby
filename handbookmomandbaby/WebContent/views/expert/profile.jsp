<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/templates/expert/inc/header.jsp" %>

    
<div class="container">
    <div class="main-body">

          <!-- /Breadcrumb -->
    		<%
    			Account a = null;
    			if(request.getAttribute("profile") != null){
    				a = (Account)request.getAttribute("profile");
    		%>
    		<form method="post" action="<%=request.getContextPath()%>/expert" enctype="multipart/form-data">
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="<%=request.getContextPath()%>/uploads/images/<%=a.getAccount_image()%>" alt="Expert" class="rounded-circle" width="300">
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
                     <input class="form-control" type="text" value="<%=a.getAccount_name()%>" name="name"/>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input class="form-control" type="text" value="<%=a.getAccount_email()%>" name="email"/>
                    </div>
                  </div>
                  <hr>
                  	<div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Đổi mật khẩu</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <input type="password" class="form-control" name="pass"/>
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
                     <input class="form-control" type="text" value="<%=a.getAccount_address()%>" name="address"/>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Phone</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                     <input class="form-control" type="text" value="<%=a.getAccount_phone()%>" name="phone"/>
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
    <%@ include file="/templates/expert/inc/footer.jsp" %>