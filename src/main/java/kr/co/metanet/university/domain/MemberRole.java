package kr.co.metanet.university.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class MemberRole {
	private Long id;
	private Long memberId;
	private String roleName;
}
