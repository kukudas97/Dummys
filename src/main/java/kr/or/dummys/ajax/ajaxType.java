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

import kr.or.dummys.service.type.TypeService;

@RestController
@RequestMapping("/type/*")
public class ajaxType {
	
	@Autowired
	public TypeService typeservice;
	
	@PostMapping("/delete.do")
	public ResponseEntity<Map<String, Object>> delteType(@RequestBody List<Integer> type_no_list){
		
		System.out.println("delete.do");
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			int type_delete_result = typeservice.deleteType(type_no_list);
			map.put("msg", type_delete_result);
			map.put("result", "success");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result","fail");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.BAD_REQUEST);
		}
	}
}
