package com.course.notice.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.course.entity.Notice;
import com.course.notice.dao.NoticeDaoImpl;
import com.framework.Page;

@Service
@Transactional(readOnly=false)
public class NoticeServiceImpl {
	

	@Resource
	private NoticeDaoImpl productDaoImpl;
	
	public void addNotice(Notice p){
		this.productDaoImpl.saveNotice(p);
	}
	
	@Transactional(readOnly=true)
	public Page<Notice> listContent(int pageNum,int pageSize,Object[] params){
		return this.productDaoImpl.findContent(pageNum, pageSize, params);
	}
	
	@Transactional(readOnly=true)
	public Page<Notice> listType(int pageNum,int pageSize,Object[] params){
		return this.productDaoImpl.findType(pageNum, pageSize, params);
	}
	
	
	@Transactional(readOnly=true)
	public Page<Notice> listNotice(int pageNum,int pageSize,Object[] params){
		return this.productDaoImpl.findNotice(pageNum, pageSize, params);
	}
	
	@Transactional(readOnly=true)
	public Notice getNotice(int productId){
		return this.productDaoImpl.getNotice(productId);
	}
	
	public void editNotice(Notice n){
		
		Notice ndb=this.productDaoImpl.getNotice(n.getNoticeId());
		ndb.setNoticeType(n.getNoticeType());
		ndb.setNoticeTitle(n.getNoticeTitle());
		ndb.setNoticeContent(n.getNoticeContent());
		ndb.setNoticeTime(n.getNoticeTime());
		
		this.productDaoImpl.updateNotice(ndb);
	}
	
	public void dropNotice(int noticeId){
		this.productDaoImpl.deleteNotice(noticeId);
	}

}
