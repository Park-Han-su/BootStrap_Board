package spring.dto.member;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Member {

	private int id;
	private String email;
	private String password;
	private String name;
	private String regdate;
}
