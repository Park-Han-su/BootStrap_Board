package controller.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.dto.auth.AuthInfo;
import spring.dto.board.Board;
import spring.dto.member.Member;
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
	
	@GetMapping("/detail{seq}")
	public String boardDetail(Board board, Model model) {
		model.addAttribute("detail",boardListService.selectBoardAllList(board));
		return "/board/boardDetail";
	}
}
