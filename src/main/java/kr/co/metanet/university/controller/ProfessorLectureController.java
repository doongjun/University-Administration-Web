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
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.domain.MemberProfessor;
import kr.co.metanet.university.domain.MemberStudent;
import kr.co.metanet.university.domain.StudentLectureVO;
import kr.co.metanet.university.service.MemberService;
import kr.co.metanet.university.service.ProfessorLectureService;
import kr.co.metanet.university.service.ProfessorStudentService;

@Controller
@RequestMapping(path="/professorLecture")
public class ProfessorLectureController {
	
	@Autowired
	@Qualifier("kr.co.metanet.university.service.impl.ProfessorLectureServiceImpl")
	private ProfessorLectureService lectureService;
	
	@Autowired
	@Qualifier("kr.co.metanet.university.service.impl.ProfessorStudentServiceImpl")
	private ProfessorStudentService studentService;
	
	private final MemberService memberService;
	
	public ProfessorLectureController(MemberService service) {
		this.memberService = service;
	}
	
	@GetMapping("/createform")
	public String createform(Principal principal, Model model,HttpSession session) {
		//principal로 사용자정보 세션관리
		String loginCode = principal.getName();
		MemberProfessor professor = memberService.getProfessorByCode(loginCode);
		session.setAttribute("professor",professor);
		
		return "professorLecture/createform";
	}

	@GetMapping("/updateform")
	public String updateform(@RequestParam("id") int id, Model model) {
		LectureVO lecture = lectureService.getLecture(id);
		model.addAttribute("vo", lecture);
		return "professorLecture/updateform";
	}
	
	@GetMapping("/lecture-list")
	public String lectureList(Principal principal, Model model, HttpSession session) {
		String loginCode = principal.getName();
		MemberProfessor professor = memberService.getProfessorByCode(loginCode);
		session.setAttribute("professor",professor);
		
		List<LectureVO> list = lectureService.getAllLecture(professor.getId());
		model.addAttribute("vo",list);
		return "professorLecture/lecture-list";
	}
	
	@GetMapping("/score-lecture-list")
	public String scoreLectureList(Principal principal, Model model, HttpSession session) {
		String loginCode = principal.getName();
		MemberProfessor professor = memberService.getProfessorByCode(loginCode);
		session.setAttribute("professor",professor);
		
		List<LectureVO> list = lectureService.getAllLecture(professor.getId());
		model.addAttribute("vo",list);
		return "professorLecture/score-lecture-list";
	}
	
	
	@GetMapping("/student-list")
	public String studentlist(@RequestParam("lecture_id") int lecture_id, Model model) {
		List<MemberStudent> list = studentService.getAllStudent(lecture_id);
		List<StudentLectureVO> list2 = studentService.getAllScore(lecture_id);
		model.addAttribute("vo",list);
		model.addAttribute("svo",list2);
		model.addAttribute("lecture_id",lecture_id);
		return "professorLecture/student-list";
	}
	
}
