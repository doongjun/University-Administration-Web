package kr.co.metanet.university.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.mapper.StudentLectureMapper;
import kr.co.metanet.university.service.StudentLectureService;

@Service
public class StudentLectureServiceImpl implements StudentLectureService {
	
	@Autowired
	private StudentLectureMapper mapper;
	
	@Override
	public List<LectureVO> getStudentLectureList(int student_id) {
		return mapper.getStudentLectureList(student_id);
	}
	
	@Override
	public boolean insert(int student_id, int lecture_id) {
		return mapper.insert(student_id, lecture_id) > 0 ? true : false;
	}
	
	@Override
	public boolean delete(int student_id, int lecture_id) {
		return mapper.delete(student_id, lecture_id) > 0 ? true : false;
	}
}
