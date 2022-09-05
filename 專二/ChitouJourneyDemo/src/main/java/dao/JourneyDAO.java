package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import javaBean.JourneyBean;

public class JourneyDAO {
	
	private Connection conn;
	
	public JourneyDAO(Connection conn) {
		this.conn = conn;
	}
	QueryRunner queryRunner = new QueryRunner();
	public List<JourneyBean> searchJourneyAll() {
		String sql="select * from journey";
		
		try {
			List<JourneyBean> resultList = queryRunner.query(conn, sql, new BeanListHandler<JourneyBean>(JourneyBean.class));
			return resultList;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
//			queryRunner.update(conn, sql, null)

		
//		try {
//			String sqlString = "select * from journey";
//			Statement stmt = conn.createStatement();
//			System.out.println(sqlString);
//			ResultSet rs = stmt.executeQuery(sqlString);
//			stmt.close();
//			String[] result = new String[result.getMetaData().getColumnCount()];
//			while(rs.next()) {
//				string[]
//			}
//		}catch (Exception e) {
//			String[] result = {"查詢資料錯誤"};
//			return result;
//		}
		
//		BeanListHandler<T>
	}
	
	public JourneyBean searchJourneyOne() {
		String sql="select top 1 * from journey ";
		
		try {
			JourneyBean result = queryRunner.query(conn, sql, new BeanHandler<JourneyBean>(JourneyBean.class));
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
