package kr.or.dummys.service.reply;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dummys.dao.ReplyDao;
import kr.or.dummys.dto.Reply;
import lombok.extern.log4j.Log4j;


@Service
public class ReplyService {
	
	//Mybatis 작업
		private SqlSession sqlsession;
		
		@Autowired
		public void setSqlsession(SqlSession sqlsession) {
			this.sqlsession = sqlsession;
		}
		
		//댓글 리스트 나열
		public List<Reply> replyList(String pg, String ps, String board_no){

			int intpg = Integer.parseInt(pg) ;
			int intps = Integer.parseInt(ps) ;
			//DAO 작업
			List<Reply> replyList = null;
			int start = intpg * intps - (intps-1); //페이지 시작 번호
			int end = intpg * intps;
			
			try {
				//동기화
				ReplyDao replyDao = sqlsession.getMapper(ReplyDao.class);
				//////////////////////////////////
				replyList = replyDao.replyList(start, end, board_no);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return replyList;
		}
		
		//댓글 등록(insert) 처리
		public String replyRegister(String board_no, String reply_content, String userid) {
			System.out.println("서비스 reply_content: " + reply_content);
			int result = 0;
			try {

				ReplyDao replyDao = sqlsession.getMapper(ReplyDao.class);
				int ref = replyDao.getRef(board_no);
				
				Reply reply = Reply.builder().userid(userid).board_no(Integer.parseInt(board_no))
						.ref(ref).reply_content(reply_content).build();
				
				result = replyDao.replyRegister(reply);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return (result>=1) ? "성공":"실패";
	
			
		}

		
		//댓글 삭제(delete)
		public String replyDelete(int reply_no) {
			System.out.println("서비스 reply_no: " + reply_no);
			int result = 0;
			try {
				ReplyDao replyDao = sqlsession.getMapper(ReplyDao.class);
				result = replyDao.replyDelete(reply_no);
				System.out.println("result: " + result);
			} catch (Exception e) {
				e.getStackTrace();
			}
			return (result>=1) ? "성공":"실패";
		}
	
	  //대댓글 insert 
		public String reReplyRegister(int parent_reply_no, String reReply_content, String userid) { 
			System.out.println("대댓글 서비스 부모 댓글 번호: " + parent_reply_no); 
			System.out.println("대댓글 서비스 대댓글 내용: " + reReply_content);
			int result = 0;
			 
			 try {
				 ReplyDao replyDao = sqlsession.getMapper(ReplyDao.class);
				 
				 Reply parentReply = replyDao.getParentReply(parent_reply_no);
				 
				 int board_no = parentReply.getBoard_no();
				 
				 int ref = parentReply.getRef();
				 
				 int dept = (parentReply.getDept()) + 1;
				 
				 Reply reply = Reply.builder().userid(userid).board_no(board_no)
							.ref(ref).reply_content(reReply_content).dept(dept).build();
				 
				 result = replyDao.reReplyRegister(reply);
				 
				 
			} catch (Exception e) {
			  e.printStackTrace();
			 }
			  
			 return (result>=1) ? "성공":"실패";
	  }


}
