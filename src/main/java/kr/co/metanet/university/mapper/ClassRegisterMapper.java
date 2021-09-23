package kr.co.metanet.university.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.metanet.university.domain.Criteria;
import kr.co.metanet.university.domain.LectureVO;

public interface ClassRegisterMapper {
	public List<LectureVO> getLectureList(@Param("cri") Criteria cri);
}
