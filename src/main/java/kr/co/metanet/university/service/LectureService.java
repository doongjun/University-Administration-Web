package kr.co.metanet.university.service;

import java.util.HashMap;
import java.util.List;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.domain.StudentLectureVO;

public interface LectureService {
	List<LectureVO> getAllLecture();
	LectureVO getLecture(int id);
	String getMaxCode();
	int create(LectureVO vo);
	int update(LectureVO vo);
	int delete(int id);
	List<StudentLectureVO> getScoreList(int student_id, String lecture_year, String semester);
}
