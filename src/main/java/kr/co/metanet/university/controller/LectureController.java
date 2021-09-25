package kr.co.metanet.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.service.LectureService;

@Controller
@RequestMapping(path="/lecture")
public class LectureController {
	
	@Autowired
	@Qualifier("kr.co.metanet.university.service.impl.LectureServiceImpl")
	private LectureService service;
	
	//이전수강내역조회
	@GetMapping("/prevLecture")
	//@RequestMapping(value="/prevLecture",method = RequestMethod.GET)
	public String prevLecture(Model model) {
		//student id와 연동되어야함
		List<LectureVO> list = service.getAllLecture();
		model.addAttribute("vo",list);
		return "lecture/prevLecture";
	}
	
	//모든 강의/강의계획서 조회
	@GetMapping("/lecture-list")
	//@RequestMapping(value="/prevLecture",method = RequestMethod.GET)
	public String list(Model model) {
		List<LectureVO> list = service.getAllLecture();
		model.addAttribute("vo",list);
		return "lecture/lecture-list";
	}
	
}
