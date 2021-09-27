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
import kr.co.metanet.university.domain.Tuition;
import kr.co.metanet.university.service.LectureService;
import kr.co.metanet.university.service.MemberService;
import kr.co.metanet.university.service.TuitionService;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping(path="/lecture")
public class LectureController {
	
	@Autowired
	@Qualifier("kr.co.metanet.university.service.impl.LectureServiceImpl")
	private LectureService service;
	
	@Autowired
	private TuitionService tuitionService;
	
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
	public String list(Principal principal, Model model) {
		List<LectureVO> list = service.getAllLecture();
		model.addAttribute("vo",list);
		
		// 강의계획표 부분
		String code = principal.getName();
		
		Tuition tuition = tuitionService.selectTuition(code);
		String filePath = tuition.getFilePath();
		String fileName = tuition.getFileName();
		
		log.info("filePath ::: " + filePath);
		log.info("fileName ::: " + fileName);
		
		StringBuffer sb = new StringBuffer();
		sb.append("../").append(filePath).append(fileName);
		
		log.info("saveFilePath ::: " + sb.toString());
		
		model.addAttribute("fileName", fileName);
		model.addAttribute("saveFilePath", sb.toString());
		
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
