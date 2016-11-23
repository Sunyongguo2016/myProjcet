package com.course.reading.controller;

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
@RequestMapping("reading")
public class readingController {

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
	public String add(@RequestParam(name = "examname") String examname,
			@RequestParam(name = "parentQuestionName") String parentQuestionName,
			@RequestParam(name = "description") String description,
			@RequestParam(name = "questionscore") String questionscore,
			@RequestParam(name = "parentquestiontitle1") String parentquestiontitle1,
			@RequestParam(name = "parentquestionarticle1") String parentquestionarticle1,
			
			//题号的开始和结束
			@RequestParam(name = "questionfrom") Integer questionfrom,
			@RequestParam(name = "questionto") Integer questionto,
			@RequestParam(name = "questionfrom") Integer questionfrom2,
			@RequestParam(name = "questionto") Integer questionto2,
			
			@RequestParam(name = "aselecttcontent56") String aselecttcontent56,
			@RequestParam(name = "bselecttcontent56") String bselecttcontent56,
			@RequestParam(name = "cselecttcontent56") String cselecttcontent56,
			@RequestParam(name = "dselecttcontent56") String dselecttcontent56,
			@RequestParam(name = "questionanswer56") String questionanswer56,
			@RequestParam(name = "questionexplain56") String questionexplain56,
			
			@RequestParam(name = "question57") String question57,
			@RequestParam(name = "aselecttcontent57") String aselecttcontent57,
			@RequestParam(name = "bselecttcontent57") String bselecttcontent57,
			@RequestParam(name = "cselecttcontent57") String cselecttcontent57,
 			@RequestParam(name = "dselecttcontent57") String dselecttcontent57,
			@RequestParam(name = "questionanswer57") String questionanswer57,
			@RequestParam(name = "questionexplain57") String questionexplain57,
			
			@RequestParam(name = "question58") String question58,
			@RequestParam(name = "aselecttcontent58") String aselecttcontent58,
			@RequestParam(name = "bselecttcontent58") String bselecttcontent58,
			@RequestParam(name = "cselecttcontent58") String cselecttcontent58,
 			@RequestParam(name = "dselecttcontent58") String dselecttcontent58,
			@RequestParam(name = "questionanswer58") String questionanswer58,
			@RequestParam(name = "questionexplain58") String questionexplain58,
			
			@RequestParam(name = "question59") String question59,
			@RequestParam(name = "aselecttcontent59") String aselecttcontent59,
			@RequestParam(name = "bselecttcontent59") String bselecttcontent59,
			@RequestParam(name = "cselecttcontent59") String cselecttcontent59,
 			@RequestParam(name = "dselecttcontent59") String dselecttcontent59,
			@RequestParam(name = "questionanswer59") String questionanswer59,
			@RequestParam(name = "questionexplain59") String questionexplain59,
			
			@RequestParam(name = "question60") String question60,
			@RequestParam(name = "aselecttcontent60") String aselecttcontent60,
			@RequestParam(name = "bselecttcontent60") String bselecttcontent60,
			@RequestParam(name = "cselecttcontent60") String cselecttcontent60,
 			@RequestParam(name = "dselecttcontent60") String dselecttcontent60,
			@RequestParam(name = "questionanswer60") String questionanswer60,
			@RequestParam(name = "questionexplain60") String questionexplain60,
			
			
			@RequestParam(name = "parentquestionname2") String parentquestionname2,
			@RequestParam(name = "parentquestiontitle2") String parentquestiontitle2,
			@RequestParam(name = "parentquestionarticle2") String parentquestionarticle2,
			
			@RequestParam(name = "question61") String question61,
			@RequestParam(name = "aselecttcontent61") String aselecttcontent61,
			@RequestParam(name = "bselecttcontent61") String bselecttcontent61,
			@RequestParam(name = "cselecttcontent61") String cselecttcontent61,
 			@RequestParam(name = "dselecttcontent61") String dselecttcontent61,
			@RequestParam(name = "questionanswer61") String questionanswer61,
			@RequestParam(name = "questionexplain61") String questionexplain61,
			
			@RequestParam(name = "question62") String question62,
			@RequestParam(name = "aselecttcontent62") String aselecttcontent62,
			@RequestParam(name = "bselecttcontent62") String bselecttcontent62,
			@RequestParam(name = "cselecttcontent62") String cselecttcontent62,
 			@RequestParam(name = "dselecttcontent62") String dselecttcontent62,
			@RequestParam(name = "questionanswer62") String questionanswer62,
			@RequestParam(name = "questionexplain62") String questionexplain62,
			
			@RequestParam(name = "question63") String question63,
			@RequestParam(name = "aselecttcontent63") String aselecttcontent63,
			@RequestParam(name = "bselecttcontent63") String bselecttcontent63,
			@RequestParam(name = "cselecttcontent63") String cselecttcontent63,
 			@RequestParam(name = "dselecttcontent63") String dselecttcontent63,
			@RequestParam(name = "questionanswer63") String questionanswer63,
			@RequestParam(name = "questionexplain63") String questionexplain63,
			
			@RequestParam(name = "question64") String question64,
			@RequestParam(name = "aselecttcontent64") String aselecttcontent64,
			@RequestParam(name = "bselecttcontent64") String bselecttcontent64,
			@RequestParam(name = "cselecttcontent64") String cselecttcontent64,
 			@RequestParam(name = "dselecttcontent64") String dselecttcontent64,
			@RequestParam(name = "questionanswer64") String questionanswer64,
			@RequestParam(name = "questionexplain64") String questionexplain64,
			
			@RequestParam(name = "question65") String question65,
			@RequestParam(name = "aselecttcontent65") String aselecttcontent65,
			@RequestParam(name = "bselecttcontent65") String bselecttcontent65,
			@RequestParam(name = "cselecttcontent65") String cselecttcontent65,
 			@RequestParam(name = "dselecttcontent65") String dselecttcontent65,
			@RequestParam(name = "questionanswer65") String questionanswer65,
			@RequestParam(name = "questionexplain65") String questionexplain65,
			HttpServletRequest request){
			//运用集合方法
			
			//list 集合存储所有的question答案和解析 信息 方便在for循环中存储
			List<String> questionLists = new ArrayList<String>();
			
			questionLists.add(questionanswer56);
			questionLists.add(questionanswer57);
			questionLists.add(questionanswer58);
			questionLists.add(questionanswer59);
			questionLists.add(questionanswer60);
			questionLists.add(questionanswer61);
			questionLists.add(questionanswer62);
			questionLists.add(questionanswer63);
			questionLists.add(questionanswer64);
			questionLists.add(questionanswer65);
			questionLists.add(questionexplain56);
			questionLists.add(questionexplain57);
			questionLists.add(questionexplain58);
			questionLists.add(questionexplain59);
			questionLists.add(questionexplain60);
			questionLists.add(questionexplain61);
			questionLists.add(questionexplain62);
			questionLists.add(questionexplain63);
			questionLists.add(questionexplain64);
			questionLists.add(questionexplain65);
			
			//用list集合保存单选内容方便用循环存储数据
			List<String> selecttLists = new ArrayList<String>();
			selecttLists.add(aselecttcontent56);
			selecttLists.add(bselecttcontent56);
			selecttLists.add(cselecttcontent56);
			selecttLists.add(dselecttcontent56);
			
			selecttLists.add(aselecttcontent57);
			selecttLists.add(bselecttcontent57);
			selecttLists.add(cselecttcontent57);
			selecttLists.add(dselecttcontent57);
			
			selecttLists.add(aselecttcontent58);
			selecttLists.add(bselecttcontent58);
			selecttLists.add(cselecttcontent58);
			selecttLists.add(dselecttcontent58);
			
			selecttLists.add(aselecttcontent59);
			selecttLists.add(bselecttcontent59);
			selecttLists.add(cselecttcontent59);
			selecttLists.add(dselecttcontent59);
			
			selecttLists.add(aselecttcontent60);
			selecttLists.add(bselecttcontent60);
			selecttLists.add(cselecttcontent60);
			selecttLists.add(dselecttcontent60);
			
			selecttLists.add(aselecttcontent61);
			selecttLists.add(bselecttcontent61);
			selecttLists.add(cselecttcontent61);
			selecttLists.add(dselecttcontent61);
			
			selecttLists.add(aselecttcontent62);
			selecttLists.add(bselecttcontent62);
			selecttLists.add(cselecttcontent62);
			selecttLists.add(dselecttcontent62);
			
			selecttLists.add(aselecttcontent63);
			selecttLists.add(bselecttcontent63);
			selecttLists.add(cselecttcontent63);
			selecttLists.add(dselecttcontent63);
			
			selecttLists.add(aselecttcontent64);
			selecttLists.add(bselecttcontent64);
			selecttLists.add(cselecttcontent64);
			selecttLists.add(dselecttcontent64);
			
			selecttLists.add(aselecttcontent65);
			selecttLists.add(bselecttcontent65);
			selecttLists.add(cselecttcontent65);
			selecttLists.add(dselecttcontent65);
			
			//第一篇阅读 
			//将获取的参数赋值给parentquestion，保存parentquestion
			ParentQuestion parentquestion = new ParentQuestion();
			
			parentquestion.setParentQuestionName(parentQuestionName);
			parentquestion.setDescription(description);
			parentquestion.setParentQuestionTitle(parentquestiontitle1);
			parentquestion.setParentQuestionArticle(parentquestionarticle1);
			
			//设置question集合 将question加入questions 将questions作为属性加入parentquestion
			Set<Question> questions = new HashSet<Question>(0);
			
			
			for(Integer i = 0, f = 0;i<questionto-questionfrom+1;i++)
			{
				Question question = new Question();
				question.setParentQuestion(parentquestion);
				question.setQuestionContent(((Integer)(i+questionfrom)).toString());
				question.setQuestionAnswer(questionLists.get(i));
				question.setQuestionExplain(questionLists.get(i+5));
				question.setQuestionScore(Float.parseFloat(questionscore));
				
				Set<Selectt> selectts = new HashSet<Selectt>(0);
				
				for(Integer j=0;j<4;j++)
				{
					Selectt selectt  = new Selectt();
					selectt.setQuestion(question);
					char c = (char)(j+65);
					selectt.setSelecttName(c+"");
					selectt.setSelecttContent(selecttLists.get(j+f));
					
					this.selecttServiceImpl.addSelectt(selectt);
					selectts.add(selectt);
				}
				
				this.questionServiceImpl.addQuestion(question);
				questions.add(question);
				f=f+4;
			}
			
			
			parentquestion.setQuestions(questions);
			
			this.parentQuestionServiceImpl.addParentQuestion(parentquestion);
			
			//第二篇阅读
			
			//将获取的参数赋值给parentquestion2，保存parentquestion2
			ParentQuestion parentquestion2 = new ParentQuestion();
			parentquestion2.setParentQuestionName(parentquestionname2);
			parentquestion2.setParentQuestionTitle(parentquestiontitle2);
			parentquestion2.setParentQuestionArticle(parentquestionarticle2);
			
			//设置question集合 将question加入questions 将questions作为属性加入parentquestion2
			Set<Question> questions2 = new HashSet<Question>(0);
			
			
			for(Integer i = 0,f=0;i<questionto2-questionfrom2+1;i++)
			{
				Question question2 = new Question();
				question2.setParentQuestion(parentquestion2);
				question2.setQuestionContent(((Integer)(i+questionfrom2)).toString());
				question2.setQuestionAnswer(questionLists.get(i));
				question2.setQuestionExplain(questionLists.get(i+5));
				
				Set<Selectt> selectts = new HashSet<Selectt>(0);
				for(Integer j=0;j<4;j++)
				{
					Selectt selectt  = new Selectt();
					selectt.setQuestion(question2);
					char c = (char)(j+65);
					selectt.setSelecttName(c+"");
					selectt.setSelecttContent(selecttLists.get(j+f+20));
					
					this.selecttServiceImpl.addSelectt(selectt);
					selectts.add(selectt);
				}
				f=f+4;
				this.questionServiceImpl.addQuestion(question2);
				questions.add(question2);
			}
			
			
			parentquestion.setQuestions(questions2);
			
			this.parentQuestionServiceImpl.addParentQuestion(parentquestion2);
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
				 @RequestParam(name="parentQuestionName",defaultValue="reading") String parentQuestionName,
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

