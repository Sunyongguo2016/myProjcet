package com.course.error.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.course.entity.Error;
import com.course.error.dao.ErrorDaoImpl;
import com.framework.Page;

@Service
@Transactional(readOnly = false)
public class ErrorServiceImpl {
	@Resource
	private ErrorDaoImpl errorDaoImpl;
	
	@Transactional(readOnly = true)
	public Page<Error> errorCollect(int pageNum, int pageSize,int collet, int studentId, Object[]params){
		return this.errorDaoImpl.findCollectError(pageNum, pageSize, collet, studentId, params);
	}
	
	@Transactional(readOnly = true)
	public Page<Error> errorContent(int pageNum, int pageSize, int studentId, int examId, int parentQuestionId){
		return this.errorDaoImpl.findCollectContent(pageNum, pageSize, studentId, examId, parentQuestionId);
	}

	public void dropError(int e){
		this.errorDaoImpl.deleteError(e);
		System.out.println("service-delete");
	}
	
	public Error findError(int studentId, int examId, int pqId){
		return  this.errorDaoImpl.getErr(studentId, examId, pqId);
	}
	 
//	public Page<Error> findErrorList(int studentId, int examId, int pqId){
//		return this.errorDaoImpl.findCollectContent(1,10,studentId,examId,pqId);
//	}
	
	public List<Error> findEList(int studentId, int examId, int pqId){
		List<Error> errors = this.errorDaoImpl.findErrorList(studentId,examId,pqId);
		return errors;

	}
	
	public void editError(Error e){
		this.errorDaoImpl.updateError(e);
	}

}
