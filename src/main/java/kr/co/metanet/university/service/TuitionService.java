package kr.co.metanet.university.service;

import java.util.List;
import java.util.Map;

import kr.co.metanet.university.domain.Member;
import kr.co.metanet.university.domain.Tuition;
import kr.co.metanet.university.domain.TuitionPageVO;

public interface TuitionService {
	void addTuition(Map<String, Object> params, String code);
	Tuition selectTuition(String code);
	int checkTuitionCountByCode(String code);
	List<TuitionPageVO> getTuitionFileList();
	void deleteTuitionByCode(String code);
}
