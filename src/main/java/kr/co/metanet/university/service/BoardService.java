package kr.co.metanet.university.service;

import java.util.List;

import kr.co.metanet.university.domain.BoardVO;


public interface BoardService {
	//전체 리스트 조회
	public List<BoardVO> boardlist();
	//조회수 증가
	public boolean addviews(int b_views, int b_no);
	//선택한 게시글 조회
	public BoardVO view(int b_no);
}
