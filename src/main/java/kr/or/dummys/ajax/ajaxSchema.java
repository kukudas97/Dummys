package kr.or.dummys.ajax;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.dummys.dto.Col;
import kr.or.dummys.dto.CreateData;
import kr.or.dummys.dto.Gaussian;
import kr.or.dummys.dto.Schema;
import kr.or.dummys.dto.Type;
import kr.or.dummys.service.gaussian.GaussianService;
import kr.or.dummys.service.schema.SchemaService;
import kr.or.dummys.service.type.TypeService;
import kr.or.dummys.utils.SchemaDownLoad;

@RestController
@RequestMapping("schema/")
public class ajaxSchema {
	
	@Autowired
	private SchemaService service;
	
	@Autowired
	private TypeService typeService;
	
	@Autowired
	private GaussianService gaussianService;
	
	@PostMapping("schemaDownload.do")
	public ResponseEntity<Resource> createDatas(@RequestBody CreateData data){
		// 서비스로 데이터 생성/가공 하고...
		/*
			List<Map<String,Object>>
			[
				Map<String,Object> - name/list
				{ "name" : "컬럼이름","list" : ["안","녕","하","세","요"] },
				{ "name" : "컬럼이름","list" : ["안","녕","하","세","요"] },
				{ "name" : "컬럼이름","list" : ["안","녕","하","세","요"] },
			]
		*/
		System.out.println(data.getSchema_name());
		List<Map<String,Object>> result = service.getDummyData(data);
		String filename =(data.getSchema_name() != null) ? ((!data.getSchema_name().equals("")) ? data.getSchema_name() : "Schema") : "Schema";
		switch (data.getType()) {
		case 1: filename += ".json"; break;
		case 2: filename += ".csv"; break;
		case 3: filename += ".html"; break;
		case 4: filename += ".sql"; break;
		}
	// =============== txt 파일 생성 ==================
		String content = SchemaDownLoad.download(result,data);
		
		// 1. 텍스트 파일 생성
		byte[] bytes = content.getBytes();
		
		ByteArrayResource resource = new ByteArrayResource(bytes);
		
		// 2. 생성된 파일 다운로드
		HttpHeaders headers = new HttpHeaders();
		headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + filename);
		headers.add(HttpHeaders.CONTENT_TYPE, MediaType.TEXT_PLAIN_VALUE);
		
		return ResponseEntity.ok()
		        .headers(headers)
		        .contentLength(bytes.length)
		        .contentType(MediaType.parseMediaType(MediaType.TEXT_PLAIN_VALUE))
		        .body(resource);
		// =============== ========== ==================
	}
	
	@PostMapping("preview.do")
	public ResponseEntity<Map<String, Object>> preview(@RequestBody CreateData data,HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			// 서비스로 데이터 생성/가공 하고...
			List<Map<String,Object>> result = service.getDummyData(data);
			
			//map에 담아서 return 해주거나 파일로 가공해주기
			map.put("result",  "success"); 
			map.put("list",result);
		} catch (Exception e) {
			map.put("result",  "fail");
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
	}
	// =============== 스키마 저장 ==================
	@PostMapping("saveSchema.do")
	public ResponseEntity<Map<String, Object>> saveDatas(@RequestBody CreateData data, Principal pri){
		Map<String, Object> map = new HashMap<String, Object>();
		if(pri == null) {
			map.put("result","login_error");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}
		
		try {
			// 서비스로 데이터 생성/가공 하고...
			Schema schema = Schema.builder()
					.userid(pri.getName())
					.schema_name((data.getSchema_name().equals("")) ? "스키마" : data.getSchema_name())
					.schema_content((data.getSchema_content().equals("")) ? "스키마 설명" : data.getSchema_content())
					.schema_password(data.getSchema_password())
					.build();
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
	@PutMapping("updateSchema.do")
	public ResponseEntity<Map<String, Object>> updateSchema(@RequestBody CreateData data, Principal pri){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.updateSchema(data);
			map.put("result","success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result","fail");
		}
		
		return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
	}
	@DeleteMapping("deleteSchema.do")
	public ResponseEntity<Map<String, Object>> deleteDatas(@RequestBody List<Integer> list,Principal pri){
		Map<String, Object> map = new HashMap<String, Object>();
		if(pri == null) {
			map.put("result", "login-error");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}
		try {
			service.deleteSchemaList(list);
			map.put("result","success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
	}
	@GetMapping("getGaussianList.do")
	public ResponseEntity<Map<String, Object>> getGaussianList(Principal pri){
		Map<String, Object> map = new HashMap<String, Object>();
		if(pri == null) {
			map.put("result", "login-error");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}
		try {
			List<Gaussian> list =  gaussianService.getGaussianList(pri.getName());
			map.put("gaussianList",list);
			map.put("result","success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
	}
}




//// =============== txt 파일 생성 ==================
//String filename = "test.txt";
//String content = "This is a test file.\n안녕하세요";
//
//// 1. 텍스트 파일 생성
//byte[] bytes = content.getBytes();
//
//
//
//ByteArrayResource resource = new ByteArrayResource(bytes);
//
//// 2. 생성된 파일 다운로드
//HttpHeaders headers = new HttpHeaders();
//headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + filename);
//headers.add(HttpHeaders.CONTENT_TYPE, MediaType.TEXT_PLAIN_VALUE);
//
//return ResponseEntity.ok()
//        .headers(headers)
//        .contentLength(bytes.length)
//        .contentType(MediaType.parseMediaType(MediaType.TEXT_PLAIN_VALUE))
//        .body(resource);
//// =============== ========== ==================
// =============== Excel 파일 생성 ==================
//Workbook workbook = new XSSFWorkbook();
//Sheet sheet = workbook.createSheet("Sheet1");
//Row row1 = sheet.createRow(0);
//Cell cell1_1 = row1.createCell(0);
//cell1_1.setCellValue("1");
//Cell cell1_2 = row1.createCell(1);
//cell1_2.setCellValue("2");
//Cell cell1_3 = row1.createCell(2);
//cell1_3.setCellValue("3");
//
//Row row2 = sheet.createRow(1);
//Cell cell2_1 = row2.createCell(0);
//cell2_1.setCellValue("a");
//Cell cell2_2 = row2.createCell(1);
//cell2_2.setCellValue("b");
//Cell cell2_3 = row2.createCell(2);
//cell2_3.setCellValue("c");
//
//ByteArrayOutputStream bos = new ByteArrayOutputStream();
//workbook.write(bos);
//byte[] bytes = bos.toByteArray();
//ByteArrayResource resource = new ByteArrayResource(bytes);
//
//  // Set response headers
////HttpHeaders headers = new HttpHeaders();
////headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=example.xlsx");
////headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE);
//
//HttpHeaders headers = new HttpHeaders();
//headers.setContentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
//headers.setContentDispositionFormData("attachment", "example.xlsx");
//
//return ResponseEntity.ok()
//        .headers(headers)
//        .contentLength(bytes.length)
//        .contentType(MediaType.parseMediaType(MediaType.APPLICATION_OCTET_STREAM_VALUE))
//        .body(resource);