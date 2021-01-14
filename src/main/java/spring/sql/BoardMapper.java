package spring.sql;

import java.util.List;
import java.util.Map;

import spring.common.Page;
import spring.dto.board.Board;

public interface BoardMapper {

	public List<Map> selectBoardList(Board board);
	public int selectCount();
	public int insertBoard(Board board);
	public int deleteBoard(Board board);
	public int modifyBoard(Board board);
	
}
