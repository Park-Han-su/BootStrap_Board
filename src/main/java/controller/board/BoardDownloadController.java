package controller.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.common.DownloadView;
import spring.dto.board.Board;


@Controller
@RequestMapping("/board")
@PropertySource("classpath:application.properties")
public class BoardDownloadController {
	
	@Value("${file.upload.location}")
	private String fileUploadLocation;
	
	@GetMapping("/download")
	public void download(Board board, HttpServletRequest request, HttpServletResponse response) throws IOException {
		DownloadView fileDown = new DownloadView();
		fileDown.filDown(request, response, fileUploadLocation, board.getFile1SName(), board.getFile1Name());
	}

}
