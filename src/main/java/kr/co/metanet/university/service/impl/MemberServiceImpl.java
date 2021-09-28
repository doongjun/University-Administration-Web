package kr.co.metanet.university.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<MemberStudent> selectStudentList() {
		return memberMapper.selectStudentList();
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

	@Override
	public void updateStudentInfo(HashMap<String, String> params) {
		memberMapper.updateStudentInfo(params);
	}

	@Override
	public void updateProfessorInfo(HashMap<String, String> params) {
		memberMapper.updateProfessorInfo(params);
	}

	@Override
	public void updateAdminInfo(HashMap<String, String> params) {
		memberMapper.updateAdminInfo(params);
	}
	
	@Transactional
	@Override
	public void addMemberStudent(Map<String, Object> params) {
		//유저 추가
		Map<String, Object> memberParams = new HashMap<>();
		memberParams.put("name", params.get("name"));
		memberParams.put("code", params.get("code"));
		memberParams.put("password", params.get("password"));
		memberMapper.insertMember(memberParams);
		int createdKey = (int)memberParams.get("createdKey");
		
		//유저 Role 추가
		Map<String, Object> memberRoleParams = new HashMap<>();
		memberRoleParams.put("memberId", createdKey);
		memberRoleParams.put("roleName", "ROLE_USER");
		memberMapper.insertMemberRole(memberRoleParams);
		
		//학생 추가
		Map<String, Object> studentParams = new HashMap<>();
		studentParams.put("code", params.get("code"));
		studentParams.put("departmentCode", params.get("departmentCode"));
		studentParams.put("grade", params.get("grade"));
		studentParams.put("birthday", params.get("birthday"));
		studentParams.put("email", params.get("email"));
		studentParams.put("phone", params.get("phone"));
		studentParams.put("academicStatus", params.get("academicStatus"));
		studentParams.put("admissionDate", params.get("admissionDate"));
		memberMapper.insertStudent(studentParams);
	}

	@Override
	public void editMemberStudent(Map<String, Object> params) {
		Map<String, Object> memberParams = new HashMap<>();
		memberParams.put("name", params.get("name"));
		memberParams.put("code", params.get("code"));
		memberParams.put("conditionCode", params.get("conditionCode"));
		memberMapper.editMember(memberParams);
		
		memberMapper.editStudent(params);
	}
	
	@Transactional
	@Override
	public void deleteMemberStudent(String code) {
		int memberId = memberMapper.selectMemberKey(code);
		System.out.println(memberId);
		memberMapper.deleteMemberRole(memberId);
		memberMapper.deleteMember(memberId);
		memberMapper.deleteStudent(code);
	}

	@Override
	public int getUserCount(String code) {
		return memberMapper.selectUserCount(code);
	}
}
