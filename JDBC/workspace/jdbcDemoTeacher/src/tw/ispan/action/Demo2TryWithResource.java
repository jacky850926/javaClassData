package tw.ispan.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Demo2TryWithResource {

	public static void main(String[] args) {
		String urlStr = "jdbc:sqlserver://localhost:1433;databaseName=JDBCDemoDB;"
						+ "user=sa;password=P@ssw0rd!;trustServerCertificate=true";
		//connection是繼承Autoclosable介面才能進行trywithresource的自動關閉
		try (Connection conn = DriverManager.getConnection(urlStr)) {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			boolean status = !conn.isClosed();
			
			System.out.println("status: " + status);
			

		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}		
		
		
	}

}
