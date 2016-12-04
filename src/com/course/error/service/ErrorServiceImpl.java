package com.course.error.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.course.entity.Exam;
import com.course.error.dao.ErrorDaoImpl;
import com.framework.Page;

@Service
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

}
