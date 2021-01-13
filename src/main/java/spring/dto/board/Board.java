package spring.dto.board;


import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Board {

	private Long seq;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yy.MM.dd.HH:mm")
	private LocalDateTime reg_date;
	private String m_id;
	private String file1Name;
	private String file1sname;
	private String update_date;
}
