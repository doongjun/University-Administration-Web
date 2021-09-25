package kr.co.metanet.university.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.metanet.university.domain.LectureVO;

@Mapper
public interface ProfessorLectureMapper {
	List<LectureVO> getAllLecture(int professor_id);
	List<LectureVO> getNowAllLecture(Map map);
	LectureVO getLecture(int id);
	int create(LectureVO vo);
	int update(LectureVO vo);
	int delete(int id);
	
}
