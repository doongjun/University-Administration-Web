package kr.co.metanet.university.service;

import java.util.List;

import kr.co.metanet.university.domain.LectureVO;

public interface StudentLectureService {
	public List<LectureVO> getStudentLectureList(int student_id);
	public boolean insert(int student_id, int lecture_id);
	public boolean delete(int student_id, int lecture_id);
}
