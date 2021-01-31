package spring.dto.board;


import java.time.LocalDateTime;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Board {

	private Long seq;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yy.MM.dd.HH:MM")
	private LocalDateTime reg_date;
	@NotBlank(message = "로그인후 이용 가능합니다.")
	private String m_id;
	private MultipartFile file1;
	private String file1Name;
	private String file1SName;
	private String update_date;
	private Long pageIndex;
	private Long perPageCount;
}
