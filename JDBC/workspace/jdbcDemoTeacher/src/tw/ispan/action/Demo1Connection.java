package tw.ispan.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Demo1Connection {

	public static void main(String[] args) {
		try {
			//class的forname方法尋找jar檔裡面的SQLserverDriver並執行
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			//建立連線字串包含連線端及帳號密碼作為連線資料庫的內容
//			String urlStr = "jdbc:sqlserver://localhost:1433;databaseName=JDBCDemoDB;"
//                    + "user=sa;password=P@ssw0rd!;trustServerCertificate=true";
			String url2 = "jdbc:sqlserver://localhost:1433;databaseName=JDBCDemoDB;trustServerCertificate=true";
			String userName = "sa";
			String password = "P@ssw0rd!";
			
			//drivermanager使用getconnection方法進行連線
//			Connection conn = DriverManager.getConnection(urlStr);
			
			Connection conn = DriverManager.getConnection(url2,userName,password);
			
			boolean status = !conn.isClosed();
			
			System.out.println("status: " + status);
			
			conn.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		
	}

}
