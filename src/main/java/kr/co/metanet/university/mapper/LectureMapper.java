package kr.co.metanet.university.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.metanet.university.domain.Criteria;
import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.domain.StudentLectureVO;

@Mapper
public interface LectureMapper {
	List<LectureVO> getAllLecture(@Param("cri") Criteria cri);
	List<LectureVO> getSearchLecture(@Param("cri") Criteria cri);
	
	LectureVO getLecture(int id);
	String getMaxCode();
	int create(LectureVO vo);
	int update(LectureVO vo);
	int delete(int id);
	List<StudentLectureVO> getScoreList(HashMap<String,Object> map);
	List<LectureVO> getPrevLectureList(HashMap<String,Object> map);
	List<LectureVO> getSelectedPrevLectureList(HashMap<String,Object> map);
	
}
