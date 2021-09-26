package kr.co.metanet.university.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.domain.MemberStudent;
import kr.co.metanet.university.domain.StudentLectureVO;
import kr.co.metanet.university.service.LectureService;
import kr.co.metanet.university.service.MemberService;

@Controller
@RequestMapping(path="/lecture")
public class LectureController {
	
	@Autowired
	@Qualifier("kr.co.metanet.university.service.impl.LectureServiceImpl")
	private LectureService service;
	
	private final MemberService memberService;
	
	public LectureController(MemberService service) {
		this.memberService = service;
	}
	
	//이전수강내역조회
	@GetMapping("/prevLecture")
	public String prevLecture(Model model) {
		//student id와 연동되어야함
		List<LectureVO> list = service.getAllLecture();
		model.addAttribute("vo",list);
		return "/lecture/prevLecture";
	}
	
	//모든 강의/강의계획서 조회
	@GetMapping("/lecture-list")
	public String list(Model model) {
		List<LectureVO> list = service.getAllLecture();
		model.addAttribute("vo",list);
		return "/lecture/lecture-list";
	}
	
	//성적조회페이지
	@GetMapping("/score-list")
	public String scoreList(Principal principal, HttpSession session) {
		String loginCode = principal.getName();
		MemberStudent student = memberService.getStudentByCode(loginCode);
		session.setAttribute("student_id", student.getId());
		return "lecture/score-list";
	}
	
	//성적검색
	@GetMapping("/get-score-list")
	public String getScoreList(@RequestParam int student_id, @RequestParam String lecture_year, @RequestParam String semester,Model model){
		List<StudentLectureVO> vo = service.getScoreList(student_id,lecture_year,semester);
		model.addAttribute("vo",vo);
		return "lecture/score-list";
	}
	
}
