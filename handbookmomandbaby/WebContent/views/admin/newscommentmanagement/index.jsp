 <%@page import="daos.MenuDAO"%>
<%@page import="daos.CommentDAO"%>
<%@page import="models.CommentChildren"%>
<%@page import="daos.ListNewsDAO"%>
<%@page import="models.Comment"%>
<%@page import="models.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/templates/admin/inc/header.jsp" %>
                <div class="container-fluid">
                    <h3>Quản lý bình luận</h3>

                   
					
                    <div class="row" style="margin-bottom: 1rem;">
                                        <%
                    CommentDAO commentDAO = new CommentDAO();
                    ListNewsDAO listNewsDAO = new ListNewsDAO();
                    MenuDAO menuDAO = new MenuDAO();
                    	if(request.getAttribute("listCommentParent") != null){
                    		ArrayList<Comment> listCommentParent = (ArrayList)request.getAttribute("listCommentParent");     		
                    			for(Integer i : listNewsDAO.idListNews()){   				
                    %>
                        <div id = "loadComment<%=i%>" class="col-md-12" style="border: 2px solid orange;margin-bottom: 1rem;padding: 1rem;border-radius: 5px;">
      
                            <h4 style="color: sienna;font-weight: bold;">Tên danh mục : <%=menuDAO.menuName(i)%> --- Tiêu đề bài viết : <%=menuDAO.newsName(i)%></h4>
                  					 <%
						for(Comment c : commentDAO.findAllCommentByIDListNews(i)){
					%>
					<h5 id="contentParent<%=c.getComment_id()%>" onclick="contentParent(<%=c.getComment_id()%>,<%=c.getComment_id()%>,0)" style="border: 2px solid red;border-radius: 5px;padding: 0.5rem;font-weight: 600;"><%=c.getComment_content()%> <span style="color: indigo;"> ---> <%=c.getNameAccount()%> <a href="javascript:void(0)" style="float: right;padding: 0 1rem;" onclick="delParent(<%=c.getComment_id()%>,<%=i%>)">Xóa</a></span><i id="down" style="float: right;" class="fas fa-caret-square-down"></i></h5>

                            <ul style="display: none;" id="contentChildren<%=c.getComment_id()%>" class="list-group">
                   <%
						for(CommentChildren cc : commentDAO.findAllCommentChildrennn(c.getComment_id())){
				   %>
                                <li id="cc<%=cc.getComment_children_id()%>" class="list-group-item"><%=cc.getComment_children_content()%><span style="color: indigo;"> ---> <%=cc.getNameAccount()%></span><a href="javascript:void(0)" style="float: right;" onclick="delChildren(<%=cc.getComment_children_id()%>)">Xóa</a></li>
                   <%} %>
                              </ul>
                               
			<%} %>
                        </div>
                        <%}}%>
                   </div>
                  </div>
</div>
                </div>
                </div>
                <style>
#contentParent:hover{
    color: slateblue;
}
</style>
<script>
function contentParent(x,y,z){
    $('#contentChildren'+y).slideToggle();
    if(z == 1){
        $('#contentParent'+y).attr('onclick','contentParent('+x+','+y+',0)');
        $('#contentParent'+y).css("border","2px solid red");
	        if($('#down'+y).attr('class') == 'far fa-caret-square-down'){
	            $('#down'+y).attr('class','fas fa-caret-square-down');
	        }else{
	            $('#down'+y).attr('class','far fa-caret-square-down');
	        }
    }else{
        $('#contentParent'+y).attr('onclick','contentParent('+x+','+y+',1)');
        $('#contentParent'+y).css("border","none");
	        if($('#down'+y).attr('class') == 'far fa-caret-square-down'){
	            $('#down'+y).attr('class','fas fa-caret-square-down');
	        }else{
	            $('#down'+y).attr('class','far fa-caret-square-down');
	        }
    }
}
function delParent(x,i){
	$.ajax({
		url: '<%=request.getContextPath()%>/delCommentAdmin',
		method: 'get',
		data: {id : x},
		success:function(data){
			$('#loadComment'+i).remove();
		}
	});
}

function delChildren(x){
	$.ajax({
		url: '<%=request.getContextPath()%>/delCommentAdmin',
		method: 'post',
		data: {id : x},
		success:function(data){
			$('#cc'+x).remove();
		}
	});
}
    </script>
<%@ include file="/templates/admin/inc/footer.jsp" %>