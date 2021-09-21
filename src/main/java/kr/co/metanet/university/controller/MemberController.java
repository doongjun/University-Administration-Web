package kr.co.metanet.university.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
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
	public String loginerror(@RequestParam("login_error") String loginError) {
		return "members/loginerror";
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
			modelMap.addAttribute("member", student);
			page = "members/student_info";
		} else if (roleName.equals("ROLE_PROF")) {
			// 교수
			MemberProfessor professor = memberService.getProfessorByCode(loginCode);
			modelMap.addAttribute("professor", professor);
			page = "members/professor_info";
		} else if (roleName.equals("ROLE_ADMIN")) {
			// 관리자
			MemberAdmin admin = memberService.getAdminByCode(loginCode);
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
	
	//등록금 파일 업로드 폼(관리자)
	@GetMapping("/tuition-form")
	public String tuition() {
		return "members/tuition-form";
	}
	
	//등록금 파일 업로드 폼(관리자)
	@PostMapping("/upload-tuition")
	public String uploadTuition(@RequestParam("file") MultipartFile file) {

		log.info("File Name :: " + file.getOriginalFilename());
		log.info("File Size :: " + file.getSize());

		try(FileOutputStream fos = new FileOutputStream("c:/tmp/" + file.getOriginalFilename());
				InputStream is = file.getInputStream();) {
			int readCount = 0;
			byte[] buffer = new byte[1024];
			
			while((readCount = is.read(buffer)) != -1) {
				fos.write(buffer, 0, readCount);
			}
			
		}catch(Exception e) {
			throw new RuntimeException("File Save Error");
		}

		return "members/uploadok";
	}

}
