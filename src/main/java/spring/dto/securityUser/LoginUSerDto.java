package spring.dto.securityUser;

import lombok.Data;

@Data
public class LoginUSerDto {

	private String email;
	private String password;
	private String auth;
}
