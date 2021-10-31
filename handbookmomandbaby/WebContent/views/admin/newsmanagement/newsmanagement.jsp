 <%@page import="models.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/templates/admin/inc/header.jsp" %>
<div class="container-fluid">
                    <h2>Quản lý tin tức</h2>
                     <p>* Tên danh mục không được trùng và phải bắt đầu bằng chữ cái</p>
                    <hr />
                    <div class="row">
                        <div class="form-group col-md-6 col-xs-12" style="border-right: 1px solid #DFE0E2;">
                        <form method="get" action="<%=request.getContextPath()%>/addmenu">
                            <label for="usr">Tên danh mục cha</label>
                            <input type="text" class="form-control" id="usr" name="name" required="required"/>
                            <div style="display: flex; justify-content: space-between;">
                            <button type="submit" class="btn btn-primary" style="margin-top: 1rem;">Thêm danh mục cha</button>
                            <%
                            try{
                            	if(request.getParameter("result").equals("0")){
                            		
                            			
                            		}else if(request.getParameter("result").equals("1")){
                            %>
                            <h4 style="margin-top: 1rem;color: red;">Thêm thành công</h4>
                            <%
                            		}else if(request.getParameter("result").equals("-1")){
                            %>
                            <h4 style="margin-top: 1rem;color: red;">Thêm thất bại</h4>
                            <%
                            		}else{}
                            }catch(Exception e){}
                            %>
                            </div>
                        </form>
                        <hr />
                        <div class="row">
                                                <div class="form-group col-md-6 col-xs-12">
                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Chọn danh mục cha cần xóa
    <span class="caret"></span></button>
                            <ul class="dropdown-menu" id="menuParent">
                              <%
                            	if(request.getAttribute("listMenuParent") != null){
                            		ArrayList<Menu> listMenuParent = (ArrayList)request.getAttribute("listMenuParent");
                            		for(Menu m : listMenuParent){
                             %>
                              <li><a href="javascript:void(0)" onclick="delParent(<%=m.getMenu_id()%>,<%=m.getParent_id()%>)"><%=m.getMenu_name()%></a></li>
                              <%
                            		}
                            	}
                              %>
                            </ul>
                        </div>
                           <div class="form-group col-md-6 col-xs-12">
                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Chọn danh mục con cần xóa
    <span class="caret"></span></button>
                            <ul class="dropdown-menu" id="menuSon">
                              <%
                            	if(request.getAttribute("listMenuSon") != null){
                            		ArrayList<Menu> listMenuSon = (ArrayList)request.getAttribute("listMenuSon");
                            		for(Menu m : listMenuSon){
                             %>
                              <li><a href="javascript:void(0)" onclick="delSon(<%=m.getMenu_id()%>)"><%=m.getMenu_name()%></a></li>
                              <%
                            		}
                            	}
                              %>
                            </ul>
                        </div>
                        </div>
                        </div>
                        <div class="form-group col-md-6 col-xs-12">
                        <form method="post" action="<%=request.getContextPath()%>/addmenu">
                            <label for="usr">Tên danh mục con</label>
                            <input type="text" class="form-control" id="usr" name="name"  required="required">
                            <label style="padding-top: 1rem;" for="usr">Chọn một danh mục cha</label>
                            <select class="custom-select" id="selectParent" name="menuParentId" required="required">
                              <%
                            	if(request.getAttribute("listMenuParent") != null){
                            		ArrayList<Menu> listMenuParent = (ArrayList)request.getAttribute("listMenuParent");
                            		for(Menu m : listMenuParent){
                             %>
                              <option value="<%=m.getMenu_id()%>"><%=m.getMenu_name()%></option>
                              <%
                            		}
                            	}
                              %>
                            </select>
                            <button type="submit" class="btn btn-primary" style="margin-top: 1rem;">Thêm danh mục con</button>
                             <%
                             try{
                            	if(request.getParameter("result").equals("0")){
                            		
                            			
                            		}else if(request.getParameter("result").equals("3")){
                            %>
                            <h4 style="margin-top: 1rem;color: red;">Thêm thành công</h4>
                            <%
                            		}else if(request.getParameter("result").equals("4")){
                            %>
                            <h4 style="margin-top: 1rem;color: red;">Thêm thất bại</h4>
                            <%
                            		}else{}
                             }catch(Exception e){}
                            %>
                            </form>
                        </div>
                    </div>
                    <hr />
                    <form method="post" action="<%=request.getContextPath()%>/posts" enctype="multipart/form-data">
                    <div class="row">
                        <div class="form-group col-md-4 col-xs-12">
                            <label for="usr">Tên bài viết</label>
                            <input type="text" class="form-control" id="usr" name="title" required>
                        </div>
                        <div class="form-group col-md-4 col-xs-12">
                            <label for="usr">Chọn một danh mục con</label>
                            <select class="custom-select" id="selectSon" name="menuSonId">
                              <%
                            	if(request.getAttribute("listMenuSon") != null){
                            		ArrayList<Menu> listMenuSon = (ArrayList)request.getAttribute("listMenuSon");
                            		for(Menu m : listMenuSon){
                             %>
                              <option value="<%=m.getMenu_id()%>"><%=m.getMenu_name()%></option>
                              <%
                              			}
                            		}
                             %>
                            </select>
                        </div>
                        <div class="form-group col-md-4 col-xs-12">
                            <label class="form-label" for="customFile">Chọn ảnh để upload</label>
                            <input type="file" class="form-control" id="customFile" name="picture" required="required"/>
                        </div>
                        <div class="form-group col-md-12 col-xs-12">
                         <%
                         try{
                            	if(request.getParameter("result").equals("0")){
                            		
                            			
                            		}else if(request.getParameter("result").equals("5")){
                            %>
                            <h4 style="margin-top: 1rem;color: red;">Thêm bài viết thành công</h4>
                            <%
                            		}else if(request.getParameter("result").equals("6")){
                            %>
                            <h4 style="margin-top: 1rem;color: red;">Thêm bài viết thất bại</h4>
                            <%
                            		}else{}
                     }catch(Exception e){}
                            %>
                            <label for="usr">Nội dung bài viết</label>
                            <textarea class="ckeditor" name="content" required="required"></textarea>
                            <button type="submit" class="btn btn-primary" style="margin-top: 1rem;">Thêm bài viết</button>
                            
                        </div>
                      </div>
