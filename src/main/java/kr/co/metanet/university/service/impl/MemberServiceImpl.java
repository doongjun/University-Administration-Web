package kr.co.metanet.university.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.metanet.university.domain.Member;
import kr.co.metanet.university.domain.MemberAdmin;
import kr.co.metanet.university.domain.MemberProfessor;
import kr.co.metanet.university.domain.MemberRole;
import kr.co.metanet.university.domain.MemberStudent;
import kr.co.metanet.university.mapper.MemberMapper;
import kr.co.metanet.university.mapper.MemberRoleMapper;
import kr.co.metanet.university.service.MemberService;
import kr.co.metanet.university.service.security.UserEntity;
import kr.co.metanet.university.service.security.UserRoleEntity;

@Service
public class MemberServiceImpl implements MemberService{
	private MemberMapper memberMapper;
	private MemberRoleMapper memberRoleMapper;
	
	public MemberServiceImpl(MemberMapper memberMapper, MemberRoleMapper memberRoleMapper) {
		this.memberMapper = memberMapper;
		this.memberRoleMapper = memberRoleMapper;
	}
	
	@Override
	public UserEntity getUser(String loginUserId) {
		Member member = memberMapper.selectMemberByCode(loginUserId);
		return new UserEntity(member.getCode(), member.getPassword());
	}
	
	@Override
	public List<UserRoleEntity> getUserRoles(String loginUserId) {
		List<MemberRole> memberRoles = memberRoleMapper.selectMemberRoleByCode(loginUserId);
		List<UserRoleEntity> list = new ArrayList<>();
		
		for(MemberRole memberRole : memberRoles) {
			list.add(new UserRoleEntity(loginUserId, memberRole.getRoleName()));
		}
		return list;
	}

	@Override
	public Member getMemberByCode(String code) {
		return memberMapper.selectMemberByCode(code);
	}

	@Override
	public MemberStudent getStudentByCode(String code) {
		return memberMapper.selectStudentByCode(code);
	}

	@Override
	public MemberProfessor getProfessorByCode(String code) {
		return memberMapper.selectProfessorByCode(code);
	}

	@Override
	public MemberAdmin getAdminByCode(String code) {
		return memberMapper.selectAdminByCode(code);
	}

	@Override
	public void updatePassword(String code, String password) {
		Map<String, String> map = new HashMap<>();
		map.put("code", code);
		map.put("password", password);
		memberMapper.updatePassword(map);
	}
}
