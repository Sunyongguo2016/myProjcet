package com.course.reading.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
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
@RequestMapping("reading")
public class ReadingController {

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
	public String add(@RequestParam(name = "examname") String examName,
			@RequestParam(name = "parentQuestionName") String parentQuestionName1,
			@RequestParam(name = "description") String description,
			@RequestParam(name = "questionscore") String questionScore,
			
			//题号的开始和结束
			@RequestParam(name = "questionfrom") Integer questionFrom,
			@RequestParam(name = "questionto") Integer questionTo,
			@RequestParam(name = "questionfrom2") Integer questionFrom2,
			@RequestParam(name = "questionto2") Integer questionTo2,
			//获取文章内容标题
			@RequestParam(name = "parentquestiontitle1") String parentQuestionTitle1,
			@RequestParam(name = "parentquestionarticle1") String parentQuestionArticle1,
			@RequestParam(name = "parentquestionname2") String parentQuestionName2,
			@RequestParam(name = "parentquestiontitle2") String parentQuestionTitle2,
			@RequestParam(name = "parentquestionarticle2") String parentQuestionArticle2,
			
			HttpServletRequest request){
			
			// 根据examName找到exam对象
			Exam exam = this.examServiceImpl.findByName(examName);
			if (exam == null) {
				return "404";
			}
			
			
			/*
			 * 
			 * @desc				阅读第一道大题存储  设置4道小题 没有参数的为空
			 * @author				田瑞航
			 * @createDate 			2016/11/23  修改日期：2016/12/7
			 * @param 				获得相关参数
			 * @return				String
			 * 
			 */
			//第一道大题
			ParentQuestion parentQuestionOne = new ParentQuestion();
			
			//parentquestion与exam关联;
			parentQuestionOne.setExam(exam);
			parentQuestionOne.setParentQuestionName(parentQuestionName1);
			parentQuestionOne.setDescription(description);
			parentQuestionOne.setParentQuestionTitle(parentQuestionTitle1);
			parentQuestionOne.setParentQuestionArticle(parentQuestionArticle1);

			
			//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
			List<Question> onequestions = new ArrayList<Question>(0);
			
			//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
			for (Integer i = 56; i < questionTo-questionFrom+1+56; i++) {
				Question question = new Question();
				
				question.setParentQuestion(parentQuestionOne);
				question.setQuestionContent(((Integer)(questionFrom+i-56)).toString()+"."+request.getParameter("question"+i));
				question.setQuestionAnswer(request.getParameter("questionanswer"+i));
				question.setQuestionExplain(request.getParameter("questionexplain"+i));
				question.setQuestionScore(Float.parseFloat(questionScore));
				
				List<Selectt> selectts = new ArrayList<Selectt>(0);
				
				//存储selectt表  将selectts赋值给question 与question联系起来
				for(Integer j = 0; j<4; j++){
					Selectt selectt = new Selectt();
					selectt.setQuestion(question);
					char c=(char) (j+65);
					
					//根据ASCII码转换成字符'A' 'B'..
					selectt.setSelecttName(c+"");
					c=(char) (c+32);
					//通过拼凑字符串找到name中的内容
					selectt.setSelecttContent(request.getParameter(c+"selecttcontent"+i));
					
					this.selecttServiceImpl.addSelectt(selectt);
					selectts.add(selectt);
				}
				
				question.setSelectts(selectts);

				this.questionServiceImpl.addQuestion(question);

				onequestions.add(question);
			}
			
			parentQuestionOne.setQuestions(onequestions);
			
			//存储parentquestion
			this.parentQuestionServiceImpl.addParentQuestion(parentQuestionOne);
			
			/*
			 * 
			 * @desc				阅读第二道大题存储  设置4道小题 没有参数的为空
			 * @author				田瑞航
			 * @createDate 			2016/11/23  修改日期：2016/12/7
			 * @param 				获得相关参数
			 * @return				String
			 * 
			 */
//			将获取到的参数赋值给parentquestion,保存parentquestion
			ParentQuestion parentQuestionTwo = new ParentQuestion();
			
//			parentquestion与exam关联;
			parentQuestionTwo.setExam(exam);
			//获取并设置参数
			parentQuestionTwo.setParentQuestionName(parentQuestionName2);
			parentQuestionTwo.setParentQuestionArticle(parentQuestionArticle2);
			parentQuestionTwo.setParentQuestionTitle(parentQuestionTitle2);
			
			//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
			List<Question> twoquestions = new ArrayList<Question>(0);
			
			
			//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
			for (Integer i = 61; i < questionTo2-questionFrom2+1+61;i++) {

				Question question = new Question();
				
				question.setParentQuestion(parentQuestionTwo);
				question.setQuestionContent(((Integer)(questionFrom2+i-61)).toString()+"."+request.getParameter("question"+i));
				question.setQuestionAnswer(request.getParameter("questionanswer"+i));
				question.setQuestionExplain(request.getParameter("questionexplain"+i));
				question.setQuestionScore(Float.parseFloat(questionScore));
				
				List<Selectt> selectts = new ArrayList<Selectt>(0);
				
				//存储selectt表  将selectts赋值给question 与question联系起来
				for(Integer j = 0; j<4; j++){
					Selectt selectt = new Selectt();
					selectt.setQuestion(question);
					char c=(char) (j+65);
					
					//根据ASCII码转换成字符'A' 'B'..
					selectt.setSelecttName(c+"");
					c=(char) (c+32);
					//通过拼凑字符串去找 name里的内容
					selectt.setSelecttContent(request.getParameter(c+"selecttcontent"+i));
					
					this.selecttServiceImpl.addSelectt(selectt);
					selectts.add(selectt);
				}
				
				question.setSelectts(selectts);

				this.questionServiceImpl.addQuestion(question);

				twoquestions.add(question);
			}
			
			parentQuestionTwo.setQuestions(twoquestions);
			
			//存储parentquestion
			this.parentQuestionServiceImpl.addParentQuestion(parentQuestionTwo);
			
			return "redirect:list";
			
		}
	
		/**
		 * 
		 * @desc				查看阅读大题，封装到page对象里  返回jsp页面
		 * @author				田瑞航
		 * @createDate 			2016/11/22
		 * @param 				搜索参数    大题名称参数 等..
		 * @return				String
		 * 
		 */
		//	   查看大题功能
		 @RequestMapping("list")
		 public String list(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
				 @RequestParam(name="searchParam",defaultValue="") String searchParam,
				 //添加参数parentQuestionName  用于按大题名称查找parentquestion表   设置默认值
				 @RequestParam(name="parentQuestionName",defaultValue="LastReading") String parentQuestionName,
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
			 
			 return "reading/readinglist";
		 }
		 /**
			 * 
			 * @desc				删除阅读大题   级联删除下面的question  selectt 表内容
			 * @author				田瑞航
			 * @createDate 			2016/11/22
			 * @param 				parentquestionid   大题id  
			 * @return				String
			 * 
			 */
		//实现试卷删除功能
		@RequestMapping(value="delete")
		public String delete(@RequestParam("parentQuestionId") int parentQuestionId,
				HttpServletRequest request){
			
			this.parentQuestionServiceImpl.dropParentQuestion(parentQuestionId);
			
			return "redirect:list";
		}

	
	
	}

