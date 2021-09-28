package kr.co.metanet.university.controller;



	import java.io.File;
	import java.io.FileOutputStream;
	import java.io.OutputStream;
	import java.io.PrintWriter;
	 
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	 
	import org.slf4j.Logger;
	import org.slf4j.LoggerFactory;
	import org.springframework.stereotype.Controller;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j2;
	@RequestMapping(path="/board")
	@Log4j2
	@Controller
	public class ImageUploadController {
	 
	    private static final Logger logger=
	            LoggerFactory.getLogger(ImageUploadController.class);
	 
	    @RequestMapping("imageUpload.do")
	    public void imageUpload(HttpServletRequest request,
	            HttpServletResponse response,
	            MultipartFile upload) throws Exception {
	        response.setCharacterEncoding("utf-8");
	        response.setContentType("text/html; charset=utf-8");
	 
	        //업로드한 파일 이름
	        String fileName=upload.getOriginalFilename();
	 
	        //파일을 바이트 배열로 변환
	        byte[] bytes=upload.getBytes();
	 
	        //이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
	        String uploadPath=
	        		//"D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\spring02\\WEB-INF\\views\\images\\";
	        
	        "C:\\DEV\\projectsource\\University-Administration-Web\\src\\main\\webapp\\WEB-INF\\views\\images\\";
	        OutputStream out=new FileOutputStream(
	                new File(uploadPath+fileName));
	
	        //서버로 업로드
	        out.write(bytes);
	        //클라이언트에 결과 표시
	        String callback=request.getParameter("CKEditorFuncNum");
	 
	        //서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
	        PrintWriter printWriter=response.getWriter();
	 
	        String fileUrl=
	                    request.getContextPath()+"/images/"+fileName;
	 
	        printWriter.println(
	"<script>window.parent.CKEDITOR.tools.callFunction("
	+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"
	+"</script>");
	        printWriter.flush();
	    }
	 
	}