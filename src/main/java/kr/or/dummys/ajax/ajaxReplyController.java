package kr.or.dummys.ajax;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.dummys.dto.Board;
import kr.or.dummys.dto.Reply;
import kr.or.dummys.service.reply.ReplyService;

@RestController
@RequestMapping("/reply/")
public class ajaxReplyController {
	
	@Autowired
	ReplyService replyService;
	
	@GetMapping(value="reply.do")
	public ResponseEntity<List<Reply>> replyFunction(@RequestParam(value="pg", required=false, defaultValue="1") String pg,
			@RequestParam(value="ps", required=false, defaultValue="1") String ps, String board_no){
		System.out.println("============================");
		System.out.println(board_no);
		List<Reply> replyList= replyService.replyList(pg, ps, board_no);
		System.out.println(replyList.toString());
		return new ResponseEntity<List<Reply>>(replyList, HttpStatus.OK);
	}
	
	
	
	@PostMapping(value="reply.do")
	  public String boardWrite(Board board, HttpServletRequest request, Principal principal) {
		  System.out.println("reply.do 컨트롤러 탔다");
		  String url = null;
		  System.out.println("principal: " + principal.toString());
			try {
				//url = replyService.boardWrite(board, request, principal);
				System.out.println("url: " + url);
			} catch (Exception e) {
				e.printStackTrace();
			}
		  
		  return url;
	  }

}
