package kr.or.dummys.ajax;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.dummys.service.message.MessageService;

@RequestMapping("/message/")
@RestController
public class ajaxMessage {
	
	@Autowired
	private MessageService messageservice;
	
	@PostMapping("idcheck.do")
	public int idCheck(@RequestParam("receive_id") String receive_id) {
		int cnt=0;
		try {
			cnt = messageservice.idcheck(receive_id);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
		
	}
	
	@PostMapping("sendmessagedelete.do")
	public int sendmessagedelete(@RequestParam("message_no") int message_no) {
		int result=0;
		try {
			result = messageservice.sendmessageDelete(message_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@PostMapping("receivemessagedelete.do")
	public int receivemessagedelete(@RequestParam("message_no") int message_no) {
		int result=0;
		try {
			result = messageservice.receivemessageDelete(message_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@PostMapping("readcheck.do")
	public int rereadStateCheck(@RequestParam("message_no") int message_no) {
		int result = 0;
		try {
			result = messageservice.readStateCheck(message_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}