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

import kr.or.dummys.dto.Dummy_data;
import kr.or.dummys.dto.Random_form;
import kr.or.dummys.dto.Type;
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
	
	@PostMapping("/listDetail.do")
	public ResponseEntity<Map<String, Object>> listDetail(@RequestBody int type_no){
		
		System.out.println("listDetail.do");
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			List<Dummy_data> listDetail_result = typeservice.listDetail(type_no);
			Type type = typeservice.getTypeType_no(type_no);
			
			if(type.getProcess_no() == 1) {
				Random_form random_form = typeservice.randomFormType_no(type_no);
				map.put("random_form", random_form);
			}
			
			map.put("list",  listDetail_result);
			map.put("type", type);
			map.put("result", "success");
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
	}
}
