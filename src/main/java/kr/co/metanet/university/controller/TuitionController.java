package kr.co.metanet.university.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.metanet.university.domain.Member;
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
	public String tuition() {
		return "tuition/tuition-form";
	}

	// 등록금 파일 업로드 폼(관리자)
	@PostMapping("/upload-tuition")
	public String uploadTuition(@RequestParam("file") MultipartFile file, @RequestParam("code") String code,
			HttpServletRequest request) {

		final String ROOT_PATH = request.getSession().getServletContext().getRealPath("/");
		final String ATTACH_PATH = "resources/upload/";

		log.info("File Name :: " + file.getOriginalFilename());
		log.info("File Size :: " + file.getSize());
		log.info("File ContentType :: " + file.getContentType());
		
		if(memberService.getMemberByCode(code) != null) {
			//업로드 x, return 추가
			//return "";
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

		return "tuition/uploadok";
	}
	
	@GetMapping("/download-tuition")
	public void download(HttpServletRequest request, HttpServletResponse response, Principal principal) {
		final String ROOT_PATH = request.getSession().getServletContext().getRealPath("/");
		
		String code = principal.getName();
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
        
        try(
                FileInputStream fis = new FileInputStream(saveFileName);
                OutputStream out = response.getOutputStream();
        ){
        	    int readCount = 0;
        	    byte[] buffer = new byte[1024];
            while((readCount = fis.read(buffer)) != -1){
            		out.write(buffer,0,readCount);
            }
        }catch(Exception ex){
            throw new RuntimeException("file Save Error");
        }
	}
	
}
