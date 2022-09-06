package tw.isapn.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Demo2TryWithResource {

	public static void main(String[] args) {
		String urlStr = "jdbc:sqlserver://localhost:1433;databaseName=JDBCDemoDB;"
				+ "user=sa;password=P@ssw0rd!;trustServerCertificate=true";
		
		try (Connection conn = DriverManager.getConnection(urlStr)) {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			
			boolean status= !conn.isClosed();
			
			System.out.println("status: " + status);
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
