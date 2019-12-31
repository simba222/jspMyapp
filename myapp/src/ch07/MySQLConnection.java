package ch07;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MySQLConnection {

	private DBConnectionMgr pool;
	
	public MySQLConnection() {
		pool = DBConnectionMgr.getInstance();
		try {
			Connection con = pool.getConnection();
			String sql = "select count(*) from aaa";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			System.out.println(cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("연결성공");
	}
	
	public static void main(String[] args) {
		 new MySQLConnection();
	}
}
