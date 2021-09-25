package kr.co.metanet.university.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.metanet.university.domain.MemberRole;

public interface MemberRoleMapper {
	List<MemberRole> selectMemberRoleByCode(String code);
}
