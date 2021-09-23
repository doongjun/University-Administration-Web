package kr.co.metanet.university.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class Tuition {
	private String code;
	private String fileName;
	private String filePath;
	private Double fileSize;
	private String contentType;
}
