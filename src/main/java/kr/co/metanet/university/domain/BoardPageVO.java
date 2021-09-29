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
	
	public BoardPageVO(BoardCriteriaVO cri, int total) {
		this.total=total;
		this.cri=cri;
		
		this.endPage=(int)(Math.ceil(cri.getPage()/10.0))*10;
		this.startPage=this.endPage-9;
		
		//마지막
		int realEnd  =(int)(Math.ceil((total/1.0)/10));
		if(realEnd<this.endPage) {
			this.endPage=realEnd;
		}
		this.prev=this.startPage>1;
		this.next=this.endPage<realEnd;
		
	}
}









