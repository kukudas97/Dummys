package kr.or.dummys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/type/*")
public class TypeController {
	
	//타입 리스트로 이동
	@GetMapping("/typelist.do")
	public String listTypes() {
		return "type/typeList";
	}
	
	//타입 생성 사이트
	@GetMapping("/typecreate.do")
	public String createType() {
		return "type/typeCreate";
	}
	
	@PostMapping("/typecreate.do")
	public String insertType(@RequestParam("file") MultipartFile file, @RequestParam("title") String title) {
		
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); //파일 사이즈
		
		System.out.println(fileRealName);
		System.out.println(title);
		
		return "redirect:/type/typelist.do";
	}
	
}
