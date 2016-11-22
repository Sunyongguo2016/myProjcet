package com.course.login.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.course.entity.StudentInfo;
import com.course.login.dao.LoginDaoImpl;

@Service
@Transactional(readOnly = true)
public class LoginServiceImpl {
	
	@Resource
	private LoginDaoImpl loginDaoImpl;
	
	@Transactional(readOnly = true)
	public void regist(String name,String pwd){
		StudentInfo student = new StudentInfo();
		student.setLoginName(name);
		student.setPassword(pwd);
		try {
			this.loginDaoImpl.save(student);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public StudentInfo login(String name, String pwd){
		return this.loginDaoImpl.findByNameAndPwd(name, pwd);
	}
}
