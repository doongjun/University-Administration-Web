package kr.co.metanet.university.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.metanet.university.domain.Criteria;
import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.domain.MemberStudent;
import kr.co.metanet.university.domain.PageVO;
import kr.co.metanet.university.domain.StudentLectureVO;
import kr.co.metanet.university.domain.Tuition;
import kr.co.metanet.university.service.LectureService;
import kr.co.metanet.university.service.MemberService;
import kr.co.metanet.university.service.ProfessorStudentService;
import kr.co.metanet.university.service.TuitionService;
import lombok.extern.log4j.Log4j2;
import kr.co.metanet.university.util.Utility;

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

	// 이전수강내역조회
	@GetMapping("/prevLecture")
	public String prevLecture(Principal principal, HttpSession session, Model model) {
		String loginCode = principal.getName();
		MemberStudent student = memberService.getStudentByCode(loginCode);
		session.setAttribute("student_id", student.getId());
		String semester = Utility.getSemester();
		String this_year = String.valueOf(Utility.getYear());
		String last_year = String.valueOf(Utility.getYear() - 1);

		List<LectureVO> list = service.getPrevLectureList(semester,this_year,last_year,student.getId());
		model.addAttribute("vo", list);
		return "/lecture/prevLecture";
	}

	// 선택수강내역조회
	@GetMapping("/selected-prevLecture")
	public String selectedPrevLecture(@RequestParam int student_id, @RequestParam String lecture_year,
			@RequestParam String semester, Principal principal, HttpSession session, Model model) {
		String loginCode = principal.getName();
		MemberStudent student = memberService.getStudentByCode(loginCode);
		session.setAttribute("student_id", student.getId());
		
		List<LectureVO> list = service.getSelectedPrevLectureList(semester,lecture_year,student.getId());
		model.addAttribute("vo", list);
		model.addAttribute("year",lecture_year);
		model.addAttribute("semester",semester);
		return "/lecture/prevLecture";
	}

	// 모든 강의/강의계획서 조회
	@GetMapping("/syllabus")
	public String list(Principal principal, Criteria cri, Model model) {
		int total = service.allLectureTotal(cri);
		
		List<LectureVO> list = service.getAllLecture(cri);
		model.addAttribute("vo", list);
		model.addAttribute("pageVo", new PageVO(cri, total));
		
		return "/lecture/syllabus";
	}
	
	// 강의계획서 검색
	@GetMapping("/search")
	public String search(Principal principal, Criteria cri, Model model) {
		int total = service.searchLectureTotal(cri);
		
		List<LectureVO> list = service.getSearchLecture(cri);
		model.addAttribute("vo", list);
		model.addAttribute("pageVo", new PageVO(cri, total));
		
		return "/lecture/syllabus";
	}

	// 성적조회페이지
	@GetMapping("/score-list")
	public String scoreList(Principal principal, HttpSession session) {
		String loginCode = principal.getName();
		MemberStudent student = memberService.getStudentByCode(loginCode);
		session.setAttribute("student_id", student.getId());
		return "lecture/score-list";
	}

	// 성적검색
	@GetMapping("/get-score-list")
	public String getScoreList(@RequestParam int student_id, @RequestParam String lecture_year,
			@RequestParam String semester, Model model) {
		List<StudentLectureVO> vo = service.getScoreList(student_id, lecture_year, semester);
		model.addAttribute("vo", vo);
		model.addAttribute("year",lecture_year);
		model.addAttribute("semester",semester);
		return "lecture/score-list";
	}

}
