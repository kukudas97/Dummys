package kr.or.dummys.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	  //게시글 목록 페이지 호출
	  @GetMapping("boardList.do") 
	  public String boardList(String pg, String f, String q, Model model) { 
		 List<Board> boardList = boardService.boardList(pg, f, q);
		 System.out.println(boardList.toString());
		 model.addAttribute("boardList", boardList);	 	 
		  return "board/boardList"; 
	 }
	  
	  //게시글 작성 페이지 호출
	  @GetMapping("boardWrite.do")
	  public String boardWrite() {
		  return "board/boardWrite";
	  }
	  
	  //게시글 작성 처리(DB에 insert)
	  @PostMapping(value="boardWrite.do")
	  public String boardWrite(Board board, HttpServletRequest request, Principal principal) {
		  System.out.println("boardWrite.do 컨트롤러 탔다");
		  String url = null;
		  System.out.println("principal: " + principal.toString());
			
			try {
				url = boardService.boardWrite(board, request, principal);
				System.out.println("url: " + url);
			} catch (Exception e) {
				e.printStackTrace();
			}
		  
		  return url;
	  }
	 
	  //게시글 상세보기
	  @RequestMapping("boardDetail.do")
	  public String boardDetail(String seq, Model model) {
		  Board board = boardService.boardDetail(seq);
		  return "board/boardDetail";
	  }
	 
}
