package kr.or.dummys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.dummys.dto.Tendinous;
import kr.or.dummys.dto.Type;
import kr.or.dummys.dto.Users;
import kr.or.dummys.dto.Warning;
import kr.or.dummys.service.admin.AdminService;
import kr.or.dummys.service.warning.WarningService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService adminservice;
	
	@Autowired
	WarningService warningService;
	
	//차트 페이지로 할 예정
	@GetMapping("/admin.do")
	public String  adminChart(Model model) {
		List<Type> typeList = adminservice.typeList();
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = null;
		try {
			jsonString = mapper.writeValueAsString(typeList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("typeList", typeList);
		model.addAttribute("jsonTypeList", jsonString);
		return "admin/adminChart";
	}
	
	//유저 관리 페이지
	@GetMapping("/adminuser.do")
	public String adminUser(Model model) {
		
		//회원인 유저
		List<Users> listUsers = adminservice.listUsers();
		//탈퇴한 유저
		List<Users> listOutUsers = adminservice.listOutUsers();
		
		model.addAttribute("userlist", listUsers);
		model.addAttribute("outuserlist", listOutUsers);
		
		
		return "admin/adminUser";
	}
	
	//신고자 확인
	 @GetMapping("/adminwarning.do") 
	 public String listWarning(String pg, String f, String q, Model model){
		 System.out.println("adminwarning 컨트롤러 탔다");
		 List<Warning> warningBoardList = warningService.listWarning("게시글", pg, f, q);
		 List<Warning> warningReplyList = warningService.listWarning("댓글", pg, f, q);
		 List<Warning> warningCnt = warningService.getWarningCnt();
		 
		 model.addAttribute("warningBoardList", warningBoardList);
		 model.addAttribute("warningReplyList", warningReplyList);
		 model.addAttribute("warningCnt", warningCnt);
		 
	 return "admin/adminWarning"; 
	 }

	
	//문의사항 확인
	@GetMapping("/admintendinous.do")
	public String adminTendinous(Model model) {
		
		List<Tendinous> listTendinous = adminservice.listTendinous();
		
		model.addAttribute("listTendinous", listTendinous);
		
		return "admin/adminTendinous";
	}
	
	//전체 쪽지 보내기
	@GetMapping("/adminmessage.do")
	public String adminMessage() {
		
		return "admin/adminMessage";
	}
	
	//스키마, 타입 확인 페이지
	@GetMapping("/admindummy.do")
	public String adminDummy() {
		
		return "admin/adminDummy";
	}
}
