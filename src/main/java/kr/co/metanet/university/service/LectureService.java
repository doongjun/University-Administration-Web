package kr.co.metanet.university.service;

import java.util.List;

import kr.co.metanet.university.domain.LectureVO;

public interface LectureService {
	List<LectureVO> getAllLecture();
	LectureVO getLecture(int id);
	String getMaxCode();
	int create(LectureVO vo);
	int update(LectureVO vo);
}
