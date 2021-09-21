package kr.co.metanet.university.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardCriteriaVO {
	//게시판 분류관련
	
	private int page;
	
	private String sort;
	private String keyword;
	
	public BoardCriteriaVO() {
		this(1);
	}

	public BoardCriteriaVO(int page) {
		super();
		this.page=page;
	}
	
	public String[] getSortArr() {
		return sort == null?new String[] {}:sort.split("");
	}
}
