package kr.or.dummys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TypeController {
	
	//타입 리스트로 이동
	@GetMapping("/typelist.do")
	public String listTypes() {
		return "type/typeList";
	}
	
	//타입 생성 사이트
	@GetMapping("typecreate.do")
	public String createType() {
		return "type/typeCreate";
	}
	
}
