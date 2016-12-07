package com.course.quickreading.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.course.entity.Exam;
import com.course.entity.ParentQuestion;
import com.course.entity.Question;
import com.course.entity.Selectt;
import com.course.exam.service.ExamServiceImpl;
import com.course.parentquestion.service.ParentQuestionServiceImpl;
import com.course.question.service.QuestionServiceImpl;
import com.course.selectt.service.SelecttServiceImpl;
import com.framework.Page;

@Controller
@RequestMapping("quickreading")
public class QuickReadingController {
	
	@Resource
	private ExamServiceImpl examServiceImpl;
	
	@Resource
	private ParentQuestionServiceImpl parentQuestionServiceImpl;
	
	@Resource
	private QuestionServiceImpl questionServiceImpl;
	
	@Resource
	private SelecttServiceImpl selecttServiceImpl;
	
	/*
	 * 添加阅读大题，获取addreading.jsp的参数，实现添加parentQuestion对象；
	 * 
	 **/
	@RequestMapping("add")
	public String add(@RequestParam(name = "examname")String examName,
			@RequestParam(name = "parentQuestionName") String parentQuestionName,
			@RequestParam(name = "description") String description,
			@RequestParam(name = "parentquestiontitle") String parentQuestionTitle,
			@RequestParam(name = "questionscore") String questionScore,
			@RequestParam(name = "parentquestionarticle") String parentQuestionArticle,
			//题号的开始和结束
			@RequestParam(name = "questionfrom") Integer questionFrom,
			@RequestParam(name = "questionto") Integer questionTo,
			
			HttpServletRequest request){

			
			
			// 根据examName找到exam对象
			Exam exam = this.examServiceImpl.findByName(examName);
			if (exam == null) {
				return "404";
			}
			
			
			//将获取到的参数复制给parentquestion，保存parentquestion
			ParentQuestion parentQuestion = new ParentQuestion();
			
			parentQuestion.setExam(exam);
			parentQuestion.setParentQuestionName(parentQuestionName);
			parentQuestion.setDescription(description);
			parentQuestion.setParentQuestionTitle(parentQuestionTitle);
			parentQuestion.setParentQuestionArticle(parentQuestionArticle);
	
			//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
			List<Question> questions = new ArrayList<Question>(0);
			
			for(Integer i = 1;i<=questionTo-questionFrom+1;i++){
				Question question = new Question();
				//获取并设置参数
				question.setParentQuestion(parentQuestion);
				question.setQuestionContent(((Integer)(questionFrom+i-1)).toString()+"."+request.getParameter("questioncontent"+i));
				question.setQuestionAnswer(request.getParameter("questionanswer"+i));				
				question.setQuestionExplain(request.getParameter("questionexplain"+i));				
				question.setQuestionScore(Float.parseFloat(questionScore));
								
				this.questionServiceImpl.addQuestion(question);
				questions.add(question);
				
				}
			
				return "redirect:list";	
			}
			
				
			/**
			 * 
			 * @desc				删除快速阅读大题   级联删除下面的question  selectt 表内容
			 * @author				田瑞航
			 * @createDate 			2016/11/22
			 * @param 				parentquestionid   大题id  
			 * @return				String 
			 * 
			 */
	
			 @RequestMapping(value="delete")
			 public String delete(@RequestParam("parentQuestionId") int parentQuestionId,
					 HttpServletRequest request){
				 
				 this.parentQuestionServiceImpl.dropParentQuestion(parentQuestionId);
			
				 return "redirect:list";
			 }

			 /**
				 * 
				 * @desc				查看快速阅读大题，封装到page对象里  返回jsp页面
				 * @author				田瑞航
				 * @createDate 			2016/11/22
				 * @param 				搜索参数    大题名称参数 等..
				 * @return				String
				 * 
				 */
			@RequestMapping("list")
			public String list(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
					 @RequestParam(name="searchParam",defaultValue="") String searchParam,
					 //添加参数parentQuestionName  用于按大题名称查找parentquestion表   设置默认值
					 @RequestParam(name="parentQuestionName",defaultValue="QuickReading") String parentQuestionName,
					 HttpServletRequest request, Model model){
				 
				 Page<ParentQuestion> page;
				 
				 if(searchParam==null || "".equals(searchParam)){
					 //在老师的基础上自己创建了方法      用于针对题型模糊查找	 修改大题controller  parentquestionserviceimpl  parentquestiondaoimpl 三个类 
					 page=this.parentQuestionServiceImpl.listParentQuestionByParentQuestionName(pageNum, 5, new
							 Object[]{parentQuestionName});
				 }else{
					 try {
						 searchParam = new String(searchParam.getBytes("ISO8859_1"), "UTF-8");
						} catch (UnsupportedEncodingException e) {
							e.printStackTrace();
						}
					 page=this.parentQuestionServiceImpl.listParentQuestionByParentQuestionName(pageNum, 5, new
					 Object[]{parentQuestionName,searchParam});
				 }
				 
				 request.setAttribute("page", page);
				 request.setAttribute("searchParam", searchParam);
				 
				 return "quickreading/quickreadinglist";
			}
			}
