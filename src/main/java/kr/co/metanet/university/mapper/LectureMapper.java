package kr.co.metanet.university.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.domain.StudentLectureVO;

@Mapper
public interface LectureMapper {
	List<LectureVO> getAllLecture();
	LectureVO getLecture(int id);
	String getMaxCode();
	int create(LectureVO vo);
	int update(LectureVO vo);
	int delete(int id);
	List<StudentLectureVO> getScoreList(HashMap<String,Object> map);
	
}
