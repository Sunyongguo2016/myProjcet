package com.course.listening.controller;

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

/**
 * 
 * @Description 		听力大题控制器  实现增加   删除  查看(list)功能
 * @author 				孙永国
 * @createDate  		2016/11/20
 * @version 			V1.0
 * 
 */

@Controller
@RequestMapping("listening")
public class ListeningController {

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
	 * @desc				添加听力大题，一共七道parentquestion;获取addlistening.jsp的参数，实现添加parentQuestion对象；
	 * @author				孙永国
	 * @createDate 			2016/11/22
	 * @param 				获得添加十五选十大题相关参数
	 * @return				String
	 * 
	 */
	@RequestMapping("add")
	public String add(@RequestParam(name = "examname") String examName,
			//parentquestionname 获取 从听力一到六 text
			@RequestParam(name = "parentquestionnameone") String parentQuestionnameOne,
			@RequestParam(name = "parentquestionnametwo") String parentQuestionnameTwo,
			@RequestParam(name = "parentquestionnamethree") String parentQuestionnameThree,
			@RequestParam(name = "parentquestionnamefour") String parentQuestionnameFour,
			@RequestParam(name = "parentquestionnamefive") String parentQuestionnameFive,
			@RequestParam(name = "parentquestionnamesix") String parentQuestionnameSix,
			@RequestParam(name = "parentquestionnametext") String parentQuestionnameText,
			
			//parentquestiondescription获取 从听力一到六 text
			@RequestParam(name = "descriptionone") String descriptionOne,
			@RequestParam(name = "descriptiontwo") String descriptionTwo,
			@RequestParam(name = "descriptionthree") String descriptionThree,
			@RequestParam(name = "descriptionfour") String descriptionFour,
			@RequestParam(name = "descriptionfive") String descriptionFive,
			@RequestParam(name = "descriptionsix") String descriptionSix,
			@RequestParam(name = "descriptiontext") String descriptionText,
			
			//parentquestiontitle 获取 从听力一到六 text
			@RequestParam(name = "parentquestiontitleone") String parentQuestiontitleOne,
			@RequestParam(name = "parentquestiontitletwo") String parentQuestiontitleTwo,
			@RequestParam(name = "parentquestiontitlethree") String parentQuestiontitleThree,
			@RequestParam(name = "parentquestiontitlefour") String parentQuestiontitleFour,
			@RequestParam(name = "parentquestiontitlefive") String parentQuestiontitleFive,
			@RequestParam(name = "parentquestiontitlesix") String parentQuestiontitleSix,
			@RequestParam(name = "parentquestiontitletext") String parentQuestiontitleText,
			
			//parentquestionscore 获取 从听力一到六 text
			@RequestParam(name = "questionscoreone") String questionScoreOne,
			@RequestParam(name = "questionscoretwo") String questionScoreTwo,
			@RequestParam(name = "questionscorethree") String questionScoreThree,
			@RequestParam(name = "questionscorefour") String questionScoreFour,
			@RequestParam(name = "questionscorefive") String questionScoreFive,
			@RequestParam(name = "questionscoresix") String questionScoreSix,
			@RequestParam(name = "questionscoretext") String questionScoreText,
			
			//questionfrom  获取 从听力一到六 text
			@RequestParam(name = "questionfromone") Integer questionFromOne,
			@RequestParam(name = "questionfromtwo") Integer questionFromTwo,
			@RequestParam(name = "questionfromthree") Integer questionFromThree,
			@RequestParam(name = "questionfromfour") Integer questionFromFour,
			@RequestParam(name = "questionfromfive") Integer questionFromFive,
			@RequestParam(name = "questionfromsix") Integer questionFromSix,
			@RequestParam(name = "questionfromtext") String questionFromText,
			
			//questionto  获取 从听力一到六 text
			@RequestParam(name = "questiontoone") Integer questionToOne,
			@RequestParam(name = "questiontotwo") Integer questionToTwo,
			@RequestParam(name = "questiontothree") Integer questionToThree,
			@RequestParam(name = "questiontofour") Integer questionToFour,
			@RequestParam(name = "questiontofive") Integer questionToFive,
			@RequestParam(name = "questiontosix") Integer questionToSix,
			@RequestParam(name = "questiontotext") String questionToText,
			//听力文本域   parentquestion参数 parentquestionarticle
			@RequestParam(name = "parentquestionarticle") String parentQuestionArticleText,
			HttpServletRequest request) {

		// 根据examName找到exam对象  找不到不许插入数据
		Exam exam = this.examServiceImpl.findByName(examName);
		if (exam == null) {
			return "404";
		}
		
		
		/*
		 * 
		 * @desc				听力第1道大题存储  设置八道小题 没有参数的为空
		 * @author				孙永国
		 * @createDate 			2016/11/21
		 * @param 				获得相关参数
		 * @return				String
		 * 
		 */
		this.extracted(1,parentQuestionnameOne, descriptionOne, parentQuestiontitleOne, questionScoreOne, questionFromOne,
				questionToOne, request, exam);
		
		
		
		
		/*
		 * 
		 * @desc				听力第2道大题存储  设置4道小题 没有参数的为空
		 * @author				孙永国
		 * @createDate 			2016/11/21
		 * @param 				获得相关参数
		 * @return				String
		 * 
		 */
		
		
		this.extracted(9,parentQuestionnameTwo, descriptionTwo, parentQuestiontitleTwo, questionScoreTwo, questionFromTwo,
				questionToTwo, request, exam);
		
		
		
		/*
		 * 
		 * @desc				听力第3道大题存储  设置4道小题 没有参数的为空
		 * @author				孙永国
		 * @createDate 			2016/11/21
		 * @param 				获得相关参数
		 * @return				String
		 * 
		 */
		
		this.extracted(13,parentQuestionnameThree, descriptionThree, parentQuestiontitleThree, questionScoreThree, questionFromThree,
				questionToThree, request, exam);
		
		
		
		/*
		 * 
		 * @desc				听力第4道大题存储  设置4道小题 没有参数的为空
		 * @author				孙永国
		 * @createDate 			2016/11/22
		 * @return				String
		 * 
		 */
		
		this.extracted(17,parentQuestionnameFour, descriptionFour, parentQuestiontitleFour, questionScoreFour, questionFromFour,
				questionToFour, request, exam);
		
		
		/*
		 * 
		 * @desc				听力第5道大题存储  设置4道小题 没有参数的为空
		 * @author				孙永国
		 * @createDate 			2016/11/22
		 * @param 				获得相关参数
		 * 
		 */
		
		this.extracted(21,parentQuestionnameFive, descriptionFive, parentQuestiontitleFive, questionScoreFive, questionFromFive,
				questionToFive, request, exam);
		
		
		/*
		 * 
		 * @desc				听力第6道大题存储  设置4道小题 没有参数的为空
		 * @author				孙永国
		 * @createDate 			2016/11/22
		 * @param 				获得相关参数
		 * 
		 */
		
		this.extracted(25,parentQuestionnameSix, descriptionSix, parentQuestiontitleSix, questionScoreSix, questionFromSix,
				questionToSix, request, exam);
		
		
		
		
		
		
		
		/*
		 * 
		 * @desc				 听力第七道大题存储(文本题 2016年没有这道题 为空) 这里可以进行判断  获得examname 如果是2016年的  删除这道题 不存入数据库
		 * @author				孙永国
		 * @createDate 			2016/11/22
		 * @param 				相关参数
		 * @return				String
		 * 
		 */
		if(examName.contains("2016")){
			return "redirect:list";
		}
		
		//这道题有的试卷没有,这里获取的时候会出错,所以获取时以string  再转换
		Integer questionToTextInt = Integer.parseInt(questionToText);
		Integer questionFromTextInt = Integer.parseInt(questionFromText);
		//判断 如果没传入参数questionform questionto 或      两者相等 不创建题；
		if(questionToTextInt == questionFromTextInt){
			return "redirect:list";
		}
		
		//将获取到的参数赋值给parentquestion,保存parentquestion
		ParentQuestion parentQuestionText = new ParentQuestion();
		
		//parentquestion与exam关联;
		parentQuestionText.setExam(exam);
		
		parentQuestionText.setParentQuestionName(parentQuestionnameText);
		parentQuestionText.setDescription(descriptionText);
		parentQuestionText.setParentQuestionTitle(parentQuestiontitleText);
		parentQuestionText.setParentQuestionArticle(parentQuestionArticleText);
		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		List<Question> textquestions = new ArrayList<Question>(0);
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		
		for (Integer i = 1; i < questionToTextInt-questionFromTextInt+1+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentQuestionText);
			question.setQuestionContent(((Integer)(i+questionFromTextInt-1)).toString());
			
			// textquestionanswer1   textquestionanswer10
			question.setQuestionAnswer(request.getParameter("textquestionanswer"+i));
			question.setQuestionExplain(request.getParameter("textquestionexplain"+i));
			
			question.setQuestionScore(Float.parseFloat(questionScoreText));

			this.questionServiceImpl.addQuestion(question);

			textquestions.add(question); 
		}
		
