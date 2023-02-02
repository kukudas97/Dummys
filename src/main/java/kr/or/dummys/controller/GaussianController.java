package kr.or.dummys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gaussian/")
public class GaussianController {

	@GetMapping("gaussianList.do")
	public String gaussianList() {
		return "gaussian/gaussianList";
	}
	@GetMapping("gaussianCreate.do")
	public String gaussianCreate() {
		return "gaussian/gaussianCreate";
	}
}
