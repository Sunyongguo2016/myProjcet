package com.course.login.dao;

import org.springframework.stereotype.Repository;
import com.course.entity.StudentInfo;
import com.framework.BaseDao;

@Repository
public class LoginDaoImpl extends BaseDao<StudentInfo, Integer>{
	/**
	 * 
	 * @Description 		根据姓名密码查询学生
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public StudentInfo findByNameAndPwd(String name, String pwd){
		try {
			return super.findOne("from StudentInfo lu where lu.loginName=? and lu.password=?", new Object[]{name,pwd});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 
	 * @Description 		根据姓名查询学生
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public StudentInfo findByName(String name){
		try {
			return super.findOne("from StudentInfo s where s.loginName=?", new Object[]{name});
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 
	 * @Description 		根据学生ID查询学生
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public StudentInfo getStudentInfo(int studentId){
		StudentInfo s = null;
		try {
			s = this.get(studentId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	/**
	 * 
	 * @Description 		更新学生信息
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public void updateStudentInfo(StudentInfo s){
		try {
			System.out.println("updateStudentInfoId:"+s.getStudentId()+"updateStudentInfo:"+s.getHobby());
			this.update(s);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
