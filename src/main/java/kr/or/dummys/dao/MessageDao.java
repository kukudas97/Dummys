package kr.or.dummys.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.dummys.dto.Board;
import kr.or.dummys.dto.Message;

public interface MessageDao {
	
	//메세지 입력
	int messageWrite(Message message) throws ClassNotFoundException, SQLException;
	
	//보낸 메세지 목록 불러오기
	public List<Message> myMessagesendList(String userid);

	//받은 메세지 목록 불러오기
	public List<Message> myMessagereceiveList(String userid);
	
	//메세지 삭제
	int messageDelete(String seq) throws ClassNotFoundException, SQLException;
	
	//DB에 있는 아이디인지 확인
	int idCheck(String userid) throws ClassNotFoundException, SQLException;
	
	//보낸 메세지 지우기
	int sendmessageDelete(int message_no);
	
	//받은 메세지 지우기
	int receivemessageDelete(int message_no);
}
