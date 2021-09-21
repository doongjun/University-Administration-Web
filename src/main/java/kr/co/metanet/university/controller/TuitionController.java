package kr.co.metanet.university.controller;

import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping(path = "/tuition")
public class TuitionController {
	// 등록금 파일 업로드 폼(관리자)
	@GetMapping("/tuition-form")
	public String tuition() {
		return "tuition/tuition-form";
	}

	// 등록금 파일 업로드 폼(관리자)
	@PostMapping("/upload-tuition")
	public String uploadTuition(@RequestParam("file") MultipartFile file, HttpServletRequest request) {

		final String ROOT_PATH = request.getSession().getServletContext().getRealPath("/");
		final String ATTACH_PATH = "resources/upload/";
		
		log.info("File Name :: " + file.getOriginalFilename());
		log.info("File Size :: " + file.getSize());

		try (FileOutputStream fos = new FileOutputStream(ROOT_PATH + ATTACH_PATH + file.getOriginalFilename());
				InputStream is = file.getInputStream();) {
			int readCount = 0;
			byte[] buffer = new byte[1024];

			while ((readCount = is.read(buffer)) != -1) {
				fos.write(buffer, 0, readCount);
			}

		} catch (Exception e) {
			throw new RuntimeException("File Save Error");
		}

		return "tuition/uploadok";
	}
}
