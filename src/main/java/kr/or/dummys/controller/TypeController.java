package kr.or.dummys.controller;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.dummys.dto.Dummy_data;
import kr.or.dummys.dto.Type;
import kr.or.dummys.service.type.TypeService;

@Controller
@RequestMapping("/type/*")
public class TypeController {
	
	@Autowired
	private TypeService typeservice;
	
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
	public String insertType(@RequestParam("file") MultipartFile file, @RequestParam("title") String title,@RequestParam("reason") String reason,
			Principal principal, HttpServletRequest request) {
		
		String result ="";
		//권한가져오기
		String process = principal.getName();
		
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); //파일 사이즈
		
		Type type = null;
		type.setType_name(title);
		type.setProcess_no(0);
		type.setType_reason(reason);
		if(process != null && !process.equals("")) {
			type.setUserid(process);
		}else {
			result = "redirect:error";
		}
		
		type.setType_category(request.isUserInRole("ROLE_ADMIN")? 0 : 1);
		
		File f = new File(file.getOriginalFilename());
		List<String> dummy= new ArrayList<String>();
		try {
			file.transferTo(f);
			Scanner sc = new Scanner(f);
			
			while(sc.hasNextLine()) {
				dummy.add(sc.nextLine());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		int insert = typeservice.insert(type, dummy);
		
		if(insert >1) {
			result = "redirect:/type/typelist.do";
		}else {
			result = "redirect:error";
		}
				
		return result;
	}
	
}
