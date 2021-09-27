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
	
	private String flag; // 수강신청 검색 1 or 2 판단
	
	// 수강신청 검색 1
	private String sectionType1; // 구분
	private String kind; // 종류
	private String keyword; //검색어
	
	// 수강신청 검색 2
	private String department; // 학과
	private String sectionType2; // 구분
	private String grade; // 학년
	
	
	public Criteria() {
		this(1, 7);
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
