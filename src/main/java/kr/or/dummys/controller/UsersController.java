package kr.or.dummys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.dummys.dto.Users;
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
	
	//error
	@GetMapping("/error.do")
	public String error() {
		return "error";
	}
	
	@GetMapping("/forgetPassword.do")
	public String forgetPassword(Principal principal, Model model) {
		
		if(principal != null) {
			String userid = principal.getName();
			Users user = userService.getUser(userid);
			model.addAttribute("user", user);
		}
		
		return "users/forgetPassword";
	}
	
	@PostMapping("/forgetPassword.do")
	public String returnPassword(Users users, Model model, Principal principal) {
		System.out.println("asdf");
		System.out.println(users);
		/*  
		아이디랑 비밀번호를 찾는거임
		그럼 닉네임도 동일하게 업데이트 할때 넣어줘야하니깐
		해당 유저 아이디로 닉네임을 찾아와서 처리
		*/
		
		users.setUserid(users.getUserid());
		users.setPassword(this.bCryptPasswordEncoder.encode(users.getPassword()));
		users.setNickname(userService.getUser(users.getUserid()).getNickname());
		String go = "";
		int result = userService.updateUser(users);
				
		if(principal != null) {
			int sleep = userService.selectROLE_SLEEP(users.getUserid());
			
			if(sleep >= 1) {
				if(result >= 1) {
					userService.deleteROLE_SLEEP(users.getUserid());
					model.addAttribute("msg","비밀번호 변경이 완료되었습니다.");
		            model.addAttribute("url","/logout");
				}else {
					model.addAttribute("msg","비밀번호 변경에 실패하였습니다.");
					model.addAttribute("url","/index.do");
				}
			}else {
				if(result >= 1) {
					model.addAttribute("msg","비밀번호 변경이 완료되었습니다.");
		            model.addAttribute("url","/logout");
				}else {
					model.addAttribute("msg","비밀번호 변경에 실패하였습니다.");
					model.addAttribute("url","/index.do");
				}
			}
		}else {
			if(result >= 1) {
				model.addAttribute("msg","비밀번호 변경이 완료되었습니다.");
	            model.addAttribute("url","/index.do");
			}else {
				model.addAttribute("msg","비밀번호 변경에 실패하였습니다.");
				model.addAttribute("url","/index.do");
			}
		}
		
		return "/utils/redirect";
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
