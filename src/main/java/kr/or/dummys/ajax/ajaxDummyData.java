package kr.or.dummys.ajax;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.dummys.dto.CreateData;

@RestController
@RequestMapping("schema/")
public class ajaxDummyData {
	
	@PostMapping("createData.do")
	public ResponseEntity<Map<String, Object>> createDatas(@RequestBody CreateData data){
		System.out.println("컨트롤러 들어옴~~~~~~~~~~~~~~");
		System.out.println(data);
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			// 서비스로 데이터 생성/가공 하고...
			
			//map에 담아서 return 해주기
			map.put("result",  "안녕"); 
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.BAD_REQUEST);
		}
	}
	@PostMapping("saveData.do")
	public ResponseEntity<Map<String, Object>> saveDatas(@RequestBody CreateData data){
		System.out.println("컨트롤러 들어옴~~~~~~~~~~~~~~");
		System.out.println(data);
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			// 서비스로 데이터 생성/가공 하고...
			
			//map에 담아서 return 해주기
			map.put("result",  "안녕"); 
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.BAD_REQUEST);
		}
	}
}
