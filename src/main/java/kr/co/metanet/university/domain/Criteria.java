package kr.co.metanet.university.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum; // 사용자가 클릭하는 페이지 번호
	private int amount; // 하나의 페이지에 보여줄 게시물 갯수
	
	private String type;   //검색조건
	private String keyword; //검색어
	
	
	public Criteria() {
		this(1, 5);
	}

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public String[] getTypeArr() {
		// type => TCW => {"T","D","W"}, TC=>{"T","D"}, T=>{"T"}
		return type==null?new String[] {}:type.split("");
	}
}
