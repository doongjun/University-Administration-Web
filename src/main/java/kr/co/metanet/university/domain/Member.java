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
public class Member {
	private Long id;
	private String code;
	private String password;
	private Date createDate;
	private Date modifyDate;
}
