package kr.co.metanet.university.service;

import java.util.Map;

import kr.co.metanet.university.domain.Member;
import kr.co.metanet.university.domain.Tuition;

public interface TuitionService {
	void addTuition(Map<String, Object> params, String code);
	Tuition selectTuition(String code);
}
