package kr.co.metanet.university.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.metanet.university.domain.MemberStudent;

@Mapper
public interface ProfessorStudentMapper {
	List<MemberStudent> getAllStudent(int lecture_id);
	int updateScore(Map<String, Object> map);
	int deleteStudent(Map<String, Object> map);
}
