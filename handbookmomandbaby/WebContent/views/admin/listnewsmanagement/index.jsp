<%@page import="daos.ListNewsDAO"%>
<%@page import="models.ListNews"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/templates/admin/inc/header.jsp" %>
 <div class="container-fluid">

 	<h2>Quản lý tin tức</h2>
 	  <table class="table table-bordered">
 	  <%
 	  	if(request.getAttribute("result").equals("1")){
 	  %>
 	  <h3 style="color: red;">Xóa tin tức thành công</h3>
 	  <%}else{}%>
    <thead>
      <tr>
        <th>Mã tin tức</th>
        <th>Tên tin tức</th>
        <th>Người đăng</th>
        <th>Ảnh</th>
        <th>Ngày đăng</th>
        <th>Nội dung</th>
        <th>Danh mục</th>
        <th>Chức năng</th>
      </tr>
    </thead>
    <tbody>
    <%
   		 ArrayList<ListNews> fullListNews = null;
    	if(request.getAttribute("fullListNews") != null){
    		fullListNews = (ArrayList)request.getAttribute("fullListNews");
    			for(ListNews l : fullListNews){
    %>
      <tr>
        <td><%=l.getListnews_id()%></td>
        <td><%=l.getListnews_name()%></td>
        <td><%=l.getListnews_uploader()%></td>
        <td><img src="<%=request.getContextPath()%>/uploads/images/<%=l.getListnews_image()%>" class="img-responsive" style="width: 300px;height: 250px;"/></td>
        <td><%=l.getListnews_date()%></td>
        <%
        	if(l.getListnews_content().length() >= 400){
        %>
        <td style="word-break : break-word;"><%=l.getListnews_content().substring(0, 400)%> ...</td>
        <%}else{
        %>
        <td style="word-break : break-word;"><%=l.getListnews_content()%> ...</td>
        <%
        } %>
        <td><%=new ListNewsDAO().nameMenu(l.getMenu_id())%></td>
        <td style="display: flex;justify-content: space-between;"><a href="<%=request.getContextPath()%>/changenews?id=<%=l.getListnews_id()%>"><button class="btn btn-primary">Sửa</button></a><a href="<%=request.getContextPath()%>/delnews?id=<%=l.getListnews_id()%>"><button class="btn btn-primary">Xóa</button></a></td>
      </tr>
      <%}} %>
    </tbody>
  </table>
  <div class="container">
                   	<%
                          int numberOfPages=(Integer)request.getAttribute("numberOfPage");
                          int currentPage=(Integer)request.getAttribute("currentPage");
                           	if(fullListNews != null && fullListNews.size() > 0 && numberOfPages > 1){	
                    %>
                 	<h5 style="float: left;color: #4E73DF;font-weight: bold;">Trang <%=currentPage%> của <%=numberOfPages%></h5>
                    <div class="row" style="float: right;padding-bottom: 25px;">
                    <%
    					if (currentPage > 1) {
     						int back = currentPage - 1;
    				%>
                        <a href="<%=request.getContextPath()%>/adminnews?page=<%=back%>">Trước</a>&nbsp;
                    <%
                          }
                    %>
                    <%
                        for(int i=1;i<=numberOfPages;i++){
                            if(currentPage==i){
                    %>
                        <a href="<%=request.getContextPath()%>/adminnews?page=<%=i%>"><%=i%></a>&nbsp;
                    <%
                            }else{
                    %>
                        <a href="<%=request.getContextPath()%>/adminnews?page=<%=i%>"><%=i%></a>&nbsp;
                    <%
                             }
                        }
                        if (currentPage < numberOfPages) {
                            int next = currentPage + 1;
					%>		
                        <a href="<%=request.getContextPath()%>/adminnews?page=<%=next%>">Sau</a>&nbsp;
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