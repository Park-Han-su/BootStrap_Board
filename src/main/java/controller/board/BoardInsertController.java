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
@PropertySource("classpath:application.properties")
@RequestMapping("/board/write")
public class BoardInsertController {
	
	@Value("${file.upload.location}")
	private String fileUploadLocation;
	
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
			MultipartFile file1 = board.getFile1();
			String file1Name = file1.getOriginalFilename();
			String msg;
			if (!"".equals(file1Name)) {
				String fileName = file1Name.substring(0, file1Name.lastIndexOf("."));
				String extension = file1Name.substring(file1Name.lastIndexOf(".") + 1);
				String file1SName = getUniqueFileName(fileName, extension);
				File uploadFile = new File(fileUploadLocation + file1SName);
				file1.transferTo(uploadFile);
				board.setFile1Name(file1Name);
				board.setFile1SName(file1SName);
			}
			int count = boardService.insertBoard(board);
			if(count == 1) {
				msg = "등록완료";
			}else {
				msg = "등록실패";
			}
			model.addAttribute("msg",msg);
		return "/board/boardInsertPage";
	}
	
	private static String getUniqueFileName(String fileName, String extension) {
		return fileName + "_" + System.currentTimeMillis() + "_" + System.nanoTime() + "." + extension;
	}
	
}
