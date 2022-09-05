package tw.ispan.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Demo3CreateStatement {
	
	private Connection conn;
	
	public void createConnection() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String urlStr = "jdbc:sqlserver://localhost:1433;databaseName=JDBCDemoDB;"
				+ "user=sa;password=P@ssw0rd!;trustServerCertificate=true";
		this.conn = DriverManager.getConnection(urlStr);
		
		boolean status = !conn.isClosed();
		
		if(status) {
			System.out.println("開啟連線成功");
		}
		
	}
	
	public void closeConnection() throws Exception {
		if(conn != null) {
			conn.close();
			System.out.println("成功關閉連線");
		}
	}
	
	public void queryDB1() throws SQLException {
		String sql = "select * from product";
		Statement state = conn.createStatement();
		ResultSet rs = state.executeQuery(sql);
		boolean result = rs.next();
		System.out.println("result: " + result);
		rs.close();
		state.close();
	}
	
	public void queryDB2() throws Exception {
		String sql = "select * from product";
		Statement state = conn.createStatement();
		ResultSet rs = state.executeQuery(sql);
		
		while(rs.next()) {
			System.out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getInt(3) + " " + rs.getDate(4)
			+ " " + rs.getString(5));
		}
		
		rs.close();
		state.close();
	}
	
	public void updateData() throws SQLException {
		
		String sql = "update product set productprice = 30 where productname = 'mask'";
		Statement state = conn.createStatement();
		int row = state.executeUpdate(sql);
		System.out.println("修改了:" + row + "筆");
		
		state.close();
	}
	
	//新增一筆資料1005, PS5 , 15000 , 2022-01-23, 缺貨
	
	public void insertData() throws SQLException {
		String sql = "insert into product values(1005, 'PS5' , 15000 , '2022-01-23', '缺貨')";
		Statement state = conn.createStatement();
		int row = state.executeUpdate(sql);
		System.out.println("新增了" + row + "筆資料如下:");
		System.out.println("1005, 'PS5' , 15000 , '2022-01-23', '缺貨'");
		state.close();
	}
	
	//找出100元以上的商品，只要商品名稱跟價錢
	public void select100() throws SQLException {
		String sql = "select * from product where productprice > 100";
		Statement state = conn.createStatement();
		ResultSet rs = state.executeQuery(sql);
		
		while(rs.next()) {
			System.out.println(rs.getString("productname") + " " + rs.getInt("productprice"));
		}
		
		rs.close();
		state.close();
	}
	public void select1002() throws SQLException {
		String sql = "select productname , productprice from product where productprice > 100";
		Statement state = conn.createStatement();
		ResultSet rs = state.executeQuery(sql);
		
		while(rs.next()) {
			System.out.println(rs.getString(1) + " " + rs.getInt(2));
		}
		
		rs.close();
		state.close();
	}
	//刪除 id 為1001的資料
	public void deleteData() throws SQLException {
		String sql = "delete from product where productid = 1001";
		Statement state = conn.createStatement();
		int row = state.executeUpdate(sql);
		System.out.println("刪除了" + row + "筆資料");
		state.close();
	}
	
	public static void main(String[] args) {
		Demo3CreateStatement demo3 = new Demo3CreateStatement();
		try {
			//開連線
			demo3.createConnection();
			//執行 createConnection
			//執行sql
//			demo3.queryDB1();
//			demo3.queryDB2();
//			demo3.updateData();
//			demo3.insertData();
//			demo3.select1002();
			demo3.deleteData();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//關連線
			try {
				demo3.closeConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
