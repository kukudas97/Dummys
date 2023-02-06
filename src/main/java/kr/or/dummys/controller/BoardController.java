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
import org.springframework.web.bind.annotation.RequestParam;

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
	  public String boardList(@RequestParam String board_kind, String pg, String f, String q, Model model) { 
		  List<Board> boardList = boardService.boardList(board_kind, pg, f, q);
		  model.addAttribute("boardList", boardList);
		  model.addAttribute("board_kind", board_kind);
			 
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
	  public String boardDetail(String board_no, Model model) {
		  System.out.println(board_no);	  
		  Board board = boardService.boardDetail(board_no);
		  model.addAttribute("board", board);
		  System.out.println("board: " + board);
		  return "board/boardDetail";
	  }
	  
	  //수정페이지 호출
	  @GetMapping(value="boardUpdate.do")
	  public String boardEdit(String board_no, Model model) {
		  Board board = null;
		  
		  try {
			board = boardService.boardUpdate(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		  model.addAttribute("board", board);
		  return "board/boardUpdate";
	  }
	  
	  //수정 처리
	  @PostMapping(value="boardUpdate.do")
	  public String boardUpdate(Board board, HttpServletRequest request) {
		  System.out.println("boardUpdate.do: " + board.toString());
		  return boardService.boardUpdate(board,  request);
	  }
	  
	  //게시글 삭제
	  @RequestMapping("boardDelete.do")
	  public String boardDelete(String board_no) {
		  return boardService.boardDelete(board_no);
	  }
	 
}
