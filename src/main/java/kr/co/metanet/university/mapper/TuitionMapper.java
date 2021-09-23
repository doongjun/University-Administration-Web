package kr.co.metanet.university.mapper;

import java.util.Map;

import kr.co.metanet.university.domain.Tuition;

public interface TuitionMapper {
	void insertTuition(Map<String, Object> params);
	Tuition selectTuition(String code);
}
