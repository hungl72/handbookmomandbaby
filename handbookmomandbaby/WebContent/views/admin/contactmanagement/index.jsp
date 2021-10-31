 <%@page import="models.Contact"%>
<%@page import="models.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/templates/admin/inc/header.jsp" %>
 <div class="container-fluid">

 	<h2>Quản lý liên hệ</h2>
 	  <table class="table table-bordered">
 	  <%
 	 String msg = "";
 	  try{
 	  	msg = String.valueOf(request.getParameter("result"));
 	  }catch(Exception e){}
 	  	if(msg.equals("1")){
 	  %>
 	  <h3 style="color: red;">Xóa liên hệ thành công</h3>
 	  <%}else if(msg.equals("2")){
 	  %>
 	  <h3 style="color: red;">Xóa liên hệ thất bại</h3>
 	  <%
 	  }else if(msg == ""){
 		  
 	  }else{}%>
    <thead>
      <tr>
        <th>Mã liên hệ</th>
        <th>Tiêu đề</th>
        <th>Nội dung</th>
        <th>Mã tài khoản</th>
        <th>Tên tài khoản</th>
        <th>Chức năng</th>
      </tr>
    </thead>
    <tbody>
    <%
    	ArrayList<Contact> listContact = null;
    	if(request.getAttribute("listContact") != null){
    		listContact = (ArrayList)request.getAttribute("listContact");
    			for(Contact c : listContact){
    %>
      <tr>
        <td><%=c.getContact_id()%></td>
        <td><%=c.getContact_title()%></td>
        <td><%=c.getContact_content()%></td>
        <td><%=c.getIDAccount()%></td>
        <td><%=c.getNameAccount()%></td>
        <td style="display: flex;justify-content: space-between;"><a href="<%=request.getContextPath()%>/delcontact?id=<%=c.getContact_id()%>"><button class="btn btn-primary">Xóa</button></a></td>
      </tr>
      <%}} %>
    </tbody>
  </table>
 </div>
 				<div class="container">
                   	<%
                          int numberOfPages=(Integer)request.getAttribute("numberOfPage");
                          int currentPage=(Integer)request.getAttribute("currentPage");
                           	if(listContact != null && listContact.size() > 0 && numberOfPages > 1){	
                    %>
                 	<h5 style="float: left;color: #4E73DF;font-weight: bold;">Trang <%=currentPage%> của <%=numberOfPages%></h5>
                    <div class="row" style="float: right;padding-bottom: 25px;">
                    <%
    					if (currentPage > 1) {
     						int back = currentPage - 1;
    				%>
                        <a href="<%=request.getContextPath()%>/contactindex?page=<%=back%>">Trước</a>&nbsp;
                    <%
                          }
                    %>
                    <%
                        for(int i=1;i<=numberOfPages;i++){
                            if(currentPage==i){
                    %>
                        <a href="<%=request.getContextPath()%>/contactindex?page=<%=i%>"><%=i%></a>&nbsp;
                    <%
                            }else{
                    %>
                        <a href="<%=request.getContextPath()%>/contactindex?page=<%=i%>"><%=i%></a>&nbsp;
                    <%
                             }
                        }
                        if (currentPage < numberOfPages) {
                            int next = currentPage + 1;
					%>		
                        <a href="<%=request.getContextPath()%>/contactindex?page=<%=next%>">Sau</a>&nbsp;
                    <%
    						}
                        }
   					%>
                    </div>
                </div>

  <%@ include file="/templates/admin/inc/footer.jsp" %>