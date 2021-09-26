package kr.co.metanet.university.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.metanet.university.domain.Criteria;
import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.mapper.ClassRegisterMapper;
import kr.co.metanet.university.service.ClassRegisterService;

@Service
public class ClassRegisterServiceImpl implements ClassRegisterService {
	
	@Autowired
	private ClassRegisterMapper mapper;
	
	@Override
	public List<LectureVO> getLectureList(Criteria cri) {
		return mapper.getLectureList(cri);
	}
	
	@Override
	public List<String> deptList() {
		return mapper.deptList();
	}
	
	@Override
	public List<LectureVO> getSearchList1(Criteria cri) {
		return mapper.getSearchList1(cri);
	}
	
	@Override
	public List<LectureVO> getSearchList2(Criteria cri) {
		return mapper.getSearchList2(cri);
	}
	
	@Override
	public int LectureListTotal(Criteria cri) {
		return mapper.LectureListTotal(cri);
	}
	
	@Override
	public int searchList1Total(Criteria cri) {
		return mapper.searchList1Total(cri);
	}
	
	@Override
	public int searchList2Total(Criteria cri) {
		return mapper.searchList2Total(cri);
	}
}

