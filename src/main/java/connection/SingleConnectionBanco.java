package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco {

	private static String banco = "jdbc:postgresql://localhost:5432/projeto-web-jsp?autoReconnect=true";
	private static String user = "postgres";
	private static String senha = "1234";
	private static Connection connection = null;
	
	static {
		conectar();
	}

	public static Connection getConnection() {
		return connection;
	}

	public SingleConnectionBanco() { /* Quando tiver uma instancia vai conectar */
		conectar();
	}

	private static void conectar() {
		try {
			if (connection == null) {
				Class.forName("org.postgresql.Driver"); /* Carrega driver de conexão do banco de dados */
				connection = DriverManager.getConnection(banco, user, senha);
				connection.setAutoCommit(false); /* Para não efetuar alterações no banco sem os comandos */
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
