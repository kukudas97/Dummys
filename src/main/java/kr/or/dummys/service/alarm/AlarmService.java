package kr.or.dummys.service.alarm;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.AlarmDao;
import kr.or.dummys.dao.BoardDao;
import kr.or.dummys.dao.ReplyDao;
import kr.or.dummys.dto.Alarm;

@Service
public class AlarmService {
	
	@Autowired
	private SqlSession sqlsession;
	
	//알람 추가
	public int insertAlarm(Alarm alarm) {
		
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		int result = alarmdao.insertAlarm(alarm);
		
		return result;
	};
	
	//알람 삭제
	public int deleteAlarm(int alarm_no) {
		
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		int result = alarmdao.deleteAlarm(alarm_no);
		
		return result;
	};
	
	//알람 확인여부
	public int updateDate(int alarm_no) {
		
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		int result = alarmdao.updateDate(alarm_no);
		
		return result;
	};
	
	//알람 리스트
	public List<Alarm> listAlarm(String userid){
		
		List<Alarm> listAlarm = new ArrayList<Alarm>();
		
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		listAlarm = alarmdao.listAlarm(userid);

		ReplyDao replydao = sqlsession.getMapper(ReplyDao.class);
		for(Alarm a : listAlarm) {
			if(a.getAlarm_type().equals("댓글")) {
				a.setAlarm_type_no(replydao.getReply(a.getAlarm_type_no()).getBoard_no());
			}
		}
		
		return listAlarm;
	};
	
	//안읽은 알람 카운트
	public int countAlarm(String userid) {
		
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		int result = alarmdao.countAlarm(userid);
		
		return result;
	};
	
	//읽은 알람 삭제
	public int deleteAllAlarm(String userid) {
		
		AlarmDao alarmdao = sqlsession.getMapper(AlarmDao.class);
		int result = alarmdao.deleteAllAlarm(userid);
		
		return result;
	};
}
