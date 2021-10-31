<%@page import="models.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                        <%
            	if(request.getSession().getAttribute("expert") != null){
            		Account e = (Account)request.getSession().getAttribute("expert");
            %>
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon">
                   <i class="fa fa-heartbeat" aria-hidden="true"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Expert</div>
            </a>
            
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
<!--  

            <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/faqexpert">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Faq</span></a>
            </li>
            -->
            

            <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/expert?id=<%=e.getAccount_id()%>">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Profile</span></a>
            </li>
                      <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/adminmessage">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Chat online</span></a>
            </li>

            <!-- Divider -->
           


            <!-- Nav Item - Pages Collapse Menu -->


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>


        </ul>
        <%}%>