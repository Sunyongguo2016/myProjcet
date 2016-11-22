package com.course.login.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import com.course.entity.StudentInfo;
import com.course.login.service.LoginServiceImpl;
import com.google.gson.Gson;

@Controller
@RequestMapping("loginuser")
public class LoginController {
	@Resource
	private LoginServiceImpl loginServiceImpl;
	
	/*
	@RequestMapping("regist")
	public void (@RequestParam("t_UserName") String name, @RequestParam("t_UserPass") String password,){
		this.loginServiceImpl.regist(name, pwd);
	}
	*/
	
	@RequestMapping("login")
	public String login(@RequestParam("t_UserName") String name, @RequestParam("t_UserPass") String password,
			HttpSession session){
		StudentInfo lu = this.loginServiceImpl.login(name,password);
		
		if(lu != null){
			String role = lu.getRoleName();
			session.setAttribute("roleName", role);
			if("student".equals(role)){
				return "redirect:/index1.jsp";
			} else if("manager".equals(role)){
				return "redirect:/index.jsp";
			} else {
				return "redirect:/login1.jsp";
			}
		} else {
			System.out.println("lu is null");
			return "redirect:/login1.jsp";
		}	
	}
	
	@RequestMapping("checkname")
	@ResponseBody
	public String CheckNameExist(HttpServletRequest request){
		String name=request.getParameter("loginName");
		List<StudentInfo> list=new ArrayList<StudentInfo>();
		StudentInfo l1=new StudentInfo();
		l1.setLoginName("loginaa");
		l1.setPassword("123456");
		
		StudentInfo l2=new StudentInfo();
		l2.setLoginName("loginbb");
		l2.setPassword("123456");
		
		list.add(l1);
		list.add(l2);
		Gson gson=new Gson();
		return gson.toJson(list);
	}
}
