package kr.co.metanet.university.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.domain.MemberStudent;

@Mapper
public interface ProfessorStudentMapper {
	List<MemberStudent> getAllStudent(int lecture_id);
}
