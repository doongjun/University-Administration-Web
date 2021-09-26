package kr.co.metanet.university.controller;

import java.security.Principal;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.metanet.university.domain.Member;
import kr.co.metanet.university.domain.MemberAdmin;
import kr.co.metanet.university.domain.MemberProfessor;
import kr.co.metanet.university.domain.MemberStudent;
import kr.co.metanet.university.service.MemberService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping(path = "/members")
public class MemberController {
	private final MemberService memberService;
	private final PasswordEncoder passwordEncoder;

	public MemberController(MemberService memberService, PasswordEncoder passwordEncoder) {
		this.memberService = memberService;
		this.passwordEncoder = passwordEncoder;
	}

	@GetMapping("/loginform")
	public String loginform() {
		return "members/loginform";
	}

	@RequestMapping("/loginerror")
	public String loginerror(@RequestParam("login_error") String loginError, RedirectAttributes ra) {
		ra.addFlashAttribute("message", "loginError");
		return "redirect:/members/loginform";
	}
	
	// 세션 할당
	@GetMapping("/home")
	public String home(Principal principal, HttpSession session) {
		String loginCode = principal.getName();

		Member member = memberService.getMemberByCode(loginCode);
		String roleName = member.getRoleName();

		String page = "common/404error";

		if (roleName.equals("ROLE_USER")) {
			// 학생
			MemberStudent student = memberService.getStudentByCode(loginCode);
			session.setAttribute("member", student);
			page = "/board/boardlist";
			
		} else if (roleName.equals("ROLE_PROF")) {
			// 교수
			MemberProfessor professor = memberService.getProfessorByCode(loginCode);
			session.setAttribute("member", professor);
			page = "/board/boardlist";
			
		} else if (roleName.equals("ROLE_ADMIN")) {
			// 관리자
			MemberAdmin admin = memberService.getAdminByCode(loginCode);
			session.setAttribute("member", admin);
			page = "/board/boardlist";
			
		}

		return "redirect:" + page;
	}
	
	// 마이페이지
	@GetMapping("/mypage")
	public String mypage(Principal principal, HttpSession session) {
		String loginCode = principal.getName();

		Member member = memberService.getMemberByCode(loginCode);
		String roleName = member.getRoleName();

		String page = "common/404error";

		if (roleName.equals("ROLE_USER")) {
			// 학생
			//MemberStudent student = memberService.getStudentByCode(loginCode);
			//session.setAttribute("member", student);
			//modelMap.addAttribute("member", student);
			page = "members/student_info";
		} else if (roleName.equals("ROLE_PROF")) {
			// 교수
			//MemberProfessor professor = memberService.getProfessorByCode(loginCode);
			//session.setAttribute("professor", professor);
			//modelMap.addAttribute("professor", professor);
			page = "members/professor_info";
		} else if (roleName.equals("ROLE_ADMIN")) {
			// 관리자
			//MemberAdmin admin = memberService.getAdminByCode(loginCode);
			//session.setAttribute("admin", admin);
			//modelMap.addAttribute("admin", admin);
			page = "members/admin_info";
		}

		return page;
	}

	// 학생 마이페이지 수정
	@PostMapping("/update-student-info")
	public String updateStudentInfo(@RequestParam HashMap<String, String> params) {
		memberService.updateStudentInfo(params);
		return "redirect:/members/mypage";
	}

	// 교수 마이페이지 수정
	@PostMapping("/update-professor-info")
	public String updateProfessorInfo(@RequestParam HashMap<String, String> params) {
		memberService.updateProfessorInfo(params);
		return "redirect:/members/mypage";
	}

	// 관리자 마이페이지 수정
	@PostMapping("/update-admin-info")
	public String updateAdminInfo(@RequestParam HashMap<String, String> params) {
		memberService.updateAdminInfo(params);
		return "redirect:/members/mypage";
	}

	@GetMapping("/pw-change-form")
	public String pwchange() {
		return "members/pw-change-form";
	}

	@PostMapping("/pw-change")
	public String pwchange(@RequestParam("curPassword") String curPassword,
			@RequestParam("val-password") String valPassword, Principal principal, RedirectAttributes ra) {
		String loginCode = principal.getName();
		Member member = memberService.getMemberByCode(loginCode);

		String memberPassword = member.getPassword();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		if (!encoder.matches(curPassword, memberPassword)) {
			ra.addFlashAttribute("message", "wrongPassword");
		} else {
			memberService.updatePassword(loginCode, encoder.encode(valPassword));
			ra.addFlashAttribute("message", "success");
		}

		return "redirect:/members/pw-change-form";
	}
	
	//학생 관리 (관리자)
	@GetMapping("/student-list")
	public String studentList() {
		return "members/student-list";
	}
}
