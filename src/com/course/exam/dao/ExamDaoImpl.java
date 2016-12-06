package com.course.exam.dao;

import org.springframework.stereotype.Repository;

import com.course.entity.Exam;
import com.framework.BaseDao;
import com.framework.Page;

@Repository
public class ExamDaoImpl extends BaseDao<Exam, Integer> {

	/**
	 * 
	 * @Description 		增加试卷
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public void saveExam(Exam e) {
		try {
			this.save(e);
		} catch (Exception ee) {
			ee.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @Description 		按页查询试卷
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public Page<Exam> findExam(int pageNum, int pageSize, Object[] params) {
		String hql;
		if (params != null && params.length > 1) {
			hql = "from Exam e where e.examName like ? and e.examType like ?";
			params[0] = "%" + params[0] + "%";
			params[1] = "%" + params[1] + "%";
		}else if (params != null && params.length > 0) {
			hql = "from Exam e where e.examName like ?";
			params[0] = "%" + params[0] + "%";
		} else {
			hql = "from Exam";
		}
		try {
			Page<Exam> page = new Page<Exam>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page = this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception ee) {
			ee.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 
	 * @Description 		按时间询试卷
	 * @author 				孙晓辉
	 * @createDate  		2016/11/30
	 * @version 			V1.0
	 * 
	 */
	public Page<Exam> findExamByTime(int pageNum, int pageSize, Object[] params) {
		String hql;
		if (params != null && params.length > 0) {
			hql = "from Exam e where e.examTime=?";
			params[0] = params[0];
		} else {
			hql = "from Exam";
		}
		try {
			Page<Exam> page = new Page<Exam>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page = this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception ee) {
			ee.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 
	 * @Description 		按类型询试卷
	 * @author 				孙晓辉
	 * @createDate  		2016/11/30
	 * @version 			V1.0
	 * 
	 */
	public Page<Exam> findExamByType(int pageNum, int pageSize, Object[] params) {
		String hql;
		if (params != null && params.length > 0) {
			System.out.println("examtype"+params[0]);
			hql = "from Exam e where e.examType like ?";
			params[0] = "%" + params[0] + "%";
		} else {
			hql = "from Exam";
		}
		try {
			Page<Exam> page = new Page<Exam>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page = this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception ee) {
			ee.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * @Description 		根据ID查询试卷
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public Exam getExam(int examId) {
		try {
			Exam e = this.get(examId);
			return e;
		} catch (Exception ee) {
			ee.printStackTrace();
			return null;
		}
	}
	
	public Exam findByName(String examName){
		String hql;
		Object[] params = {examName};
		hql="from Exam e where e.examName like ?";
		try {
			return this.findOne(hql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * @Description 		编辑试卷
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public void updateExam(Exam e) {
		try {
			this.update(e);
		} catch (Exception ee) {
			ee.printStackTrace();
		}
	}

	/**
	 * 
	 * @Description 		删除试卷
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public void deleteExam(int examId) {
		try {
			this.delete(examId);
		} catch (Exception ee) {
			ee.printStackTrace();
		}
	}
}
