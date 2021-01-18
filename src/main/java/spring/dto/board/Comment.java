package spring.dto.board;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Comment {

	private Long seq;
	private Long b_seq;
	private Long m_id;
	private String comment;
	private LocalDateTime reg_date;
	
}
