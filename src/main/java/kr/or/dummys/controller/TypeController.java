package kr.or.dummys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TypeController {
	
	@GetMapping("/type.do")
	public String createDummys() {
		return "type/typeList";
	}
	
}
