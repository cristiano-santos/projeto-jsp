<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set scope="session" var="isAdmin"
	value='<%= request.getSession().getAttribute("isAdmin") %>'>
</c:set>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<div
		class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
		<a class="sidebar-brand brand-logo"
			href="<%=request.getContextPath()%>/index.jsp"><img
			src="<%= request.getContextPath() %>/assets/images/logo.svg"
			alt="logo" /></a> <a class="sidebar-brand brand-logo-mini"
			href="<%=request.getContextPath()%>/index.jsp"><img
			src="<%= request.getContextPath() %>/assets/images/logo-mini.svg"
			alt="logo" /></a>
	</div>
	<ul class="nav">
		<li class="nav-item profile">
			<div class="profile-desc">
				<div class="profile-pic">
					<div class="count-indicator">
						<img class="img-xs rounded-circle "
							src="<%= request.getContextPath()%>/assets/images/faces/face50.png"
							alt=""> <span class="count bg-success"></span>
					</div>
					<div class="profile-name">
						<h5 class="mb-0 font-weight-normal"><%= session.getAttribute("usuario")%></h5>
						<span>Gold Member</span>
					</div>
				</div>
				<a href="#" id="profile-dropdown" data-toggle="dropdown"><i
					class="mdi mdi-dots-vertical"></i></a>
				<div
					class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list"
					aria-labelledby="profile-dropdown">
					<a href="#" class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-dark rounded-circle">
								<i class="mdi mdi-settings text-primary"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<p class="preview-subject ellipsis mb-1 text-small">Account
								settings</p>
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-dark rounded-circle">
								<i class="mdi mdi-onepassword  text-info"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<p class="preview-subject ellipsis mb-1 text-small">Change
								Password</p>
						</div>
					</a>
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item preview-item">
						<div class="preview-thumbnail">
							<div class="preview-icon bg-dark rounded-circle">
								<i class="mdi mdi-calendar-today text-success"></i>
							</div>
						</div>
						<div class="preview-item-content">
							<p class="preview-subject ellipsis mb-1 text-small">To-do
								list</p>
						</div>
					</a>
				</div>
			</div>
		</li>
		<li class="nav-item nav-category"><span class="nav-link">Menu
				de Navega��o</span></li>

		<c:if test="${isAdmin}">
			<li class="nav-item menu-items"><a class="nav-link"
				href="<%=request.getContextPath()%>/ServletsUsuarioController?acao=listarUser">
					<span class="menu-icon"> <i class="mdi mdi-account-plus"></i>
				</span> <span class="menu-title">Usuario</span>
			</a></li>
		</c:if>

		<li class="nav-item menu-items"><a class="nav-link"
			href="<%=request.getContextPath()%>/principal/teste.jsp"> <span
				class="menu-icon"> <i class="mdi mdi-account-multiple-plus"></i>
			</span> <span class="menu-title">Clientes</span>
		</a></li>

		<li class="nav-item menu-items"><a class="nav-link"
			href="pages/tables/basic-table.html"> <span class="menu-icon">
					<i class="mdi mdi-table-large"></i>
			</span> <span class="menu-title">Tables</span>
		</a></li>

		<li class="nav-item menu-items"><a class="nav-link"
			href="pages/charts/chartjs.html"> <span class="menu-icon">
					<i class="mdi mdi-truck-delivery"></i>
			</span> <span class="menu-title">Fornecedores</span>
		</a></li>

		<li class="nav-item menu-items"><a class="nav-link"
			href="pages/icons/mdi.html"> <span class="menu-icon"> <i
					class="mdi mdi-contacts"></i>
			</span> <span class="menu-title">Icons</span>
		</a></li>

		<li class="nav-item menu-items"><a class="nav-link"
			data-toggle="collapse" href="#auth" aria-expanded="false"
			aria-controls="auth"> <span class="menu-icon"> <i
					class="mdi mdi-security"></i>
			</span> <span class="menu-title">User Pages</span> <i class="menu-arrow"></i>
		</a>

			<div class="collapse" id="auth">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="pages/samples/blank-page.html"> Blank Page </a></li>
					<li class="nav-item"><a class="nav-link"
						href="pages/samples/error-404.html"> 404 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="pages/samples/error-500.html"> 500 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="pages/samples/login.html"> Login </a></li>
					<li class="nav-item"><a class="nav-link"
						href="pages/samples/register.html"> Register </a></li>
				</ul>
			</div></li>

		<li class="nav-item menu-items"><a class="nav-link"
			href="http://www.bootstrapdash.com/demo/corona-free/jquery/documentation/documentation.html">
				<span class="menu-icon"> <i class="mdi mdi-file-document-box"></i>
			</span> <span class="menu-title">Documentation</span>
		</a></li>
	</ul>
</nav>