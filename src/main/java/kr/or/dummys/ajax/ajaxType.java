package kr.or.dummys.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.dummys.service.type.TypeService;

@RestController
@RequestMapping("type/")
public class ajaxType {
	
	@Autowired
	public TypeService typeservice;
	
	@PostMapping("delteType")
	public ResponseEntity<Map<String, Object>> delteType(@RequestBody List<String> type_no_list){
		
		System.out.println("deleteType");
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		return null;
	}
}
