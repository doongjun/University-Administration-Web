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
import kr.co.metanet.university.service.MemberService;
import kr.co.metanet.university.service.ProfessorLectureService;

@Controller
@RequestMapping(path="/professorLecture")
public class ProfessorLectureController {
	
	@Autowired
	@Qualifier("kr.co.metanet.university.service.impl.ProfessorLectureServiceImpl")
	private ProfessorLectureService service;
	
	//@Autowired
	//@Qualifier("kr.co.metanet.university.service.impl.MemberServiceImpl")
	//private MemberService mservice;
	
	private final MemberService mservice;
	
	public ProfessorLectureController(MemberService mservice) {
		this.mservice = mservice;
	}
	
	@GetMapping("/createform")
	public String createform(Principal principal, Model model,HttpSession session) {
		//principal로 사용자정보 세션관리
		String loginCode = principal.getName();
		MemberProfessor professor = mservice.getProfessorByCode(loginCode);
		session.setAttribute("professor",professor);
		
		return "professorLecture/createform";
	}

	@GetMapping("/updateform")
	public String updateform(@RequestParam("id") int id, Model model) {
		LectureVO lecture = service.getLecture(id);
		model.addAttribute("vo", lecture);
		return "professorLecture/updateform";
	}
	
	@GetMapping("/lecture-list")
	public String lectureList(Principal principal, Model model, HttpSession session) {
		String loginCode = principal.getName();
		MemberProfessor professor = mservice.getProfessorByCode(loginCode);
		session.setAttribute("professor",professor);
		
		List<LectureVO> list = service.getAllLecture(professor.getId());
		model.addAttribute("vo",list);
		return "professorLecture/lecture-list";
	}
	
}
