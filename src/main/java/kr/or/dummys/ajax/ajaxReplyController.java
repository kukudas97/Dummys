package kr.or.dummys.ajax;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.dummys.dto.Reply;
import kr.or.dummys.service.reply.ReplyService;
import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/reply/")
@AllArgsConstructor
public class ajaxReplyController {
	
	@Autowired
	ReplyService replyService;
	
	@GetMapping(value="reply.do")
	
	public ResponseEntity<List<Reply>> replyFunction(@RequestParam(value="pg", required=false, defaultValue="1") String pg,
			@RequestParam(value="ps", required=false, defaultValue="10") String ps, String board_no){
		System.out.println("============================");
		System.out.println(board_no);
		List<Reply> replyList= replyService.replyList(pg, ps, board_no);
		System.out.println(replyList.toString());
		
		return new ResponseEntity<List<Reply>>(replyList, HttpStatus.OK);
	}
	
	
	
	@PostMapping(value="reply.do")
	  public ResponseEntity<Map<String, Object>> registerReply(String board_no, String reply_content, Principal principal) {
		  System.out.println("reply.do 컨트롤러 탔다");
		  System.out.println("principal: " + principal.toString());
		  
		  Map<String, Object> result = new HashMap<String, Object>();
		  
			try {
				result.put("result",replyService.replyRegister(board_no, reply_content, principal.getName()));
			} catch (Exception e) {
				result.put("result","실패");
				e.printStackTrace();
			}
		  
		  return new ResponseEntity<Map<String,Object>>(result, HttpStatus.OK);
	  }
	
	
	@DeleteMapping(value="reply.do")
	public ResponseEntity<Map<String, Object>> deleteReply(@RequestBody int reply_no){
		System.out.println("delet 컨트롤러 탔다: " + reply_no);
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			result.put("result", replyService.replyDelete(reply_no));
		} catch (Exception e) {
			result.put("result", "실패");
			e.printStackTrace();
		}
		return new ResponseEntity<Map<String,Object>>(result, HttpStatus.OK);
	} 
	

}
