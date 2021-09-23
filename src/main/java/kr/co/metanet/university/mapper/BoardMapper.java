package kr.co.metanet.university.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.metanet.university.domain.BoardCriteriaVO;
import kr.co.metanet.university.domain.BoardVO;

public interface BoardMapper {
	//전체 리스트 조회
	public List<BoardVO> list();
	//조회수 증가
	public int addviews(@Param("b_views")int b_views,@Param("b_no") int b_no);
	//선택한 게시글 조회
	public BoardVO view(int b_no);
	//전체 게시글 수 계산
	public int totalCnt(BoardCriteriaVO cri);
	
	
	//관리자용
	//글 작성
	public int insert(BoardVO vo);
}
