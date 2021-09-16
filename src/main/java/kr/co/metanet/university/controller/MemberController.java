package kr.co.metanet.university.controller;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.metanet.university.domain.Member;
import kr.co.metanet.university.domain.MemberAdmin;
import kr.co.metanet.university.domain.MemberProfessor;
import kr.co.metanet.university.domain.MemberStudent;
import kr.co.metanet.university.service.MemberService;

@Controller
@RequestMapping(path="/members")
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
	public String loginerror(@RequestParam("login_error") String loginError) {
		return "members/loginerror";
	}
	
	@GetMapping("/mypage")
	public String mypage(Principal principal, ModelMap modelMap) {
		String loginCode = principal.getName();

		Member member = memberService.getMemberByCode(loginCode);
		String roleName = member.getRoleName();
		
		String page = "common/404error";
		
		if(roleName.equals("ROLE_USER")) {
			//학생
			MemberStudent student = memberService.getStudentByCode(loginCode);
			modelMap.addAttribute("member", student);
			page = "members/student_info";
		}else if(roleName.equals("ROLE_PROF")) {
			//교수
			MemberProfessor professor = memberService.getProfessorByCode(loginCode);
			modelMap.addAttribute("professor", professor);
			page = "members/professor_info";
		}else {
			//관리자
			MemberAdmin admin = memberService.getAdminByCode(loginCode);
			modelMap.addAttribute("admin", admin);
			page = "members/admin_info";
		}
		
		return page;
	}
	
	@GetMapping("/pw-change-form")
	public String pwchange(){
		return "members/pw_change";
	}
	
	@PostMapping("/pw-change")
	public String pwchange(@RequestParam("curPassword") String curPassword,
			@RequestParam("val-password") String valPassword,
			Principal principal,
			RedirectAttributes ra) {
		String loginCode = principal.getName();
		Member member = memberService.getMemberByCode(loginCode);
		
		String memberPassword = member.getPassword();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(!encoder.matches(curPassword, memberPassword)) {
			ra.addFlashAttribute("message", "wrongPassword");
			return "redirect:/members/pw-change-form";
		}
		
		memberService.updatePassword(loginCode, encoder.encode(valPassword));
		
		return "redirect:/logout";
	}
	
	
}