		parentQuestionText.setQuestions(textquestions);
		
		//存储parentquestion
		this.parentQuestionServiceImpl.addParentQuestion(parentQuestionText);
		
		return "redirect:list";
	}

	
	
	
	
	
	
	
	
	
	
	
	/*
	 * 
	 * @desc				听力非文本大题存储,简化代码,简化获取参数方式等
	 * @author				孙永国
	 * @createDate 			2016/12/7
	 * @param 				n  							前台页面该大题开始的数字，与questionContent 不一定一致
	 * 						parentquestionName   		(parentquestion表)大题名称  例如：ListentingComprehensionOne
	 * 						description					大题描述						
	 * 						parentQuestionTitle			大题标题  如：question9 to 12 are based on the ...
	 * 
	 * 						questionScore				(question表)小题的分数  
	 * 						questionFrom				小题开始的题号
	 *						questionTo					小题结束点题号
	 *
	 *						request						获取request.getParameter();
	 *						exam 						exam对象  最初已经初始化,与每道大题联系起来
	 *
	 *
	 * 
	 * @return				void
	 * 
	 */
	private void extracted(int n,String parentQuestionName, String description, String parentQuestionTitle,
			String questionScore, Integer questionFrom, Integer questionTo, HttpServletRequest request,
			Exam exam) {
		//将获取到的参数赋值给parentquestion,保存parentquestion
		//初始化大题parentquestion
		ParentQuestion parentquestion = new ParentQuestion();
		
		//parentquestion与exam关联;
		parentquestion.setExam(exam);
		
		parentquestion.setParentQuestionName(parentQuestionName);
		parentquestion.setDescription(description);
		parentquestion.setParentQuestionTitle(parentQuestionTitle);
		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		List<Question> questions = new ArrayList<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		//参数n 与前台传入的参数对应   与questionfrom不一致,要考虑具体情况
		for (Integer i = n; i < questionTo-questionFrom+1+n; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestion);
			//存入题号  题号和i questionFrom  n有关系
			question.setQuestionContent(((Integer)(i+questionFrom-n)).toString());
			//循环次数i 决定存入的答案和解析,i与题号不完全一致,但是可以保证存入数据库的题是正确的
			//原因：具体情况请看前台传入的关于questionanswer参数
			question.setQuestionAnswer(request.getParameter("questionanswer"+i));
			question.setQuestionExplain(request.getParameter("questionexplain"+i));
			question.setQuestionScore(Float.parseFloat(questionScore));
			
			
			List<Selectt> selectts = new ArrayList<Selectt>(0);
			
			//存储selectt表  将selectts赋值给question 与question联系起来
			for(Integer j = 0; j<4; j++){
				Selectt selectt = new Selectt();
				selectt.setQuestion(question);
				char c=(char) (j+97);
				
				//根据ASCII码转换成字符'A' 'B'..
				selectt.setSelecttName((c+"").toUpperCase());
				//分别存储每道question 的selectt j对应selectt  i对应question
				selectt.setSelecttContent(request.getParameter(c+"selecttcontent"+i));
				
				this.selecttServiceImpl.addSelectt(selectt);
				selectts.add(selectt);
			}
			
			//将选项与question联系起来
			question.setSelectts(selectts);
			
			//保存question
			this.questionServiceImpl.addQuestion(question);
			
			
			//将题与大题(parentquestion.questions)联系起来
			questions.add(question);
		}
		
		//将题与大题(parentquestion.questions)联系起来
		parentquestion.setQuestions(questions);
		
		//存储parentquestion
		this.parentQuestionServiceImpl.addParentQuestion(parentquestion);
	}
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 
	 * @desc				删除听力大题   级联删除下面的question  selectt 表内容
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
	 * @desc				查看听力大题，封装到page对象里  返回jsp页面
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
			 @RequestParam(name="parentQuestionName",defaultValue="ListeningComprehensionOne") String parentQuestionName,
			 HttpServletRequest request, Model model){
		 
		 Page<ParentQuestion> page;
		 
		 if(searchParam==null || "".equals(searchParam)){
			 //在老师的基础上自己创建了方法      用于针对题型模糊查找
			 page=this.parentQuestionServiceImpl.listParentQuestionListeningByParentQuestionName(pageNum, 5, new
					 Object[]{parentQuestionName});
		 }else{
			 //对搜索参数进行转码，解决上次搜索中文出错问题！
			 try {
				 searchParam = new String(searchParam.getBytes("ISO8859_1"), "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			 
			 page=this.parentQuestionServiceImpl.listParentQuestionListeningByParentQuestionName(pageNum, 5, new
			 Object[]{parentQuestionName,searchParam});
		 }
		 
		 request.setAttribute("page", page);
		 request.setAttribute("searchParam", searchParam);
		 
		 return "listening/listeninglist";
	 }
}
