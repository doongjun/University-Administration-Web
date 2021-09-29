package kr.co.metanet.university.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.metanet.university.domain.MemberStudent;
import kr.co.metanet.university.domain.StudentLectureVO;
import kr.co.metanet.university.mapper.ProfessorStudentMapper;
import kr.co.metanet.university.service.ProfessorStudentService;

@Service("kr.co.metanet.university.service.impl.ProfessorStudentServiceImpl")
public class ProfessorStudentServiceImpl implements ProfessorStudentService {

	@Autowired
	private ProfessorStudentMapper mapper;
	
	@Override
	public List<MemberStudent> getAllStudent(int lecture_id) {
		return mapper.getAllStudent(lecture_id);
	}

	@Override
	public int updateScore(String score, int student_id, int lecture_id, double midterm_exam, double final_exam, double assignment, double attendance, double total) {
		Map<String,Object> map = new HashMap<>();
		map.put("score", score);
		map.put("student_id", student_id);
		map.put("lecture_id", lecture_id);
		map.put("midterm_exam", midterm_exam);
		map.put("final_exam", final_exam);
		map.put("assignment", assignment);
		map.put("attendance", attendance);
		map.put("total", total);
		return mapper.updateScore(map);
	}

	@Override
	public int deleteStudent(int student_id, int lecture_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("student_id", student_id);
		map.put("lecture_id", lecture_id);
		return mapper.deleteStudent(map);
	}

	@Override
	public List<StudentLectureVO> getAllScore(int lecture_id) {
		return mapper.getAllScore(lecture_id);
	}

}
