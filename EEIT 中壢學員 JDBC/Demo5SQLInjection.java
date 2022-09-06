package tw.isapn.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Demo5SQLInjection {
	
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
	
	public boolean checkLogin(String username, String pwd) throws SQLException {
		String sql = "select * from users where username = '"+ username+"' and pwd = '"+ pwd +"'";
		
		System.out.println("sql: " + sql);
		
		Statement state = conn.createStatement();
		ResultSet rs = state.executeQuery(sql);
		boolean checkOK = rs.next();
		
		rs.close();
		state.close();
		return checkOK;
	}
	
	public boolean checkLogin2(String username, String pwd) throws SQLException {
		String sql = "select * from users where username = ? and pwd = ?";
		PreparedStatement preState = conn.prepareStatement(sql);
		preState.setString(1, username);
		preState.setString(2, pwd);
		
		ResultSet rs = preState.executeQuery();
		boolean checkOK = rs.next();
		
		rs.close();
		preState.close();
		return checkOK;
	}

	public static void main(String[] args) {
		Demo5SQLInjection demo5 = new Demo5SQLInjection();
		
		String loginUser = "' or 1=1 --";
		String loginPassword = "666689890";
		
		try {
			demo5.createConnection();
//			boolean result = demo5.checkLogin(loginUser, loginPassword);
			boolean result = demo5.checkLogin2(loginUser, loginPassword);
			
			if(result) {
				System.out.println("登入成功");
			}else {
				System.out.println("登入失敗，帳號密碼錯誤");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				demo5.closeConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		

	}

}
