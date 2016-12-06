package com.course.error.dao;

import org.springframework.stereotype.Repository;

import com.framework.BaseDao;
import com.framework.Page;

@Repository
public class ErrorDaoImpl extends BaseDao<Error, Integer> {
	/**
	 * 
	 * @Description 		按页查询试卷
	 * @author 				童海苹
	 * @createDate  		2016/11/22
	 * @version 			V1.0
	 * 
	 */
	public Page<Error> findCollectError(int pageNum, int pageSize, int isCollect, int studentId, Object[] params) {
		
		String hql;
		if (params != null && params.length > 0) {
			if(isCollect == 1){
				hql = "from Error e where e.isCollect =1 and e.studentInfo in(select s from StudentInfo s where s.studentId="+studentId+") and e.exam in(select ex from Exam ex where ex.examName like ?)";
			} else {
				hql = "from Error e where e.studentInfo in(select s from StudentInfo s where s.studentId="+studentId+") and e.exam in(select ex from Exam ex where ex.examName like ?)";
			}
			params[0] = "%" + params[0] + "%";
		}else{
			if(isCollect == 1){
				hql = "from Error e where e.isCollect =1 and e.studentInfo in(select s from StudentInfo s where s.studentId="+studentId+")";
			} else {
				hql = "from Error e where e.studentInfo in(select s from StudentInfo s where s.studentId="+studentId+")";
			}
		}
		
		try {
			Page<Error> page = new Page<Error>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page = this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception ee) {
			ee.printStackTrace();
			return null;
		}
	}

}
