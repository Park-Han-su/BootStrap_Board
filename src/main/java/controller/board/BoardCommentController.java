package controller.board;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import spring.dto.board.Comment;
import spring.service.board.BoardService;

@RestController
@RequestMapping("/board")
public class BoardCommentController {

	@Autowired
	BoardService boardService;
	
	@PostMapping("/insertComment")
	public ResponseEntity insertComment(@RequestBody Comment comment) {
		boardService.insertComment(comment);
		return ResponseEntity.ok(null);
	}
	
	@GetMapping(value="/readComment")
	public ResponseEntity ReadComment() {
		return null;
	}
	        
}
