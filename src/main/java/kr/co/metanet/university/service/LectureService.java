package kr.co.metanet.university.service;

import java.util.List;


import kr.co.metanet.university.domain.Criteria;
import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.domain.StudentLectureVO;

public interface LectureService {
	List<LectureVO> getAllLecture(Criteria cri);
	List<LectureVO> getSearchLecture(Criteria cri);
	int allLectureTotal(Criteria cri);
	int searchLectureTotal(Criteria cri);
	
	LectureVO getLecture(int id);
	String getMaxCode();
	int create(LectureVO vo);
	int update(LectureVO vo);
	int delete(int id);
	List<StudentLectureVO> getScoreList(int student_id, String lecture_year, String semester);
	List<LectureVO> getPrevLectureList(String semester, String this_year, String last_year, int student_id);
	List<LectureVO> getSelectedPrevLectureList(String semester, String lecture_year, int student_id);
	
}
