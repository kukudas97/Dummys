package kr.or.dummys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/createdummys.do")
	public String createDummys() {
		return "TaeWoo/createdummy";
	}
}
