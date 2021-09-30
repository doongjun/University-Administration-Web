	package kr.co.metanet.university.controller;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@Autowired
	private MemberService memberService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public MemberController() {
		
	}
	/*
	public MemberController(MemberService memberService, PasswordEncoder passwordEncoder) {
		this.memberService = memberService;
		this.passwordEncoder = passwordEncoder;
	}*/

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
	public String mypage(Principal principal, ModelMap modelMap) {
		String loginCode = principal.getName();

		Member member = memberService.getMemberByCode(loginCode);
		String roleName = member.getRoleName();

		String page = "common/404error";

		if (roleName.equals("ROLE_USER")) {
			// 학생
			MemberStudent student = memberService.getStudentByCode(loginCode);
			// session.setAttribute("member", student);
			modelMap.addAttribute("member", student);
			page = "members/student_info";
		} else if (roleName.equals("ROLE_PROF")) {
			// 교수
			MemberProfessor professor = memberService.getProfessorByCode(loginCode);
			// session.setAttribute("professor", professor);
			modelMap.addAttribute("professor", professor);
			page = "members/professor_info";
		} else if (roleName.equals("ROLE_ADMIN")) {
			// 관리자
			MemberAdmin admin = memberService.getAdminByCode(loginCode);
			// session.setAttribute("admin", admin);
			modelMap.addAttribute("admin", admin);
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

	// 학생 관리 (관리자)
	@GetMapping("/student-list")
	public String studentList(Model model) {
		List<MemberStudent> studentList = memberService.selectStudentList();
		model.addAttribute("studentList", studentList);
		return "members/student-list";
	}

	// 학생 상세 정보
	@GetMapping("/student-info")
	@ResponseBody
	public MemberStudent studentInfo(HttpServletRequest request) {
		String code = request.getParameter("code");
		log.info("result ::: " + code);
		MemberStudent memberStudent = memberService.getStudentByCode(code);
		return memberStudent;
	}

	// 학생 추가(관리자)
	@PostMapping("/add-student")
	@ResponseBody
	public Map<String, Object> addStudent(@RequestParam Map<String, Object> params) throws ParseException {
		Map<String, Object> map = new HashMap<>();
		map.put("cnt", 0);
		int cnt = memberService.getUserCount((String)params.get("code"));
		if(cnt > 0) {
			map.put("cnt", cnt);
			return map;
		}
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String pw = (String) params.get("password");
		params.put("password", encoder.encode(pw));
		params.put("grade", Integer.parseInt((String) params.get("grade")));
		params.put("departmentCode", Integer.parseInt((String) params.get("departmentCode")));
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		String birthdayString = (String) params.get("birthday");
		String admissionDateString = (String) params.get("admissionDate");
		
		Date birthday= fm.parse(birthdayString);
		Date admissionDate= fm.parse(admissionDateString);
		
		params.put("birthday", birthday);
		params.put("admissionDate", admissionDate);
		
		memberService.addMemberStudent(params);
		return map;
	}
	
	// 학생 수정(관리자)
	@PostMapping("/edit-student")
	@ResponseBody
	public Map<String, Object> editStudent(@RequestParam Map<String, Object> params) throws ParseException {
		Map<String, Object> map = new HashMap<>();
		map.put("cnt", 0);
		
		if(!params.get("code").equals(params.get("conditionCode"))){
			int cnt = memberService.getUserCount((String)params.get("code"));
			if(cnt > 0) {
				map.put("cnt", cnt);
				return map;
			}
		}
		
		params.put("grade", Integer.parseInt((String) params.get("grade")));
		params.put("departmentCode", Integer.parseInt((String) params.get("departmentCode")));
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		String birthdayString = (String) params.get("birthday");
		String admissionDateString = (String) params.get("admissionDate");
		
		Date birthday= fm.parse(birthdayString);
		Date admissionDate= fm.parse(admissionDateString);
		
		params.put("birthday", birthday);
		params.put("admissionDate", admissionDate);
		
		memberService.editMemberStudent(params);
		
		return map;
	}
	
	//학생 삭제(관리자)
	@PostMapping("/delete-student")
	public String deleteStudent(@RequestParam String code) {
		memberService.deleteMemberStudent(code);
		return "redirect:/members/student-list";
	}
}
