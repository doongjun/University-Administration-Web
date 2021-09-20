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
	public List<LectureVO> getStudentLectureList() {
		return mapper.getStudentLectureList();
	}

}
