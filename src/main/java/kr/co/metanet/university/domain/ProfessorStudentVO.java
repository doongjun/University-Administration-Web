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
public class ProfessorStudentVO {

	private int student_id;
	private String dept_name;
	private String student_name;
	private int grade;
	private String score;
	//private int enrollment;?
}
