package kr.co.metanet.university.mapper;

import java.util.Map;

import kr.co.metanet.university.domain.Member;
import kr.co.metanet.university.domain.MemberAdmin;
import kr.co.metanet.university.domain.MemberProfessor;
import kr.co.metanet.university.domain.MemberStudent;

public interface MemberMapper {
	Member selectMemberByCode(String code);
	MemberStudent selectStudentByCode(String code);
	MemberProfessor selectProfessorByCode(String code);
	MemberAdmin selectAdminByCode(String code);
	void updatePassword(Map<String, String> params);
	void updateStudentInfo(Map<String, String> params);
	void updateProfessorInfo(Map<String, String> params);
	void updateAdminInfo(Map<String, String> params);
} 
