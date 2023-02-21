package kr.or.dummys.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/alarm/*")
public class AlarmController {
	
	@GetMapping("/alarm.do")
    public String myEndpoint() {
        return "Hello, world!";
    }
	
}
