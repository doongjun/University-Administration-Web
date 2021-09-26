package kr.co.metanet.university.service;

import java.util.List;
import java.util.Map;

import kr.co.metanet.university.domain.LectureVO;

public interface ProfessorLectureService {
	List<LectureVO> getAllLecture(int professor_id);
	List<LectureVO> getNowAllLecture(Map map);
	LectureVO getLecture(int id);
	int create(LectureVO vo);
	int update(LectureVO vo);
	int delete(int id);
}
	
