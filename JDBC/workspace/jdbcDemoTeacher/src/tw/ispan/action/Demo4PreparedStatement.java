package tw.ispan.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Demo4PreparedStatement {

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
	
	public void createTable() throws SQLException {
		String sql = "create table profiles(id int not null primary key identity(1,1),name nvarchar(50) not null,address nvarchar(100) not null,phone varchar(20));";
		PreparedStatement preState = conn.prepareStatement(sql);
		preState.execute();
		preState.close();
		System.out.println("create table success!");
	}
	
	public void insertData(String name,String address,String phone) throws SQLException {
		String sql = "insert into profiles(name,address,phone) values (?,?,?)";
		PreparedStatement preState = conn.prepareStatement(sql);
		preState.setString(1, name);
		preState.setString(2, address);
		preState.setString(3, phone);
		
		int row = preState.executeUpdate();
		System.out.println("新增了" + row + "筆資料");
		preState.close();
	}
	
	//透過address找資料
	public void queryByAddress(String address) throws SQLException {
		String sql = "select * from profiles where address = ?";
		PreparedStatement preState = conn.prepareStatement(sql);
		preState.setString(1, address);
		
		ResultSet rs = preState.executeQuery();
		
		while(rs.next()) {
			System.out.println(rs.getString("name"));
		}
		
		rs.close();
		preState.close();
	}
	
	//參數id int ，根據此id刪除prifile內的資料
	public void deleteById(int id) throws SQLException {
		String sql = "delete from profiles where id = ?";
		PreparedStatement preState = conn.prepareStatement(sql);
		preState.setInt(1, id);
		
		int row = preState.executeUpdate();
		System.out.println("刪除了" + row + "筆資料");
		preState.close();
		
	}
	//某人想要改電話號碼
	//參數為要修改電話的人的name跟新的電話
	public void updatePhoneByName(String name , String newPhone) throws SQLException {
		String sql = "update profiles set Phone =? where name = ?";
		PreparedStatement preState = conn.prepareStatement(sql);
		preState.setString(1, newPhone);
		preState.setString(2, name);
		
		int row =preState.executeUpdate();
		System.out.println("修改了" + row + "筆資料");
		preState.close();
	}
	
	public static void main(String[] args) {
		Demo4PreparedStatement demo4 = new Demo4PreparedStatement();
		
		try {
			demo4.createConnection();
//			demo4.createTable();
//			demo4.insertData("肯德基爺爺" , "新安東京海上" , "28225252");
//			demo4.queryByAddress("新安東京海上");
//			demo4.deleteById(4);
			demo4.updatePhoneByName("花媽", "12345678");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				demo4.closeConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
