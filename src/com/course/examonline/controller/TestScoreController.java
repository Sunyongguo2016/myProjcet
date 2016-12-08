package com.course.examonline.controller;

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

import com.course.entity.Exam;
import com.course.entity.ParentQuestion;
import com.course.entity.Question;
import com.course.entity.Score;
import com.course.entity.StudentInfo;
import com.course.entity.Error;
import com.course.error.service.ErrorServiceImpl;
import com.course.exam.service.ExamServiceImpl;
import com.course.score.service.ScoreServiceImpl;
import com.course.studentinfo.service.StudentInfoServiceImpl;

/**
 * 
 * @Description 		试卷的评分功能
 * @author 				孙晓辉
 * @createDate  		2016/12/4
 * @version 			V1.0
 */

@Controller
@RequestMapping("testscore")
public class TestScoreController {
	@Resource
	private ExamServiceImpl examServiceImpl;
	
	@Resource
	private ScoreServiceImpl scoreServiceImpl;
	
	@Resource
	private StudentInfoServiceImpl studentInfoServiceImpl;
	
	@Resource
	private ErrorServiceImpl errorServiceImpl;
	
	/**
	 * 
	 * @desc				判断客观题对错，并将所得分数存入score表中，错题存入error表中
	 * @author				孙晓辉
	 * @createDate 			2016/12/4
	 * @param 				examId
	 * @return				String
	 * 
	 */
	@RequestMapping("score")
	public String look(@RequestParam(name="examId",defaultValue="0") int examId,
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
//				
//				break;
//			}
//		}
		
		//通过Id获取Exam对象
		Exam exam = examServiceImpl.getExam(examId);
		
		//根据Exam获得ParentQuestion的List
		List<ParentQuestion> parentQuestions = exam.getParentQuestions();
		
		//标准答案
		String answer = null;
		//用户的答案
		String daan = null;
		//要获取值的name
		String name = null;
		ParentQuestion parentQuestion = null;
		List<Question> questions = null;
		Question question = null;
		
		
		Iterator<ParentQuestion> it = parentQuestions.iterator();
		while(it.hasNext()){
			parentQuestion = it.next();
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
						this.saveScore(exam, parentQuestion, question, question.getQuestionScore(), studentInfo);
					}else{
						//用户答案错误
						//保存到Score表
						this.saveScore(exam, parentQuestion, question, 0, studentInfo);
						//保存到Error表
						this.saveError(exam, parentQuestion, question, studentInfo);
					}
				}
			}
		}
		//计算总分
		float mark = this.caculate(examId, studentInfo);
		System.out.println("总分"+mark);
		session.removeAttribute("url");
		request.setAttribute("mark", mark);
		request.setAttribute("tested", "on");
		request.setAttribute("exam", exam);
		
		return "examzc/preview";
	}
	
	/**
	 * 
	 * @desc				算出客观题分数
	 * @author				孙晓辉
	 * @createDate 			2016/12/4
	 * @param 				examId
	 * @return				String
	 * 
	 */
	public float caculate(int examId,StudentInfo studentInfo){
		float mark = 0;
		System.out.println("0.0"+mark);
		//通过StudentInfo获得Score集合
		Set<Score> scores = studentInfo.getScores();
		Iterator<Score> it = scores.iterator();
		Score score = null;
		while(it.hasNext()){
			score = it.next();
			if(score.getExam().getExamId()==examId){
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
	 * @author				孙晓辉
	 * @createDate 			2016/12/4
	 * @param 				parentQuestion,question,Score,studentInfo
	 * @return				String
	 * 
	 */
	public void saveScore(Exam exam,ParentQuestion parentQuestion,Question question,
			float markScore,StudentInfo studentInfo){
		//创建Score对象
		Score score = new Score();
		//初始化
		score.setExam(exam);
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
	 * @author				孙晓辉
	 * @createDate 			2016/12/4
	 * @param 				examId
	 * @return				String
	 * 
	 */
	public void saveError(Exam exam,ParentQuestion parentQuestion,Question question,
			StudentInfo studentInfo){
		//创建Error对象
		Error error = new Error();
		//初始化error
		error.setExam(exam);
		error.setParentQuestion(parentQuestion);
		error.setQuestion(question);
		error.setStudentInfo(studentInfo);
		//存到Error表中
		this.errorServiceImpl.addError(error);
	}
}
