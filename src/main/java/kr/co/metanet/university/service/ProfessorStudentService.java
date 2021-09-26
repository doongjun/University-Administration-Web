package kr.co.metanet.university.service;

import java.util.List;

import kr.co.metanet.university.domain.MemberStudent;

public interface ProfessorStudentService {
	List<MemberStudent> getAllStudent(int lecture_id);
	int updateScore(String score, int student_id, int lecture_id);
	int deleteStudent(int student_id, int lecture_id);
}
	
