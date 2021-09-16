package kr.co.metanet.university.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.mapper.ClassRegisterMapper;
import kr.co.metanet.university.service.ClassRegisterService;

@Service
public class ClassRegisterServiceImpl implements ClassRegisterService {
	
	@Autowired
	private ClassRegisterMapper mapper;
	
	@Override
	public List<LectureVO> getLectureList() {
		return mapper.getLectureList();
	}

}
