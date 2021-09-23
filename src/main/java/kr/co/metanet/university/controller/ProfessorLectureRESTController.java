package kr.co.metanet.university.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.service.LectureService;

@RestController
@RequestMapping(path="/api/professorLecture")
public class ProfessorLectureRESTController {
	
	@Autowired
	@Qualifier("kr.co.metanet.university.service.impl.LectureServiceImpl")
	private LectureService lectureService;
	
	@PostMapping("/create")
	public String create(@RequestParam HashMap<String,String> params) throws Exception {
		LectureVO lecture = new LectureVO();
		//test
		lecture.setProfessor_id(1);
		String lecture_code = "000004";
		lecture.setLecture_code(lecture_code);
		lecture.setLecture_year("2021");
		lecture.setSemester("1학기");
		lecture.setDept_code(1);
		
		//real input
		lecture.setLecture_name((String)params.get("lecture_name"));
		lecture.setGrade(params.get("grade"));
		lecture.setClassroom((String)params.get("classroom"));
		lecture.setLecture_time((String)params.get("lecture_time"));
		lecture.setSection((String)params.get("section"));
		lecture.setCredit(Integer.valueOf(params.get("credit")));
		lecture.setDivision((String)params.get("division"));
		lecture.setRemarks((String)params.get("remarks"));
		lecture.setStudent_count(0);
		lecture.setStudent_full(Integer.valueOf(params.get("student_full")));
		
		int flag = lectureService.create(lecture);
		
		if (flag >0){
			//성공창 띄워주기
		}else {
			//실패창 return
		}
		System.out.println(flag);
		System.out.println(lecture.toString());
		
		return lecture.toString();
	}
	
	
}
