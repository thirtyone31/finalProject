package org.kh.fin.notice.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.kh.fin.notice.domain.Notice;
import org.kh.fin.notice.domain.PageInfo;
import org.kh.fin.notice.domain.Pagination;
import org.kh.fin.notice.domain.Search;
import org.kh.fin.notice.service.NoticeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

@Controller

public class NoticeController {

	@Autowired
	private NoticeServiceImpl nService;

	@RequestMapping("nlist.do")
	public ModelAndView noticeList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		System.out.println(currentPage);
		// currentPage가 0으로 안떨어지게 하기 위해서 필요 ? 뭐지
		int listCount = nService.getListCount();
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		System.out.println(pi);

		ArrayList<Notice> list = nService.selectList(pi);

		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("notice/noticeListView");
		} else if(list.isEmpty()){
			
		}else {
			mv.addObject("msg", "공지사항 목록조회 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}

	@RequestMapping("nsearch.do")
	public String noticeSearch(Search search, Model model,
			@RequestParam(value = "page", required = false) Integer page) {
		/*
		 * integer : 정수 -Wrapper 클래스(객체) -null 값을 처리할 수 있다 -null 값을 처리할 수 있기 때문에 SQL과
		 * 연동할 경우 처리가 용이하다 -DB에서 자료형이 정수형이지만 null값이 필요할 경우 사용한다
		 */
		ArrayList<Notice> searchList = nService.searchList(search);

		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		return "notice/noticeListView";
	}

	// 상세보기
	@RequestMapping("ndetail.do")
	public String noticeDetail(int nId, Model model) {
		Notice notice = nService.selectOne(nId);
		if (notice != null) {
			model.addAttribute("notice", notice);
			return "notice/noticeDetailView";
		} else {
			model.addAttribute("msg", "공지사항 상세조회 실패");
			return "common/errorPage";
		}
	}

	// 공지사항 등록화면
	@RequestMapping("nWriterView.do")
	public String nWriterView() {
		return "notice/noticeWriteForm";
	}
	
	//공지 사항 등록2
	@RequestMapping("ninsert.do")
	public String noticeInsert(Notice notice,Model model,HttpServletRequest request) {
		int result =0;
		String path= null;
		result = nService.insertNotice(notice, request);
		if(result>0) {
			path ="redirect:nlist.do";
		}else {
			model.addAttribute("msg","게시글 등록 실패");
			return "common/errorPage";
		}
		return path;
	}
	
	/*// 공지사항 등록
	@RequestMapping("ninsert.do")
	public String noticeInsert(Notice notice, Model model,
			@RequestParam(name="uploadFile",required=false)MultipartFile uploadFile,
			HttpServletRequest request) {
		
		//파일 서버에 저장하는 작업
		if(!uploadFile.getOriginalFilename().equals("")) {
			String filePath = saveFile(uploadFile,request);
			if(filePath != null) {
				notice.setFilePath(uploadFile.getOriginalFilename());
			}
		}
		//데이터를 디비에 저장하는 작업
		int result = 0;
		
		result = nService.insertNotice(notice,uploadFile,request);
		if (result > 0) {
			return "redirect:nlist.do";
		} else {
			model.addAttribute("msg", "회원가입 실패");
			
		}
		return "common/errorPage";
	}*/
	
	
	
	/*//파일 저장 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		 //파일 저장 경로 
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root +"\\nuploadFiles";
		
		//저장 폴더 선택
		File folder = new File(savePath);
		
		//만약 폴더가 없을 경우 생성
		if(!folder.exists()) {
			folder.mkdir();
		}
		String filePath = folder + "\\"
				+ file.getOriginalFilename();
		
		try {
			//파일 저장
			file.transferTo(new File(filePath));
		}catch(IllegalStateException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		return filePath;
	}
*/
	// 자유게시판 사진 저장 서비스
	@RequestMapping(value = "fileupload.do")
	@ResponseBody
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						String uploadPath = request.getSession().getServletContext()
								.getRealPath("/resources/imgs/noticeimg");
						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						printWriter = response.getWriter();
						response.setContentType("text/html");
						String fileUrl = request.getContextPath() + "/resources/imgs/noticeimg/" + fileName;
						// json 데이터로 등록
						// {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
						// 이런 형태로 리턴이 나가야함.
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						System.out.println(json);						
						System.out.println(fileUrl);
						
						printWriter.print(json);
						//printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('"
								//+ fileUrl + "','이미지를 업로드 하였습니다.'" + ")</script>");
						/*printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
								+ callback + ",'" + fileUrl + "','이미지를 업로드 하였습니다.'" + ")</script>");*/
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}

					}
				}
			}
		}
		return null;
	}

	/*
	 * //사진전송
	 * 
	 * public String imageUpload(Locale locale, Model model, HttpServletRequest
	 * request, HttpServletResponse response ) { //web.init();
	 * 
	 * response.setContentType("application/json");
	 * 
	 * try { upload.multipartRequest(); } catch(Exception e) { e.printStackTrace();
	 * return null; }
	 * 
	 * }
	 */

	// 공지사항 수정 화면
	@RequestMapping("nupView.do")
	public String noticeUpdateView(int nId, Model model) {
		model.addAttribute("notice", nService.selectOne(nId));
		return "notice/noticeUpdateView";
	}

	// 공지사항 수정
	@RequestMapping(value = "nupdate.do", method = RequestMethod.POST)
	public String noticeUpdate(Notice notice, Model model,HttpServletRequest request) {
			
			/*System.out.println(notice.getnCategory());
			//새로 업로드된 파일이 있을 경우
			if(reloadFile != null && !reloadFile.isEmpty()) {
			 //기존 업로드된 파일이 있을 경우 
			 if(notice.getFilePath() != null) {
				 //기존 파일 삭제 
				 deleteFile(notice.getFilePath(),request);
			 }	 
			 //새로 업로드된 파일 저장
			 String savePath = saveFile(reloadFile, request);
			 
			 //새로 업로드 된 파일이 잘 저장이 되었다면 디비 저장
			 if(savePath != null) {
				 notice.setFilePath(reloadFile.getOriginalFilename());
			 }
			} */
		 

		int result = nService.updateNotice(notice);
		if (result > 0) {
			return "redirect:ndetail.do?nId=" + notice.getnId();
		} else {
			model.addAttribute("msg", "공지사항 수정 실패");
			return "common/errorPage";
		}
	}

	public void deleteFile(String fileName, HttpServletRequest request) {
		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\nuploadFiles";
		// 삭제할 파일 경로 + 파일명
		File deleteFile = new File(savePath + "\\" + fileName);
		// 해당 파일이 존재할 경우 삭제
		if (deleteFile.exists()) {
			deleteFile.delete();
		}
	}

	// 공지사항 삭제
	// 1. DB데이터 삭제
	// 2. DB데이터 삭제 성공시 저장된 파일 삭제
	// 3. 삭제 후 공지사항 목록으로 redirect
	// 공지사항 삭제
	// 1. DB데이터 삭제
	// 2. DB데이터 삭제 성공시 저장된 파일 삭제
	// 3. 삭제 후 공지사항 목록으로 redirect
	/*@RequestMapping("ndelete.do")
	public String noticeDelete(int nId, Model model, HttpServletRequest request, RedirectAttributes rd) {
		// 파일을 지우기 위해 nId 공지사항 조회
		Notice notice = nService.selectOne(nId);
		int result = nService.deleteNotice(nId);
		if (result > 0) {
			if (notice.getFilePath() != null) {
				deleteFile(notice.getFilePath(), request);
			}
			rd.addFlashAttribute("msg", "공지사항 삭제 성공");
			return "redirect:nlist.do";
		} else {
			model.addAttribute("msg", "공지사항 삭제 실패");
			return "common/errorPage";
		}
	}*/

}
