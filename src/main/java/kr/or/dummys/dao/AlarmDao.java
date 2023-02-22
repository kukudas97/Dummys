package kr.or.dummys.dao;

import java.util.List;

import kr.or.dummys.dto.Alarm;

public interface AlarmDao {
	
	//알람 추가
	public int insertAlarm(Alarm alarm);
	
	//알람 삭제
	public int deleteAlarm(int alarm_no);
	
	//알람 확인여부
	public int updateDate(int alarm_no);
	
	//알람 리스트
	public List<Alarm> listAlarm(String userid);
	
	//안읽은 알람 카운트
	public int countAlarm(String userid);
	
	//읽은 알람 삭제
	public int deleteAllAlarm(String userid);
}
