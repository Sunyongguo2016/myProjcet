package com.course.reading.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashSet;
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
			@RequestParam(name = "parentquestiontitle1") String parentQuestionTitle1,
			@RequestParam(name = "parentquestionarticle1") String parentQuestionArticle1,
			
			//题号的开始和结束
			@RequestParam(name = "questionfrom") Integer questionFrom,
			@RequestParam(name = "questionto") Integer questionTo,
			@RequestParam(name = "questionfrom2") Integer questionFrom2,
			@RequestParam(name = "questionto2") Integer questionTo2,
			
			@RequestParam(name = "question56") String question56,
			@RequestParam(name = "aselecttcontent56") String aSelecttContent56,
			@RequestParam(name = "bselecttcontent56") String bSelecttContent56,
			@RequestParam(name = "cselecttcontent56") String cSelecttContent56,
			@RequestParam(name = "dselecttcontent56") String dSelecttContent56,
			@RequestParam(name = "questionanswer56") String questionAnswer56,
			@RequestParam(name = "questionexplain56") String questionExplain56,
			
			@RequestParam(name = "question57") String question57,
			@RequestParam(name = "aselecttcontent57") String aSelecttContent57,
			@RequestParam(name = "bselecttcontent57") String bSelecttContent57,
			@RequestParam(name = "cselecttcontent57") String cSelecttContent57,
 			@RequestParam(name = "dselecttcontent57") String dSelecttContent57,
			@RequestParam(name = "questionanswer57") String questionAnswer57,
			@RequestParam(name = "questionexplain57") String questionExplain57,
			
			@RequestParam(name = "question58") String question58,
			@RequestParam(name = "aselecttcontent58") String aSelecttContent58,
			@RequestParam(name = "bselecttcontent58") String bSelecttContent58,
			@RequestParam(name = "cselecttcontent58") String cSelecttContent58,
 			@RequestParam(name = "dselecttcontent58") String dSelecttContent58,
			@RequestParam(name = "questionanswer58") String questionAnswer58,
			@RequestParam(name = "questionexplain58") String questionExplain58,
			
			@RequestParam(name = "question59") String question59,
			@RequestParam(name = "aselecttcontent59") String aSelecttContent59,
			@RequestParam(name = "bselecttcontent59") String bSelecttContent59,
			@RequestParam(name = "cselecttcontent59") String cSelecttContent59,
 			@RequestParam(name = "dselecttcontent59") String dSelecttContent59,
			@RequestParam(name = "questionanswer59") String questionAnswer59,
			@RequestParam(name = "questionexplain59") String questionExplain59,
			
			@RequestParam(name = "question60") String question60,
			@RequestParam(name = "aselecttcontent60") String aSelecttContent60,
			@RequestParam(name = "bselecttcontent60") String bSelecttContent60,
			@RequestParam(name = "cselecttcontent60") String cSelecttContent60,
 			@RequestParam(name = "dselecttcontent60") String dSelecttContent60,
			@RequestParam(name = "questionanswer60") String questionAnswer60,
			@RequestParam(name = "questionexplain60") String questionExplain60,
			
			
			@RequestParam(name = "parentquestionname2") String parentQuestionName2,
			@RequestParam(name = "parentquestiontitle2") String parentQuestionTitle2,
			@RequestParam(name = "parentquestionarticle2") String parentQuestionArticle2,
			
			@RequestParam(name = "question61") String question61,
			@RequestParam(name = "aselecttcontent61") String aSelecttContent61,
			@RequestParam(name = "bselecttcontent61") String bSelecttContent61,
			@RequestParam(name = "cselecttcontent61") String cSelecttContent61,
 			@RequestParam(name = "dselecttcontent61") String dSelecttContent61,
			@RequestParam(name = "questionanswer61") String questionAnswer61,
			@RequestParam(name = "questionexplain61") String questionExplain61,
			
			@RequestParam(name = "question62") String question62,
			@RequestParam(name = "aselecttcontent62") String aSelecttContent62,
			@RequestParam(name = "bselecttcontent62") String bSelecttContent62,
			@RequestParam(name = "cselecttcontent62") String cSelecttContent62,
 			@RequestParam(name = "dselecttcontent62") String dSelecttContent62,
			@RequestParam(name = "questionanswer62") String questionAnswer62,
			@RequestParam(name = "questionexplain62") String questionExplain62,
			
			@RequestParam(name = "question63") String question63,
			@RequestParam(name = "aselecttcontent63") String aSelecttContent63,
			@RequestParam(name = "bselecttcontent63") String bSelecttContent63,
			@RequestParam(name = "cselecttcontent63") String cSelecttContent63,
 			@RequestParam(name = "dselecttcontent63") String dSelecttContent63,
			@RequestParam(name = "questionanswer63") String questionAnswer63,
			@RequestParam(name = "questionexplain63") String questionExplain63,
			
			@RequestParam(name = "question64") String question64,
			@RequestParam(name = "aselecttcontent64") String aSelecttContent64,
			@RequestParam(name = "bselecttcontent64") String bSelecttContent64,
			@RequestParam(name = "cselecttcontent64") String cSelecttContent64,
 			@RequestParam(name = "dselecttcontent64") String dSelecttContent64,
			@RequestParam(name = "questionanswer64") String questionAnswer64,
			@RequestParam(name = "questionexplain64") String questionExplain64,
			
			@RequestParam(name = "question65") String question65,
			@RequestParam(name = "aselecttcontent65") String aSelecttContent65,
			@RequestParam(name = "bselecttcontent65") String bSelecttContent65,
			@RequestParam(name = "cselecttcontent65") String cSelecttContent65,
 			@RequestParam(name = "dselecttcontent65") String dSelecttContent65,
			@RequestParam(name = "questionanswer65") String questionAnswer65,
			@RequestParam(name = "questionexplain65") String questionExplain65,
			HttpServletRequest request){
			//运用集合方法
			
			//list 集合存储所有的question答案和解析 信息 方便在for循环中存储
			List<String> questionLists = new ArrayList<String>();
			
			questionLists.add(questionAnswer56);
			questionLists.add(questionAnswer57);
			questionLists.add(questionAnswer58);
			questionLists.add(questionAnswer59);
			questionLists.add(questionAnswer60);
			questionLists.add(questionAnswer61);
			questionLists.add(questionAnswer62);
			questionLists.add(questionAnswer63);
			questionLists.add(questionAnswer64);
			questionLists.add(questionAnswer65);
			questionLists.add(questionExplain56);
			questionLists.add(questionExplain57);
			questionLists.add(questionExplain58);
			questionLists.add(questionExplain59);
			questionLists.add(questionExplain60);
			questionLists.add(questionExplain61);
			questionLists.add(questionExplain62);
			questionLists.add(questionExplain63);
			questionLists.add(questionExplain64);
			questionLists.add(questionExplain65);
			questionLists.add(question56);
			questionLists.add(question57);
			questionLists.add(question58);
			questionLists.add(question59);
			questionLists.add(question60);
			questionLists.add(question61);
			questionLists.add(question62);
			questionLists.add(question63);
			questionLists.add(question64);
			questionLists.add(question65);
			
			
			//用list集合保存单选内容方便用循环存储数据
			List<String> selecttLists = new ArrayList<String>();
			selecttLists.add(aSelecttContent56);
			selecttLists.add(bSelecttContent56);
			selecttLists.add(cSelecttContent56);
			selecttLists.add(dSelecttContent56);
			
			selecttLists.add(aSelecttContent57);
			selecttLists.add(bSelecttContent57);
			selecttLists.add(cSelecttContent57);
			selecttLists.add(dSelecttContent57);
			
			selecttLists.add(aSelecttContent58);
			selecttLists.add(bSelecttContent58);
			selecttLists.add(cSelecttContent58);
			selecttLists.add(dSelecttContent58);
			
			selecttLists.add(aSelecttContent59);
			selecttLists.add(bSelecttContent59);
			selecttLists.add(cSelecttContent59);
			selecttLists.add(dSelecttContent59);
			
			selecttLists.add(aSelecttContent60);
			selecttLists.add(bSelecttContent60);
			selecttLists.add(cSelecttContent60);
			selecttLists.add(dSelecttContent60);
			
			selecttLists.add(aSelecttContent61);
			selecttLists.add(bSelecttContent61);
			selecttLists.add(cSelecttContent61);
			selecttLists.add(dSelecttContent61);
			
			selecttLists.add(aSelecttContent62);
			selecttLists.add(bSelecttContent62);
			selecttLists.add(cSelecttContent62);
			selecttLists.add(dSelecttContent62);
			
			selecttLists.add(aSelecttContent63);
			selecttLists.add(bSelecttContent63);
			selecttLists.add(cSelecttContent63);
			selecttLists.add(dSelecttContent63);
			
			selecttLists.add(aSelecttContent64);
			selecttLists.add(bSelecttContent64);
			selecttLists.add(cSelecttContent64);
			selecttLists.add(dSelecttContent64);
			
			selecttLists.add(aSelecttContent65);
			selecttLists.add(bSelecttContent65);
			selecttLists.add(cSelecttContent65);
			selecttLists.add(dSelecttContent65);
			
			// 根据examName找到exam对象
			Exam exam = this.examServiceImpl.findByName(examName);
			if (exam == null) {
				return "404";
			}
			
			
			/*
			 * 
			 * @desc				阅读第一道大题存储  设置4道小题 没有参数的为空
			 * @author				田瑞航
			 * @createDate 			2016/11/23
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
			Set<Question> onequestions = new HashSet<Question>(0);
			
			
			//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
			for (Integer i = 0; i < questionTo-questionFrom+1; i++) {
				Question question = new Question();
				question.setParentQuestion(parentQuestionOne);
				question.setQuestionContent(((Integer)(i+questionFrom)).toString()+"."+questionLists.get(i+20));
				question.setQuestionAnswer(questionLists.get(i));
				
				//集合questionLists中  前十个是answer  后十个是explain
				question.setQuestionExplain(questionLists.get(i+10));
				question.setQuestionScore(Float.parseFloat(questionScore));
				
				Set<Selectt> selectts = new HashSet<Selectt>(0);
				
				//存储selectt表  将selectts赋值给question 与question联系起来
				for(Integer j = 0; j<4; j++){
					Selectt selectt = new Selectt();
					selectt.setQuestion(question);
					char c=(char) (j+65);
					
					//根据ASCII码转换成字符'A' 'B'..
					selectt.setSelecttName(c+"");
					//分别存储每道question 的selectt j对应selectt  i对应question
					selectt.setSelecttContent(selecttLists.get(j+i*4));
					
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
			 * @createDate 			2016/11/23
			 * @param 				获得相关参数
			 * @return				String
			 * 
			 */
//			将获取到的参数赋值给parentquestion,保存parentquestion
			ParentQuestion parentQuestionTwo = new ParentQuestion();
			
//			parentquestion与exam关联;
			parentQuestionTwo.setExam(exam);
			
			parentQuestionTwo.setParentQuestionName(parentQuestionName2);
			parentQuestionTwo.setParentQuestionArticle(parentQuestionArticle2);
			parentQuestionTwo.setParentQuestionTitle(parentQuestionTitle2);
			
			//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
			Set<Question> twoquestions = new HashSet<Question>(0);
			
			
			//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
			for (Integer i = 0; i < questionTo2-questionFrom2+1; i++) {
				Question question = new Question();
				question.setParentQuestion(parentQuestionTwo);
				question.setQuestionContent(((Integer)(i+questionFrom2)).toString()+"."+questionLists.get(i+5+20));
				//集合questionLists中  
				question.setQuestionAnswer(questionLists.get(i+5));
				
				//集合questionLists中  
				question.setQuestionExplain(questionLists.get(i+5+10));
				question.setQuestionScore(Float.parseFloat(questionScore));
				
				Set<Selectt> selectts = new HashSet<Selectt>(0);
				
				//存储selectt表  将selectts赋值给question 与question联系起来
				for(Integer j = 0; j<4; j++){
					Selectt selectt = new Selectt();
					selectt.setQuestion(question);
					char c=(char) (j+65);
					
					//根据ASCII码转换成字符'A' 'B'..
					selectt.setSelecttName(c+"");
					//分别存储每道question 的selectt j对应selectt  i对应question
					selectt.setSelecttContent(selecttLists.get(j+(i+5)*4));
					
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

