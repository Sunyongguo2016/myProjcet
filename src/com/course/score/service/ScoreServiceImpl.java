package com.course.score.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.course.entity.Score;
import com.course.score.dao.ScoreDaoImpl;

/**
 * 
 * @Description 		分数表Service
 * @author 				孙晓辉
 * @createDate  		2016/12/4
 * @version 			V1.0
 */
@Service
@Transactional(readOnly=false)
public class ScoreServiceImpl {
	@Resource
	private ScoreDaoImpl scoreDaoImpl;
	
	public void addScore(Score s){
		this.scoreDaoImpl.saveScore(s);
	}
	
	@Transactional(readOnly=true)
	public Score getScore(int Id){
		return this.scoreDaoImpl.getScore(Id);
	}
	
	public void editScore(Score s){
		Score pdb=this.scoreDaoImpl.getScore(s.getId());
//		pdb.setName(p.getName());
//		pdb.setPrice(p.getPrice());
		this.scoreDaoImpl.updateScore(pdb);
	}
	
	public void dropScore(int Id){
		this.scoreDaoImpl.deleteScore(Id);
	}
}
