package kr.co.metanet.university.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.metanet.university.domain.Member;
import kr.co.metanet.university.domain.MemberAdmin;
import kr.co.metanet.university.domain.MemberProfessor;
import kr.co.metanet.university.domain.MemberStudent;
import kr.co.metanet.university.service.security.UserDbService;

public interface MemberService extends UserDbService{
	Member getMemberByCode(String code);
	MemberStudent getStudentByCode(String code);
	List<MemberStudent> selectStudentList();
	MemberProfessor getProfessorByCode(String code);
	MemberAdmin getAdminByCode(String code);
	void updatePassword(String code, String password);
	void updateStudentInfo(HashMap<String, String> params);
	void updateProfessorInfo(HashMap<String, String> params);
	void updateAdminInfo(HashMap<String, String> params);
	void addMemberStudent(Map<String, Object> params);
	void editMemberStudent(Map<String, Object> params);
	void deleteMemberStudent(String code);
	int getUserCount(String code);
}
