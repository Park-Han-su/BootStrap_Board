package spring.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.board.BoardDAO;
import spring.dto.board.Board;

@Service
public class BoardWriteService {

	@Autowired
	BoardDAO boardDAO;
	
	public int insertBoard(Board board) {
		return boardDAO.insertBoard(board);
	}
}
