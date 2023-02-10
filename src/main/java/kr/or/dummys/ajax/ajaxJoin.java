package kr.or.dummys.ajax;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/join/*")
public class ajaxJoin {
	
	@PostMapping("/mailcheck.do")
	public ResponseEntity<Map<String, Object>> mailcheck(@RequestBody String email){
		
		System.out.println("들어옴");
		System.out.println(email);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		return null;
	}
}
