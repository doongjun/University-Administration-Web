package kr.co.metanet.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.service.ClassRegisterService;

@Controller
@RequestMapping(path="/classRegist")
public class ClassRegistController {
	
	@Autowired
	private ClassRegisterService service;
	
	@GetMapping("/calendar")
	public String calendarGet() {
		return "classRegist/calendar";
	}
	
	@GetMapping("/regist")
	public String registGet(Model model) {
		List<LectureVO> vo = service.getLectureList();
		
		model.addAttribute("vo",vo);
		
		return "classRegist/regist";
	}
}
