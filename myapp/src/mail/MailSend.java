package mail;

public class MailSend {
	
	//�������� id�� email�� �Է� ������ ������ ������ true ����
	public boolean sendPwd(String id, String email) {
		boolean flag = false;
		MemberMgr mgr = new MemberMgr();
		String pwd = mgr.findPwd(id, email);
		if(pwd!=null&&!pwd.equals("")) {
			String content = "id : " + id  + " / pwd : " + pwd;
			GmailSend.send("000.com���� id�� pwd�� �����մϴ�.", content, email);
			flag = true;
		}
		return flag;
	}
}
