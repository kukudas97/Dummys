package kr.or.dummys.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class AlarmController {
	
	@MessageMapping("/{id}")
	@SendTo("/topic/{id}")
    public String myEndpoint() {
        return "home";
    }
	
}