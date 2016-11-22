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
	
	public void addExam(Exam e){
		this.examDaoImpl.saveExam(e);
	}
	
	@Transactional(readOnly = true)
	public Page<Exam>listExam(int pageNum, int pageSize, Object[]params){
		return this.examDaoImpl.findExam(pageNum, pageSize, params);
	}
	
	@Transactional(readOnly = true)
	public Exam getExam(int examId){
		return this.examDaoImpl.getExam(examId);
	}
	
	public void editExam(Exam e) throws Exception{
		Exam exam = this.examDaoImpl.getExam(e.getExamId());
		exam.setExamName(e.getExamName());
		exam.setExamType(e.getExamType());
		exam.setExamTime(e.getExamTime());
		System.out.println("service" + e.getExamId() + e.getExamName() + e.getExamType() + e.getExamTime());
		this.examDaoImpl.update(exam);
	}
	
	public void dropExam(int examId){
		this.examDaoImpl.deleteExam(examId);
	}
}
