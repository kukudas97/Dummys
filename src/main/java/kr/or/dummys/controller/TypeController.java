package kr.or.dummys.controller;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.dummys.dto.Random_form;
import kr.or.dummys.dto.Type;
import kr.or.dummys.service.type.TypeService;

@Controller
@RequestMapping("/type/*")
public class TypeController {
	
	@Autowired
	private TypeService typeservice;
	
	//타입 리스트로 이동
	@GetMapping("/typelist.do")
	public String listTypes(Model model, Principal principal) {
		
		String userid = principal.getName();
		
		List<Type> typelist = typeservice.getTypeUserId(userid);
		
		model.addAttribute("typelist", typelist);
		
		return "type/typeList";
	}
	
	//타입 생성 사이트
	@GetMapping("/typecreate.do")
	public String createType() {
		return "type/typeCreate";
	}
	
	@PostMapping("/typecreate.do")
	public String insertType(@RequestParam("file") MultipartFile file, @RequestParam("title") String title,
				@RequestParam("reason") String reason, @RequestParam("process_no")int process_no, @RequestParam(value = "random", required = false) String random_word_form,
			@RequestParam("type_open")int type_open, Principal principal, HttpServletRequest request) {
		
		String result ="";
		//권한가져오기
		String userid = principal.getName();
		
		Type type = new Type();
		
		type.setType_name(title);
		type.setProcess_no(process_no);
		type.setType_reason(reason);
		type.setType_open(type_open);
		if(userid != null && !userid.equals("")) {
			type.setUserid(userid);
		}else {
			result = "redirect:/error";
		}
		
		type.setType_category(request.isUserInRole("ROLE_ADMIN")? 0 : 1);
		File f = new File(file.getOriginalFilename());
		List<String> dummy= new ArrayList<String>();
		Scanner sc = null;
		try {
			file.transferTo(f);
			sc = new Scanner(f);
			
			while(sc.hasNextLine()) {
				String str =sc.nextLine();
				if(!str.equals("")) {
					dummy.add(str);
				}
			}
		} catch (Exception e) {
			
		}
		
		if(random_word_form == null) {
			random_word_form = "지정하지 않았습니다.";
		}else if(random_word_form != null && random_word_form.equals("")) {
			random_word_form = "지정하지 않았습니다.";
		}
		
		try {
			
			int insert =
					(process_no != 1)? 
					typeservice.insertDummy(type, dummy) : 
					typeservice.insertRandom(type, random_word_form, dummy);
			
			if(insert >= 1) {
				result = "redirect:/type/typelist.do";
			}else {
				result = "redirect:/error";
			}
			sc.close();
		} catch (Exception e) {
			e.printStackTrace();
			result = "redirect:/error";
		}
				
		return result;
	}
	
	@GetMapping("/typeupdate.do")
	public String typeUpdate(Model model, @RequestParam("type_no")int type_no) {
		
		Type type = new Type();
		
		type = typeservice.getTypeType_no(type_no);
		
		model.addAttribute(type);
		
		return "type/typeUpdate";
	}
	
	@PostMapping("/typeupdate.do")
	public String typeUpdateGo(@RequestParam("file") MultipartFile file, @RequestParam("title") String title,
			@RequestParam("reason") String reason, @RequestParam("seq") int seq) {
		String result = "";
		Type type = new Type();
		
		type.setType_name(title);
		type.setType_reason(reason);
		type.setType_no(seq);
		
		File f = new File(file.getOriginalFilename());
		List<String> dummy= new ArrayList<String>();
		try {
			file.transferTo(f);
			Scanner sc = new Scanner(f);
			
			while(sc.hasNextLine()) {
				String str =sc.nextLine();
				dummy.add(str);
			}
			
			int insert = typeservice.updateDummy(type, dummy) ;
			
			if(insert >= 1) {
				result = "redirect:/type/typelist.do";
			}else {
				result = "redirect:/utils/error";
			}
			sc.close();
		} catch (Exception e) {
			e.printStackTrace();
			result = "redirect:/utils/error";
		}
		
		return result;
	}
}
