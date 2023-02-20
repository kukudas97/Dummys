package kr.or.dummys.service.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.UserDao;
import kr.or.dummys.dto.Board;
import kr.or.dummys.dto.Users;

@Service
public class UserService {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private JavaMailSender mailSender;

	// user확인
	public Users getUser(String userid) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);

		Users user = userDao.userDetail(userid);

		return user;
	}

	public Map<String, Object> myBoardList(String userid) {
		// service
		Map<String, Object> mypageMap = new HashMap<String, Object>();
		List<Board> myBoardList = null;
		List<Board> myReplyBoardList = null;

		try {
			UserDao userDao = sqlsession.getMapper(UserDao.class);
			myBoardList = userDao.myBoardList(userid);
			myReplyBoardList = userDao.myReplyBoardList(userid);

			mypageMap.put("myBoardList", myBoardList);
			mypageMap.put("myReplyBoardList", myReplyBoardList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mypageMap;
	}

	public int updateLogin_date(String userid) {
		UserDao userdao = sqlsession.getMapper(UserDao.class);
		int result = userdao.updateLogin_date(userid);
		System.out.println(result);
		return result;
	}
	
	//이메일 여부 확인
	public boolean idCheck(String userid) {
		UserDao userdao = sqlsession.getMapper(UserDao.class);
		
		return (userdao.idCheck(userid.replaceAll("\"", "")) >=1)? true : false;
	}
	
	private int authNumber;
	
	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		authNumber = checkNum;
	}
	
	//이메일 보낼 양식! 
	public String joinEmail(String email) {
		
		makeRandomNumber();
		String setFrom = "zlawoghd@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		/* String toMail = email; */
		String title = "Dummy's 비밀번호 재설정을 위한 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"Dummy's를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		mailSend(setFrom, email, title, content);
		return Integer.toString(authNumber);
	}
	
	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//회원 수정
	public int updateUser(Users users) {
		UserDao userdao = sqlsession.getMapper(UserDao.class);
		int result = userdao.updateUser(users);
		return result;
	}
	
	//ROLE_SLEEP여부
	public int selectROLE_SLEEP(String userid) {
		UserDao userdao = sqlsession.getMapper(UserDao.class);
		int result = userdao.selectROLE_SLEEP(userid);
		return result;
	}
	
	//ROLE_SLEEP DELETE
	public int deleteROLE_SLEEP(String userid) {
		UserDao userdao = sqlsession.getMapper(UserDao.class);
		int result = userdao.deleteROLE_SLEEP(userid);
		return result;
	}
}
