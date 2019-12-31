package jspstudy;

import java.util.Vector;

public class MailSend {
	
	//정상적인 id와 email를 입력 받으면 메일을 보내고 true 리턴
	public boolean sendPwd() {
		boolean flag = false;
		MemberMgr mgr = new MemberMgr();
		Vector<String> vlist = mgr.getEmailList();
		for (int i = 0; i < vlist.size(); i++) {
			String title = "(광고)[JSPStudy] 'IoT 사물인터넷을 위한 라즈베리파이 4 정석'을 소개합니다.";
			String content = "<a href=\"http://www.jspstudy.co.kr\" target=\"_blank\">"
					+ "<img src=\"http://www.jspstudy.co.kr/main/images/jsptitle2.jpg\"></a><p/>";
			content += "<h3>&nbsp;&nbsp;'IoT 사물인터넷을 위한 라즈베리파이 4 정석'을 발간하였습니다.<br/><br/>\r\n" + 
					"					&nbsp;&nbsp;<a href=\"http://www.yes24.com/Product/Goods/83492347?scode=029\" target=\"_blank\">YES24</a>&nbsp;" + 
					"					&nbsp;&nbsp;<a target=\"_blank\" href=\"http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791185553573\">교보문고</a>&nbsp;" + 
					"					&nbsp;&nbsp;<a target=\"_blank\" href=\"http://book.interpark.com/product/BookDisplay.do?_method=detail&sc.shopNo=0000400000&sc.prdNo=321620518&sc.saNo=003002001&bid1=search&bid2=product&bid3=title&bid4=001\">인터파크</a>&nbsp;" + 
					"					&nbsp;&nbsp;<a target=\"_blank\" href=\"https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=217234720\">알라딘</a>&nbsp;" + 
					"					&nbsp;&nbsp;<a target=\"_blank\" href=\"https://book.naver.com/bookdb/book_detail.nhn?bid=15811600\">NAVER책</a>\r\n" + 
					"					</h3>";
			content += "<a href=\"http://www.yes24.com/Product/Goods/83492347?scode=029\" target=\"_blank\">"
					+ "<img src=\"http://www.jspstudy.co.kr/se2/upload/2019_11_21_091636.PNG\">";
			
			String email = vlist.get(i);
			GmailSend.send(title , content, email);
		}
		return flag;
	}
	
	public static void main(String[] args) {
		MailSend mgr = new MailSend();
		mgr.sendPwd();
	}
}
