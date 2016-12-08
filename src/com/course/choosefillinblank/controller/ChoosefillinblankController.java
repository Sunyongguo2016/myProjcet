package com.course.choosefillinblank.controller;

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

/**
 * 
 * @Description 		大题十五选十控制器  实现增加   删除  查看(list)功能
 * @author 				孙永国
 * @createDate  		2016/11/20
 * @version 			V1.0
 * 
 */

@Controller
@RequestMapping("choosefillinblank")
public class ChoosefillinblankController {

	@Resource
	private ExamServiceImpl examServiceImpl;
	
	@Resource
	private ParentQuestionServiceImpl parentQuestionServiceImpl;
	
	@Resource
	private QuestionServiceImpl questionServiceImpl;
	
	@Resource
	private SelecttServiceImpl selecttServiceImpl;

	
	
	/**
	 * 
	 * @desc				添加十五选十大题，获取addcontent.jsp的参数，实现添加parentQuestion对象；
	 * @author				孙永国
	 * @createDate 			2016/11/21 修改日期 2016/12/7 修改者：田瑞航
	 * @param 				获得添加十五选十大题相关参数
	 * @return				String
	 * 
	 */
	@RequestMapping("add")
	public String add(@RequestParam(name = "examname") String examName,
			@RequestParam(name = "parentquestionname") String parentQuestionName,
			@RequestParam(name = "questionfrom", required = true) Integer questionFrom,
			@RequestParam(name = "questionto") Integer questionTo,
			@RequestParam(name = "parentquestionarticle") String parentQuestionArticle,
			@RequestParam(name = "parentquestiontitle") String parentQuestionTitle,
			@RequestParam(name = "description") String description,
			@RequestParam(name = "questionscore") String questionScore,
			HttpServletRequest request) {
		
		// 根据examName找到exam对象
		Exam exam = this.examServiceImpl.findByName(examName);
		if (exam == null) {
			return "404";
		}
		
		//将获取到的参数赋值给parentquestion,保存parentquestion
		ParentQuestion parentQuestion = new ParentQuestion();
		
		//parentquestion与exam关联;
		parentQuestion.setExam(exam);
		parentQuestion.setParentQuestionName(parentQuestionName);
		parentQuestion.setDescription(description);
		parentQuestion.setParentQuestionTitle(parentQuestionTitle);
		parentQuestion.setParentQuestionArticle(parentQuestionArticle);

		
		//设置questions集合  将question加入questions  将questions作为属性加入parentQuestion
		List<Question> questions = new ArrayList<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 1; i <= questionTo-questionFrom+1; i++) {
			Question question = new Question();
			//获取并设置参数
			question.setParentQuestion(parentQuestion);
			question.setQuestionContent(((Integer)(questionFrom+i-1)).toString());
			question.setQuestionAnswer(request.getParameter("questionanswer"+i));

			
			//集合questionLists中  前十个是answer  后十个是explain
			question.setQuestionExplain(request.getParameter("questionexplain"+i));
			question.setQuestionScore(Float.parseFloat(questionScore));
			
			List<Selectt> selectts = new ArrayList<Selectt>(0);
			
			//存储selectt表  将selectts赋值给question 与question联系起来
			for(Integer j = 1; j<16; j++){
				Selectt selectt = new Selectt();
				selectt.setQuestion(question);
				char c=(char) (j+64);
				
				//根据ASCII码转换成字符'A' 'B'..
				selectt.setSelecttName(c+"");
				selectt.setSelecttContent(request.getParameter("selecttcontent"+j));
				
				this.selecttServiceImpl.addSelectt(selectt);
				selectts.add(selectt);
			}
			
			question.setSelectts(selectts);

			this.questionServiceImpl.addQuestion(question);
			questions.add(question);
		}
		
		parentQuestion.setQuestions(questions);
		
		//存储parentQuestion
		this.parentQuestionServiceImpl.addParentQuestion(parentQuestion);
		return "redirect:list";
	}
	
	
	
	
	/**
	 * 
	 * @desc				删除十五选十大题   级联删除下面的question  selectt 表内容
	 * @author				孙永国
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
	 * @desc				查看十五选十大题，封装到page对象里  返回jsp页面
	 * @author				孙永国
	 * @createDate 			2016/11/22
	 * @param 				搜索参数    大题名称参数 等..
	 * @return				String
	 * 
	 */
	 @RequestMapping("list")
	 public String list(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			 @RequestParam(name="searchParam",defaultValue="") String searchParam,
			 //添加参数parentQuestionName  用于按大题名称查找parentquestion表   设置默认值
			 @RequestParam(name="parentQuestionName",defaultValue="ChooseFillInBlank") String parentQuestionName,
			 HttpServletRequest request, Model model){
		 
		 Page<ParentQuestion> page;
		 
		 if(searchParam==null || "".equals(searchParam)){
			 //在老师的基础上自己创建了方法      用于针对题型模糊查找	 修改大题controller  parentquestionserviceimpl  parentquestiondaoimpl 三个类 
			 page=this.parentQuestionServiceImpl.listParentQuestionByParentQuestionName(pageNum, 5, new
					 Object[]{parentQuestionName});
		 }else{
			 //对搜索参数进行转码，解决上次搜索中文出错问题！
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
		 return "choosefillinblank/choosefillinblanklist";
	 }
}