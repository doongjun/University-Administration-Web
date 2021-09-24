package kr.co.metanet.university.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.metanet.university.domain.Member;
import kr.co.metanet.university.domain.Tuition;
import kr.co.metanet.university.domain.TuitionPageVO;
import kr.co.metanet.university.mapper.MemberMapper;
import kr.co.metanet.university.mapper.TuitionMapper;
import kr.co.metanet.university.service.TuitionService;
import lombok.extern.log4j.Log4j2;

@Service
public class TuitionServiceImpl implements TuitionService{
	@Autowired
	private TuitionMapper tuitionMapper;
	
	@Override
	public void addTuition(Map<String, Object> params, String code) {
		tuitionMapper.insertTuition(params);
	}

	@Override
	public Tuition selectTuition(String code) {
		return tuitionMapper.selectTuition(code);
	}

	@Override
	public int checkTuitionCountByCode(String code) {
		return tuitionMapper.checkTuitionCountByCode(code);
	}

	@Override
	public List<TuitionPageVO> getTuitionFileList() {
		return tuitionMapper.selectTuitionFileList();
	}

	@Override
	public void deleteTuitionByCode(String code) {
		tuitionMapper.deleteTuitionByCode(code);
	}

}
