package kr.co.metanet.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.domain.StudentLectureVO;
import kr.co.metanet.university.service.LectureService;

@RestController
@RequestMapping(path = "/api/lecture")
public class LectureRESTController {
		
	@Autowired
	@Qualifier("kr.co.metanet.university.service.impl.LectureServiceImpl")
	private LectureService service;
	
	public LectureRESTController() {
		System.out.println("LectureContorller test ȣ��");
	}

	@RequestMapping(value= {"/get-lecture"}, method=RequestMethod.GET)
	public List<LectureVO> getLectureTest(){
		List<LectureVO> list = service.getAllLecture();
		return list; 
	}
	
	@GetMapping("/get-scorelist/{student_id}/{lecture_year}/{semester}")
	public ResponseEntity<List<StudentLectureVO>> getScoreList(@PathVariable int student_id, @PathVariable String lecture_year, @PathVariable String semester){
		List<StudentLectureVO> vo = service.getScoreList(student_id,lecture_year,semester);
		return new ResponseEntity<List<StudentLectureVO>>(vo, HttpStatus.OK); 
	}
}
