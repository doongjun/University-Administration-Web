package kr.co.metanet.university.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class LectureVO {
	private int id;
	private String lecture_code;
	private String lecture_name;
	private int grade;
	private String classroom;
	private String division;
	private String lecture_time;
	private String semester;
	private int student_count;
	private int credit;
	private String section;
	private int dept_code;
	private String remarks;
	private String schedule;
}
