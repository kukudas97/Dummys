package kr.or.dummys.utils;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class AOP {
	@Autowired
	private SimpMessagingTemplate messagingTemplate;

	@Pointcut("execution(public * kr.or.dummys.controller(..))")
	public void myEndpointExecution() {
		
	}

	@AfterReturning(pointcut = "myEndpointExecution()", returning = "result")
	public void afterMyEndpointExecution(JoinPoint joinPoint, Object result) {
		String topic = "/topic/my-topic";
		String message = "My message: " + result.toString();
		messagingTemplate.convertAndSend(topic, message);
	}
}
