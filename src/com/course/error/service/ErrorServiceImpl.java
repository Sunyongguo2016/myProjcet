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
	
	/**
	 * 
	 * @Description 		展示错题列表
	 * @author 				童海苹
	 * @createDate  		2016/12/3
	 * @version 			V1.0
	 * 
	 */
	@Transactional(readOnly = true)
	public Page<Error> errorCollect(int pageNum, int pageSize,int collet, int studentId, Object[]params){
		return this.errorDaoImpl.findCollectError(pageNum, pageSize, collet, studentId, params);
	}
	
	/**
	 * 
	 * @Description 		展示错题内容
	 * @author 				童海苹
	 * @createDate  		2016/12/3
	 * @version 			V1.0
	 * 
	 */
	@Transactional(readOnly = true)
	public Page<Error> errorContent(int pageNum, int pageSize, int studentId, int examId, int parentQuestionId){
		return this.errorDaoImpl.findCollectContent(pageNum, pageSize, studentId, examId, parentQuestionId);
	}

	/**
	 * 
	 * @Description 		删除错题
	 * @author 				童海苹
	 * @createDate  		2016/12/3
	 * @version 			V1.0
	 * 
	 */
	public void dropError(int e){
		this.errorDaoImpl.deleteError(e);
		System.out.println("service-delete");
	}
	
	/**
	 * 
	 * @Description 		查询错题
	 * @author 				童海苹
	 * @createDate  		2016/12/3
	 * @version 			V1.0
	 * 
	 */
	public Error findError(int studentId, int examId, int pqId){
		return  this.errorDaoImpl.getErr(studentId, examId, pqId);
	}
	
	public List<Error> findEList(int studentId, int examId, int pqId){
		List<Error> errors = this.errorDaoImpl.findErrorList(studentId,examId,pqId);
		return errors;

	}
	
	/**
	 * 
	 * @Description 		编辑错题
	 * @author 				童海苹
	 * @createDate  		2016/12/3
	 * @version 			V1.0
	 * 
	 */
	public void editError(Error e){
		this.errorDaoImpl.updateError(e);
	}

}
