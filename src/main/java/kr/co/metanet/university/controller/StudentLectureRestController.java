package kr.co.metanet.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.service.StudentLectureService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping(path="/studentLecture")
public class StudentLectureRestController {
	
	@Autowired
	private StudentLectureService service;
	
	@PutMapping("/rest_new/{student_id}/{lecture_id}" )
	public ResponseEntity<String> insert(@PathVariable("student_id") int student_id, @PathVariable("lecture_id") int lecture_id) {
		log.info("수강내역 삽입");
		
		return service.insert(student_id, lecture_id) ? new ResponseEntity<String>("success",HttpStatus.OK)
				: new ResponseEntity<String>("failed",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping("/rest_delete/{student_id}/{lecture_id}" )
	public ResponseEntity<String> delete(@PathVariable("student_id") int student_id, @PathVariable("lecture_id") int lecture_id) {
		log.info("수강내역 삭제");
		
		return service.delete(student_id, lecture_id) ? new ResponseEntity<String>("success",HttpStatus.OK)
				: new ResponseEntity<String>("failed",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/rest_calendar")
	public ResponseEntity<List<LectureVO>> calendar() {
		log.info("시간표죠회 페이지 요청");
		
		List<LectureVO> vo = service.getStudentLectureList();
		
		return new ResponseEntity<List<LectureVO>>(vo, HttpStatus.OK);
	}
}
