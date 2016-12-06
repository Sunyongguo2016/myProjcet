package com.course.error.controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.course.entity.Error;
import com.course.error.service.ErrorServiceImpl;
import com.course.login.service.LoginServiceImpl;
import com.framework.Page;

@Controller
@RequestMapping("error")
public class ErrorController {
	@Resource
	private ErrorServiceImpl errorServiceImpl;
	@Resource
	private LoginServiceImpl loginServiceImpl;
	
	
	@RequestMapping("collect")
	public String selectCollect(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(name="isCollect", defaultValue="0") int isCollect, HttpSession session,
			@RequestParam(name="searchParam",defaultValue="") String searchParam,HttpServletRequest request,
			Model model){
		int stuId = (int)session.getAttribute("stuId");
		System.out.println(stuId);
		Page<Error> page;
		if(searchParam == null || "".equals(searchParam)){
			if(isCollect == 1){
				request.setAttribute("isCol", 1);
			}else{
				request.setAttribute("isCol", 0);
			}
			page = this.errorServiceImpl.ErrorCollect(pageNum, 2, isCollect, stuId, null);
		}else{
			try {
				 searchParam = new String(searchParam.getBytes("ISO8859_1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
			}
			page = this.errorServiceImpl.ErrorCollect(pageNum, 2, isCollect, stuId, new Object[]{searchParam});
		} 
		request.setAttribute("page", page);
		request.setAttribute("searchParam", searchParam);
		return "wrongpage/wrongpagelist";
	}
	
	
	
}
