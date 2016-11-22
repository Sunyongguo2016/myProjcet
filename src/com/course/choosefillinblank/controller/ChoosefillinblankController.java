package com.course.choosefillinblank.controller;

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

//	@Resource
//	private ExamServiceImpl examServiceImpl;
	
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
	 * @createDate 			2016/11/21
	 * @param 				获得添加十五选十大题相关参数
	 * @return				String
	 * 
	 */
	@RequestMapping("add")
	public String add(@RequestParam(name = "examname") String examname,
			@RequestParam(name = "parentquestionname") String parentquestionname,
			@RequestParam(name = "questionfrom", required = true) Integer questionfrom,
			@RequestParam(name = "questionto") Integer questionto,
			@RequestParam(name = "parentquestionarticle") String parentquestionarticle,
			@RequestParam(name = "parentquestiontitle") String parentquestiontitle,
			@RequestParam(name = "description") String description,
			@RequestParam(name = "aselecttcontent") String aselecttcontent,
			@RequestParam(name = "bselecttcontent") String bselecttcontent,
			@RequestParam(name = "cselecttcontent") String cselecttcontent,
			@RequestParam(name = "dselecttcontent") String dselecttcontent,
			@RequestParam(name = "eselecttcontent") String eselecttcontent,
			@RequestParam(name = "fselecttcontent") String fselecttcontent,
			@RequestParam(name = "gselecttcontent") String gselecttcontent,
			@RequestParam(name = "hselecttcontent") String hselecttcontent,
			@RequestParam(name = "iselecttcontent") String iselecttcontent,
			@RequestParam(name = "jselecttcontent") String jselecttcontent,
			@RequestParam(name = "kselecttcontent") String kelecttcontent,
			@RequestParam(name = "lselecttcontent") String lselecttcontent,
			@RequestParam(name = "mselecttcontent") String mselecttcontent,
			@RequestParam(name = "nselecttcontent") String nselecttcontent,
			@RequestParam(name = "oselecttcontent") String oselecttcontent,
			@RequestParam(name = "questionscore") String questionscore,
			@RequestParam(name = "questionanswer36") String questionanswer36,
			@RequestParam(name = "questionanswer37") String questionanswer37,
			@RequestParam(name = "questionanswer38") String questionanswer38,
			@RequestParam(name = "questionanswer39") String questionanswer39,
			@RequestParam(name = "questionanswer40") String questionanswer40,
			@RequestParam(name = "questionanswer41") String questionanswer41,
			@RequestParam(name = "questionanswer42") String questionanswer42,
			@RequestParam(name = "questionanswer43") String questionanswer43,
			@RequestParam(name = "questionanswer44") String questionanswer44,
			@RequestParam(name = "questionanswer45") String questionanswer45,
			@RequestParam(name = "questionexplain36") String questionexplain36,
			@RequestParam(name = "questionexplain37") String questionexplain37,
			@RequestParam(name = "questionexplain38") String questionexplain38,
			@RequestParam(name = "questionexplain39") String questionexplain39,
			@RequestParam(name = "questionexplain40") String questionexplain40,
			@RequestParam(name = "questionexplain41") String questionexplain41,
			@RequestParam(name = "questionexplain42") String questionexplain42,
			@RequestParam(name = "questionexplain43") String questionexplain43,
			@RequestParam(name = "questionexplain44") String questionexplain44,
			@RequestParam(name = "questionexplain45") String questionexplain45,
			HttpServletRequest request) {
		
		
		//用集合！！很好用的方法！
		//用集合获取参数  再在for循环中使用 方便利用for循环添加question
		
		//list集合存储所有的question 答案和解析 信息   方便在for循环中存储
		List<String> questionLists = new ArrayList<String>();
		questionLists.add(questionanswer36);
		questionLists.add(questionanswer37);
		questionLists.add(questionanswer38);
		questionLists.add(questionanswer39);
		questionLists.add(questionanswer40);
		questionLists.add(questionanswer41);
		questionLists.add(questionanswer42);
		questionLists.add(questionanswer43);
		questionLists.add(questionanswer44);
		questionLists.add(questionanswer45);
		questionLists.add(questionexplain36);
		questionLists.add(questionexplain37);
		questionLists.add(questionexplain38);
		questionLists.add(questionexplain39);
		questionLists.add(questionexplain40);
		questionLists.add(questionexplain41);
		questionLists.add(questionexplain42);
		questionLists.add(questionexplain43);
		questionLists.add(questionexplain44);
		questionLists.add(questionexplain45);
		
		
		//用list集合保存单选内容   方便用循环存储数据
		List<String> selecttLists = new ArrayList<String>();
		selecttLists.add(aselecttcontent);
		selecttLists.add(bselecttcontent);
		selecttLists.add(cselecttcontent);
		selecttLists.add(dselecttcontent);
		selecttLists.add(eselecttcontent);
		selecttLists.add(fselecttcontent);
		selecttLists.add(gselecttcontent);
		selecttLists.add(hselecttcontent);
		selecttLists.add(iselecttcontent);
		selecttLists.add(jselecttcontent);
		selecttLists.add(kelecttcontent);
		selecttLists.add(lselecttcontent);
		selecttLists.add(mselecttcontent);
		selecttLists.add(nselecttcontent);
		selecttLists.add(oselecttcontent);

//		待实现功能,这段注释不要学习
//		根据examname查询exam,赋值给parentquestion,实现关联关系;
//		前提必须有exam  需要判空
//		Exam exam = null;
//		exam = this.examServiceImpl.findByExamName(examname);
//		
//		if(exam == null){
//			return "404";
//		}
		
		
		//将获取到的参数赋值给parentquestion,保存parentquestion
		ParentQuestion parentquestion = new ParentQuestion();
		
		//此处关联没有实现 
		//parentquestion与exam关联;
		//parentquestion.setExam(exam);
		
		parentquestion.setParentQuestionName(parentquestionname);
		parentquestion.setDescription(description);
		parentquestion.setParentQuestionTitle(parentquestiontitle);
		parentquestion.setParentQuestionArticle(parentquestionarticle);

		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> questions = new HashSet<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 0; i < questionto-questionfrom+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestion);
			question.setQuestionContent(((Integer)(i+questionfrom)).toString());
			question.setQuestionAnswer(questionLists.get(i));
			
			//集合questionLists中  前十个是answer  后十个是explain
			question.setQuestionExplain(questionLists.get(i+10));
			question.setQuestionScore(Float.parseFloat(questionscore));
			
			Set<Selectt> selectts = new HashSet<Selectt>(0);
			
			//存储selectt表  将selectts赋值给question 与question联系起来
			for(Integer j = 0; j<15; j++){
				Selectt selectt = new Selectt();
				selectt.setQuestion(question);
				char c=(char) (j+65);
				
				//根据ASCII码转换成字符'A' 'B'..
				selectt.setSelecttName(c+"");
				selectt.setSelecttContent(selecttLists.get(j));
				
				this.selecttServiceImpl.addSelectt(selectt);
				selectts.add(selectt);
			}
			
			question.setSelectts(selectts);

			this.questionServiceImpl.addQuestion(question);
			questions.add(question);
		}
		
		parentquestion.setQuestions(questions);
		
		//存储parentquestion
		this.parentQuestionServiceImpl.addParentQuestion(parentquestion);
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
			 page=this.parentQuestionServiceImpl.listParentQuestionByParentQuestionName(pageNum, 5, new
			 Object[]{parentQuestionName,searchParam});
		 }
		 
		 request.setAttribute("page", page);
		 request.setAttribute("searchParam", searchParam);
		 
		 return "choosefillinblank/choosefillinblanklist";
	 }
}