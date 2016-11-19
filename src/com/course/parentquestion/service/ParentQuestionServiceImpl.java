package com.course.parentquestion.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.course.parentquestion.dao.ParentQuestionDaoImpl;
import com.course.entity.ParentQuestion;
import com.framework.Page;


@Service
@Transactional(readOnly=false)
public class ParentQuestionServiceImpl {
		
	@Resource
	private ParentQuestionDaoImpl parentQuestionDaoImpl;
	
	public void addParentQuestion(ParentQuestion p){
		this.parentQuestionDaoImpl.saveParentQuestion(p);
	}

	@Transactional(readOnly=true)
	public Page<ParentQuestion> listParentQuestion(int pageNum,int pageSize,Object[] params){
		return this.parentQuestionDaoImpl.findParentQuestion(pageNum, pageSize, params);
	}
	
	@Transactional(readOnly=true)
	public ParentQuestion getParentQuestion(int parentQuestionId){
		return this.parentQuestionDaoImpl.getParentQuestion(parentQuestionId);
	}
	
	public void editParentQuestion(ParentQuestion p){
		ParentQuestion pdb=this.parentQuestionDaoImpl.getParentQuestion(p.getParentQuestionId());
//		pdb.setName(p.getName());
//		pdb.setPrice(p.getPrice());
		this.parentQuestionDaoImpl.updateParentQuestion(pdb);
	}
	
	public void dropParentQuestion(int parentQuestionId){
		this.parentQuestionDaoImpl.deleteParentQuestion(parentQuestionId);
	}
}

