package kr.or.dummys.service.message;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.BoardDao;
import kr.or.dummys.dao.MessageDao;
import kr.or.dummys.dao.UserDao;
import kr.or.dummys.dto.Message;

@Service
public class MessageService {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	//보내고 받은 메세지 리스트
	public Map<String, Object> myMessageList(String userid){
		
		Map<String, Object> mymessageMap = new HashMap<String, Object>();
		List<Message> myMessagesendList = null;
		List<Message> myMessagereceiveList = null;
		
		try {
			MessageDao messageDao = sqlsession.getMapper(MessageDao.class);
			myMessagesendList=messageDao.myMessagesendList(userid);
			myMessagereceiveList = messageDao.myMessagereceiveList(userid);
			
			mymessageMap.put("myMessagesendList", myMessagesendList);
			mymessageMap.put("myMessagereceiveList", myMessagereceiveList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return mymessageMap;
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
	public int messageWrite(Message message) throws ClassNotFoundException, SQLException {
		
		System.out.println("메세지 처리 서비스다");
		int result = 0;
		MessageDao messagedao = sqlsession.getMapper(MessageDao.class);
		result = messagedao.messageWrite(message);
		return result;
	}
	
	//send값 delete update
	public int sendmessageDelete(int message_no) {
		
		int result =0;
		MessageDao messagedao = sqlsession.getMapper(MessageDao.class);
		result = messagedao.sendmessageDelete(message_no);
		return result;
	}
	
	//receive값 delete update
	public int receivemessageDelete(int message_no) {
		int result =0;
		MessageDao messagedao = sqlsession.getMapper(MessageDao.class);
		result = messagedao.receivemessageDelete(message_no);
		return result;
	}
	
	//message_check update (1로 바뀌면 읽은것)
	public int readStateCheck(int message_no) {
		int result =0;
		MessageDao messagedao = sqlsession.getMapper(MessageDao.class);
		result =messagedao.readStateCheck(message_no);
		return result;
	}
	
}
