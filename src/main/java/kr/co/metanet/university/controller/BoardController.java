package kr.co.metanet.university.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.metanet.university.domain.BoardCriteriaVO;
import kr.co.metanet.university.domain.BoardPageVO;
import kr.co.metanet.university.domain.BoardVO;
import kr.co.metanet.university.service.BoardService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RequestMapping(path="/board")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	//공지사항 게시판 조회
	@GetMapping("/boardlist")
	private void boardlist(Model model, BoardCriteriaVO cri) {
		List<BoardVO> list=service.boardlist(cri);
		log.info("*****전체list*****");
		model.addAttribute("list",list);
		log.info(list);
		int total=service.total(cri);
		log.info(total);
		
		BoardPageVO BoardPageVO = new BoardPageVO(cri, total);
		model.addAttribute("BoardPageVO", BoardPageVO);
	
	}
	
	//조회수 증가
	
	@PostMapping("/addviews")
	@ResponseBody
	public String addview(@RequestBody String b_noval) {
		log.info("*****조회수 증가*****");
		//b_no 가져오기
		int b_no=Integer.parseInt(b_noval);
		//현재 조회수 가져오기
		BoardVO vo=service.view(b_no);
		
		//조회수 1 증가
		int views=vo.getB_views()+1;	
		String last_views=Integer.toString(views);
		return last_views;
	}
	
	//글 조회
	@GetMapping("/view")
	public void view(int b_no, Model  model) {
		log.info("*****게시글 조회*****"+b_no);
		
		//현재 조회수 가져오기
		BoardVO vo=service.view(b_no);
//		int views=vo.getB_views();
//		if (b_views - views == 1 || b_views == 1){			
//			service.addviews(b_views, b_no);
//		}
		
		
		model.addAttribute("vo",vo);
	}
	
	//관리자 글작성
	
	@GetMapping("/write")
	public void gowrite(HttpSession session) {
		log.info("***** 공지사항 작성하러 가기 *****");
		
		
	}
	
	//@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
//	@PreAuthorize("hasRole('ROLE_ADMIN')"), HttpSession session, Authentication authentication
	@PostMapping("/write")
	public String write(BoardVO vo, RedirectAttributes rttr, HttpSession session) {
		log.info("***** 공지사항 작성 *****");
		//사용자정보
		session.getAttribute("admin");
		
		if(service.insert(vo)) {
			rttr.addFlashAttribute("result", "게시글 등록 성공");
			return "redirect:boardlist";
		}else {
			rttr.addFlashAttribute("result", "실패");
			return "redirect:write";
		}
		
		
	}
}