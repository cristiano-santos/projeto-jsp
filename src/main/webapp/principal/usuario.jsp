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
									<input type="hidden" name="acao" id="acao" value="">

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

									<button type="button" class="btn btn-outline-primary btn-fw" onclick="limparForm();">Novo</button>
									<button type="submit" class="btn btn-outline-success btn-fw">Salvar</button>
									<button type="button" class="btn btn-outline-danger btn-fw" onclick="criarDeleteComAjax();">Excluir</button>
									<button type="button" class="btn btn-outline-warning btn-fw" data-toggle="modal" data-target="#exampleModal">Pesquisar</button>
								</form>
							</div>
						</div>
					</div>
					<span id="msg">${msg}</span>
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
	
	function criarDeleteComAjax(){
		if(confirm('Deseja realmente excluir o registro com Ajax?')){
			var urlAction = document.getElementById('formUser').action;
			var idUser = document.getElementById('id').value;
			
			$.ajax({
				method: "get",
				url: urlAction,
				data: "id=" + idUser + '&acao=deletarAjax',
				success: function(response){
					limparForm();
					document.getElementById('msg').textContent = response;
				}
			}).fail(function(xhr, status, errorThrown){
				alert('Erro ao deletar usuario por id: + xhe.responseText');
			});
			
		}
	}
	
	function criarDelete(){
	if(confirm('Deseja realmente excluir o registro ?')){
			document.getElementById("formUser").method = 'get';
			document.getElementById("acao").value = 'deletar';
			document.getElementById("formUser").submit();
		}
	}
		
		function limparForm() {
			var elementos = document.getElementById("formUser").elements; /*Retorna os elemantos html dentro do form*/
			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
			}
		}
	</script>
	
	<!-- Button trigger modal -->

	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Pesquisa de Usuário</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-light btn-fw" data-dismiss="modal">Fechar</button>
       
      </div>
    </div>
  </div>
</div>
	
</body>
</html>