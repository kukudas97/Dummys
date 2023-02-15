package kr.or.dummys.ajax;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.dummys.dto.Col;
import kr.or.dummys.dto.Type;
import kr.or.dummys.dto.CreateData;
import kr.or.dummys.dto.Schema;
import kr.or.dummys.service.schema.SchemaService;
import kr.or.dummys.service.type.TypeService;

@RestController
@RequestMapping("schema/")
public class ajaxDummyData {
	
	@Autowired
	private SchemaService service;
	
	@Autowired
	private TypeService typeService;
	
	@PostMapping("createData.do")
	public ResponseEntity<Map<String, Object>> createDatas(@RequestBody CreateData data){
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			// 서비스로 데이터 생성/가공 하고...
			
			//map에 담아서 return 해주기
			map.put("result",  "안녕"); 
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}
	}
	@PostMapping("saveSchema.do")
	public ResponseEntity<Map<String, Object>> saveDatas(@RequestBody CreateData data, Principal pri){
		Map<String, Object> map = new HashMap<String, Object>();
		if(pri == null) {
			map.put("result","login_error");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}
		
		try {
			// 서비스로 데이터 생성/가공 하고...
			Schema schema = Schema.builder().userid(pri.getName()).schema_name(data.getSchema_name()).schema_content(data.getSchema_content()).schema_password(data.getSchema_password()).build();
			List<Col> list = data.getList();
			
			int serviceResult = service.createSchema(schema, list);
			
			//map에 담아서 return 해주기
			map.put("result",  "success"); 
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result",  "error"); 
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}
	}
	@GetMapping("getTypeList.do")
	public ResponseEntity<Map<String, Object>> getType(@RequestParam("type") String type, @RequestParam("searchKeyword") String searchKeyword, Principal pri){
		Map<String, Object> map = new HashMap<String, Object>();
		
//		if(pri == null) {
//			map.put("result","login_error");
//			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
//		}
		List<Type> list = null;
		try {
			list = typeService.getTypeListBySql(type, searchKeyword, pri);
			map.put("list",list);
			map.put("result","success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result","fail");
		}
		
		return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
	}
}
