package com.course.zx.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.course.entity.ParentQuestion;
import com.course.entity.Question;
import com.course.entity.Score;
import com.course.entity.StudentInfo;
import com.course.entity.Error;
import com.course.error.service.ErrorServiceImpl;
import com.course.parentquestion.service.ParentQuestionServiceImpl;
import com.course.score.service.ScoreServiceImpl;
import com.course.studentinfo.service.StudentInfoServiceImpl;

/**
 * 
 * @Description 		专项的评分功能
 * @author 				李翘楚
 * @createDate  		2016/12/7
 * @version 			V1.0
 */

@Controller
@RequestMapping("zxscore")
public class ZxTestController {
	
	@Resource
	private ParentQuestionServiceImpl parentQuestionServiceImpl;
	
	@Resource
	private ScoreServiceImpl scoreServiceImpl;
	
	@Resource
	private StudentInfoServiceImpl studentInfoServiceImpl;
	
	@Resource
	private ErrorServiceImpl errorServiceImpl;
	
	/**
	 * 
	 * @desc				判断客观题对错，并将所得分数存入score表中，错题存入error表中
	 * @author				李翘楚
	 * @createDate 			2016/12/7
	 * @param 				parentQuestionId
	 * @return				String
	 * 
	 */
	@RequestMapping("score")
	public String look(@RequestParam(name="parentQuestionId",defaultValue="0") int parentQuestionId,
			HttpServletRequest request,
			HttpSession session,
			Model model){
		//通过studentId获取StudentInfo对象
		int studentId = (int) session.getAttribute("stuId");
		StudentInfo studentInfo = studentInfoServiceImpl.getStudentInfo(studentId);
//		Set<Score> scores = studentInfo.getScores();
//		Iterator<Score> s = scores.iterator();
//		Score sc = null;
//		while(s.hasNext()){
//			sc = s.next();
//			if(sc.getExam().getExamId()==examId){
//				//由于级联关系,many方无法直接删除,需要解除与one方的关联
//				sc.getStudentInfo().getScores().remove(sc);
//				sc.setStudentInfo(null);
//				this.scoreServiceImpl.dropScore(sc.getId());
//			}
//		}
		
		//通过Id获取ParentQuestion对象
		ParentQuestion parentQuestion = parentQuestionServiceImpl.getParentQuestion(parentQuestionId);
		
		//标准答案
		String answer = null;
		//用户的答案
		String daan = null;
		//要获取值的name
		String name = null;
		List<Question> questions = null;
		Question question = null;
		
		
		if(!(parentQuestion.getParentQuestionName().equals("Writing")
				||parentQuestion.getParentQuestionName().equals("Translation"))){
			questions = parentQuestion.getQuestions();
			Iterator<Question> he = questions.iterator();
			System.out.println("ParentQuestionName:"+parentQuestion.getParentQuestionName());
			while(he.hasNext()){
				question = he.next();
				answer = question.getQuestionAnswer();
				System.out.println("answer:"+answer);
				name = "Q-"+question.getQuestionId();
				System.out.println("name:"+name);
				daan = request.getParameter(name);
				System.out.println("daan:"+daan);
				System.out.println("true or false:"+daan.equals(answer));
				
				//用户答案正确
				if(daan.equals(answer)){
					//保存到Score表
					this.saveScore(parentQuestion, question, question.getQuestionScore(), studentInfo);
				}else{
					//用户答案错误
					//保存到Score表
					this.saveScore(parentQuestion, question, 0, studentInfo);
					//保存到Error表
					this.saveError(parentQuestion, question, studentInfo);
				}
			}
		}
		//计算总分
		float mark = this.caculate(parentQuestionId, studentInfo);
		System.out.println("总分"+mark);
		request.setAttribute("mark", mark);
		request.setAttribute("tested", "on");
		request.setAttribute("parentQuestion", parentQuestion);
		
		return "examzx/zxpreview";
	}
	
	/**
	 * 
	 * @desc				算出客观题分数
	 * @author				李翘楚
	 * @createDate 			2016/12/7
	 * @param 				parentQuestionId
	 * @return				String
	 * 
	 */
	public float caculate(int parentQuestionId,StudentInfo studentInfo){
		float mark = 0;
		System.out.println("0.0"+mark);
		//通过StudentInfo获得Score集合
		Set<Score> scores = studentInfo.getScores();
		Iterator<Score> it = scores.iterator();
		Score score = null;
		while(it.hasNext()){
			score = it.next();
			if(score.getParentQuestion().getParentQuestionId()==parentQuestionId){
				System.out.println("getscore"+score.getScore());
				mark += score.getScore();
				System.out.println("mark:"+mark);
			}
		}
		return (float)(Math.round(mark*100))/100;
	}
	
	/**
	 * 
	 * @desc				将所得分数存入score表中
	 * @author				李翘楚
	 * @createDate 			2016/12/7
	 * @param 				parentQuestion,question,Score,studentInfo
	 * @return				String
	 * 
	 */
	public void saveScore(ParentQuestion parentQuestion,Question question,
			float markScore,StudentInfo studentInfo){
		//创建Score对象
		Score score = new Score();
		//初始化
		score.setParentQuestion(parentQuestion);
		score.setQuestion(question);
		score.setScore(markScore);
		score.setStudentInfo(studentInfo);
		//存到Score表中
		this.scoreServiceImpl.addScore(score);
	}
	/**
	 * 
	 * @desc				将错题存入error表中
	 * @author				李翘楚
	 * @createDate 			2016/12/7
	 * @param 				parentQuestion,question,Score,studentInfo
	 * @return				String
	 * 
	 */
	public void saveError(ParentQuestion parentQuestion,Question question,
			StudentInfo studentInfo){
		//创建Error对象
		Error error = new Error();
		//初始化error
		error.setParentQuestion(parentQuestion);
		error.setQuestion(question);
		error.setStudentInfo(studentInfo);
		//存到Error表中
		this.errorServiceImpl.addError(error);
	}
}
