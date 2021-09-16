package kr.co.metanet.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.service.LectureService;

@RestController
public class LectureRESTController {
		
	@Autowired
	@Qualifier("kr.co.metanet.university.service.impl.LectureServiceImpl")
	private LectureService service;
	
	public LectureRESTController() {
		System.out.println("LectureContorller test »£√‚");
	}

	@RequestMapping(value= {"/api/get-lecture"}, method=RequestMethod.GET)
	public List<LectureVO> getLectureTest(){
		List<LectureVO> list = service.getAllLecture();
		return list; 
	}
}
