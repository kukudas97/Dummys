package kr.or.dummys.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dummys.dto.Message;
import kr.or.dummys.service.message.MessageService;

@Controller
@RequestMapping("/message/")
public class MessageController {
	
	@Autowired
	private MessageService messageservice;
	
	//쪽지목록 화면으로 이동
	@GetMapping("message.do")
	public String messagelist(Principal principal, Model model) {
		
		Map<String, Object> mymessageMap = messageservice.myMessageList(principal.getName());
		
		model.addAttribute("myMessagesendList", mymessageMap.get("myMessagesendList"));
		model.addAttribute("myMessagereceiveList", mymessageMap.get("myMessagereceiveList"));
		
		return "messages/message";
	}
	
	//쪽지 보내기 처리
	@PostMapping("message.do")
	public String messageSend(Message message, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		
		int result = 0;
		
		String viewpage="";
		
		result = messageservice.messageWrite(message);
		if(result > 0) {
			if(request.isUserInRole("ROLE_ADMIN")) {
				viewpage = "redirect:/admin/admintendinous.do";
			}else {
				viewpage = "redirect:/message/message.do";
			}
		}
		return viewpage;
	}
	
}
