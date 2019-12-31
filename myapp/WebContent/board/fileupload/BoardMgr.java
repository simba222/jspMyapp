package board;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import member.MemberBean;
import admin.AdminBean;
import admin.CateBean;
import admin.DBConnectionMgr;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardMgr {

	private DBConnectionMgr pool;
	public final static String LOADFOLDER = "/home/hosting_users/simba0222/www/board/file";
	public final static int MAXSIZE = 10 * 1024 * 1024;// 10MB
	public final static String ENCTYPE = "utf-8";

	public BoardMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void downLoad(HttpServletRequest req, HttpServletResponse res, JspWriter out, PageContext pageContext) {
		try {
			String filename = req.getParameter("filename");
			File file = new File(UtilMgr.con(LOADFOLDER + File.separator + filename));
			byte b[] = new byte[(int) file.length()];
			res.setHeader("Accept-Ranges", "bytes");
			String strClient = req.getHeader("User-Agent");
			if (strClient.indexOf("MSIE6.0") != -1) {

				res.setContentType("application/smnet;charset=euc-kr");
				res.setHeader("Content-Disposition", "filename=" + filename + ";");
			} else {
				res.setContentType("application/smnet;charset=euc-kr");
				res.setHeader("Content-Disposition", "attachment;filename=" + filename + ";");
			}
			out.clear();
			out = pageContext.pushBody();
			if (file.isFile()) {
				BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream outs = new BufferedOutputStream(res.getOutputStream());
				int read = 0;
				while ((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}
				outs.close();
				fin.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean recomInsert(RecommendBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;

		try {
			con = pool.getConnection();
			sql = "insert recommend (m_num,b_num,c_num,c_like,c_dislike,c_declare,b_like,b_dislike,b_declare)" + " values (?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getM_num());
			pstmt.setInt(2, bean.getB_num());
			pstmt.setInt(3, bean.getC_num());
			pstmt.setInt(4, bean.getC_like());
			pstmt.setInt(5, bean.getC_dislike());
			pstmt.setInt(6, bean.getC_declare());
			pstmt.setInt(7, bean.getB_like());
			pstmt.setInt(8, bean.getB_dislike());
			pstmt.setInt(9, bean.getB_declare());	
			if(pstmt.executeUpdate()>0) flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// ��õüũ
	public boolean checkReCom(int c_num, int b_num, int myNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		ResultSet rs = null;	

		try {
			con = pool.getConnection();

			if (c_num > 0) {
				sql = "select re_num from recommend where c_num = ? and m_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, c_num);
				pstmt.setInt(2, myNum);
				rs = pstmt.executeQuery();
				flag =  rs.next();
			} else if (b_num > 0) {
				sql = "select re_num from recommend where b_num = ? and m_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, b_num);
				pstmt.setInt(2, myNum);
				rs = pstmt.executeQuery();
				flag =  rs.next();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// ����Ʈ �ֱ�
	public void updatePoint(int m_num, int check) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		int point = 0;
		if (check == 1)	point = 10;
		if (check == 2)	point = -10;
		if (check == 3)	point = -50;

		try {
			con = pool.getConnection();
			sql = "update _member set point = point+? where m_num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setInt(2, m_num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// ��õ �Ű� �Է�
	public boolean uplikeboard(int b_num, int like, int dislike, int declare) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;		
		
		try {
			con = pool.getConnection();
			sql = "update board set b_like = b_like+?,b_dislike = b_dislike+?,b_declare = b_declare+? where b_num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, like);
			pstmt.setInt(2, dislike);
			pstmt.setInt(3, declare);
			pstmt.setInt(4, b_num);
			if(pstmt.executeUpdate()>0) flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	//로그아웃시 본회원이 했던 추천 신고 정보 삭제
	public void deleteLike(int m_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			con = pool.getConnection();
			sql = "delete from recommend where m_num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, m_num);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// ���Ѽ� ���ϱ�
	public int getTotalCount(String keyField, String keyWord, String b_division1) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int totalCount = 0;

		try {
			con = pool.getConnection();
			if (!(keyField == null || keyField.equals(""))) {
				sql = "select count(b_num) from board where division1 =? and " + keyField + " like  ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, b_division1);
				pstmt.setString(2, "%" + keyWord + "%");
				rs = pstmt.executeQuery();
			} else {
				sql = "select count(b_num) from board where division1 =? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, b_division1);
				rs = pstmt.executeQuery();
			}

			if (rs.next())
				totalCount = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}

	// ī�װ? �ҷ�����
	public Vector<CateBean> getCate() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<CateBean> vlist = new Vector<CateBean>();

		try {
			con = pool.getConnection();
			sql = "select cate from category where etc=1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CateBean bean = new CateBean();
				bean.setCate(rs.getString("cate"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return vlist;
	}

	// �Խ��� ����Ʈ �ѷ��ֱ�
	public Vector<BoardBean> bboardList(int start, int end, String keyField, String keyWord, String b_division1) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();

		try {
			con = pool.getConnection();
			if (keyField.equals(null) || keyField.equals("")) {
				sql = "select * from board where division1 =? order by ref desc,pos limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, b_division1);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				rs = pstmt.executeQuery();
			} else {
				sql = "select * from board where division1 = ? and " + keyField + " like ? order by ref desc,pos limit ?,? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, b_division1);
				pstmt.setString(2, "%" + keyWord + "%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				rs = pstmt.executeQuery();
			}

			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setB_num(rs.getInt(1));
				bean.setM_num(rs.getInt(2));
				bean.setSubject(rs.getString(3));
				bean.setContent(rs.getString(4));
				bean.setPos(rs.getInt(5));
				bean.setRef(rs.getInt(6));
				bean.setDepth(rs.getInt(7));
				bean.setB_regdate(rs.getString(8));
				bean.setB_pass(rs.getString(9));
				bean.setIp(rs.getString(10));
				bean.setCount(rs.getInt(11));
				bean.setFilename(rs.getString(12));
				bean.setFilesize(rs.getInt(13));
				bean.setB_like(rs.getInt(14));
				bean.setB_dislike(rs.getInt(15));
				bean.setB_declare(rs.getInt(16));
				bean.setDivision1(rs.getString(17));
				bean.setDivision2(rs.getString(18));
				bean.setCategory(rs.getString(19));
				bean.setB_nick(rs.getString(20));
				bean.setB_photo(rs.getString(21));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	// �Խ��� �Է�
	/*
	 * public boolean bboardInsert(HttpServletRequest req){ Connection con =
	 * null; PreparedStatement pstmt = null; String sql = null; boolean flag =
	 * false; ResultSet rs = null; String b_filename = null; int b_filesize = 0;
	 * 
	 * try{ con = pool.getConnection();
	 * 
	 * sql = "select MAX(b_num) from board "; pstmt = con.prepareStatement(sql);
	 * rs = pstmt.executeQuery(); int ref = 1; if(rs.next()) ref =
	 * rs.getInt(1)+1;
	 * 
	 * MultipartRequest multi = new MultipartRequest(req, LOADFOLDER, MAXSIZE,
	 * ENCTYPE, new DefaultFileRenamePolicy());
	 * 
	 * if(multi.getFilesystemName("b_filename")!=null){ b_filename =
	 * multi.getFilesystemName("b_filename"); b_filesize
	 * =(int)multi.getFile("b_filename").length(); }
	 * 
	 * 
	 * sql =
	 * "insert board (m_num,subject,content,pos,ref,depth,b_regdate,b_pass,ip,"
	 * + "count,filename,filesize,division1,category,b_nick) values " +
	 * "(?,?,?,0,?,0,now(),?,?,0,?,?,?,?,?)"; pstmt = con.prepareStatement(sql);
	 * pstmt.setInt(1, Integer.parseInt(multi.getParameter("m_num")));
	 * pstmt.setString(2, multi.getParameter("b_subject")); pstmt.setString(3,
	 * multi.getParameter("b_content")); pstmt.setInt(4, ref);
	 * pstmt.setString(5, multi.getParameter("b_pass")); pstmt.setString(6,
	 * multi.getParameter("b_ip")); pstmt.setString(7, b_filename);
	 * pstmt.setInt(8, b_filesize); pstmt.setString(9,
	 * multi.getParameter("b_division1")); pstmt.setString(10,
	 * multi.getParameter("b_category"));
	 * pstmt.setString(11,multi.getParameter("nick"));
	 * 
	 * if(pstmt.executeUpdate()==1) flag = true;
	 * 
	 * if(flag){ sql = "update member set point = point + 10 where m_num = ? ";
	 * pstmt = con.prepareStatement(sql); pstmt.setInt(1,
	 * Integer.parseInt(multi.getParameter("m_num"))); pstmt.executeUpdate(); }
	 * 
	 * }catch (Exception e){ e.printStackTrace(); }finally{
	 * pool.freeConnection(con,pstmt); } return flag; }
	 */
	public BoardBean bboardInsert(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		ResultSet rs = null;
		String b_filename = null;
		int b_filesize = 0;
		BoardBean bean = new BoardBean();

		try {
			con = pool.getConnection();

			sql = "select MAX(b_num) from board ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ref = 1;
			if (rs.next())
				ref = rs.getInt(1) + 1;

			MultipartRequest multi = new MultipartRequest(req, LOADFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());

			if (multi.getFilesystemName("b_filename") != null) {
				b_filename = multi.getFilesystemName("b_filename");
				b_filesize = (int) multi.getFile("b_filename").length();
			}

			sql = "insert board (m_num,subject,content,pos,ref,depth,b_regdate,b_pass,ip," 
					+ "count,filename,filesize,b_like,b_dislike,b_declare,division1,category,b_nick) values "
					+ "(?,?,?,0,?,0,now(),?,?,0,?,?,0,0,0,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(multi.getParameter("m_num")));
			pstmt.setString(2, multi.getParameter("b_subject"));
			pstmt.setString(3, multi.getParameter("b_content"));
			pstmt.setInt(4, ref);
			pstmt.setString(5, multi.getParameter("b_pass"));
			pstmt.setString(6, multi.getParameter("b_ip"));
			pstmt.setString(7, b_filename);
			pstmt.setInt(8, b_filesize);
			pstmt.setString(9, multi.getParameter("b_division1"));
			pstmt.setString(10, multi.getParameter("b_category"));
			pstmt.setString(11, multi.getParameter("nick"));

			if (pstmt.executeUpdate() == 1)
				flag = true;

			if (flag) {
				sql = "update _member set point = point + 10 where m_num = ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(multi.getParameter("m_num")));
				pstmt.executeUpdate();
			}

			sql = "select division1,category from board where ref = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setDivision1(rs.getString("division1"));
				bean.setCategory(rs.getString("category"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return bean;
	}

	// ��ȸ��
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update board set count = count+1 where b_num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// �Խ��� �б�
	public BoardBean readBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "select * from board where b_num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setB_num(rs.getInt(1));
				bean.setM_num(rs.getInt(2));
				bean.setSubject(rs.getString(3));
				bean.setContent(rs.getString(4));
				bean.setPos(rs.getInt(5));
				bean.setRef(rs.getInt(6));
				bean.setDepth(rs.getInt(7));
				bean.setB_regdate(rs.getString(8));
				bean.setB_pass(rs.getString(9));
				bean.setIp(rs.getString(10));
				bean.setCount(rs.getInt(11));
				bean.setFilename(rs.getString(12));
				bean.setFilesize(rs.getInt(13));
				bean.setB_like(rs.getInt(14));
				bean.setB_dislike(rs.getInt(15));
				bean.setB_declare(rs.getInt(16));
				bean.setDivision1(rs.getString(17));
				bean.setDivision2(rs.getString(18));
				bean.setCategory(rs.getString(19));
				bean.setB_nick(rs.getString(20));
				bean.setB_photo(rs.getString(21));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// �Խ��� ����
	public boolean bBoardUpdate(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		Boolean flag = false;
		MultipartRequest multi = null;
		int filesize = 0;
		String filename = null;

		try {
			con = pool.getConnection();

			File file = new File(LOADFOLDER);
			if (!file.exists())
				file.mkdirs();

			multi = new MultipartRequest(req, LOADFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			if (multi.getFilesystemName("b_filename") != null) {
				filename = multi.getFilesystemName("b_filename");
				filesize = (int) multi.getFile("b_filename").length();
			} else if (multi.getFilesystemName("b_filename") == null & multi.getParameter("filename2") != null) {
				filename = multi.getParameter("filename2");
				filesize = Integer.parseInt(multi.getParameter("filesize2"));
			}

			sql = "update board set subject = ?, content = ?, filename = ?, filesize = ?, b_regdate = now() where b_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("b_subject"));
			pstmt.setString(2, multi.getParameter("b_content"));
			pstmt.setString(3, filename);
			pstmt.setInt(4, filesize);
			pstmt.setInt(5, Integer.parseInt(multi.getParameter("b_num")));

			if (pstmt.executeUpdate() > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// �Խ��� ����
	public boolean delBboard(int b_num, String b_filename) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;

		try {

			if (b_filename != null && !b_filename.equals("")) {
				String f = LOADFOLDER + File.separator + b_filename;
				File file = new File(f);
				if (file.exists()) {
					UtilMgr.delete(f);
				}
			}

			con = pool.getConnection();
			sql = "delete from board where b_num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			if (pstmt.executeUpdate() > 0)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// ���Ë� ���� �ֱ�
	public void replyUpBoard(int pos, int ref) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			con = pool.getConnection();
			sql = "update board set pos = pos+1 where ref =? and pos > ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// ���� ����
	public boolean replyBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		MultipartRequest multi = null;
		String filename = null;
		int filesize = 0;
		boolean flag = false;

		try {
			con = pool.getConnection();

			multi = new MultipartRequest(req, LOADFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());

			if (multi.getFilesystemName("b_filename") != null) {
				filename = multi.getFilesystemName("b_filename");
				filesize = (int) multi.getFile("b_filename").length();
			}

			sql = "insert board (m_num,subject,content,pos,ref,depth,b_regdate,b_pass,ip," + "count,filename,filesize,division1,category,b_nick) values "
					+ "(?,?,?,?,?,?,now(),?,?,0,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(multi.getParameter("m_num")));
			pstmt.setString(2, multi.getParameter("b_subject"));
			pstmt.setString(3, multi.getParameter("b_content"));
			pstmt.setInt(4, Integer.parseInt(multi.getParameter("b_pos")) + 1);
			pstmt.setInt(5, Integer.parseInt(multi.getParameter("b_ref")));
			pstmt.setInt(6, Integer.parseInt(multi.getParameter("b_depth")) + 1);
			pstmt.setString(7, multi.getParameter("b_pass"));
			pstmt.setString(8, multi.getParameter("b_ip"));
			pstmt.setString(9, filename);
			pstmt.setInt(10, filesize);
			pstmt.setString(11, multi.getParameter("b_division1"));
			pstmt.setString(12, multi.getParameter("b_category"));
			pstmt.setString(13, multi.getParameter("nick"));

			if (pstmt.executeUpdate() > 0)
				flag = true;

			if (flag) {
				sql = "update _member set point = point + 10 where m_num = ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(multi.getParameter("m_num")));
				pstmt.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	// ��¥ �޾ƿͼ� '-' ��ְ� ���� ��¥�� ���� �Ϸ����� ���� false��ȯ
	public boolean getNew(String writeDate) {

		boolean flag = false;
		String writeDate1 = writeDate.trim();
		String writeDate2 = writeDate1.replace("-", "");
		int writeDate3 = Integer.parseInt(writeDate2);

		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format(currentTime);
		int today = Integer.parseInt(mTime);
		int delDay = today - writeDate3;

		if (delDay == 1) {
			flag = true;
		} else if (delDay < 2) {
			flag = true;
		} else {
			flag = false;
		}
		return flag;
	}

	// ù������ ����Ʈ ���
	// �Խ��� ����Ʈ �ѷ��ֱ�
	public Vector<BoardBean> qboardList(int start, int end, String keyField, String keyWord, String b_division1) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();

		try {
			con = pool.getConnection();
			if (keyField.equals(null) || keyField.equals("")) {
				sql = "select * from board where division1 =? order by count desc,pos limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, b_division1);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				rs = pstmt.executeQuery();
			} else {
				sql = "select * from board where division1 = ? and " + keyField + " like ? order by count desc,pos limit ?,? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, b_division1);
				pstmt.setString(2, "%" + keyWord + "%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				rs = pstmt.executeQuery();
			}

			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setB_num(rs.getInt(1));
				bean.setM_num(rs.getInt(2));
				bean.setSubject(rs.getString(3));
				bean.setContent(rs.getString(4));
				bean.setPos(rs.getInt(5));
				bean.setRef(rs.getInt(6));
				bean.setDepth(rs.getInt(7));
				bean.setB_regdate(rs.getString(8));
				bean.setB_pass(rs.getString(9));
				bean.setIp(rs.getString(10));
				bean.setCount(rs.getInt(11));
				bean.setFilename(rs.getString(12));
				bean.setFilesize(rs.getInt(13));
				bean.setB_like(rs.getInt(14));
				bean.setB_dislike(rs.getInt(15));
				bean.setB_declare(rs.getInt(16));
				bean.setDivision1(rs.getString(17));
				bean.setDivision2(rs.getString(18));
				bean.setCategory(rs.getString(19));
				bean.setB_nick(rs.getString(20));
				bean.setB_photo(rs.getString(21));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	// �ֱ� �Խù� ����Ʈ ��������
	public Vector<BoardBean> newboardList(int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();

		try {
			con = pool.getConnection();
			sql = "SELECT * FROM board " + "WHERE date(b_regdate) = date(now()) " + "ORDER BY b_num ASC limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setB_num(rs.getInt(1));
				bean.setM_num(rs.getInt(2));
				bean.setSubject(rs.getString(3));
				bean.setContent(rs.getString(4));
				bean.setPos(rs.getInt(5));
				bean.setRef(rs.getInt(6));
				bean.setDepth(rs.getInt(7));
				bean.setB_regdate(rs.getString(8));
				bean.setB_pass(rs.getString(9));
				bean.setIp(rs.getString(10));
				bean.setCount(rs.getInt(11));
				bean.setFilename(rs.getString(12));
				bean.setFilesize(rs.getInt(13));
				bean.setB_like(rs.getInt(14));
				bean.setB_dislike(rs.getInt(15));
				bean.setB_declare(rs.getInt(16));
				bean.setDivision1(rs.getString(17));
				bean.setDivision2(rs.getString(18));
				bean.setCategory(rs.getString(19));
				bean.setB_nick(rs.getString(20));
				bean.setB_photo(rs.getString(21));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	public int newTotalCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int totalCount = 0;

		try {
			con = pool.getConnection();
			sql = "SELECT count(b_num) FROM board " + "WHERE date(b_regdate) = date(now()) " + "ORDER BY b_num ASC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next())
				totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	//맴버페이지 관련
	public int getmyTotalCount(int m_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int totalCount = 0;

		try {
			con = pool.getConnection();
			
				sql = "select count(b_num) from board where m_num =? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, m_num);
				rs = pstmt.executeQuery();
			
			if (rs.next())
				totalCount = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	public Vector<BoardBean> myboardList(int start, int end, int m_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>();

		try {
			con = pool.getConnection();
			
				sql = "select * from board where m_num = ? order by ref desc,pos limit ?,? ";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, m_num);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardBean mybean = new BoardBean();
				mybean.setB_num(rs.getInt(1));
				mybean.setM_num(rs.getInt(2));
				mybean.setSubject(rs.getString(3));
				mybean.setContent(rs.getString(4));
				mybean.setPos(rs.getInt(5));
				mybean.setRef(rs.getInt(6));
				mybean.setDepth(rs.getInt(7));
				mybean.setB_regdate(rs.getString(8));
				mybean.setB_pass(rs.getString(9));
				mybean.setIp(rs.getString(10));
				mybean.setCount(rs.getInt(11));
				mybean.setFilename(rs.getString(12));
				mybean.setFilesize(rs.getInt(13));
				mybean.setB_like(rs.getInt(14));
				mybean.setB_dislike(rs.getInt(15));
				mybean.setB_declare(rs.getInt(16));
				mybean.setDivision1(rs.getString(17));
				mybean.setDivision2(rs.getString(18));
				mybean.setCategory(rs.getString(19));
				mybean.setB_nick(rs.getString(20));
				mybean.setB_photo(rs.getString(21));
				vlist.add(mybean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public void myupCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update board set count = count+1 where b_num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	public BoardBean myreadBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		BoardBean mybean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "select * from board where b_num = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mybean.setB_num(rs.getInt(1));
				mybean.setM_num(rs.getInt(2));
				mybean.setSubject(rs.getString(3));
				mybean.setContent(rs.getString(4));
				mybean.setPos(rs.getInt(5));
				mybean.setRef(rs.getInt(6));
				mybean.setDepth(rs.getInt(7));
				mybean.setB_regdate(rs.getString(8));
				mybean.setB_pass(rs.getString(9));
				mybean.setIp(rs.getString(10));
				mybean.setCount(rs.getInt(11));
				mybean.setFilename(rs.getString(12));
				mybean.setFilesize(rs.getInt(13));
				mybean.setB_like(rs.getInt(14));
				mybean.setB_dislike(rs.getInt(15));
				mybean.setB_declare(rs.getInt(16));
				mybean.setDivision1(rs.getString(17));
				mybean.setDivision2(rs.getString(18));
				mybean.setCategory(rs.getString(19));
				mybean.setB_nick(rs.getString(20));
				mybean.setB_photo(rs.getString(21));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return mybean;
	}

	
}
