package servlets;

import java.io.IOException;
import java.util.List;

import javax.imageio.stream.ImageOutputStreamImpl;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.postgresql.shaded.com.ongres.scram.common.bouncycastle.base64.Base64Encoder;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DAOUsuarioRepository;
import model.ModelLogin;

@MultipartConfig
@WebServlet(urlPatterns = {"/ServletsUsuarioController"})
public class ServletsUsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();

	public ServletsUsuarioController() {

	}

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String acao = request.getParameter("acao");

			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletar")) {
				
				String idUser = request.getParameter("id");
				daoUsuarioRepository.deletarUsuario(idUser);
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultarUsuarioList();
				request.setAttribute("modelLogins", modelLogins);
				
				request.setAttribute("msg", "Usuario Excluído com Sucesso.");
				
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
				
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarAjax")) {
				
				String idUser = request.getParameter("id");
				daoUsuarioRepository.deletarUsuario(idUser);
				
				response.getWriter().write("Usuario Excluido com Sucesso no Ajax.");
			
				
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarUserAjax")) {
				
				String nomeBusca = request.getParameter("nomeBusca");
				List<ModelLogin> dadosJsonUser = daoUsuarioRepository.consultarUsuarioList(nomeBusca);
				
				ObjectMapper mapper = new ObjectMapper();
				String json = mapper.writeValueAsString(dadosJsonUser);
				response.getWriter().write(json);
			
				
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarEditar")) {
				
				String id = request.getParameter("id");
				ModelLogin modelLogin = daoUsuarioRepository.consultarUsuarioId(id);
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultarUsuarioList();
				request.setAttribute("modelLogins", modelLogins);
				
				request.setAttribute("msg", "Usuario em Edição.");
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("/principal/usuario.jsp").forward(request, response);
			
				
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listarUser")) {
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultarUsuarioList();
				
				request.setAttribute("msg", "Usuarios Carregados");
				request.setAttribute("modelLogins", modelLogins);
				request.getRequestDispatcher("/principal/usuario.jsp").forward(request, response);
			
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("downloadFoto")) {
				String idUser = request.getParameter("id");
				
				ModelLogin modelLogin = daoUsuarioRepository.consultarUsuarioId(idUser);
				if(modelLogin.getFotouser() != null && !modelLogin.getFotouser().isEmpty()) {
					response.setHeader("Content-Disposition", "attachment;filename=arquivo." + modelLogin.getExtensaofotouser());
					response.getOutputStream().write(new Base64().decodeBase64(modelLogin.getFotouser().split("\\,")[1]));
				}
			
			}else {
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultarUsuarioList();
				request.setAttribute("modelLogins", modelLogins);
				request.getRequestDispatcher("/principal/usuario.jsp").forward(request, response);
			}	

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String msg = "Dados gravados com sucesso.";

			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String email = request.getParameter("email");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");
			String perfil = request.getParameter("perfil");
			String sexo = request.getParameter("sexo");

			ModelLogin modelLogin = new ModelLogin();

			modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
			modelLogin.setNome(nome);
			modelLogin.setEmail(email);
			modelLogin.setLogin(login);
			modelLogin.setSenha(senha);
			modelLogin.setPerfil(perfil);
			modelLogin.setSexo(sexo);
			
			if(ServletFileUpload.isMultipartContent(request)) {
				Part part = request.getPart("fileFoto"); /*Pega a foto da tela */
				
				if(part.getSize() > 0) {
				byte[] foto = IOUtils.toByteArray(part.getInputStream()); /*Converte a imagem para byte*/
				@SuppressWarnings("static-access")
				String imagemBase64 = "data:image/" + part.getContentType().split("\\/")[1] + ";base64," + new Base64().encodeBase64String(foto);
				
				modelLogin.setFotouser(imagemBase64);
				modelLogin.setExtensaofotouser(part.getContentType().split("\\/")[1]);
				}
			}

			if (daoUsuarioRepository.validarCadastro(modelLogin.getLogin()) && modelLogin.getId() == null) {
				msg = "Já existe esse login cadastrado para outro usuario, favor informe outro login.";
			} else {
				if (modelLogin.isNovo()) {
					msg = "Usuario Salvo com Sucesso!";
				} else {
					msg = "Usuario Atualizado com Sucesso!";
				}
				modelLogin = daoUsuarioRepository.gravarUsuario(modelLogin);
			}
			
			List<ModelLogin> modelLogins = daoUsuarioRepository.consultarUsuarioList();
			request.setAttribute("modelLogins", modelLogins);
			request.setAttribute("msg", msg);
			request.setAttribute("modelLogin", modelLogin);
			request.getRequestDispatcher("/principal/usuario.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
	}
}
