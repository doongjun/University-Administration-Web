package kr.co.metanet.university.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudentLectureVO {
	private int student_id;
	private int lecture_id;
	private String lecture_year;
	private String lecture_code;
	private String lecture_name;
	private String division;
	private String semester;
	private int credit;
	private String section;
	
	private String score;
	private double midterm_exam;
	private double final_exam;
	private double attendance;
	private double total;
	private double assignment;
	
}
