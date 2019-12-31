package ch07;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

//JSP DB������ �ʿ��� �޼ҵ带 ����� Ŭ����
public class TeamMgr {

	// Ǯ����� : Connection ��ü�� �̸� 10�� ����� ���´�.
	private DBConnectionMgr pool;

	public TeamMgr() {
		// DBConnectionMgr�� �̱��� ������ ���� Ŭ����
		// �̱��� ������ ��ü�� �Ѱ��� ����� �ֵ��� ������ Ŭ����
		pool = DBConnectionMgr.getInstance();
	}

	// ����
	// public boolean postTeam(String name,String city,int age,String team)
	public boolean postTeam(TeamBean bean) {
		// java.sql ��Ű�� ���
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			// DBConnectionMgr���� Connection ������.
			con = pool.getConnection();
			sql = "insert tblTeam(name,city,age,team)values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			// ?�� �������� ���� ����
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getCity());
			pstmt.setInt(3, bean.getAge());
			pstmt.setString(4, bean.getTeam());
			// �ϼ��� sql ���� : cnt�� �����̸� 1, ���� 0
			int cnt = pstmt.executeUpdate();// insert, update, delete
			if (cnt == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Connection �ݳ��ϰ�, pstmt�� close
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// ����Ʈ : ���ڵ� ���ٸ� ��� ��ü�� �����.
	// �̷��� ������ ��� ��� ��ü Vector
	public Vector<TeamBean> listTeam() {
		Connection con = null;
		PreparedStatement pstmt = null;
		// select �϶� ���̺� ��Ű��(����), ���ڵ� ����)
		ResultSet rs = null;
		String sql = null;
		Vector<TeamBean> vlist = new Vector<TeamBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblTeam";
			pstmt = con.prepareStatement(sql);
			// ���� sql���� ? �� ����. �ٷ� ����
			rs = pstmt.executeQuery();// select ����
			while (rs.next()) {
				// ���̺��� ������ ������ ��� ����
				TeamBean bean = new TeamBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setCity(rs.getString("city"));
				bean.setAge(rs.getInt("age"));
				bean.setTeam(rs.getString("team"));
				// ��� Vector ����
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// con �ݳ�, pstmt, rs�� close
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	// ���ڵ� �Ѱ� ��������
	public TeamBean readTeam(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		TeamBean bean = new TeamBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblTeam where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();// select
			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCity(rs.getString(3));
				bean.setAge(rs.getInt(4));
				bean.setTeam(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// ���� : update tblTeam set name=?, city=?,
	// age=?, team=? where num=?
	public boolean updateTeam(TeamBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "update tblTeam set name=?,city=?," + "age=?,team=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getCity());
			pstmt.setInt(3, bean.getAge());
			pstmt.setString(4, bean.getTeam());
			pstmt.setInt(5, bean.getNum());
			// ����->����� ���ڵ� ����
			int cnt = pstmt.executeUpdate();
			if (cnt == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// ���� : delete from tblTeam where num=?
	public void deleteTeam(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "delete from tblTeam where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// ������� �ִ� �޼ҵ� �ݵ�� ��ȯ �ʿ�� ����.
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	//teamNameList
	public String[] readTeamName() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String[] list = null;
		try {
			con = pool.getConnection();
			sql = "select count(distinct team) from tblTeam";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				list = new String[rs.getInt(1)];
			rs.close();
			pstmt.close();
			sql = "select distinct team from tblTeam";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			for(int i=0;rs.next();i++) {
				list[i] = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	public String[] readTeamName2() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int i = 0;
		String[] teamN = null;
		try {
			con = pool.getConnection();
			sql = "select distinct team from tblTeam";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				i++;
			}
			teamN = new String[i];
			i = 0;
			rs.beforeFirst(); // rs cursor ù�� ������ �ٽ� �̵�
			while (rs.next()) {
				teamN[i] = rs.getString(1);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return teamN;
	}
	
}






