package tw.isapn.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Demo9SQLException {
	
	private Connection conn;

	public void createConnection() throws SQLException  {
		String urlStr = "jdbc:sqlserver://localhost:1433;databaseName=JDBCDemoDB;"
				+ "user=sa;password=P@ssw0rd!;trustServerCertificate=true";
		this.conn = DriverManager.getConnection(urlStr);

		boolean status = !conn.isClosed();

		if (status) {
			System.out.println("開啟連線成功");
		}

	}

	public void closeConnection() throws SQLException {
		if (conn != null) {
			conn.close();
			System.out.println("成功關閉連線");
		}
	}

	public static void main(String[] args) {
		Demo9SQLException demo9 = new Demo9SQLException();
		
		try {
			demo9.createConnection();
		} catch (SQLException e) {
			System.out.println("e: " + e.getMessage());
			System.out.println("error code: " + e.getErrorCode());
		} finally {
			try {
				demo9.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
