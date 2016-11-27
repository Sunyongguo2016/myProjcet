package com.course.parentquestion.dao;

import org.springframework.stereotype.Repository;

import com.course.entity.ParentQuestion;
import com.framework.BaseDao;
import com.framework.Page;

@Repository
public class ParentQuestionDaoImpl extends BaseDao<ParentQuestion, Integer> {
		
	public ParentQuestion findByNamdAndPwd(String name,String pwd){
		try{
			return super.findOne("from LoginUser lu where lu.loginName=? and lu.password=?", new Object[]{name,pwd});
	}catch(Exception e){
		e.printStackTrace();
		return null;
	}
}
	public void saveParentQuestion(ParentQuestion p){
		try {
			this.save(p);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//按大题名称和搜索条件查找parentquestion  适用于听力
		public Page<ParentQuestion> findParentQuestionListeningByParentQuestionName(int pageNum, int pageSize,Object[] params){
			String hql;
			if(params!=null && params.length>1){
				hql="from ParentQuestion p where p.parentQuestionName like ? and p.parentQuestionName like ?";
				params[0]="%"+params[0].toString().substring(0, 20)+"%";
				params[1]="%"+params[1]+"%";
			}else{
				hql="from ParentQuestion p where p.parentQuestionName like ?";
				params[0]="%"+params[0].toString().substring(0, 20)+"%";
			}
			try {
				Page<ParentQuestion> page=new Page<ParentQuestion>();
				page.setCurrentPageNum(pageNum);
				page.setPageSize(pageSize);
				page=this.findByPage(pageNum, pageSize, hql, params);
				return page;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
	
	//按大题名称和搜索条件查找parentquestion  适用于十五选十等
	public Page<ParentQuestion> findParentQuestionByParentQuestionName(int pageNum, int pageSize,Object[] params){
		String hql;
		if(params!=null && params.length>1){
			hql="from ParentQuestion p where p.parentQuestionName like ? and p.parentQuestionArticle like ?";
			params[0]="%"+params[0]+"%";
			params[1]="%"+params[1]+"%";
		}else{
			hql="from ParentQuestion p where p.parentQuestionName like ?";
			params[0]="%"+params[0]+"%";
		}
		try {
			Page<ParentQuestion> page=new Page<ParentQuestion>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page=this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	
	
	
	public Page<ParentQuestion> findParentQuestion(int pageNum, int pageSize,Object[] params){
		String hql;
		if(params!=null && params.length>0){
			hql="from ParentQuestion p where p.parentQuestionArticle like ?";
			params[0]="%"+params[0]+"%";
		}else{
			hql="from ParentQuestion";
		}
		try {
			Page<ParentQuestion> page=new Page<ParentQuestion>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page=this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ParentQuestion getParentQuestion(int productId){
		try {
			ParentQuestion p=this.get(productId);
			return p;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public void updateParentQuestion(ParentQuestion p){
		try {
			this.update(p);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteParentQuestion(int parentQuestionId){
		try {
			this.delete(parentQuestionId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
