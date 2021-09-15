package kr.co.metanet.university.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class MemberProfessor {
	private int id;
	private String name;
	private String roleName;
	private String code;
	private String password;
	private String departmentName;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date birthday;
	private String email;
	private String phone;
	private String degree;
}
