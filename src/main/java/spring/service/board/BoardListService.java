package spring.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.board.BoardDAO;
import spring.dto.board.Board;

@Service
public class BoardListService {

	@Autowired
	BoardDAO boardDAO;
	
	public List<Map> selectBoardAllList(Board board){
		return boardDAO.selectBoardList(board);
	}
	
}
