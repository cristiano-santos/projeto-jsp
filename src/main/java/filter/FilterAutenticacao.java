package filter;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import connection.SingleConnectionBanco;

@WebFilter(urlPatterns = {"/principal/*"}) /* Intercepta todas as requisições que vierem do projeto ou mapeamento */
public class FilterAutenticacao implements Filter {

	private static Connection connection;
	
	public FilterAutenticacao() {
		
	}

	public void destroy() { /* Encerra os processos quando o servidor é parado */
		try {
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/* Intercepta as requisições e da as respostas no sistema.*/
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();

			String usuarioLogado = (String) session.getAttribute("usuario");

			String urlAutenticar = req.getServletPath(); /* URL que está sendo acessada */

			/* Validar se está logado senão redireciona para a tela de login */

			if (usuarioLogado == null &&
					!urlAutenticar.equalsIgnoreCase("/principal/ServletLogin")) {
				
				RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp?url=" + urlAutenticar);
				
				request.setAttribute("msg", "Por favor realize o login.");
				
				redireciona.forward(request, response);
				
				return; /* Para a execução e redireciona para o login */
				
			} else {
				chain.doFilter(request, response);
			}
			connection.commit(); /*Comita as alterações no banco de dados*/
			
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			
			try {
				connection.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}
	
	 /* Inicia os processos ou recursos quando o servidor sobe o projeto */
	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnectionBanco.getConnection();
		
	}

}
