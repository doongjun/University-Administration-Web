package kr.co.metanet.university.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class MemberAdmin {
	private int id;
	private String name;
	private String roleName;
	private String code;
	private String password;
	private String position;
	private String email;
	private String phone;
	private String division;
}
