package kr.or.dummys.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.dummys.dto.Reply;

public interface ReplyDao {

	// 댓글수
	public int getReplyCount(String field, String query) throws ClassNotFoundException, SQLException;

	// 댓글 리스트
	public List<Reply> replyList(int start, int end, String board_no) throws ClassNotFoundException, SQLException;

	// 댓글 작성(insert)
	public int replyRegister(Reply reply) throws ClassNotFoundException, SQLException;

	// 게시물 수정(update)
	// int replyUpdate(Reply reply) throws ClassNotFoundException, SQLException;

	// 게시물 삭제(delete)
	public int replyDelete(int reply_no) throws ClassNotFoundException, SQLException;

	public int getRef(String board_no) throws ClassNotFoundException, SQLException;

	// 부모 댓글 계층형 정보 가져옴
	public Reply getParentReply(int reply_no) throws ClassNotFoundException, SQLException;

	// 대댓글 작성(insert)
	public int reReplyRegister(Reply reply) throws ClassNotFoundException, SQLException;

	// 대댓글 작성 시 step update
	public int updateStep(Reply reply) throws ClassNotFoundException, SQLException;

	// step 가져오는 거
	public List<Reply> getUncleStepList(Reply reply) throws ClassNotFoundException, SQLException;

	public int getStep(int board_no, int ref) throws ClassNotFoundException, SQLException;

}
