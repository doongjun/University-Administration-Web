package kr.co.metanet.university.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@Builder
public class BoardFileVO {
	
	
		private int b_no;
		private String f_uuid;
		private String f_path;
		private String f_name;
		private boolean f_type;

	
}
