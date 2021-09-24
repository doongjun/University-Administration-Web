package kr.co.metanet.university.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class TuitionPageVO {
	private String code;
	private String name;
	private String departmentName;
	private String fileName;
	private String filePath;
	private Double fileSize;
	private String contentType;
}
