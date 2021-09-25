package kr.co.metanet.university.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.metanet.university.domain.Tuition;
import kr.co.metanet.university.service.MemberService;
import kr.co.metanet.university.service.TuitionService;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping(path = "/tuition")
public class TuitionController {
	@Autowired
	private TuitionService tuitionService;

	@Autowired
	private MemberService memberService;

	// 등록금 파일 업로드 폼(관리자)
	@GetMapping("/tuition-form")
	public String tuition(Model model) {

		model.addAttribute("fileList", tuitionService.getTuitionFileList());

		return "tuition/tuition-form";
	}

	// 등록금 파일 업로드(관리자)
	@PostMapping("/upload-tuition")
	public String uploadTuition(@RequestParam("file") MultipartFile file, @RequestParam("code") String code,
			HttpServletRequest request, RedirectAttributes ra) {

		final String ROOT_PATH = request.getSession().getServletContext().getRealPath("/");
		final String ATTACH_PATH = "resources/upload/";

		log.info("File Name :: " + file.getOriginalFilename());
		log.info("File Size :: " + file.getSize());
		log.info("File ContentType :: " + file.getContentType());

		// 없는 학번 null 검사
		if (memberService.getMemberByCode(code) == null) {
			ra.addFlashAttribute("message", "noStudent");
			return "redirect:/tuition/tuition-form";
		}

		// 중복 체크
		if (tuitionService.checkTuitionCountByCode(code) > 0) {
			ra.addFlashAttribute("message", "overFile");
			return "redirect:/tuition/tuition-form";
		}

		Map<String, Object> params = new HashMap<>();
		params.put("code", code);
		params.put("fileName", file.getOriginalFilename());
		params.put("filePath", ATTACH_PATH);
		params.put("fileSize", file.getSize());
		params.put("contentType", file.getContentType());

		try (FileOutputStream fos = new FileOutputStream(ROOT_PATH + ATTACH_PATH + file.getOriginalFilename());
				InputStream is = file.getInputStream();) {
			int readCount = 0;
			byte[] buffer = new byte[1024];

			while ((readCount = is.read(buffer)) != -1) {
				fos.write(buffer, 0, readCount);
			}

			tuitionService.addTuition(params, code);

		} catch (Exception e) {
			throw new RuntimeException("File Save Error");
		}

		return "redirect:/tuition/tuition-form";
	}

	// 등록금 뷰(학생)
	@GetMapping("tuition-view")
	public String confirmTuition(Principal principal, ModelMap modelMap) {
		String code = principal.getName();
		
		Tuition tuition = tuitionService.selectTuition(code);
		String filePath = tuition.getFilePath();
		String fileName = tuition.getFileName();
		
		log.info("filePath ::: " + filePath);
		log.info("fileName ::: " + fileName);
		
		StringBuffer sb = new StringBuffer();
		sb.append("../").append(filePath).append(fileName);
		
		log.info("saveFilePath ::: " + sb.toString());
		
		modelMap.addAttribute("fileName", fileName);
		modelMap.addAttribute("saveFilePath", sb.toString());
		
		return "tuition/tuition-view";
	}
	
	//등록금 파일 삭제(관리자)
	@GetMapping("/delete-tuition")
	public String deleteTuitionByCode(HttpServletRequest request, @RequestParam(name = "code") String code) {
		final String ROOT_PATH = request.getSession().getServletContext().getRealPath("/");
		
		Tuition tuition = tuitionService.selectTuition(code);
		
		String fileName = tuition.getFileName();
		String saveFileName = ROOT_PATH + tuition.getFilePath() + fileName;
		String contentType = tuition.getContentType();
		Double fileSize = tuition.getFileSize();

		log.info("fileName :: " + fileName);
		log.info("saveFileName :: " + saveFileName);
		log.info("contentType :: " + contentType);
		log.info("fileSize :: " + fileSize);
		
		File deleteFile = new File(saveFileName);
		
		if(deleteFile.exists()) {
			deleteFile.delete();
			tuitionService.deleteTuitionByCode(code);
			log.info("=============");
			log.info("파일을 삭제합니다.");
			log.info("=============");
		}else {
			log.info("=============");
			log.info("파일이 존재하지 않습니다.");
			log.info("=============");
		}
		return "redirect:/tuition/tuition-form";
		
	}
	
	//등록금 파일 다운로드(관리자)
	@GetMapping("/download-tuition")
	public void downloadTuitionByCode(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "code", defaultValue = "") String code) {
		final String ROOT_PATH = request.getSession().getServletContext().getRealPath("/");

		Tuition tuition = tuitionService.selectTuition(code);
		
		String fileName = tuition.getFileName();
		String saveFileName = ROOT_PATH + tuition.getFilePath() + fileName;
		String contentType = tuition.getContentType();
		Double fileSize = tuition.getFileSize();

		log.info("fileName :: " + fileName);
		log.info("saveFileName :: " + saveFileName);
		log.info("contentType :: " + contentType);
		log.info("fileSize :: " + fileSize);

		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Type", contentType);
		response.setHeader("Content-Length", "" + fileSize);
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");

		try (FileInputStream fis = new FileInputStream(saveFileName); OutputStream out = response.getOutputStream();) {
			int readCount = 0;
			byte[] buffer = new byte[1024];
			while ((readCount = fis.read(buffer)) != -1) {
				out.write(buffer, 0, readCount);
			}
		} catch (Exception ex) {
			throw new RuntimeException("file Save Error");
		}
	}

}
