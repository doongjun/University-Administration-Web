package kr.co.metanet.university.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.metanet.university.service.MemberService;

@Controller
public class MainController {
	private final MemberService memberService;
	
	public MainController(MemberService memberService) {
		this.memberService = memberService;
	}
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/main")
	@ResponseBody
	public String main() {
		return "main page";
	}
	
	@RequestMapping("/securepage")
	@ResponseBody
	public String securitypage() {
		return "secure page";
	}
	
	
}
