package controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.dto.board.Board;
import spring.service.board.BoardListService;

@Controller
@RequestMapping("/board")
public class BoardListController {
	
	@Autowired
	BoardListService boardListService;
	
	@GetMapping("/list")
	public String boardList(Board board, Model model) {
		model.addAttribute("boardList",boardListService.selectBoardAllList(board));
		return "/board/boardList";
	}
	
	@GetMapping("/detail")
	public String boardDetail() {
		return "/board/boardDetail";
	}
}
