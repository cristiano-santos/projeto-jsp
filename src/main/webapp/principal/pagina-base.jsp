<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

<body>
	<div class="container-scroller">
		<!-- partial:partials/_sidebar.html -->
		<jsp:include page="sidebar.jsp"></jsp:include>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_navbar.html -->
			<jsp:include page="navbar.jsp"></jsp:include>


			<div class="main-panel">
				<div class="content-wrapper">
				<h3>Pagina Base com conteudo do projeto.</h3>
				
				</div>
				<!-- content-wrapper ends -->
				<!--footer.html -->
				<jsp:include page="footer.jsp"></jsp:include>
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller ends -->

	<!-- plugins:js -->
	<jsp:include page="javascriptfile.jsp"></jsp:include>
	<!-- End custom js for this page -->

</body>
</html>