package tw.isapn.action;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Demo6CallableStatement {
	
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
	
	public void callProcedure() throws SQLException {
		CallableStatement callState = conn.prepareCall("{call productProc(?,?)}");
		callState.setInt(1, 1004);
		callState.registerOutParameter(2, java.sql.Types.VARCHAR);
		
		callState.execute();
		
		String productName = callState.getString(2);
		
		System.out.println("productName: " + productName);
		
		callState.close();
		
	}
	
	
	public void callProcedureOnlyInput(int id) throws SQLException {
		CallableStatement callState = conn.prepareCall("{call productProc2(?)}");
		callState.setInt(1, id);
		
		ResultSet rs = callState.executeQuery();
		rs.next();
		
		String result = rs.getString(1);
		System.out.println("result: " + result);
		
		rs.close();
		callState.close();
	}

	public static void main(String[] args) {
		Demo6CallableStatement demo6 = new Demo6CallableStatement();
		
		try {
			demo6.createConnection();
//			demo6.callProcedure();
			demo6.callProcedureOnlyInput(1003);
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			try {
				demo6.closeConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
