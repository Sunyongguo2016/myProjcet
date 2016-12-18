package com.course.login.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.course.entity.StudentInfo;
import com.course.login.service.LoginServiceImpl;

@Controller
@RequestMapping("loginuser")
public class LoginController {
	@Resource
	private LoginServiceImpl loginServiceImpl;
	
	/**
	 * 
	 * @desc				注册，获取register.jsp的参数,检查登录名是否已存在来控制登录名不可重复；
	 * @author				童海苹
	 * @createDate 			2016/11/23
	 * @param 				name登录名，password密码
	 * @return				登录页面
	 * 
	 */
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String regist(@RequestParam("username") String name, @RequestParam("password") String password, @RequestParam("content") String img, HttpSession session){
		this.loginServiceImpl.regist(name, password,img);
		return "redirect:/login_use.jsp";
	}
	
	/**
	 * 
	 * @desc				登录，获取login_use.jsp的参数，从数据库查询登录者的角色决定跳转的页面；
	 * @author				童海苹
	 * @createDate 			2016/11/23
	 * @param 				uer登录名，pwd密码
	 * @return				String
	 * @throws IOException 
	 * 
	 */
	@RequestMapping("login")
	public String login(@RequestParam("uer") String name, @RequestParam("pwd") String password,
			HttpSession session, HttpServletResponse response) throws IOException{
		StudentInfo lu = this.loginServiceImpl.login(name,password);
		
		if(lu != null){
			String role = lu.getRoleName();
			session.setAttribute("roleName",lu.getRoleName() );
			if("student".equals(role)){
				session.setAttribute("stuId", lu.getStudentId());
				session.setAttribute("student", lu);
				session.setAttribute("logined", "on");
				//设置失效时间
				session.setMaxInactiveInterval(8*60*60);
				return "redirect:/";
			} else if("manager".equals(role)){
				session.setAttribute("manager", lu);
				session.setMaxInactiveInterval(8*60*60);
				return "index";
			} else {
				System.out.println("lu is not exist");
				return "login_use";
			}
		} else {
			System.out.println("lu is null");
			return "redirect:/login_use.jsp";
		}	
	}
	/**
	 * 
	 * @desc				验证用户名是否已被占用
	 * @author				童海苹
	 * @createDate 			2016/11/28
	 * @param 				
	 * @return				
	 * @throws IOException 
	 * 
	 */
	@RequestMapping("checkname")
	public void CheckNameExist(HttpServletRequest request, HttpServletResponse response){
		String name=request.getParameter("username");
		StudentInfo s = this.loginServiceImpl.checkStudent(name);
		
		if(s != null){
			try {
				response.getWriter().write("exist");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().write("");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	/**
	 * 
	 * @desc				设置个人信息；
	 * @author				童海苹
	 * @createDate 			2016/11/23
	 * @param 				studentId学生编号，hobby个人爱好，location当前位置，introduce个人简介
	 * @return				重置信息后需要重新登录
	 * 
	 */
	@RequestMapping(value = "setinfo", method = RequestMethod.GET)
	public String setInfoo( ){
		
		return "info/usermessageEdge";
	}
	@RequestMapping(value = "setinfo", method = RequestMethod.POST)
	public String setInfo(@RequestParam(name = "hobby") String hobby, @RequestParam("location") String location, 
			@RequestParam("introduce") String introduce, HttpSession session){
		int sId = (int) session.getAttribute("stuId");
		
		StudentInfo stu = this.loginServiceImpl.getStudentInfo(sId);
		stu.setHobby(hobby);
		stu.setLocation(location);
		stu.setIntroduce(introduce);
		
		this.loginServiceImpl.editStudentInfo(stu);
		return "login_use";
	}
	
	/**
	 * 
	 * @desc				修改密码时验证旧密码是否输入正确
	 * @author				童海苹
	 * @createDate 			2016/11/29
	 * @param 				
	 * @return				void
	 * 
	 */
	@RequestMapping(value="checkOldPwd")
	public void checkOldPwd(HttpSession session, HttpServletRequest request, HttpServletResponse response){
		String opwd =request.getParameter("oldPwd");
		int sId = (int) session.getAttribute("stuId");
		StudentInfo stu = this.loginServiceImpl.getStudentInfo(sId);
		
		if(opwd.equals(stu.getPassword())){
			try {
				response.getWriter().write("yes");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().write("no");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 
	 * @desc				重置密码
	 * @author				童海苹
	 * @createDate 			2016/11/28
	 * @param 				
	 * @return				void
	 * 
	 */
	@RequestMapping(value = "resetPwd", method = RequestMethod.POST)
	public String resetPwd(HttpSession session, @RequestParam("oldPwd") String opwd,
			@RequestParam("password") String pwd, @RequestParam(name="content") String img,
			HttpServletRequest request, HttpServletResponse response){
		int sId = (int) session.getAttribute("stuId");
		StudentInfo stu = this.loginServiceImpl.getStudentInfo(sId);
		
		if(opwd.equals(stu.getPassword())){
			System.out.println("old is right");
			stu.setPassword(pwd);
			stu.setUrl(img);
			this.loginServiceImpl.editStudentInfo(stu);
			
			return "redirect:/";
		} else {
			System.out.println("old is wrong");
		}
		return "info/install";
	}
	/**
	 * 
	 * @desc				退出登錄
	 * @author				童海苹
	 * @createDate 			2016/12/6
	 * @param 				
	 * @return				void
	 * 
	 */
	@RequestMapping(value = "turnOut")
	public String resetPwd(HttpSession session){
		//清楚当前session
		session.invalidate();
		return "redirect:/";
	}

}

	