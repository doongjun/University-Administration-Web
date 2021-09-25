package kr.co.metanet.university.service;

import java.util.List;

import kr.co.metanet.university.domain.MemberStudent;

public interface ProfessorStudentService {
	List<MemberStudent> getAllStudent(int lecture_id);
}
	
