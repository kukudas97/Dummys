package kr.or.dummys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dummys.dto.Users;
import kr.or.dummys.service.admin.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService adminservice;
	
	//차트 페이지로 할 예정
	@GetMapping("/admin.do")
	public String  adminMain() {
		
		return "admin/admin";
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
	public String adminWarning() {
		
		return "admin/adminWarning";
	}
	
	//문의사항 확인
	@GetMapping("/admintendinous.do")
	public String adminTendinous() {
		
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
