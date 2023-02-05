package kr.or.dummys.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dummys.dto.Board;
import kr.or.dummys.service.board.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {

	private BoardService boardService;

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	  //게시글 목록
	  @GetMapping("boardList.do") 
	  public String boardList(String pg, String f, String q, Model model) { 
		 List<Board> boardList = boardService.boardList(pg, f, q);
		 model.addAttribute("boardList", boardList);	 	 
		  return "board/boardList"; 
	 }
	  
	  @GetMapping("boardWrite.do")
	  public String boardWrite() {
		  return "board/boardWrite";
	  }
	 
}
