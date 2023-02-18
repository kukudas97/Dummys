package kr.or.dummys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/message/")
public class MessageController {
	
	//쪽지목록 화면으로 이동
	@GetMapping("message.do")
	public String messagelist() {
		System.out.println("asdfasdfasdf");
		return "messages/message";
	}
	
	//쪽지 보내기 처리
	
	
}
