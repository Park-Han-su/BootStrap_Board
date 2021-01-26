package spring.dao.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import spring.dto.board.Board;
import spring.dto.board.Comment;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession sqlSession;

	public List<Map> selectBoardList(Board board){
		return sqlSession.selectList("mappers.BoardMapper.selectBoardList", board);
	}
	
	public int selectCount() {
		return sqlSession.selectOne("mappers.BoardMapper.selectCount");
	}
	
	public int insertBoard(Board board) {
		return sqlSession.insert("mappers.BoardMapper.insertBoard", board);
	}
	
	public int modifyBoard(Board board) {
		return sqlSession.update("mappers.BoardMapper.modifyBoard", board);
	}
	
	public int deleteBoard(Board board) {
		return sqlSession.delete("mappers.BoardMapper.deleteBoard", board);
	}
	
	public int insertComment(Comment comment) {
		return sqlSession.insert("mappers.BoardMapper.insertComment", comment);
	}
	
	public List<Comment> selectComment(Comment comment){
		return sqlSession.selectList("mappers.BoardMapper.selectComment",comment);
	}
	
	public int modifyComment(Comment comment) {
		return sqlSession.update("mappers.BoardMapper.modifyComment", comment);
	}
	
	public int deleteComment(Comment comment) {
		return sqlSession.delete("mappers.BoardMapper.deleteComment", comment);
	}
	
}
