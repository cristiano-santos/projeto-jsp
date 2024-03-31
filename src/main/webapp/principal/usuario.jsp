<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



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
								<form class="forms-sample" enctype="multipart/form-data"
									action="<%=request.getContextPath()%>/ServletsUsuarioController"
									method="post" id="formUser">
									<input type="hidden" name="acao" id="acao" value="">

									<div class="form-group">
										<label for="exampleInputName1">ID</label> <input type="text"
											class="form-control" name="id" id="id" readonly="readonly"
											value="${modelLogin.id}">
									</div>
									
									 <div class="form-group form-default input-group mb-4" >
									 
									 <div class="input-group-prepend" >
									 
									 	<c:if test="${modelLogin.fotouser != '' && modelLogin.fotouser != null}">
									 		<a href="<%= request.getContextPath() %>/ServletsUsuarioController?acao=downloadFoto&id=${modelLogin.id}">
									 			 <img alt="Imagem User" id="fotoembase64" src="${modelLogin.fotouser}" width="100px">
									 		</a>
									 	</c:if>
									 		 
									 	<c:if test="${modelLogin.fotouser == '' || modelLogin.fotouser == null}">
									 		<img alt="Imagem User" id="fotoembase64" src="assets/images/faces/face60.png" width="100px">
									 	</c:if>
									 	
									 </div>
                                       <input type="file" id="fileFoto" name="fileFoto" accept="image/*" onchange="visualizarImg('fotoembase64', 'fileFoto');" class="form-control-file" style="margin-top: 15px; margin-left: 5px; color: #6c7293;">
                                       
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
										<label>Perfil do usuario</label> <select
											class="form-control" name="perfil" style="width: 100%;">
											<option disabled="disabled" selected="selected">[Selecione o Perfil]</option>
											<option value="ADMIN" <%
											ModelLogin modelLogin = (ModelLogin) request.getAttribute("modelLogin");
											if(modelLogin != null && modelLogin.getPerfil().equals("ADMIN")){
												out.print(" ");
												out.print("selected=\"selected\"");
												out.print(" ");
											}%>>Administrador </option>
											<option value="SUPERVISOR" <%
											modelLogin = (ModelLogin) request.getAttribute("modelLogin");
											if(modelLogin != null && modelLogin.getPerfil().equals("SUPERVISOR")){
												out.print(" ");
												out.print("selected=\"selected\"");
												out.print(" ");
											}%>>Supervisor</option>
											<option value="VENDEDOR" <%
											modelLogin = (ModelLogin) request.getAttribute("modelLogin");
											if(modelLogin != null && modelLogin.getPerfil().equals("VENDEDOR")){
												out.print(" ");
												out.print("selected=\"selected\"");
												out.print(" ");
											}%>>Vendedor</option>
											<option value="ASSISTENTE" <%
											modelLogin = (ModelLogin) request.getAttribute("modelLogin");
											if(modelLogin != null && modelLogin.getPerfil().equals("ASSISTENTE")){
												out.print(" ");
												out.print("selected=\"selected\"");
												out.print(" ");
											}%>>Assistente</option>
											
										</select>
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

									<div class="col-md-6">
										<div class="form-group row">
											<label class="col-sm-3 col-form-label">Sexo</label>
											<div class="col-sm-4">
												<div class="form-check">
													<label class="form-check-label"> <input type="radio"
														class="form-check-input" name="sexo" checked="checked"
														value="MASCULINO"
														<% modelLogin = (ModelLogin) request.getAttribute("modelLogin");
                                                        if (modelLogin != null && modelLogin.getSexo().equals("MASCULINO")) {
	                                                        out.print(" ");
	                                                        out.print("checked=\"checked\"");
	                                                        out.print(" ");
                                                        }%>>Masculino
													</label>
												</div>
											</div>
											<div class="col-sm-5">
												<div class="form-check">
													<label class="form-check-label"> <input
														type="radio" class="form-check-input" name="sexo"
														value="FEMININO"
														<% modelLogin = (ModelLogin) request.getAttribute("modelLogin");
                                                        if (modelLogin != null && modelLogin.getSexo().equals("FEMININO")) {
	                                                        out.print(" ");
	                                                        out.print("checked=\"checked\"");
	                                                        out.print(" ");
                                                        }%>>Feminino
													</label>
												</div>
											</div>
										</div>
									</div>


									<button type="button" class="btn btn-outline-primary btn-fw"
										onclick="limparForm();">Novo</button>
									<button type="submit" class="btn btn-outline-success btn-fw">Salvar</button>
									<button type="button" class="btn btn-outline-danger btn-fw"
										onclick="criarDeleteComAjax();">Excluir</button>
									<button type="button" class="btn btn-outline-warning btn-fw"
										data-toggle="modal" data-target="#exampleModal">Pesquisar</button>
								</form>
							</div>
						</div>
					</div>
					<span id="msg">${msg}</span>
				</div>

				<div class="col-lg-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Usuários Cadastrados</h4>
							<div class="table-responsive">
								<table class="table table-striped" id="tabelaview">
									<thead>
										<tr>
											<th>ID</th>
											<th>Nome</th>
											<th>Email</th>
											<th>Login</th>
											<th>Ver</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items='${modelLogins}' var='ml'>
											<tr>
												<td><c:out value="${ml.id}"></c:out></td>
												<td><c:out value="${ml.nome}"></c:out></td>
												<td><c:out value="${ml.email}"></c:out></td>
												<td><c:out value="${ml.login}"></c:out></td>
												<td><a class="btn btn-success btn-fw"
													href="<%=request.getContextPath()%>/ServletsUsuarioController?acao=buscarEditar&id=${ml.id}">Visualizar</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- content-wrapper ends -->

			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller ends -->

	<!-- plugins:js -->
	<jsp:include page="javascriptfile.jsp"></jsp:include>
	<!-- End custom js for this page -->

	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisa de
						Usuário</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Nome"
							aria-label="nome" id="nomeBusca" aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-success btn-fw" type="button"
								onclick="buscarUsuario();">Buscar</button>
						</div>
					</div>

					<div style="height: 250px; overflow: scroll;">
						<table class="table" id="tabelaresultados">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Nome</th>
									<th scope="col">Visualizar</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
					<span id="totalResultados"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btn-fw"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		
		function visualizarImg(fotoembase64, fileFoto){
			
			var preview = document.getElementById(fotoembase64); // campo IMG html
			var fileUser = document.getElementById(fileFoto).files[0];
			var reader = new FileReader();
			
			reader.onloadend = function(){
				preview.src = reader.result; /*Carrega a foto na tela*/
			};
			
			if(fileUser){
				reader.readAsDataURL(fileUser);/*Preview da imagem*/
			}else{
				preview.src= '';
			}
		}
	
	
		function verEditar(id) {

			var urlAction = document.getElementById('formUser').action;

			window.location.href = urlAction + '?acao=buscarEditar&id=' + id;
		}

		function buscarUsuario() {
			var nomeBusca = document.getElementById('nomeBusca').value;

			if (nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != '') { /*Validndo se tem dados para buscar no banco*/
				var urlAction = document.getElementById('formUser').action;

				$
						.ajax(
								{
									method : "get",
									url : urlAction,
									data : "nomeBusca=" + nomeBusca
											+ '&acao=buscarUserAjax',
									success : function(response) {

										var json = JSON.parse(response);
										console.info(json);
										$('#tabelaresultados > tbody > tr')
												.remove();

										for (var p = 0; p < json.length; p++) {

											$('#tabelaresultados > tbody')
													.append(
															'<tr> <td>'
																	+ json[p].id
																	+ '</td> <td> '
																	+ json[p].nome
																	+ '</td> <td><button onclick="verEditar('
																	+ json[p].id
																	+ ')" type="button" class="btn btn-info btn-icon-text"> Ver <i class="mdi mdi-magnify btn-icon-append"></i</button></td></tr>');
										}

										document
												.getElementById('totalResultados').textContent = 'Resultados: '
												+ json.length;
									}
								})
						.fail(
								function(xhr, status, errorThrown) {
									alert('Erro ao buscar usuario por nome: + xhe.responseText');
								});

			}
		}

		function criarDeleteComAjax() {
			if (confirm('Deseja realmente excluir o registro com Ajax?')) {
				var urlAction = document.getElementById('formUser').action;
				var idUser = document.getElementById('id').value;

				$
						.ajax(
								{
									method : "get",
									url : urlAction,
									data : "id=" + idUser + '&acao=deletarAjax',
									success : function(response) {
										limparForm();
										document.getElementById('msg').textContent = response;
									}
								})
						.fail(
								function(xhr, status, errorThrown) {
									alert('Erro ao deletar usuario por id: + xhe.responseText');
								});

			}
		}

		function criarDelete() {
			if (confirm('Deseja realmente excluir o registro ?')) {
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
	<!--footer.html -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>