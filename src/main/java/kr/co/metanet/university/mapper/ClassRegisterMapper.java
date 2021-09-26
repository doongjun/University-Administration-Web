package kr.co.metanet.university.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.metanet.university.domain.Criteria;
import kr.co.metanet.university.domain.LectureVO;

public interface ClassRegisterMapper {
	public List<LectureVO> getLectureList(@Param("cri") Criteria cri);
	public List<String> deptList();
	public List<LectureVO> getSearchList1(@Param("cri") Criteria cri);
	public List<LectureVO> getSearchList2(@Param("cri") Criteria cri);
	
	public int LectureListTotal(@Param("cri") Criteria cri);
	public int searchList1Total(@Param("cri") Criteria cri);
	public int searchList2Total(@Param("cri") Criteria cri);
}
