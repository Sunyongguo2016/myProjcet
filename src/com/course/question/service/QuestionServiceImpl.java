package com.course.question.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.course.entity.Question;
import com.course.question.dao.QuestionDaoImpl;
import com.framework.Page;

@Service
@Transactional(readOnly=false)
public class QuestionServiceImpl {
	
	@Resource
	private QuestionDaoImpl questionDaoImpl;
	
	public void addQuestion(Question p){
		this.questionDaoImpl.saveQuestion(p);
	}

	@Transactional(readOnly=true)
	public Page<Question> listQuestion(int pageNum,int pageSize,Object[] params){
		return this.questionDaoImpl.findQuestion(pageNum, pageSize, params);
	}
	
	@Transactional(readOnly=true)
	public Question getQuestion(int QuestionId){
		return this.questionDaoImpl.getQuestion(QuestionId);
	}
	
	public void editQuestion(Question p){
		Question pdb=this.questionDaoImpl.getQuestion(p.getQuestionId());
//		pdb.setName(p.getName());
//		pdb.setPrice(p.getPrice());
		this.questionDaoImpl.updateQuestion(pdb);
	}
	
	public void dropQuestion(int QuestionId){
		this.questionDaoImpl.deleteQuestion(QuestionId);
	}
}
