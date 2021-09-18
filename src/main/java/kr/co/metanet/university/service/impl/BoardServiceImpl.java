package kr.co.metanet.university.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.metanet.university.domain.BoardVO;
import kr.co.metanet.university.mapper.BoardMapper;
import kr.co.metanet.university.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> boardlist() {
		
		return mapper.list();
	}

}
