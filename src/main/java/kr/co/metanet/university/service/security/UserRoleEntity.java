package kr.co.metanet.university.service.security;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserRoleEntity {
	private String userLoginId;
	private String roleName;
	
	public UserRoleEntity(String userLoginId, String roleName) {
		this.userLoginId = userLoginId;
		this.roleName = roleName;
	}
}
