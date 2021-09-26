package kr.co.metanet.university.domain;

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
	//lecture table 용
	private int id;
	private int professor_id;
	private String lecture_year;
	private String lecture_code;
	private String lecture_name;
	private String grade;
	private String classroom;
	private String division;
	private String lecture_time;
	private String semester;
	private int student_count;
	private int student_full;
	private int credit;
	private String section;
	private int dept_code;
	private String remarks;
	private String department_name;
	
	//student_lecture table 용
	private int student_id;
	private int lecture_id;
	private String score;
	private int enrolment;
	
	//사용보류
	private String schedule;
}
