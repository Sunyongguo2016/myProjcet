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
			
			@RequestParam(name = "questioncontent46") String questionContent46,
			@RequestParam(name = "questionanswer46") String questionAnswer46,
			@RequestParam(name = "questionexplain46") String questionExplain46,
			
			
			@RequestParam(name = "questioncontent47") String questionContent47,
			@RequestParam(name = "questionanswer47") String questionAnswer47,
			@RequestParam(name = "questionexplain47") String questionExplain47,
			
			@RequestParam(name = "questioncontent48") String questionContent48,
			@RequestParam(name = "questionanswer48") String questionAnswer48,
			@RequestParam(name = "questionexplain48") String questionExplain48,
			
			@RequestParam(name = "questioncontent49") String questionContent49,
			@RequestParam(name = "questionanswer49") String questionAnswer49,
			@RequestParam(name = "questionexplain49") String questionExplain49,
			
			@RequestParam(name = "questioncontent50") String questionContent50,
			@RequestParam(name = "questionanswer50") String questionAnswer50,
			@RequestParam(name = "questionexplain50") String questionExplain50,
			
			@RequestParam(name = "questioncontent51") String questionContent51,
			@RequestParam(name = "questionanswer51") String questionAnswer51,
			@RequestParam(name = "questionexplain51") String questionExplain51,
			
			@RequestParam(name = "questioncontent52") String questionContent52,
			@RequestParam(name = "questionanswer52") String questionAnswer52,
			@RequestParam(name = "questionexplain52") String questionExplain52,
			
			@RequestParam(name = "questioncontent53") String questionContent53,
			@RequestParam(name = "questionanswer53") String questionAnswer53,
			@RequestParam(name = "questionexplain53") String questionExplain53,
			
			@RequestParam(name = "questioncontent54") String questionContent54,
			@RequestParam(name = "questionanswer54") String questionAnswer54,
			@RequestParam(name = "questionexplain54") String questionExplain54,
			
			@RequestParam(name = "questioncontent55") String questionContent55,
			@RequestParam(name = "questionanswer55") String questionAnswer55,
			@RequestParam(name = "questionexplain55") String questionExplain55,
			HttpServletRequest request){
			//运用集合方法
		
			//list集合存储所有的question答案和解析 信息方便在for循环中存储
			List<String> questionLists = new ArrayList<String>();
			
			questionLists.add(questionAnswer46);
			questionLists.add(questionAnswer47);
			questionLists.add(questionAnswer48);
			questionLists.add(questionAnswer49);
			questionLists.add(questionAnswer50);
			questionLists.add(questionAnswer51);
			questionLists.add(questionAnswer52);
			questionLists.add(questionAnswer53);
			questionLists.add(questionAnswer54);
			questionLists.add(questionAnswer55);
			questionLists.add(questionExplain46);
			questionLists.add(questionExplain47);
			questionLists.add(questionExplain48);
			questionLists.add(questionExplain49);
			questionLists.add(questionExplain50);
			questionLists.add(questionExplain51);
			questionLists.add(questionExplain52);
			questionLists.add(questionExplain53);
			questionLists.add(questionExplain54);
			questionLists.add(questionExplain55);
			
			questionLists.add(questionContent46);
			questionLists.add(questionContent47);
			questionLists.add(questionContent48);
			questionLists.add(questionContent49);
			questionLists.add(questionContent50);
			questionLists.add(questionContent51);
			questionLists.add(questionContent52);
			questionLists.add(questionContent53);
			questionLists.add(questionContent54);
			questionLists.add(questionContent55);
			
			
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
			Set<Question> questions = new HashSet<Question>(0);
			
			for(Integer i = 0;i<questionTo-questionFrom+1;i++){
				Question question = new Question();
				question.setParentQuestion(parentQuestion);
				question.setQuestionContent(((Integer)(i+questionFrom)).toString()+"."+questionLists.get(i+20));
				question.setQuestionAnswer(questionLists.get(i));
				question.setQuestionExplain(questionLists.get(i+10));
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
