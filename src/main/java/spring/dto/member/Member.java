package spring.dto.member;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class Member {

	private int code;
	@Email
	private String email;
	@NotBlank
	private String password;
	@NotBlank
	private String name;
	private String reg_date;
	private String auth;
	private int enabled;
}
