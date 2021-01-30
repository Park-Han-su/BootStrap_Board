package spring.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import spring.common.Page;
import spring.common.PageCount;
import spring.dao.board.BoardDAO;
import spring.dto.board.Board;
import spring.dto.board.Comment;

@Transactional
@Service
public class BoardService {

	@Autowired
	BoardDAO boardDAO;
	
	public List<Map> selectBoardAllList(Board board){
		return boardDAO.selectBoardList(board);
	}
	
	public void readList(Page page, Board board, Model model){
		if(0 == page.getPageNo()) {
			page.setPageNo(1);
		}
		board.setPageIndex((page.getPageNo()-1) * PageCount.PER_PAGE_CNT);
		board.setPerPageCount(PageCount.PER_PAGE_CNT);
		page.setPageCnt(PageCount.getPageCnt(boardDAO.selectCount()));
		model.addAttribute("boardList", boardDAO.selectBoardList(board));
		model.addAttribute("page", page);
	}
	
	public int deleteBoard(Board board) {
		return boardDAO.deleteBoard(board);
	}
	
	public int modifyBoard(Board board) {
		return boardDAO.modifyBoard(board);
	}
	
	public int insertBoard(Board board) {
		return boardDAO.insertBoard(board);
	}
	
	public int insertComment(Comment comment) {
		return boardDAO.insertComment(comment);
	}
	
	public List<Comment> selectComment(Comment comment){
		return boardDAO.selectComment(comment);
	}
	
	public int modifyComment(Comment comment) {
		return boardDAO.modifyComment(comment);
	}
	
	public int deleteComment(Comment comment) {
		return boardDAO.deleteComment(comment);
	}
	
}
