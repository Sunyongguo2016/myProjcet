package com.course.selectt.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.course.entity.Selectt;
import com.course.selectt.dao.SelecttDaoImpl;
import com.framework.Page;

@Service
@Transactional(readOnly=false)
public class SelecttServiceImpl {
	
	@Resource
	private SelecttDaoImpl selecttDaoImpl;
	
	public void addSelectt(Selectt p){
		this.selecttDaoImpl.saveSelectt(p);
	}

	@Transactional(readOnly=true)
	public Page<Selectt> listSelectt(int pageNum,int pageSize,Object[] params){
		return this.selecttDaoImpl.findSelectt(pageNum, pageSize, params);
	}
	
	@Transactional(readOnly=true)
	public Selectt getSelectt(int SelecttId){
		return this.selecttDaoImpl.getSelectt(SelecttId);
	}
	
	public void editSelectt(Selectt p){
		Selectt pdb=this.selecttDaoImpl.getSelectt(p.getSelecttId());
//		pdb.setName(p.getName());
//		pdb.setPrice(p.getPrice());
		this.selecttDaoImpl.updateSelectt(pdb);
	}
	
	public void dropSelectt(int SelecttId){
		this.selecttDaoImpl.deleteSelectt(SelecttId);
	}
}
