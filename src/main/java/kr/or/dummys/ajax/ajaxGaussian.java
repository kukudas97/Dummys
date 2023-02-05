package kr.or.dummys.ajax;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.dummys.dto.GaussianCreate;
import kr.or.dummys.service.gaussian.GaussianService;

@RestController
@RequestMapping("gaussian/")
public class ajaxGaussian {
	
	@Autowired
	private GaussianService service;
	
	@PostMapping("saveGaussian.do")
	public ResponseEntity<Map<String, Object>> createDatas(@RequestBody GaussianCreate data, Principal pri){
		System.out.println("saveGaussian.do 컨트롤러");
		Map<String, Object> map = new HashMap<String, Object>();

		//로그인 안되어있으면 실패처리 
		if(pri == null) {
			map.put("result","login_error");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.BAD_REQUEST);
		} else {
			data.getGaussian().setUserid(pri.getName());
		}
		
		
		// 서비스 불러서 처리하고...
		try {
//			service.insertGaussian(data);
			map.put("result","result");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		} catch (Exception e) {
			map.put("result","result");
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.BAD_REQUEST);
			
		}
	}
}
