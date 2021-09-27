package kr.co.metanet.university.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	private int b_no;
	private String b_title;
	private int b_writer_code;
	private String b_content;
	private Date b_sysdate;
	private int b_views;
	private String b_sort;
	
	private String writer;

}