</form>
                    <hr />
                </div>
                </div>
<script>
	function delParent(menu_id,parent_id){
		if(confirm('Bạn có muốn xóa danh mục cha này không, lưu ý tất cả danh mục con và bài viết thuộc menu này cũng sẽ bị xóa ?')){
		$.ajax({            
	        url: '<%=request.getContextPath()%>/delMenu',
	        method: 'get',
	        data:{menu_id : menu_id,parent_id : parent_id},
	        success:function(data){
	        	$("#menuParent").html(data);
	        	loadSon();
	        	loadSelectParent();
	        	loadSelectSon();
	        }
	    });
		}else{}
	}
	
	function delSon(menu_id){
		if(confirm('Bạn có muốn xóa danh mục con này không, lưu ý tất cả bài viết thuộc danh mục này cũng sẽ bị xóa ?')){
		$.ajax({            
	        url: '<%=request.getContextPath()%>/delMenu',
	        method: 'post',
	        data:{menu_id : menu_id},
	        success:function(data){
	        	$("#menuSon").html(data);
	        	loadSelectParent();
	        	loadSelectSon();
	        }
	    });
		}else{}
	}
	
	function loadSon(){
		$.ajax({            
	        url: '<%=request.getContextPath()%>/delMenu',
	        method: 'post',
	        data:{},
	        success:function(data){
	        	$("#menuSon").html(data);
	        }
	    });
	}
	
	function loadSelectParent(){
		$.ajax({            
	        url: '<%=request.getContextPath()%>/loadSelect',
	        method: 'get',
	        data:{},
	        success:function(data){
	        	$("#selectParent").html(data);
	        }
	    });
	}
	
	function loadSelectSon(){
		$.ajax({            
	        url: '<%=request.getContextPath()%>/loadSelect',
	        method: 'post',
	        data:{},
	        success:function(data){
	        	$("#selectSon").html(data);
	        }
	    });
	}
</script>
                 <%@ include file="/templates/admin/inc/footer.jsp" %>