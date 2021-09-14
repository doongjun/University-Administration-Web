package kr.co.metanet.university.service.security;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserEntity {
	private String loginUserId;
	private String password;
	
	public UserEntity(String loginUserId, String password) {
		this.loginUserId = loginUserId;
		this.password = password;
	}
}
