package spring.dto.board;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Comment {

	private Long seq;
	private Long b_seq;
	private Long m_id;
	private String m_name;
	private String comment;
	private String reg_date;
	
}
