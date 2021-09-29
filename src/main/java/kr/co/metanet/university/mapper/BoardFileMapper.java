package kr.co.metanet.university.mapper;

import java.util.List;
import java.util.Map;

import kr.co.metanet.university.domain.BoardFileVO;




public interface BoardFileMapper {
	void insertFIle(Map<String, Object> params);
	BoardFileVO selectFile(int b_no);
}
