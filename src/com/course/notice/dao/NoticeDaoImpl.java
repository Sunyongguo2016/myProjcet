package com.course.notice.dao;

import org.springframework.stereotype.Repository;
import com.course.entity.Notice;
import com.framework.BaseDao;
import com.framework.Page;

@Repository
public class NoticeDaoImpl  extends BaseDao<Notice, Integer> {

	public void saveNotice(Notice p){
		try {
			this.save(p);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Page<Notice> findNotice(int pageNum, int pageSize,Object[] params){
		String hql;
		if(params!=null && params.length>0){
			hql="from Notice n where n.noticeTitle like ?";
			params[0] = "%" + params[0] + "%";
			
		}else{
			hql="from Notice";
		}
		try {
			Page<Notice> page=new Page<Notice>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page=this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Notice getNotice(int noticeId){
		try {
			Notice p=this.get(noticeId);
			
			//不会为空的
			return p;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public void updateNotice(Notice p){
		try {
			this.update(p);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteNotice(int noticeId){
		try {
			this.delete(noticeId);
		} catch (Exception e) {
			//失败回滚
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
