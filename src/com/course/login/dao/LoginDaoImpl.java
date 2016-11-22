package com.course.login.dao;

import org.springframework.stereotype.Repository;
import com.course.entity.StudentInfo;
import com.framework.BaseDao;

@Repository
public class LoginDaoImpl extends BaseDao<StudentInfo, Integer>{
	
	public StudentInfo findByNameAndPwd(String name, String pwd){
		try {
			return super.findOne("from StudentInfo lu where lu.loginName=? and lu.password=?", new Object[]{name,pwd});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
