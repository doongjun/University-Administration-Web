package kr.co.metanet.university.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.metanet.university.domain.MemberStudent;
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

}
