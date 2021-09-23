package kr.co.metanet.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.metanet.university.domain.Criteria;
import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.service.ClassRegisterService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping(path="/classRegist")
public class ClassRegistController {
	
	@Autowired
	private ClassRegisterService service;
	
	@GetMapping("/calendar")
	public String calendarGet() {
		log.info("calendar.jsp get 요청");
		return "classRegist/calendar";
	}
	
	@GetMapping("/regist")
	public String registGet(Criteria cri,Model model) {
		List<LectureVO> vo = service.getLectureList(cri);
		
		model.addAttribute("vo",vo);
		
		return "classRegist/regist";
	}

}
