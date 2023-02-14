package kr.or.dummys.ajax;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.dummys.service.user.JoinService;

@RestController
@RequestMapping("/join/*")
public class ajaxJoin {
	
	@Autowired
	private JoinService joinservice;
	
	@PostMapping("/mailcheck.do")
	public ResponseEntity<Map<String, Object>> mailcheck(@RequestBody String email){
		
		Map<String, Object> map = new HashMap<String, Object>();
		String authnumber = null;
		
		try {
			if(joinservice.idCheck(email) && !email.equals("\"\"") && email != null) {
				authnumber = joinservice.joinEmail(email);
				map.put("authnumber", authnumber);
				map.put("result", "success");
				
				return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
			}else {
				return new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
		
	}
}
