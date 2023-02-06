package kr.or.dummys.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dummys.dto.Gaussian;
import kr.or.dummys.service.gaussian.GaussianService;

@Controller
@RequestMapping("/gaussian/")
public class GaussianController {

	@Autowired
	GaussianService service;
	
	@GetMapping("gaussianList.do")
	public String gaussianList(Model model, Principal pri) {

		if(pri == null) {
			return "redirect:/users/login.do";
		}
		
		List<Gaussian> list = null;
		list = service.getGaussianList(pri.getName());
		
		model.addAttribute("list", list);
		
		return "gaussian/gaussianList";
	}
	@GetMapping("gaussianCreate.do")
	public String gaussianCreate() {
		return "gaussian/gaussianCreate";
	}
}
