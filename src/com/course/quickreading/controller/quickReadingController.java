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
import com.course.parentquestion.service.ParentQuestionServiceImpl;
import com.course.question.service.QuestionServiceImpl;
import com.course.selectt.service.SelecttServiceImpl;
import com.framework.Page;

@Controller
@RequestMapping("quickreading")
public class quickReadingController {
	
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
	public String add(@RequestParam(name = "examname")String examname,
			@RequestParam(name = "parentQuestionName") String parentQuestionName,
			@RequestParam(name = "description") String description,
			@RequestParam(name = "parentquestiontitle") String parentquestiontitle,
			@RequestParam(name = "questionscore") String questionscore,
			@RequestParam(name = "parentquestionarticle") String parentquestionarticle,
			//题号的开始和结束
			@RequestParam(name = "questionfrom") Integer questionfrom,
			@RequestParam(name = "questionto") Integer questionto,
			
			@RequestParam(name = "selecttcontent46") String selecttcontent46,
			@RequestParam(name = "questionanswer46") String questionanswer46,
			@RequestParam(name = "questionexplain46") String questionexplain46,
			
			
			@RequestParam(name = "selecttcontent47") String selecttcontent47,
			@RequestParam(name = "questionanswer47") String questionanswer47,
			@RequestParam(name = "questionexplain47") String questionexplain47,
			
			@RequestParam(name = "selecttcontent48") String selecttcontent48,
			@RequestParam(name = "questionanswer48") String questionanswer48,
			@RequestParam(name = "questionexplain48") String questionexplain48,
			
			@RequestParam(name = "selecttcontent49") String selecttcontent49,
			@RequestParam(name = "questionanswer49") String questionanswer49,
			@RequestParam(name = "questionexplain49") String questionexplain49,
			
			@RequestParam(name = "selecttcontent50") String selecttcontent50,
			@RequestParam(name = "questionanswer50") String questionanswer50,
			@RequestParam(name = "questionexplain50") String questionexplain50,
			
			@RequestParam(name = "selecttcontent51") String selecttcontent51,
			@RequestParam(name = "questionanswer51") String questionanswer51,
			@RequestParam(name = "questionexplain51") String questionexplain51,
			
			@RequestParam(name = "selecttcontent52") String selecttcontent52,
			@RequestParam(name = "questionanswer52") String questionanswer52,
			@RequestParam(name = "questionexplain52") String questionexplain52,
			
			@RequestParam(name = "selecttcontent53") String selecttcontent53,
			@RequestParam(name = "questionanswer53") String questionanswer53,
			@RequestParam(name = "questionexplain53") String questionexplain53,
			
			@RequestParam(name = "selecttcontent54") String selecttcontent54,
			@RequestParam(name = "questionanswer54") String questionanswer54,
			@RequestParam(name = "questionexplain54") String questionexplain54,
			
			@RequestParam(name = "selecttcontent55") String selecttcontent55,
			@RequestParam(name = "questionanswer55") String questionanswer55,
			@RequestParam(name = "questionexplain55") String questionexplain55,
			HttpServletRequest request){
			//运用集合方法
		
			//list集合存储所有的question答案和解析 信息方便在for循环中存储
			List<String> questionLists = new ArrayList<String>();
			
			questionLists.add(questionanswer46);
			questionLists.add(questionanswer47);
			questionLists.add(questionanswer48);
			questionLists.add(questionanswer49);
			questionLists.add(questionanswer50);
			questionLists.add(questionanswer51);
			questionLists.add(questionanswer52);
			questionLists.add(questionanswer53);
			questionLists.add(questionanswer54);
			questionLists.add(questionanswer55);
			questionLists.add(questionexplain46);
			questionLists.add(questionexplain47);
			questionLists.add(questionexplain48);
			questionLists.add(questionexplain49);
			questionLists.add(questionexplain50);
			questionLists.add(questionexplain51);
			questionLists.add(questionexplain52);
			questionLists.add(questionexplain53);
			questionLists.add(questionexplain54);
			questionLists.add(questionexplain55);
			
			//将获取到的参数复制给parentquestion，保存parentquestion
			ParentQuestion parentquestion = new ParentQuestion();
			parentquestion.setParentQuestionName(parentQuestionName);
			parentquestion.setDescription(description);
			parentquestion.setParentQuestionTitle(parentquestiontitle);
			parentquestion.setParentQuestionArticle(parentquestionarticle);
	
			//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
			Set<Question> questions = new HashSet<Question>(0);
			
			for(Integer i = 0;i<questionto-questionfrom+1;i++)
			{
				Question question = new Question();
				question.setParentQuestion(parentquestion);
				question.setQuestionContent(((Integer)(i+questionfrom)).toString());
				question.setQuestionAnswer(questionLists.get(i));
				question.setQuestionExplain(questionLists.get(i+10));
				question.setQuestionScore(Float.parseFloat(questionscore));
				
				Set<Selectt> selectts = new HashSet<Selectt>(0);
				
				
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
					 @RequestParam(name="parentQuestionName",defaultValue="quickReading") String parentQuestionName,
					 HttpServletRequest request, Model model){
				 
				 Page<ParentQuestion> page;
				 
				 if(searchParam==null || "".equals(searchParam)){
					 //在老师的基础上自己创建了方法      用于针对题型模糊查找	 修改大题controller  parentquestionserviceimpl  parentquestiondaoimpl 三个类 
					 page=this.parentQuestionServiceImpl.listParentQuestionByParentQuestionName(pageNum, 5, new
							 Object[]{parentQuestionName});
				 }else{
					 page=this.parentQuestionServiceImpl.listParentQuestionByParentQuestionName(pageNum, 5, new
					 Object[]{parentQuestionName,searchParam});
				 }
				 
				 request.setAttribute("page", page);
				 request.setAttribute("searchParam", searchParam);
				 
				 return "quickreading/quickreadinglist";
			}
			}
