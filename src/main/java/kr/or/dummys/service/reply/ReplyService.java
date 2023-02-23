package kr.or.dummys.service.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dummys.dao.ReplyDao;
import kr.or.dummys.dto.Reply;


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
		@Transactional(rollbackFor = Exception.class)
		public Reply reReplyRegister(int parent_reply_no, String reReply_content, String userid) throws Exception { 
			System.out.println("대댓글 서비스 부모 댓글 번호: " + parent_reply_no); 
			System.out.println("대댓글 서비스 대댓글 내용: " + reReply_content);
			int result = 0;

			 Reply reply = null;
			 
			 try {
				 ReplyDao replyDao = sqlsession.getMapper(ReplyDao.class);
				 
				 // 부모 댓글 가져오기
				 Reply parentReply = replyDao.getParentReply(parent_reply_no);
				 
				 int board_no = parentReply.getBoard_no();
				 
				 int ref = parentReply.getRef();
				 
				 int dept = (parentReply.getDept()) + 1;
				 
				 System.out.println("대댓글 insert 서비스: " + parentReply.toString());
				 
				 // 부모 댓글과 같은 ref, dept를 가진 댓글들 뽑아오기
				 // select * from reply where ref="부모댓글 ref" and dept="부모댓글의 dept" and step>"부모댓글 step" order by step;
				 // 그리고 이렇게 구해온 댓글들 중 첫번째 댓글의 step보다 크거나 같은 step을 가지고 있는 댓글들의 step을 모두 1씩 증가시키고
				 // 위에서 구한 첫번째 댓글의 step 자리에 대댓글을 insert 하기
				 List<Reply> uncleList = replyDao.getUncleStepList(parentReply);
				 System.out.println("+++++++++++++++++++++++++++++++++++++++++");
				 System.out.println(uncleList);
				 
				 if(uncleList==null || uncleList.size() == 0) {
					 System.out.println("1번 탔음~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
					 int step = replyDao.getStep(board_no, ref);
					 
					 reply = Reply.builder().userid(userid).board_no(board_no)
								.ref(ref).reply_content(reReply_content).dept(dept).step(step).build();
				 }
				 else { //대댓글이 있을 때
					 System.out.println("2번 탔음~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
					 int firstUncleStep = uncleList.get(0).getStep();
					 
					 //update
					 int stepUpdate = replyDao.updateStep(uncleList.get(0));
					 
					 // insert 할 댓글 객체 생성
					 reply = Reply.builder().userid(userid).board_no(board_no)
								.ref(ref).reply_content(reReply_content).dept(dept).step(firstUncleStep).build();
				 }
			} catch (Exception e) {
			  e.printStackTrace();
			  throw e; //예외 직접 발생시키는 것
			 }
			  
			 return reply;
	  }
		public int reReplyInsert(Reply reply) {
			int result = 0;
			try {
				ReplyDao dao = sqlsession.getMapper(ReplyDao.class);
				result = dao.reReplyRegister(reply);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		//댓글 가져오기
		public Reply getReply(int reply_no) {
			
			Reply reply = new Reply();
			
			ReplyDao replydao = sqlsession.getMapper(ReplyDao.class);
			
			reply = replydao.getReply(reply_no);
			
			return reply;
		}

}
