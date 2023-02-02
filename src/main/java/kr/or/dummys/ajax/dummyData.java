package kr.or.dummys.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.dummys.dao.testDao;
import kr.or.dummys.dto.Col;

@RestController
public class dummyData {
	
//	@GetMapping("")
//	public ResponseEntity<Map<String, Object>> getDummyData(){
//		
//		return null;
//	}
	@PostMapping("dummydata.do")
		public ResponseEntity<Map<String, Object>> test(List<Col> colList){
		System.out.println(colList);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("result",  "안녕"); 
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.BAD_REQUEST);
		}
	}
}
