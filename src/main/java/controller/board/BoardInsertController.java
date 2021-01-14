package controller.board;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import spring.dto.board.Board;
import spring.service.board.BoardService;

@Controller
@RequestMapping("/board/write")
public class BoardInsertController {
	
	@Autowired
	BoardService boardService;
	
	@GetMapping
	public String boardWrite() {
		return "/board/boardWrite";
	}
	
	@GetMapping("/summer")
	public String summer() {
		return "/board/summer";
	}
	
	@PostMapping("/insert")
	public String boardInsert(Board board, Model model) throws Exception{
			int count = boardService.insertBoard(board);
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
