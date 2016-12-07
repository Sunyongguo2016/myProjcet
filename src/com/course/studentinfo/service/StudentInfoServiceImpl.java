package com.course.studentinfo.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.course.entity.StudentInfo;
import com.course.studentinfo.dao.StudentInfoDaoImpl;

/**
 * 
 * @Description 		学生信息表Service
 * @author 				孙晓辉
 * @createDate  		2016/12/4
 * @version 			V1.0
 */
@Service
@Transactional(readOnly=false)
public class StudentInfoServiceImpl {
	@Resource
	private StudentInfoDaoImpl studentInfoDaoImpl;
	
	public void addStudentInfo(StudentInfo s){
		this.studentInfoDaoImpl.saveStudentInfo(s);
	}
	
	@Transactional(readOnly=true)
	public StudentInfo getStudentInfo(int studentId){
		return this.studentInfoDaoImpl.getStudentInfo(studentId);
	}
	
	public void editStudentInfo(StudentInfo s){
		StudentInfo pdb=this.studentInfoDaoImpl.getStudentInfo(s.getStudentId());
//		pdb.setName(p.getName());
//		pdb.setPrice(p.getPrice());
		this.studentInfoDaoImpl.updateStudentInfo(pdb);
	}
	
	public void dropStudentInfo(int studentId){
		this.studentInfoDaoImpl.deleteStudentInfo(studentId);
	}
}
