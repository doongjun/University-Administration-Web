package kr.co.metanet.university.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.metanet.university.domain.Criteria;
import kr.co.metanet.university.domain.LectureVO;

public interface ClassRegisterService {
	public List<LectureVO> getLectureList(@Param("cri") Criteria cri);
	public List<String> deptList();
}
