package kr.co.metanet.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.service.StudentLectureService;
import kr.co.metanet.university.util.Utility;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping(path="/studentLecture")
public class StudentLectureController {
	
	@Autowired
	private StudentLectureService service;
	
	
	@GetMapping("/list")
	public String listGet(int student_id, Model model) {
		log.info("수강내역조회 페이지 요청");
		
		int year = Utility.getYear();
		String semester = Utility.getSemester();
		
		List<LectureVO> vo = service.getStudentLectureList(student_id);
		
		model.addAttribute("vo",vo);
		model.addAttribute("year",year);
		model.addAttribute("semester",semester);
		
		return "classRegist/list";
	}
	
	@GetMapping("/calendar")
	public String calendar(Model model) {
		log.info("시간표죠회 페이지 요청");
		
		return "classRegist/calendar";
	}
}
