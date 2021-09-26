package kr.co.metanet.university.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.service.LectureService;
import kr.co.metanet.university.service.ProfessorStudentService;
import kr.co.metanet.university.util.Utility;

@RestController
@RequestMapping(path = "/api/professorLecture")
public class ProfessorLectureRESTController {

	@Autowired
	@Qualifier("kr.co.metanet.university.service.impl.LectureServiceImpl")
	private LectureService lectureService;
	
	@Autowired
	@Qualifier("kr.co.metanet.university.service.impl.ProfessorStudentServiceImpl")
	private ProfessorStudentService studentService;
	
	@PostMapping("/create")
	public ResponseEntity<String> create(@RequestParam HashMap<String, String> params) throws Exception {
		LectureVO lecture = new LectureVO();
		// test
		String lecture_code = "000004";
		lecture.setLecture_code(lecture_code);
		// real input
		lecture.setLecture_year(String.valueOf(Utility.getYear()));
		lecture.setSemester(Utility.getSemester());
		lecture.setProfessor_id(Integer.valueOf(params.get("professor_id")));
		lecture.setDept_code(Integer.valueOf(params.get("dept_code")));
		lecture.setLecture_name(params.get("lecture_name"));
		lecture.setGrade(params.get("grade"));
		lecture.setClassroom(params.get("classroom"));
		lecture.setLecture_time(params.get("lecture_time"));
		lecture.setSection(params.get("section"));
		lecture.setCredit(Integer.valueOf(params.get("credit")));
		lecture.setDivision(params.get("division"));
		lecture.setRemarks(params.get("remarks"));
		lecture.setStudent_count(0);
		lecture.setStudent_full(Integer.valueOf(params.get("student_full")));

		int flag = lectureService.create(lecture);

		if(flag >0) {
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("failed",HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	@PostMapping("/update")
	public ResponseEntity<String> update(@RequestParam HashMap<String, String> params) throws Exception {
		LectureVO lecture = new LectureVO();
		
		lecture.setId(Integer.valueOf(params.get("id")));
		lecture.setLecture_code(params.get("lecture_code"));
		lecture.setDept_code(Integer.valueOf(params.get("dept_code")));
		lecture.setLecture_name(params.get("lecture_name"));
		lecture.setGrade(params.get("grade"));
		lecture.setClassroom(params.get("classroom"));
		lecture.setLecture_time(params.get("lecture_time"));
		lecture.setSection(params.get("section"));
		lecture.setCredit(Integer.valueOf(params.get("credit")));
		lecture.setDivision(params.get("division"));
		lecture.setRemarks(params.get("remarks"));
		lecture.setStudent_full(Integer.valueOf(params.get("student_full")));
		
		int flag = lectureService.update(lecture);

		if(flag >0) {
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("failed",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<String> delete(@PathVariable("id") int id) throws Exception {
		int flag = lectureService.delete(id);
		
		if(flag >0) {
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("failed",HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PostMapping("/updateScore")
	public ResponseEntity<String> updateScore(@RequestParam HashMap<String, String> params) throws Exception {
		String score = params.get("score");
		int student_id = Integer.valueOf(params.get("student_id"));
		int lecture_id = Integer.valueOf(params.get("lecture_id"));
		
		int flag = studentService.updateScore(score, student_id, lecture_id);

		if(flag >0) {
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("failed",HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@DeleteMapping("/deleteStudent/{student_id}/{lecture_id}")
	public ResponseEntity<String> deleteStudent(@PathVariable("student_id") int student_id, @PathVariable("lecture_id") int lecture_id) throws Exception {
		int flag = studentService.deleteStudent(student_id, lecture_id);
		
		if(flag >0) {
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("failed",HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
		
	
	

}
