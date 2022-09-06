package tw.isapn.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class Demo10BatchUpdate {
	
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
	
	public void couponSending() throws SQLException {
		ArrayList<String> emails = new ArrayList<String>();
		emails.add("jerry@gmail");
		emails.add("Amy@gmail");
		emails.add("tina@gmail");
		
		String sql = "insert coupon (userEmail, couponCode) values (?,?)";
		
		PreparedStatement preState = conn.prepareStatement(sql);
		
		for(String e : emails) {
			preState.setString(1, e);
			preState.setString(2, "uuuu");
			preState.addBatch();
		}
		
		// [1,1,1]
		int[] rows = preState.executeBatch();
		
		System.out.println("sql add rows: " + rows.length);
		
		preState.close();
		
	}

	public static void main(String[] args) {
		Demo10BatchUpdate demo10 = new Demo10BatchUpdate();
		
		try {
			demo10.createConnection();
			demo10.couponSending();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				demo10.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
