package com.course.selectt.dao;

import org.springframework.stereotype.Repository;

import com.course.entity.Selectt;
import com.framework.BaseDao;
import com.framework.Page;

@Repository
public class SelecttDaoImpl extends BaseDao<Selectt, Integer> {

	public void saveSelectt(Selectt selectt){
		try {
			this.save(selectt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Page<Selectt> findSelectt(int pageNum, int pageSize,Object[] params){
		String hql;
		if(params!=null && params.length>0){
			hql="from Selectt p where p.name like ?";
			params[0]="%"+params[0]+"%";
			
		}else{
			hql="from Selectt";
		}
		try {
			Page<Selectt> page=new Page<Selectt>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page=this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Selectt getSelectt(int SelecttId){
		try {
			Selectt p=this.get(SelecttId);
			return p;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public void updateSelectt(Selectt selectt){
		try {
			this.update(selectt);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteSelectt(int SelecttId){
		try {
			this.delete(SelecttId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
