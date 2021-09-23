package kr.co.metanet.university.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.metanet.university.domain.LectureVO;

@Mapper
public interface LectureMapper {
	List<LectureVO> getAllLecture();
	int create(LectureVO vo);
	String getMaxCode();
//	int update(LectureVO vo);
	
}
