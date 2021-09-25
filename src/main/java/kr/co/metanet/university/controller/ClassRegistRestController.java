package kr.co.metanet.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.metanet.university.service.ClassRegisterService;
import kr.co.metanet.university.service.StudentLectureService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping(path="/classRegist")
public class ClassRegistRestController {
	
	@Autowired
	private ClassRegisterService service;
	
	@GetMapping("/rest_dept")
	public ResponseEntity<List<String>> deptList() {
		log.info("학과 이름 가져오기");
		
		return new ResponseEntity<List<String>>(service.deptList(), HttpStatus.OK);
	}
	
	
}
