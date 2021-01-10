package controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.dto.board.Board;
import spring.service.board.BoardWriteService;

@Controller
@RequestMapping("/board/write")
public class BoardInsertController {
	
	@Autowired
	BoardWriteService boardWriteService;
	
	@GetMapping
	public String boardWrite() {
		return "/board/boardWrite";
	}
	
	@GetMapping("/insert")
	public String boardInsert(Board board, Model model) {
		int count = boardWriteService.insertBoard(board);
		String msg;
		if(count == 1) {
			msg = "등록완료";
		}else {
			msg = "등록실패";
		}
		model.addAttribute("msg",msg);
		return "/board/boardInsertPage";
	}
}
