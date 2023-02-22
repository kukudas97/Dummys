package kr.or.dummys.utils;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;

import kr.or.dummys.dto.Alarm;

@Aspect
@Component
public class AOP {
	@Autowired
	private SimpMessagingTemplate messagingTemplate;
	
	

	@Pointcut("execution(* kr.or.dummys.service.reply.ReplyService.replyRegister(..)) || "
	        + "execution(* kr.or.dummys.service.reply.ReplyService.reReplyRegister(..)) || "
	        + "execution(* kr.or.dummys.service.message.MessageService.messageWrite(..))")
	public void myEndpointExecution() {}

	@AfterReturning(pointcut = "myEndpointExecution()", returning = "result")
	public void afterMyEndpointExecution(JoinPoint joinPoint, Object result) {
	    String methodName = joinPoint.getSignature().getName(); //함수 이름
	    Object[] methodArgs = joinPoint.getArgs(); //파라미터
	    Class<?> returnType = joinPoint.getSignature().getDeclaringType(); //타입불러오기
	    String message = "";
	    String userid = "mint@mint.com";	    
	    
	    Alarm alarm = null;
	    
	    if (methodName.equals("replyRegister")) {
	        // replyRegister 함수인 경우 처리할 내용
	        System.out.println("Reply registered with return value: " + result);
	        System.out.println("reply : " + Arrays.toString(methodArgs));
	        
	        message = "댓글이 달렸습니다.";
	    } else if (methodName.equals("reReplyRegister")) {
	        // reReplyRegister 함수인 경우 처리할 내용
	        System.out.println("Re-reply registered with return value: " + result);
	        System.out.println("re-reply : " + Arrays.toString(methodArgs));
	        message = "대댓글이 달렸습니다.";
	    } else if (methodName.equals("messageWrite")) {
	        // messageWrite 함수인 경우 처리할 내용
	        System.out.println("Message written with return value: " + result);
	        System.out.println("message : " + Arrays.toString(methodArgs));
	        message = "쪽지가 왔습니다.";
	    }
	    
	    // service로 DB >> Alarm
	    
	    
		String topic = "/topic/"+userid;
		messagingTemplate.convertAndSend(topic, message);
	}
}
