package com.course.studentinfo.dao;

import org.springframework.stereotype.Repository;

import com.course.entity.StudentInfo;
import com.framework.BaseDao;

/**
 * 
 * @Description 		学生信息表Dao
 * @author 				孙晓辉
 * @createDate  		2016/12/4
 * @version 			V1.0
 */
@Repository
public class StudentInfoDaoImpl extends BaseDao<StudentInfo, Integer>{
	public void saveStudentInfo(StudentInfo StudentInfo){
		try {
			this.save(StudentInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public StudentInfo getStudentInfo(int studentId){
		try {
			StudentInfo s=this.get(studentId);
			return s;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public void updateStudentInfo(StudentInfo StudentInfo){
		try {
			this.update(StudentInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteStudentInfo(int studentId){
		try {
			this.delete(studentId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
