package kr.co.metanet.university.mapper;

import java.util.List;
import java.util.Map;

import kr.co.metanet.university.domain.Tuition;
import kr.co.metanet.university.domain.TuitionPageVO;

public interface TuitionMapper {
	void insertTuition(Map<String, Object> params);
	Tuition selectTuition(String code);
	int checkTuitionCountByCode(String code);
	List<TuitionPageVO> selectTuitionFileList();
	void deleteTuitionByCode(String code);
}
