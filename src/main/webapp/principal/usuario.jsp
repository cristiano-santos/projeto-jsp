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
					<h3>Cadastro de Usuarios</h3>

					<div class="col-12 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<form class="forms-sample"
									action="<%=request.getContextPath()%>/ServletsUsuarioController"
									method="post" id="formUser">
									<div class="form-group">
										<label for="exampleInputName1">ID</label> <input type="text"
											class="form-control" name="id" id="id" readonly="readonly"
											value="${modelLogin.id}">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail3">Nome</label> <input
											type="text" class="form-control" name="nome" id="nome"
											required="required" placeholder="Nome"
											value="${modelLogin.nome}">
									</div>

									<div class="form-group">
										<label for="exampleInputEmail3">Email</label> <input
											type="email" class="form-control" name="email" id="email"
											required="required" placeholder="Email"
											value="${modelLogin.email}">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail3">Login</label> <input
											type="text" class="form-control" name="login" id="login"
											required="required" placeholder="Login"
											value="${modelLogin.login}">
									</div>

									<div class="form-group">
										<label for="exampleInputPassword4">Senha</label> <input
											type="password" class="form-control" name="senha" id="senha"
											required="required" placeholder="Senha"
											value="${modelLogin.senha}">
									</div>

									<div class="form-group">
										<label>Carregar Arquivo</label> <input type="file"
											name="img[]" class="file-upload-default">
										<div class="input-group col-xs-12">
											<input type="text" class="form-control file-upload-info"
												disabled placeholder="Carregar Imagem"> <span
												class="input-group-append">
												<button class="file-upload-browse btn btn-primary"
													type="button">Upload</button>
											</span>
										</div>
									</div>
									<button type="button" class="btn btn-outline-info btn-fw"
										onclick="limparForm();" >Novo</button>
									<button type="submit" class="btn btn-outline-success btn-fw">Salvar</button>
									<button type="button" class="btn btn-outline-danger btn-fw">Excluir</button>
								</form>
							</div>
						</div>
					</div>
					<span>${msg}</span>
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
	<script type="text/javascript">
		function limparForm() {
			var elementos = document.getElementById("formUser").elements; /*Retorna os elemantos html dentro do form*/
			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
			}
		}
	</script>
</body>
</html>