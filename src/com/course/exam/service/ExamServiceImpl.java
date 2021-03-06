package com.course.exam.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.course.entity.Exam;
import com.course.exam.dao.ExamDaoImpl;
import com.framework.Page;

@Service
@Transactional(readOnly = false)
public class ExamServiceImpl {
	@Resource
	private ExamDaoImpl examDaoImpl;
	
	/**
	 * 
	 * @Description 		增加试卷
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public void addExam(Exam e){
		this.examDaoImpl.saveExam(e);
	}
	
	/**
	 * 
	 * @Description 		根据页面查询试卷
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	@Transactional(readOnly = true)
	public Page<Exam>listExam(int pageNum, int pageSize, Object[]params){
		return this.examDaoImpl.findExam(pageNum, pageSize, params);
	}
	
	/**
	 * 
	 * @Description 		根据时间查询试卷
	 * @author 				孙晓辉
	 * @createDate  		2016/11/30
	 * @version 			V1.0
	 * 
	 */
	@Transactional(readOnly = true)
	public Page<Exam>listExamByTimeAndType(int pageNum, int pageSize, Object[]params){
		return this.examDaoImpl.findExamByTimeAndType(pageNum, pageSize, params);
	}

	@Transactional(readOnly = true)
	public Page<Exam>listExamByTime(int pageNum, int pageSize, Object[]params){
		return this.examDaoImpl.findExamByTime(pageNum, pageSize, params);
	}
	
	/**
	 * 
	 * @Description 		根据类型查询试卷
	 * @author 				孙晓辉
	 * @createDate  		2016/11/30
	 * @version 			V1.0
	 * 
	 */
	@Transactional(readOnly = true)
	public Page<Exam>listExamByType(int pageNum, int pageSize, Object[]params){
		return this.examDaoImpl.findExamByType(pageNum, pageSize, params);
	}
	
	/**
	 * 
	 * @Description 		根据ID查询试卷
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */

	@Transactional(readOnly = true)
	public Exam getExam(int examId){
		return this.examDaoImpl.getExam(examId);
	}
	
	@Transactional(readOnly=true)
	public Exam findByName(String examName){
		return this.examDaoImpl.findByName(examName);
	}
	
	/**
	 * 
	 * @Description 		编辑试卷
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public void editExam(Exam e) throws Exception{
//		Exam exam = this.examDaoImpl.getExam(e.getExamId());
//		exam.setExamName(e.getExamName());
//		exam.setExamType(e.getExamType());
//		exam.setExamTime(e.getExamTime());

		this.examDaoImpl.updateExam(e);
	}
	
	/**
	 * 
	 * @Description 		删除试卷
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public void dropExam(int examId){
		this.examDaoImpl.deleteExam(examId);
	}
}
