 <%@page import="models.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/templates/admin/inc/header.jsp" %>
 <div class="container-fluid">

 	<h2>Quản lý tài khoản</h2>
 	<a href="<%=request.getContextPath()%>/accountadd"><button class="btn btn-primary" style="margin-bottom: 1rem;">Tạo tài khoản chuyên gia</button></a>
 	  <table class="table table-bordered">
 	  <%
 	  	if(request.getAttribute("result").equals("1")){
 	  %>
 	  <h3 style="color: red;">Xóa tài khoản thành công</h3>
 	  <%}else if(request.getAttribute("result").equals("2")){
 	 %>
 	  <h3 style="color: red;">Thêm tài khoản chuyên gia thành công</h3>
 	 <%
 	  }%>
    <thead>
      <tr>
        <th>Mã tài khoản</th>
        <th>Tên tài khoản</th>
        <th>Email</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Số điện thoại</th>
        <th>Ngày tạo tài khoản</th>
        <th>Ngày thay đổi</th>
        <th>Hình ảnh</th>
        <th>Vai trò</th>
        <th>Chức năng</th>
      </tr>
    </thead>
    <tbody>
    <%
    	ArrayList<Account> listAccount = null;
    	if(request.getAttribute("listAccount") != null){
    		listAccount = (ArrayList)request.getAttribute("listAccount");
    			for(Account a : listAccount){
    %>
      <tr>
        <td><%=a.getAccount_id()%></td>
        <td><%=a.getAccount_name()%></td>
        <td><%=a.getAccount_email()%></td>
        <td><%=a.getAccount_date()%></td>
        <td><%=a.getAccount_address()%></td>
        <td><%=a.getAccount_phone()%></td>
        <td><%=a.getAccount_datecreated()%></td>
        <td><%=a.getAccount_datemodified()%></td>
        <td><img src="<%=request.getContextPath()%>/uploads/images/<%=a.getAccount_image()%>" class="img-responsive" width="200px" height="auto"/></td>
        <td>
		 <%
        	if(a.getIDUserGroup() == 3){
        %>
        Người dùng
        <%
        	}else{
        %>
        Chuyên gia
        <%
        	}
        %>
		</td>
        <td style="display: flex;justify-content: space-between;"><a href="<%=request.getContextPath()%>/delaccount?id=<%=a.getAccount_id()%>"><button class="btn btn-primary">Xóa</button></a></td>
      </tr>
      <%}} %>
    </tbody>
  </table>
    <div class="container">
                   	<%
                          int numberOfPages=(Integer)request.getAttribute("numberOfPage");
                          int currentPage=(Integer)request.getAttribute("currentPage");
                           	if(listAccount != null && listAccount.size() > 0 && numberOfPages > 1){	
                    %>
                 	<h5 style="float: left;color: #4E73DF;font-weight: bold;">Trang <%=currentPage%> của <%=numberOfPages%></h5>
                    <div class="row" style="float: right;padding-bottom: 25px;">
                    <%
    					if (currentPage > 1) {
     						int back = currentPage - 1;
    				%>
                        <a href="<%=request.getContextPath()%>/adminaccount?page=<%=back%>">Trước</a>&nbsp;
                    <%
                          }
                    %>
                    <%
                        for(int i=1;i<=numberOfPages;i++){
                            if(currentPage==i){
                    %>
                        <a href="<%=request.getContextPath()%>/adminaccount?page=<%=i%>"><%=i%></a>&nbsp;
                    <%
                            }else{
                    %>
                        <a href="<%=request.getContextPath()%>/adminaccount?page=<%=i%>"><%=i%></a>&nbsp;
                    <%
                             }
                        }
                        if (currentPage < numberOfPages) {
                            int next = currentPage + 1;
					%>		
                        <a href="<%=request.getContextPath()%>/adminaccount?page=<%=next%>">Sau</a>&nbsp;
                    <%
    						}
                        }
   					%>
                    </div>
                </div>
 </div>
 </div>
 </div>
 </div>
  <%@ include file="/templates/admin/inc/footer.jsp" %>