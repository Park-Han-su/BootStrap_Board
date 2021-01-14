package spring.dto.board;


import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Board {

	private Long seq;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yy.MM.dd.HH:mm")
	private LocalDateTime reg_date;
	private String m_id;
	private MultipartFile file1;
	private String file1Name;
	private String file1Sname;
	private String update_date;
	private Long pageIndex;
	private Long perPageCount;
}
