package spring.dto.member;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class Member {

	private int id;
	@Email
	private String email;
	@NotBlank
	private String password;
	@NotBlank
	private String name;
	private String regdate;
}
