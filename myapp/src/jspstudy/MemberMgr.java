package jspstudy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;


public class MemberMgr {
	
	private DBConnectionMgr pool;
	
	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Product List
	public Vector<String> getEmailList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<String> vlist = new Vector<String>();
		try {
			con = pool.getConnection();
			sql = "select id from _member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vlist.addElement(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}


}
