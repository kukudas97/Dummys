package kr.or.dummys.service.message;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.MessageDao;
import kr.or.dummys.dao.UserDao;
import kr.or.dummys.dto.Message;

@Service
public class MessageService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<Message> messageList(){
		
		List<Message> messageList = null;
		
		
		return null;
	}
	
	//DB에 동일한 아이디 있나 확인
	public int idcheck(String id) throws ClassNotFoundException, SQLException {
		System.out.println("aassdd");
		MessageDao messagedao = sqlsession.getMapper(MessageDao.class);
		int cnt = messagedao.idCheck(id);
		System.out.println(id);
		
		return cnt;
	}
	//메세지 쓰기 처리
	public String messageWrite() {
		
		return null;
	}
	
}
