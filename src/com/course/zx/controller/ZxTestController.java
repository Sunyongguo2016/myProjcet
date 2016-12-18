package com.course.zx.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
		Map<Integer,String> an = new HashMap<Integer,String>();
		
		
		if(!(parentQuestion.getParentQuestionName().equals("Writing")
				||parentQuestion.getParentQuestionName().equals("Translation"))){
			
			//判断 听力与非听力区别判断，区别插入记录Map "an"
			if(parentQuestion.getParentQuestionName().contains("ListeningComprehension")){
				Iterator<ParentQuestion> it = parentQuestion.getExam().getParentQuestions().iterator();
				while(it.hasNext()){
					ParentQuestion pq = it.next();
					if(pq.getParentQuestionName().contains("ListeningComprehension")){
						this.judge(request, pq, an);
					}
				}
			}else{
				this.judge(request, parentQuestion, an);
			}
			
		}

		request.setAttribute("tested", "on");
		request.setAttribute("parentQuestion", parentQuestion);
		request.setAttribute("examType", parentQuestion.getExam().getExamType());
		request.setAttribute("an", an);
		
		return "examzx/zxpreview";
	}

	private void judge(HttpServletRequest request, ParentQuestion parentQuestion, Map<Integer, String> an) {
		String answer;
		String daan;
		String name;
		List<Question> questions;
		Question question;
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
			an.put(question.getQuestionId(), daan);
			System.out.println("daan:"+daan);
			System.out.println("true or false:"+daan.equals(answer));
			
		}
	}
	
}
