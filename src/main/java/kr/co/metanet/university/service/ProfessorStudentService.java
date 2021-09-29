package kr.co.metanet.university.service;

import java.util.List;

import kr.co.metanet.university.domain.MemberStudent;
import kr.co.metanet.university.domain.StudentLectureVO;

public interface ProfessorStudentService {
	List<MemberStudent> getAllStudent(int lecture_id);
	List<StudentLectureVO> getAllScore(int lecture_id);
	int updateScore(String score, int student_id, int lecture_id, double midterm_exam, double final_exam, double assignment, double attendance, double total);
	int deleteStudent(int student_id, int lecture_id);
	
}
	
