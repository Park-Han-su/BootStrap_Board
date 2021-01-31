package spring.dto.securityUser;

import lombok.Data;

@Data
public class AuthInfo {

	private long id;
	private String email;
	private String name;

	public AuthInfo(long id, String email, String name) {
		this.id = id;
		this.email = email;
		this.name = name;
	}
}
