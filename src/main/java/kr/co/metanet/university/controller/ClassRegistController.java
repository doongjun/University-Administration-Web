package kr.co.metanet.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.metanet.university.domain.Criteria;
import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.domain.PageVO;
import kr.co.metanet.university.service.ClassRegisterService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping(path="/classRegist")
public class ClassRegistController {
	
	@Autowired
	private ClassRegisterService service;
	
	@GetMapping("/regist")
	public String registGet(Criteria cri,Model model) {
		log.info("수강신청 페이지 요청");
		
		List<LectureVO> vo = service.getLectureList(cri);
		
		int total = service.LectureListTotal(cri);//service.totalCnt(eno, workDay);
		log.info("total : " + total);
		
		model.addAttribute("pageVo", new PageVO(cri, total));
		model.addAttribute("vo",vo);
		
		return "classRegist/regist";
	}
	
	@GetMapping("/search")
	public String searchGet(Criteria cri,Model model) {
		log.info("수강신청 페이지 검색 요청 : " + cri.getFlag());
		
		List<LectureVO> vo = null;
		
		int total = 0;
		
		if(cri.getFlag().equals("1")) {
			total = service.searchList1Total(cri);
			log.info("total : " + total);
			
			vo = service.getSearchList1(cri);
		}
		
		if(cri.getFlag().equals("2")) {
			total = service.searchList2Total(cri);
			log.info("total : " + total);
			
			vo = service.getSearchList2(cri);
		}		
		
		model.addAttribute("pageVo", new PageVO(cri, total));
		model.addAttribute("vo",vo);
		
		return "classRegist/regist";
	}

}
