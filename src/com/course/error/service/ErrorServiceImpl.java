package com.course.error.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.course.entity.Error;
import com.course.error.dao.ErrorDaoImpl;
import com.framework.Page;

@Service
public class ErrorServiceImpl {
	@Resource
	private ErrorDaoImpl errorDaoImpl;
	/**
	 * 
	 * @Description 		添加到Error表中
	 * @author 				孙晓辉
	 * @createDate  		2016/12/4
	 * @version 			V1.0
	 */
	public void addError(Error error){
		this.errorDaoImpl.saveError(error);
	}
	
/*	@Transactional(readOnly = true)
	public Page<Exam> selectlistError(int pageNum, int pageSize, Object[]params){
		return this.errorDaoImpl.findError(pageNum, pageSize, params);
	}
*/	
	@Transactional(readOnly = true)
	public Page<Error> ErrorCollect(int pageNum, int pageSize,int collet, int studentId, Object[]params){
		return this.errorDaoImpl.findCollectError(pageNum, pageSize, collet, studentId, params);
	}

}
