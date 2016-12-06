package com.course.score.dao;

import org.springframework.stereotype.Repository;

import com.course.entity.Score;
import com.framework.BaseDao;

/**
 * 
 * @Description 		分数表Dao
 * @author 				孙晓辉
 * @createDate  		2016/12/4
 * @version 			V1.0
 */
@Repository
public class ScoreDaoImpl extends BaseDao<Score, Integer>{
	public void saveScore(Score Score){
		try {
			this.save(Score);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Score getScore(int Id){
		try {
			Score s=this.get(Id);
			return s;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public void updateScore(Score Score){
		try {
			this.update(Score);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteScore(int Id){
		try {
			this.delete(Id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
