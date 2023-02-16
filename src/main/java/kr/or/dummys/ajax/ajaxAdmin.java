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

import kr.or.dummys.service.admin.AdminService;

@RestController
@RequestMapping("/admin/*")
public class ajaxAdmin {
	
	@Autowired
	public AdminService adminservice;
	
	@PostMapping("/in_user.do")
	public ResponseEntity<Map<String, Object>> inUser(@RequestBody List<String> userid){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			int inuser_result = adminservice.inUser(userid);
			map.put("msg", inuser_result);
			map.put("result", "success");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.BAD_REQUEST);
		}
	}
	
	@PostMapping("/out_user.do")
	public ResponseEntity<Map<String, Object>> outUser(@RequestBody List<String> userid){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			int out_result = adminservice.outUser(userid);
			map.put("msg", out_result);
			map.put("result", "success");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.BAD_REQUEST);
		}
	}
}
