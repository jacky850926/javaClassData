package tw.ispan.action;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Demo7BlobImage {
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
	
	public void saveImageInDB() throws Exception {
		File file = new File("C:/myImage/w1200.jpg");
		FileInputStream fis = new FileInputStream(file);
		
		String sql = "insert into gallery(image_name, image_file) values(?,?)";
		PreparedStatement preState = conn.prepareStatement(sql);
		preState.setString(1, "window");
		preState.setBinaryStream(2, fis);
		
		preState.execute();
		preState.close();
		fis.close();
		System.out.println("Save file OK");
	}
	
	public void getImageFile() throws Exception{
		String sql = "select image_file from gallery where id = ?";
		PreparedStatement preState = conn.prepareStatement(sql);
		preState.setInt(1, 1);
		ResultSet rs = preState.executeQuery();//連線取得resultset
		rs.next();//指標移動到第一筆
		
		Blob blob = rs.getBlob(1);
		
		FileOutputStream fos = new FileOutputStream("C:\\myImage\\output\\out2.jpg");//用硬碟下去寫
		BufferedOutputStream bos = new BufferedOutputStream(fos);//記憶體緩衝區輸出
		bos.write(blob.getBytes(1, (int)blob.length()));
//		fos.write(blob.getBytes(1, (int)blob.length()));
		//getbyte(1,n)方法可從blob拿出byte，從第1個到第n個，但blob.length()是long型別要強制轉型
		bos.flush();//強制寫出緩衝區，小於8KB的檔案一定要寫這行
		System.out.println("Out File OK");
//		fos.close();
		rs.close();
		preState.close();
	}
	
	public static void main(String[] args) {
		Demo7BlobImage demo7 = new Demo7BlobImage();
		
		try {
			demo7.createConnection();
//			demo7.saveImageInDB();
			demo7.getImageFile();
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			try {
				demo7.closeConnection();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
