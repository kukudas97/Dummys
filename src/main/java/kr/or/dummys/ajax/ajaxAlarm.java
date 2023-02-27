package kr.or.dummys.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.dummys.dto.Alarm;
import kr.or.dummys.service.alarm.AlarmService;

@RestController
@RequestMapping("/alarm/*")
public class ajaxAlarm {
	
	@Autowired
	private AlarmService alarmservice;
	
	//안읽은 메세지 갯수 확인
	@PostMapping("/count.do")
	public ResponseEntity<Map<String, Object>> count(String userid){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			int count = alarmservice.countAlarm(userid);
			map.put("msg", count);
			map.put("result", "success");
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
	}
	
	//일반 알람삭제
	@PostMapping("/delete.do")
	public ResponseEntity<Map<String, Object>> delete(@RequestBody int alarm_no){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			int result = alarmservice.deleteAlarm(alarm_no);
			map.put("msg", result);
			map.put("result", "success");
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
	}
	
	//알람 확인 여부
	@PostMapping("/update.do")
	public ResponseEntity<Map<String, Object>> update(int alarm_no){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			int result = alarmservice.updateDate(alarm_no);
			map.put("msg", result);
			map.put("result", "success");
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
	}
	
	//전체삭제
	@PostMapping("/deleteAll.do")
	public ResponseEntity<Map<String, Object>> deleteAll(String userid){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			int result = alarmservice.deleteAllAlarm(userid);
			map.put("msg", result);
			map.put("result", "success");
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
	}
	
	//알람 리스트
	@PostMapping("/listAlarm.do")
	public ResponseEntity<Map<String, Object>> listAlarm(String userid){
		
		Map<String, Object> map = new HashMap<String, Object>();
		userid.replaceAll("\"", "");
		try {
			List<Alarm> alarm_list = alarmservice.listAlarm(userid);
			map.put("alarmList", alarm_list);
			map.put("result", "success");
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
	}
}