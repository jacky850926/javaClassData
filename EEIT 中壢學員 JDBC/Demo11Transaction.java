package tw.isapn.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Demo11Transaction {
	
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
	
	public void controlTransaction() throws SQLException {
		String sql = "update product set remark = ? where productid = ?";
		
		conn.setAutoCommit(false); // 啟動隱含交易模式
		
		PreparedStatement preState = conn.prepareStatement(sql);
		
		preState.setString(1, "因疫情關係，不在 24H 保障內");
		preState.setInt(2, 1005);
		preState.execute();
		
		preState.setString(1, "因疫情關係，不在 24H 保障內66666666666666666666666666666666666666666666666666666");
		preState.setInt(2, 1006);
		preState.execute();
		
		conn.commit();
		
		System.out.println("commit OK!!");
		
		conn.setAutoCommit(true); // 回到自動認可交易模式
		
		preState.close();
		
	}

	public static void main(String[] args) {
		Demo11Transaction demo11 = new Demo11Transaction();
		
		
		try {
			demo11.createConnection();
			demo11.controlTransaction();
			
		} catch (SQLException e) {
			System.out.println("SQL 出錯，訊息為: " + e.getMessage());
		} finally {
			try {
				demo11.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
