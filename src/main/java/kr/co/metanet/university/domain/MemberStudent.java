package kr.co.metanet.university.domain;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class MemberStudent {
	private int id;
	private String name;
	private String roleName;
	private String code;
	private String password;
	private String departmentName;
	private int grade;
	private Date birthday;
	private String AcademicStatus;
	private Date admissionDate;
	private String email;
	private String phone;
	
	
	
}
