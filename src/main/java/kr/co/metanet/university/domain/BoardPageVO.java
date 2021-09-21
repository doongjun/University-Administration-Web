package kr.co.metanet.university.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardPageVO {
	//게시판 페이징 관련
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int total;
	private BoardCriteriaVO cri;
}
