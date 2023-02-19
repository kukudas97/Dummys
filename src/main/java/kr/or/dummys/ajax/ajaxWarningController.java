package kr.or.dummys.ajax;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.dummys.dto.Warning;
import kr.or.dummys.service.warning.WarningService;

@RestController
@RequestMapping("/warning/*")
public class ajaxWarningController{
	
	@Autowired
	WarningService warningService;
	
	@PostMapping(value="reportWarning.do")
	public String reportWarning(Warning warning, Principal principal) {
		System.out.println("warning 컨트롤러 탔다");
		System.out.println(warning.toString());
		String url = null;
		System.out.println("신고 하는 사람 : "+ principal.getName());
		try {
			System.out.println("reportWarning 트라이문 탔다");
			url = warningService.reportWarning(warning, principal);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}
	
	

}
