package kr.or.dummys.utils;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.dummys.dto.Alarm;
import kr.or.dummys.dto.Board;
import kr.or.dummys.dto.Message;
import kr.or.dummys.dto.Reply;
import kr.or.dummys.service.alarm.AlarmService;
import kr.or.dummys.service.board.BoardService;
import kr.or.dummys.service.reply.ReplyService;

@Aspect
@Component
public class AOP {
	@Autowired
	private SimpMessagingTemplate messagingTemplate;
	
	@Autowired
	private AlarmService alarmservice;
	
	@Autowired
	private BoardService boardservice;
	
	@Autowired
	private ReplyService resplyservice;

	@Pointcut("execution(* kr.or.dummys.service.reply.ReplyService.replyRegister(..)) || "
	        + "execution(* kr.or.dummys.service.reply.ReplyService.reReplyRegister(..)) || "
	        + "execution(* kr.or.dummys.service.message.MessageService.messageWrite(..))")
	public void myEndpointExecution() {}

	@AfterReturning(pointcut = "myEndpointExecution()", returning = "result")
	public void afterMyEndpointExecution(JoinPoint joinPoint, Object result) {
	    String methodName = joinPoint.getSignature().getName(); //함수 이름
	    
	    Object[] methodArgs = joinPoint.getArgs(); //파라미터 > 모두다 이걸로 처리해야함
	    /*
	    Class<?> returnType = joinPoint.getSignature().getDeclaringType(); //타입불러오기
	    */
	    String message = "";
	    String userid = "";
	    String sendid = "";
	    String url = "";
	    Alarm alarm = new Alarm();
	    
	    if (methodName.equals("replyRegister")) {
	        String board_no = (String)methodArgs[0];
	        
	        String reply_content = (String)methodArgs[1];
	        
	        Board board = boardservice.boardDetail(board_no);
	        
	        sendid = (String)methodArgs[2];
	        userid = board.getUserid();
	        
	        if(sendid != userid) {
	        	alarm.setUserid(userid);
		        alarm.setAlarm_type("게시판");
		        alarm.setAlarm_type_no(Integer.parseInt(board_no));
		        
		        if(reply_content.length() >= 10) {
		        	alarm.setAlarm_content(reply_content.substring(0, 10) + "...");
		        }else {
		        	alarm.setAlarm_content(reply_content);
		        }
		        
		        message = "\""+board.getBoard_name()+"\""+"게시글에 댓글이 달렸습니다.";
		        url = "/board/boardDetail.do?board_no="+board.getBoard_no();
	        }
	    } else if (methodName.equals("reReplyRegister")) {
	        int reply_no = (int)methodArgs[0];
	        
	        String reReply_content = (String)methodArgs[1];
	        
	        Reply reply = resplyservice.getReply(reply_no);
	        sendid = (String)methodArgs[2]; 
	        userid = reply.getUserid();
	        
	        if(sendid != userid) {
	        	alarm.setUserid(userid);
		        alarm.setAlarm_type("댓글");
		        alarm.setAlarm_type_no(reply_no);
		        
		        if(reReply_content.length() >= 10) {
		        	alarm.setAlarm_content(reReply_content.substring(0, 10) + "...");
		        }else {
		        	alarm.setAlarm_content(reReply_content);
		        }
		        
		        String reply_user = reply.getReply_content();
		        if(reply_user.length() >= 10) {
		        	reply_user = reply_user.substring(0, 10) + "...";
		        }
		    	
		    	message = "\""+reply_user+"\""+"댓글에 대댓글이 달렸습니다.";
		    	url = "/board/boardDetail.do?board_no="+reply.getBoard_no();
	        }
	    } else if (methodName.equals("messageWrite")) {
	        Message messagedto = (Message)methodArgs[0];
	        
	        userid = messagedto.getReceive_id();
	        
	        sendid = messagedto.getSend_id();
	        
	        String message_content = messagedto.getMessage_content(); 
	        if(sendid != userid) {
		        alarm.setUserid(userid);
		        alarm.setAlarm_type("쪽지");
		        alarm.setAlarm_type_no(messagedto.getMessage_no());
		        
		        if(message_content.length() >= 10) {
		        	alarm.setAlarm_content(message_content.substring(0, 10) + "...");
		        }else {
		        	alarm.setAlarm_content(message_content);
		        }
		        
		        message = "\""+sendid+"\""+"님에게 쪽지가 왔습니다.";
		        url = "/message/message.do";
	        }
	    }
	    
	    // service로 DB >> Alarm
		String topic = "/topic/"+userid;
		
		int number = 0;
		try {
			if(!sendid.equals(userid)) {
				number = alarmservice.insertAlarm(alarm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, String> map = new HashMap<String, String>();
		ObjectMapper objectMapper = new ObjectMapper();
		
		
		map.put("message", message);
		map.put("url", url);
		
		String jsonString = "";
		
		try {
			jsonString = objectMapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		
		if(number > 0) {
			messagingTemplate.convertAndSend(topic, jsonString);
		}
	}
}
