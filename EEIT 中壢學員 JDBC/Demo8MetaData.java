package tw.isapn.action;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class Demo8MetaData {
	
	private Connection conn;

	public void createConnection() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String urlStr = "jdbc:sqlserver://localhost:1433;databaseName=JDBCDemoDB;"
				+ "user=sa;password=P@ssw0rd!;trustServerCertificate=true";
		this.conn = DriverManager.getConnection(urlStr);

		boolean status = !conn.isClosed();

		if (status) {
			System.out.println("開啟連線成功");
		}

	}

	public void closeConnection() throws Exception {
		if (conn != null) {
			conn.close();
			System.out.println("成功關閉連線");
		}
	}
	
	public void testDatabaseMetaData() throws SQLException {
		DatabaseMetaData metaData = conn.getMetaData();
		
		System.out.println("DatabaseProductName: " + metaData.getDatabaseProductName());
		System.out.println("DatabaseProductVersion: " + metaData.getDatabaseProductVersion());
		System.out.println("DriverName: " + metaData.getDriverName());
		System.out.println("DriverVersion: " + metaData.getDriverVersion());
		System.out.println("UserName: " + metaData.getUserName());
		
	}
	
	
	public void resultSetMetaData() throws SQLException {
		String sql = "select * from product";
		PreparedStatement preState = conn.prepareStatement(sql);
		ResultSet rs = preState.executeQuery();
		
		ResultSetMetaData metaData = rs.getMetaData();
		
		System.out.println("ColumnCount: " + metaData.getColumnCount());
		System.out.println("ColumnName(1): " + metaData.getColumnName(1));
		System.out.println("ColumnName(2): " + metaData.getColumnName(2));
		System.out.println("ColumnTypeName(1): " + metaData.getColumnTypeName(1));
		System.out.println("ColumnTypeName(2): " + metaData.getColumnTypeName(2));
		System.out.println("ColumnDisplaySize(1): " + metaData.getColumnDisplaySize(1));
		System.out.println("ColumnDisplaySize(2): " + metaData.getColumnDisplaySize(2));
		
		rs.close();
		preState.close();
	}

	public static void main(String[] args) {
		Demo8MetaData demo8 = new Demo8MetaData();
		
		try {
			demo8.createConnection();
//			demo8.testDatabaseMetaData();
			demo8.resultSetMetaData();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			try {
				demo8.closeConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
