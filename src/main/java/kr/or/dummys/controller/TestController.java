package kr.or.dummys.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.or.dummys.dao.testDao;

@Controller
public class TestController {

	@Autowired
	private SqlSession s;
	
	@GetMapping("/createdummys.do")
	public String createDummys() {
		return "TaeWoo/createdummy";
	}
}
