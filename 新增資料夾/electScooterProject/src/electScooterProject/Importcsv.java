package electScooterProject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class Importcsv {
	private Connection conn;
	
	public void createConnection() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String urlStr = "jdbc:sqlserver://localhost:1433;databaseName=electscooter;"
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
	
	public void insertData() throws Exception {
		File file = new File("C:\\Java\\新北市電動機車充電站.csv");
		FileInputStream fis = new FileInputStream(file);
		FileReader fr = new FileReader(file);
		BufferedReader br = new BufferedReader(fr);
		br.readLine();
		String line = null;
		while((line = br.readLine())!=null) {
			String[] splitline = line.split(",");
				String sql = "insert into tabletest(dis,sta,address,das,state,cha,fee,way,ope,sty,no) values(?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement preState = conn.prepareStatement(sql);
				for(int j=0;j <= 10;j++) {
					preState.setString(j+1,splitline[j].substring(1, splitline[j].length()-1));
				}
				int row = preState.executeUpdate();
				preState.close();
				System.out.println("新增資料:" + row);
			
		}
		System.out.println("save file OK");
		
	}
	
	public void resultSetMataData() throws SQLException{
		String sql = "select * from tabletest";
		PreparedStatement preState = conn.prepareStatement(sql);
		ResultSet rs = preState.executeQuery();
		ResultSetMetaData metaData = rs.getMetaData();
		for(int i=1 ; i<=11;i++) {
		System.out.print(metaData.getColumnName(i)+",");
		}
		
	}
		

	public static void main(String[] args) {
		Importcsv demo = new Importcsv();
		try {
			demo.createConnection();
//			demo.resultSetMataData();
			demo.insertData();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				demo.closeConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
