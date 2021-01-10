package spring.sql;

import java.util.List;
import java.util.Map;

import spring.dto.board.Board;

public interface BoardMapper {

	public List<Map> selectBoardList(Board board);
	public int insertBoard(Board board);
}
