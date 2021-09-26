package kr.co.metanet.university.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.metanet.university.domain.LectureVO;

public interface StudentLectureMapper {
	public List<LectureVO> getStudentLectureList(int student_id);
	public int insert(@Param("student_id") int student_id, @Param("lecture_id") int lecture_id);
	public int delete(@Param("student_id") int student_id, @Param("lecture_id") int lecture_id);
}
