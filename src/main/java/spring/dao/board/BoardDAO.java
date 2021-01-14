package spring.dao.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import spring.dto.board.Board;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession sqlSession;

	public List<Map> selectBoardList(Board board){
		return sqlSession.selectList("spring.sql.BoardMapper.selectBoardList", board);
	}
	
	public int selectCount() {
		return sqlSession.selectOne("spring.sql.BoardMapper.selectCount");
	}
	
	public int insertBoard(Board board) {
		return sqlSession.insert("spring.sql.BoardMapper.insertBoard", board);
	}
	
	public int modifyBoard(Board board) {
		return sqlSession.update("spring.sql.BoardMapper.modifyBoard", board);
	}
	
	public int deleteBoard(Board board) {
		return sqlSession.delete("spring.sql.BoardMapper.deleteBoard", board);
	}
	
}
