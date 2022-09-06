package tw.isapn.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {
	
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
	
	public void addMember(Member m) throws SQLException {
		String sql = "insert into member values (?,?,?,?)";
		PreparedStatement preState = conn.prepareStatement(sql);
		preState.setInt(1, m.getMemberId());
		preState.setString(2, m.getMemberName());
		preState.setString(3, m.getMemberAddress());
		preState.setString(4, m.getPhone());
		preState.execute();
		preState.close();
		System.out.println("新增資料完成");
	}
	
	public Member findMemberById(Integer id) throws SQLException {
		// 透過 id 拿 member 的 sql
		String sql = "select * from member where id = ?";
		
		PreparedStatement preState = conn.prepareStatement(sql);
		preState.setInt(1, id);
		
		ResultSet rs = preState.executeQuery();
		
		rs.next();
		
		// new Member, 把 ResultSet 的資料裝給它
		Member tempMember = new Member();
		tempMember.setMemberId(rs.getInt("id"));
		tempMember.setMemberName(rs.getString("member_name"));
		tempMember.setMemberAddress(rs.getString("member_address"));
		tempMember.setPhone(rs.getString("phone"));
		
		rs.close();
		preState.close();
		// 回傳該 member 物件
		return tempMember;
	}
	
	public List<Member> getAllMember() throws SQLException{
		String sql = "select * from member";
		PreparedStatement preState = conn.prepareStatement(sql);
		
		ResultSet rs = preState.executeQuery();
		
		List<Member> list = new ArrayList<Member>();
		
		while(rs.next()) {
			Member m = new Member();
			m.setMemberId(rs.getInt("id"));
			m.setMemberName(rs.getString("member_name"));
			m.setMemberAddress(rs.getString("member_address"));
			m.setPhone(rs.getString("phone"));
			list.add(m);
		}
		
		rs.close();
		preState.close();
		
		return list;
	}
	
	// 根據 ID 拿到資料，修改地址
	public void updateAddressById(Integer id, String newAddress) throws SQLException {
		String sql = "update member set member_address = ? where id = ?";
		PreparedStatement preState = conn.prepareStatement(sql);
		preState.setInt(2, id);
		preState.setString(1, newAddress);
		int row = preState.executeUpdate();
		System.out.println("修改了 " + row + " 筆");
		preState.close();
	}
	
	public void deleteById(int id) throws SQLException {
		String sql = "delete from member where id = ?";
		PreparedStatement preState = conn.prepareStatement(sql);
		preState.setInt(1, id);
		int row = preState.executeUpdate();
		System.out.println("刪除了" + row + "筆");
		preState.close();
	}
	


}
