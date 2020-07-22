package org.kh.fin.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kh.fin.member.domain.Member;
import org.kh.fin.mypage.domain.Bucket;
import org.kh.fin.order.domain.OrderDetail;
import org.kh.fin.product.domain.Product;
import org.kh.fin.product.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;

@Controller
public class ProductController {

	// 상품 등록 페이지
	@RequestMapping("insertShowProduct.do")
	public String insertShowProduct() {
		return "product/insertProduct";
	}

	// 상품 등록한걸 저장하기위한 메소드
	@RequestMapping(value = "insertProduct.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String insertProduct(Product product,
			@RequestParam(value = "uploadFileInfo", required = false) MultipartFile uploadMainInfoFile,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
			HttpServletRequest request) {

		if (!uploadMainInfoFile.getOriginalFilename().equals("") && !uploadFile.getOriginalFilename().equals("")) {
			String filePath1 = saveMainInfoFile(uploadMainInfoFile, request);
			String filePath2 = saveFile(uploadFile, request);
			if (filePath1 != null && filePath2 != null) {
				product.setProductInfo(uploadMainInfoFile.getOriginalFilename());
				product.setProductMainName(uploadFile.getOriginalFilename());

				product.setProductMainPath(filePath2);

			}
		}

		// 데이터를 디비에 저장하는 작업
		int result = 0;
		String path = null;

		result = pService.insertProduct(product, uploadFile, request);
		if (result > 0) {
			return "product/insertProduct";
		} else {
			return "실패페이지로";
		}
	}

	private String saveMainInfoFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\images\\productInfo";
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdir();
		}

		String filePath = folder + "\\" + file.getOriginalFilename();

		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return filePath;
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\images\\productImg";
		// 저장 폴더 선택
		File folder = new File(savePath);

		// 만약 폴더가 없을 경우 자동 생성
		if (!folder.exists()) {
			folder.mkdir();
		}

		String filePath = folder + "\\" + file.getOriginalFilename();

		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return filePath;

	}

	// 등록된 상품보여주기 관리자만
	@RequestMapping("listAdminProduct.do")
	public ModelAndView modifyListProduct(ModelAndView mv, HttpServletRequest request) {
		HttpSession session =  request.getSession();
		Member mem = (Member)session.getAttribute("loginInfo");
		ArrayList<Product> list = pService.productSelectList(mem.getMemberId());
		mv.addObject("list", list);
		mv.setViewName("product/showAdminProduct");
		return mv;
	}

	// 상품 삭제하기
	@RequestMapping("deleteProduct.do")
	public String deleteProduct(int pId) {
		int result = pService.productDelete(pId);
		if (result > 0) {
			return "redirect:productMain.do";
		} else {
			return null;

		}
	}

	@Autowired
	ProductService pService;

	// 낚시용품 메인화면으로 이동
	@RequestMapping("productMain.do")
	public ModelAndView allProduct(ModelAndView mv, HttpServletRequest request) {
		HttpSession session =  request.getSession();
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Member mem = (Member)session.getAttribute("loginInfo");
		String memberId;
		if(mem==null) {
			memberId = null;
		}else {
			memberId = mem.getMemberId();
		}
		ArrayList<Product> list = pService.productSelectList(memberId);
		mv.addObject("list", list);
		mv.setViewName("product/productMain");
		return mv;
	}

	@RequestMapping("ProductDetailView.do")
	public String productDetailView(int pNum, Model model) {

		int result = pService.updateViewCnt(pNum);
		Product product = pService.productSelectOne(pNum);

		if (product != null && result > 0) {
			model.addAttribute("p", product);
			return "product/selectDetailProduct";
		} else {
			return "에러페이지로";
		}

	}

	// 주문버튼누르면 저장해주는 메소드
	@RequestMapping(value = "buyInfoProduct.do", method = RequestMethod.POST)
	public ModelAndView buyAndCartProduct(int productNum, int orderQty, ModelAndView mv) {
		Product product = pService.productSelectOne(productNum);
		if (product != null && orderQty != 0) {

			mv.addObject("product", product);
			mv.addObject("orderQty", orderQty);

			mv.setViewName("product/buyAndCartProduct");
		} else {
			mv.setViewName("error");

		}
		return mv;

	}
	
	@ResponseBody
	@RequestMapping(value="insertCart.do", method=RequestMethod.GET)
	public String insertCart(HttpServletResponse response, HttpServletRequest request, 
			@RequestParam(value="pNum") int pNum, @RequestParam(value="cnt") int cnt) {
		HttpSession session = request.getSession();
		ArrayList<Bucket> cart = (ArrayList<Bucket>) session.getAttribute("cart");
		if(cart == null) {
			cart = new ArrayList<Bucket>();
		}
		
		for (Bucket bucket : cart) {
			if(bucket.getProductNum() == pNum) {
				return "fail";
			}
		}
		
		cart.add(new Bucket(pNum, cnt));
		session.setAttribute("cart", cart);
		return "success";
	}
	/*
	 * //등록된 상품보여주기 관리자만
	 * 
	 * @RequestMapping("showAdinProduct.do") public ModelAndView showAdinProduct() {
	 * return null; } //등록된 상품 수정하기
	 * 
	 * @RequestMapping("modifyProduct.do") public String modifyProduct() { return
	 * null; }
	 * 
	 * 
	 * 
	 */

}
