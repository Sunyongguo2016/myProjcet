package com.course.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
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
	public String regist(@RequestParam("username") String name, @RequestParam("password") String password, HttpSession session){
		StudentInfo si = this.loginServiceImpl.checkStudent(name);
		if(si == null){
			this.loginServiceImpl.regist(name, password);
			return "redirect:/login_use.jsp";
		} else {
			//session.setAttribute("userna", "exist");
			return "register"; 
		}
	}
	
	/**
	 * 
	 * @desc				登录，获取login_use.jsp的参数，从数据库查询登录者的角色决定跳转的页面；
	 * @author				童海苹
	 * @createDate 			2016/11/23
	 * @param 				uer登录名，pwd密码
	 * @return				String
	 * 
	 */
	@RequestMapping("login")
	public String login(@RequestParam("uer") String name, @RequestParam("pwd") String password,
			HttpSession session){
		StudentInfo lu = this.loginServiceImpl.login(name,password);
		
		if(lu != null){
			String role = lu.getRoleName();
			session.setAttribute("roleName",lu.getRoleName() );
			if("student".equals(role)){
				session.setAttribute("stuId", lu.getStudentId());
				session.setAttribute("student", lu);
				session.setAttribute("logined", "on");
				return "index_before";
			} else if("manager".equals(role)){
				return "index";
			} else {
				return "login_use";
			}
		} else {
			System.out.println("lu is null");
			return "redirect:/login_use.jsp";
		}	
	}
	
	/**
	 * 
	 * @desc				设置个人信息；
	 * @author				童海苹
	 * @createDate 			2016/11/23
	 * @param 				studentId学生编号，hobby个人爱好，location当前位置，introduce个人简介
	 * @return				void
	 * 
	 */
	@RequestMapping(value = "setinfo", method = RequestMethod.POST)
	public String setInfo(@RequestParam("hobby") String hobby, @RequestParam("location") String location, @RequestParam("introduce") String introduce, HttpSession session){
		int sId = (int) session.getAttribute("stuId");
		StudentInfo stu = this.loginServiceImpl.getStudentInfo(sId);
		System.out.println("password"+stu.getPassword());
		stu.setHobby(hobby);
		stu.setLocation(location);
		stu.setIntroduce(introduce);
		
		this.loginServiceImpl.editStudentInfo(stu);
		StudentInfo newStudent = this.loginServiceImpl.getStudentInfo(sId);
		System.out.println("hobby:"+newStudent.getIntroduce()+stu.getHobby());
		session.setAttribute("stu", newStudent);
		return "info/usermessage";
	}
}
