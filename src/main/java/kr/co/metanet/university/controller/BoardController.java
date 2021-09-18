package kr.co.metanet.university.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.metanet.university.domain.BoardVO;
import kr.co.metanet.university.service.BoardService;


@RequestMapping(path="/board")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	@GetMapping("/list")
	private void boardlist(Model model) {
		List<BoardVO> list=service.boardlist();
		model.addAttribute("list",list);
		

	}
}
