package kr.co.metanet.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.service.LectureService;

@Controller
@RequestMapping(path="/professorLecture")
public class ProfessorLectureController {
	
	@Autowired
	@Qualifier("kr.co.metanet.university.service.impl.LectureServiceImpl")
	private LectureService service;
	
	@GetMapping("/createform")
	public String createform(Model model) {
		return "professorLecture/create";
	}

	@GetMapping("/updateform")
	public String updateform(@RequestParam("id") int id, Model model) {
		LectureVO lecture = service.getLecture(id);
		model.addAttribute("vo", lecture);
		return "professorLecture/updateform";
	}
	
	@GetMapping("/lecture-list")
	public String lectureList(Model model) {
		List<LectureVO> list = service.getAllLecture();
		model.addAttribute("vo",list);
		return "professorLecture/lecture-list";
	}
	
}
