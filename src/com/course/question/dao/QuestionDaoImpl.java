package com.course.question.dao;

import org.springframework.stereotype.Repository;

import com.course.entity.Question;
import com.framework.BaseDao;
import com.framework.Page;

@Repository
public class QuestionDaoImpl extends BaseDao<Question, Integer> {
	public void saveQuestion(Question Question){
		try {
			this.save(Question);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Page<Question> findQuestion(int pageNum, int pageSize,Object[] params){
		String hql;
		if(params!=null && params.length>0){
			hql="from Question p where p.name like ?";
			params[0]="%"+params[0]+"%";
			
		}else{
			hql="from Question";
		}
		try {
			Page<Question> page=new Page<Question>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page=this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Question getQuestion(int QuestionId){
		try {
			Question p=this.get(QuestionId);
			return p;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public void updateQuestion(Question Question){
		try {
			this.update(Question);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteQuestion(int QuestionId){
		try {
			this.delete(QuestionId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

