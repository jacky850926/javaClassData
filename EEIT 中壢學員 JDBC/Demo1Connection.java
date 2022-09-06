package tw.isapn.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Demo1Connection {

	public static void main(String[] args) {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//			String urlStr = "jdbc:sqlserver://localhost:1433;databaseName=JDBCDemoDB;"
//					+ "user=sa;password=P@ssw0rd!;trustServerCertificate=true";
			
			String url2 = "jdbc:sqlserver://localhost:1433;databaseName=JDBCDemoDB;trustServerCertificate=true";
			String userName = "sa";
			String password = "P@ssw0rd!";
			
//			Connection conn = DriverManager.getConnection(urlStr);
			
			Connection conn = DriverManager.getConnection(url2,userName,password);
			
			boolean status = !conn.isClosed();
			
			System.out.println("status: " + status);
			
			conn.close();
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
