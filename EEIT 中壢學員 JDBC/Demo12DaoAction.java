package tw.isapn.action;

import java.sql.SQLException;
import java.util.List;

import tw.isapn.model.Member;
import tw.isapn.model.MemberDao;

public class Demo12DaoAction {

	public static void main(String[] args) {
		MemberDao mDao = new MemberDao();
		
//		Member m1 = new Member(1004,"王心凌", "台北", "123456");
		
		try {
			mDao.createConnection();
//			mDao.addMember(m1);
//			Member resultMember = mDao.findMemberById(1001);
//			System.out.println("name: " + resultMember.getMemberName());
			
			
//			List<Member> allMember = mDao.getAllMember();
//			for(Member tempMember :allMember) {
//				System.out.println("name: " + tempMember.getMemberName());
//				System.out.println("address: " + tempMember.getMemberAddress());
//				System.out.println("=====================================");
//			}
			
//			mDao.updateAddressById(1002, "USA");
			mDao.deleteById(1005);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				mDao.closeConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		

	}

}
