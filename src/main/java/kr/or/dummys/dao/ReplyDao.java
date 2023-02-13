package kr.or.dummys.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.dummys.dto.Reply;



public interface ReplyDao {
	
		//댓글수
		int getReplyCount(String field, String query) throws ClassNotFoundException, SQLException;
			
		//댓글 리스트
		List<Reply> replyList(int start, int end, String board_no) throws ClassNotFoundException, SQLException;
		
		//댓글 작성(insert)
		int replyRegister(Reply reply) throws ClassNotFoundException, SQLException;
		
		//게시물 수정(update)
		int replyUpdate(Reply reply) throws ClassNotFoundException, SQLException;
		
		//게시물 삭제(delete)
		int replyDelete(int reply_no) throws ClassNotFoundException, SQLException;
		
		int getRef(String board_no) throws ClassNotFoundException, SQLException;
		
		//부모 댓글 계층형 정보 가져옴
		Reply getParentReply(int reply_no) throws ClassNotFoundException, SQLException;
		
		//대댓글 작성(insert)
		int reReplyRegister(Reply reply) throws ClassNotFoundException, SQLException;

}
