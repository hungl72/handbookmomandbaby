<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
                        <%
            	if(request.getSession().getAttribute("adminInfo") != null){
            %>
            <a class="sidebar-brand d-flex align-items-center justify-content-center">
                <div class="sidebar-brand-icon">
                   <i class="fa fa-lock" aria-hidden="true"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Administrator</div>
            </a>
            <%}%>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <%
            	if(request.getSession().getAttribute("adminInfo") != null){
            %>
            <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/adminhome">
                   <i class="fa fa-signal" aria-hidden="true"></i>
                    <span>Tổng quan</span></a>
            </li>
            <%}%>

            <!-- Divider -->



            <!-- Nav Item - Pages Collapse Menu -->
             <%
            	if(request.getSession().getAttribute("adminInfo") != null){
            %>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Quản lý</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="<%=request.getContextPath()%>/adminaccount">Tài khoản</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/adminindex">Thêm menu và tin tức</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/adminnews">Tin tức</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/newscommentsmanagement">Bình luận</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/productindex">Sản phẩm</a>
                        <a class="collapse-item" href="<%=request.getContextPath()%>/contactindex">Liên hệ</a>
                    </div>
                </div>
            </li>
 			<%}%>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>


        </ul>