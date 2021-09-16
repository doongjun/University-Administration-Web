package kr.co.metanet.university.mapper;

import kr.co.metanet.university.domain.Member;
import kr.co.metanet.university.domain.MemberAdmin;
import kr.co.metanet.university.domain.MemberProfessor;
import kr.co.metanet.university.domain.MemberStudent;

public interface MemberMapper {
	Member selectMemberByCode(String code);
	MemberStudent selectStudentByCode(String code);
	MemberProfessor selectProfessorByCode(String code);
	MemberAdmin selectAdminByCode(String code);
}
