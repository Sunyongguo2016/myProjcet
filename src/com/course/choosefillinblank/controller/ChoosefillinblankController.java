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
	 * @createDate 			2016/11/21
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
			@RequestParam(name = "aselecttcontent") String aSelecttContent,
			@RequestParam(name = "bselecttcontent") String bSelecttContent,
			@RequestParam(name = "cselecttcontent") String cSelecttContent,
			@RequestParam(name = "dselecttcontent") String dSelecttContent,
			@RequestParam(name = "eselecttcontent") String eSelecttContent,
			@RequestParam(name = "fselecttcontent") String fSelecttContent,
			@RequestParam(name = "gselecttcontent") String gSelecttContent,
			@RequestParam(name = "hselecttcontent") String hSelecttContent,
			@RequestParam(name = "iselecttcontent") String iSelecttContent,
			@RequestParam(name = "jselecttcontent") String jSelecttContent,
			@RequestParam(name = "kselecttcontent") String kSelecttContent,
			@RequestParam(name = "lselecttcontent") String lSelecttContent,
			@RequestParam(name = "mselecttcontent") String mSelecttContent,
			@RequestParam(name = "nselecttcontent") String nSelecttContent,
			@RequestParam(name = "oselecttcontent") String oSelecttContent,
			@RequestParam(name = "questionscore") String questionScore,
			@RequestParam(name = "questionanswer36") String questionAnswer36,
			@RequestParam(name = "questionanswer37") String questionAnswer37,
			@RequestParam(name = "questionanswer38") String questionAnswer38,
			@RequestParam(name = "questionanswer39") String questionAnswer39,
			@RequestParam(name = "questionanswer40") String questionAnswer40,
			@RequestParam(name = "questionanswer41") String questionAnswer41,
			@RequestParam(name = "questionanswer42") String questionAnswer42,
			@RequestParam(name = "questionanswer43") String questionAnswer43,
			@RequestParam(name = "questionanswer44") String questionAnswer44,
			@RequestParam(name = "questionanswer45") String questionAnswer45,
			@RequestParam(name = "questionexplain36") String questionExplain36,
			@RequestParam(name = "questionexplain37") String questionExplain37,
			@RequestParam(name = "questionexplain38") String questionExplain38,
			@RequestParam(name = "questionexplain39") String questionExplain39,
			@RequestParam(name = "questionexplain40") String questionExplain40,
			@RequestParam(name = "questionexplain41") String questionExplain41,
			@RequestParam(name = "questionexplain42") String questionExplain42,
			@RequestParam(name = "questionexplain43") String questionExplain43,
			@RequestParam(name = "questionexplain44") String questionExplain44,
			@RequestParam(name = "questionexplain45") String questionExplain45,
			HttpServletRequest request) {
		
		
		//用集合！！很好用的方法！
		//用集合获取参数  再在for循环中使用 方便利用for循环添加question
		
		//list集合存储所有的question 答案和解析 信息   方便在for循环中存储
		List<String> questionLists = new ArrayList<String>();
		questionLists.add(questionAnswer36);
		questionLists.add(questionAnswer37);
		questionLists.add(questionAnswer38);
		questionLists.add(questionAnswer39);
		questionLists.add(questionAnswer40);
		questionLists.add(questionAnswer41);
		questionLists.add(questionAnswer42);
		questionLists.add(questionAnswer43);
		questionLists.add(questionAnswer44);
		questionLists.add(questionAnswer45);
		questionLists.add(questionExplain36);
		questionLists.add(questionExplain37);
		questionLists.add(questionExplain38);
		questionLists.add(questionExplain39);
		questionLists.add(questionExplain40);
		questionLists.add(questionExplain41);
		questionLists.add(questionExplain42);
		questionLists.add(questionExplain43);
		questionLists.add(questionExplain44);
		questionLists.add(questionExplain45);
	
		
		//用list集合保存单选内容   方便用循环存储数据
		List<String> selecttLists = new ArrayList<String>();
		selecttLists.add(aSelecttContent);
		selecttLists.add(bSelecttContent);
		selecttLists.add(cSelecttContent);
		selecttLists.add(dSelecttContent);
		selecttLists.add(eSelecttContent);
		selecttLists.add(fSelecttContent);
		selecttLists.add(gSelecttContent);
		selecttLists.add(hSelecttContent);
		selecttLists.add(iSelecttContent);
		selecttLists.add(jSelecttContent);
		selecttLists.add(kSelecttContent);
		selecttLists.add(lSelecttContent);
		selecttLists.add(mSelecttContent);
		selecttLists.add(nSelecttContent);
		selecttLists.add(oSelecttContent);
		
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
		for (Integer i = 0; i < questionTo-questionFrom+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentQuestion);
			question.setQuestionContent(((Integer)(i+questionFrom)).toString());
			question.setQuestionAnswer(questionLists.get(i));
			
			//集合questionLists中  前十个是answer  后十个是explain
			question.setQuestionExplain(questionLists.get(i+10));
			question.setQuestionScore(Float.parseFloat(questionScore));
			
			List<Selectt> selectts = new ArrayList<Selectt>(0);
			
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