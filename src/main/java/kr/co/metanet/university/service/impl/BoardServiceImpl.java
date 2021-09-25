package kr.co.metanet.university.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.metanet.university.domain.BoardCriteriaVO;
import kr.co.metanet.university.domain.BoardVO;
import kr.co.metanet.university.mapper.BoardMapper;
import kr.co.metanet.university.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	//전체 리스트
	@Override
	public List<BoardVO> boardlist(BoardCriteriaVO cri) {
		return mapper.list(cri);
	}

	//조회수
	@Override
	public boolean addviews(int b_views, int b_no) {
		return mapper.addviews(b_views, b_no) > 0 ? true : false;
	}

	//게시글 조회
	@Override
	public BoardVO view(int b_no) {
		return mapper.view(b_no);
	}

	@Override
	public int total(BoardCriteriaVO cri) {
		return mapper.totalCnt(cri);
	}

	
	
	//관리자용
	//글작성
	@Override
	public boolean insert(BoardVO vo) {
		return mapper.insert(vo)>0 ? true:false;
	}
	//글 수정
	@Override
	public boolean update(BoardVO vo) {
		return mapper.update(vo)>0 ? true : false ;
	}
	//글 삭제
	@Override
	public boolean delete(int b_no) {
		return mapper.delete(b_no)>0 ? true : false;
	}
	
	

}