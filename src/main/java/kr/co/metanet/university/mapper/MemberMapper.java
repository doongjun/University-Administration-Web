package kr.co.metanet.university.mapper;

import kr.co.metanet.university.domain.Member;
import kr.co.metanet.university.domain.MemberRole;

public interface MemberMapper {
	Member selectMemberByCode(String code);
}
