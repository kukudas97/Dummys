package kr.or.dummys.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.dummys.dto.Gaussian;
import kr.or.dummys.dto.Gaussian_result;
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
	@GetMapping("gaussianUpdate.do")
	public String gaussianUpdate(@RequestParam(value="gaussian_no", required=false) String gaussian_no, Model model) {
		
		// 번호 입력 없으면 리스트로
		if(gaussian_no.equals("") || gaussian_no == null) {
			return "gaussian/gaussianList.do";
		}
		
		// 번호 있으면 정규분포 조회
		Gaussian gaussian = service.getGaussianByNo(gaussian_no);
		
		if(gaussian == null){
			return "gaussian/gaussianList.do";
		}

		List<Gaussian_result> list = service.getGaussianResultListByNo(gaussian_no);
		
		model.addAttribute("gaussian",gaussian);
		model.addAttribute("resultList", list);
		
		return "gaussian/gaussianUpdate";
	}
}
