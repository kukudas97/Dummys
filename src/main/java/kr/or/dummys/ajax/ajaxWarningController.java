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
		String result = null;
		System.out.println("신고 하는 사람 : "+ principal.getName());
		try {
			
			if(warningService.checkWarning(warning, principal).equals("성공")) {
				result = warningService.reportWarning(warning, principal);
			} else {
				result = "already";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(result);
		return result;
	}
	
	

}
