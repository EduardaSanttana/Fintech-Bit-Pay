package persistencia;

import java.sql.DriverManager;
import java.sql.SQLException;

public class Connection {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public static Connection getConnection() throws SQLException {
		Connection conn = (Connection) DriverManager
				.getConnection("jdbc:mysql://localhost:3307/BITPAY", "root", "root");

		return conn;
	}
}
