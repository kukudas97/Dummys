package kr.or.dummys.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dummys.dto.Board;
import kr.or.dummys.service.user.UserService;



@Controller
@RequestMapping("/users/*")
public class UsersController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	//로그인 처리화면

	@GetMapping("/login.do")
	public String login() {

		return "users/login";
	}
	
	/*
	@PostMapping("/login.do")
	public String loginOK(@RequestParam("password") String rawPassword, Principal pri) {
		String viewpage = "";
		System.out.println(rawPassword);
		
		//회원정보
		Users user = userService.getUser(pri.getName());
		
		String encodedPassword = user.getPassword();
		
		boolean result = bCryptPasswordEncoder.matches(rawPassword, encodedPassword);
		
		if(result) {
			viewpage = "redirect:index.do";
		}else {
			viewpage = "redirect:join.do";
		}
		
		return viewpage;
	}
	*/
	

	
	@GetMapping("/forgetPassword.do")
	public String forgetPassword() {

		return "users/forgetPassword";
	}
	
	//지가 쓴 게시글 , 댓글 단 게시글 목록 (mypage)
	@GetMapping("/mypage.do")
	public String mypage(Principal principal, Model model) {
		Map<String, Object> mypageMap = userService.myBoardList(principal.getName());
		
		model.addAttribute("myBoardList", mypageMap.get("myBoardList"));
		model.addAttribute("myReplyBoardList", mypageMap.get("myReplyBoardList"));
		return "users/mypage";
	}


}
