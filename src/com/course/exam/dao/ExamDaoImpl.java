package com.course.exam.dao;

import org.springframework.stereotype.Repository;

import com.course.entity.Exam;
import com.framework.BaseDao;
import com.framework.Page;

@Repository
public class ExamDaoImpl extends BaseDao<Exam, Integer> {

	public void saveExam(Exam e) {
		try {
			this.save(e);
		} catch (Exception ee) {
			ee.printStackTrace();
		}
	}

	public Page<Exam> findExam(int pageNum, int pageSize, Object[] params) {
		String hql;
		if (params != null && params.length > 0) {
			hql = "from Exam e where e.name like ?";
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

	public Exam getExam(int examId) {
		try {
			Exam e = this.get(examId);
			return e;
		} catch (Exception ee) {
			ee.printStackTrace();
			return null;
		}
	}

	public void updateExam(Exam e) {
		try {
			System.out.println("dao" + e.getExamId() + e.getExamName() + e.getExamName() + e.getExamTime());
			this.update(e);
		} catch (Exception ee) {
			ee.printStackTrace();
		}
	}

	public void deleteExam(int examId) {
		try {
			this.delete(examId);
		} catch (Exception ee) {
			ee.printStackTrace();
		}
	}
}
