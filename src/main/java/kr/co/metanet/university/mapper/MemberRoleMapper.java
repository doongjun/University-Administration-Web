package kr.co.metanet.university.mapper;

import java.util.List;

import kr.co.metanet.university.domain.MemberRole;

public interface MemberRoleMapper {
	List<MemberRole> selectMemberRoleByCode(String code);
}
