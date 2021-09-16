package kr.co.metanet.university.mapper;

import java.util.List;

import kr.co.metanet.university.domain.BoardVO;

public interface BoardMapper {
	public List<BoardVO> boardlist(BoardVO vo);
}
