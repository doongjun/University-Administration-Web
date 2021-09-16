package kr.co.metanet.university.service;

import kr.co.metanet.university.domain.Member;
import kr.co.metanet.university.domain.MemberAdmin;
import kr.co.metanet.university.domain.MemberProfessor;
import kr.co.metanet.university.domain.MemberStudent;
import kr.co.metanet.university.service.security.UserDbService;

public interface MemberService extends UserDbService{
	Member getMemberByCode(String code);
	MemberStudent getStudentByCode(String code);
	MemberProfessor getProfessorByCode(String code);
	MemberAdmin getAdminByCode(String code);
	void updatePassword(String code, String password);
}
