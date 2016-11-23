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
			//获取所有选择题为a的选项内容
			@RequestParam(name = "aselecttcontent1") String aSelecttContent1,
			@RequestParam(name = "aselecttcontent2") String aSelecttContent2,
			@RequestParam(name = "aselecttcontent3") String aSelecttContent3,
			@RequestParam(name = "aselecttcontent4") String aSelecttContent4,
			@RequestParam(name = "aselecttcontent5") String aSelecttContent5,
			@RequestParam(name = "aselecttcontent6") String aSelecttContent6,
			@RequestParam(name = "aselecttcontent7") String aSelecttContent7,
			@RequestParam(name = "aselecttcontent8") String aSelecttContent8,
			@RequestParam(name = "aselecttcontent9") String aSelecttContent9,
			@RequestParam(name = "aselecttcontent10") String aSelecttContent10,
			@RequestParam(name = "aselecttcontent11") String aSelecttContent11,
			@RequestParam(name = "aselecttcontent12") String aSelecttContent12,
			@RequestParam(name = "aselecttcontent13") String aSelecttContent13,
			@RequestParam(name = "aselecttcontent14") String aSelecttContent14,
			@RequestParam(name = "aselecttcontent15") String aSelecttContent15,
			@RequestParam(name = "aselecttcontent16") String aSelecttContent16,
			@RequestParam(name = "aselecttcontent17") String aSelecttContent17,
			@RequestParam(name = "aselecttcontent18") String aSelecttContent18,
			@RequestParam(name = "aselecttcontent19") String aSelecttContent19,
			@RequestParam(name = "aselecttcontent20") String aSelecttContent20,
			@RequestParam(name = "aselecttcontent21") String aSelecttContent21,
			@RequestParam(name = "aselecttcontent22") String aSelecttContent22,
			@RequestParam(name = "aselecttcontent23") String aSelecttContent23,
			@RequestParam(name = "aselecttcontent24") String aSelecttContent24,
			@RequestParam(name = "aselecttcontent25") String aSelecttContent25,
			@RequestParam(name = "aselecttcontent26") String aSelecttContent26,
			@RequestParam(name = "aselecttcontent27") String aSelecttContent27,
			@RequestParam(name = "aselecttcontent28") String aSelecttContent28,
			
			//获取所有选择题为b的选项内容
			@RequestParam(name = "bselecttcontent1") String bSelecttContent1,
			@RequestParam(name = "bselecttcontent2") String bSelecttContent2,
			@RequestParam(name = "bselecttcontent3") String bSelecttContent3,
			@RequestParam(name = "bselecttcontent4") String bSelecttContent4,
			@RequestParam(name = "bselecttcontent5") String bSelecttContent5,
			@RequestParam(name = "bselecttcontent6") String bSelecttContent6,
			@RequestParam(name = "bselecttcontent7") String bSelecttContent7,
			@RequestParam(name = "bselecttcontent8") String bSelecttContent8,
			@RequestParam(name = "bselecttcontent9") String bSelecttContent9,
			@RequestParam(name = "bselecttcontent10") String bSelecttContent10,
			@RequestParam(name = "bselecttcontent11") String bSelecttContent11,
			@RequestParam(name = "bselecttcontent12") String bSelecttContent12,
			@RequestParam(name = "bselecttcontent13") String bSelecttContent13,
			@RequestParam(name = "bselecttcontent14") String bSelecttContent14,
			@RequestParam(name = "bselecttcontent15") String bSelecttContent15,
			@RequestParam(name = "bselecttcontent16") String bSelecttContent16,
			@RequestParam(name = "bselecttcontent17") String bSelecttContent17,
			@RequestParam(name = "bselecttcontent18") String bSelecttContent18,
			@RequestParam(name = "bselecttcontent19") String bSelecttContent19,
			@RequestParam(name = "bselecttcontent20") String bSelecttContent20,
			@RequestParam(name = "bselecttcontent21") String bSelecttContent21,
			@RequestParam(name = "bselecttcontent22") String bSelecttContent22,
			@RequestParam(name = "bselecttcontent23") String bSelecttContent23,
			@RequestParam(name = "bselecttcontent24") String bSelecttContent24,
			@RequestParam(name = "bselecttcontent25") String bSelecttContent25,
			@RequestParam(name = "bselecttcontent26") String bSelecttContent26,
			@RequestParam(name = "bselecttcontent27") String bSelecttContent27,
			@RequestParam(name = "bselecttcontent28") String bSelecttContent28,
			
			//获取所有选择题为c的选项内容
			@RequestParam(name = "cselecttcontent1") String cSelecttContent1,
			@RequestParam(name = "cselecttcontent2") String cSelecttContent2,
			@RequestParam(name = "cselecttcontent3") String cSelecttContent3,
			@RequestParam(name = "cselecttcontent4") String cSelecttContent4,
			@RequestParam(name = "cselecttcontent5") String cSelecttContent5,
			@RequestParam(name = "cselecttcontent6") String cSelecttContent6,
			@RequestParam(name = "cselecttcontent7") String cSelecttContent7,
			@RequestParam(name = "cselecttcontent8") String cSelecttContent8,
			@RequestParam(name = "cselecttcontent9") String cSelecttContent9,
			@RequestParam(name = "cselecttcontent10") String cSelecttContent10,
			@RequestParam(name = "cselecttcontent11") String cSelecttContent11,
			@RequestParam(name = "cselecttcontent12") String cSelecttContent12,
			@RequestParam(name = "cselecttcontent13") String cSelecttContent13,
			@RequestParam(name = "cselecttcontent14") String cSelecttContent14,
			@RequestParam(name = "cselecttcontent15") String cSelecttContent15,
			@RequestParam(name = "cselecttcontent16") String cSelecttContent16,
			@RequestParam(name = "cselecttcontent17") String cSelecttContent17,
			@RequestParam(name = "cselecttcontent18") String cSelecttContent18,
			@RequestParam(name = "cselecttcontent19") String cSelecttContent19,
			@RequestParam(name = "cselecttcontent20") String cSelecttContent20,
			@RequestParam(name = "cselecttcontent21") String cSelecttContent21,
			@RequestParam(name = "cselecttcontent22") String cSelecttContent22,
			@RequestParam(name = "cselecttcontent23") String cSelecttContent23,
			@RequestParam(name = "cselecttcontent24") String cSelecttContent24,
			@RequestParam(name = "cselecttcontent25") String cSelecttContent25,
			@RequestParam(name = "cselecttcontent26") String cSelecttContent26,
			@RequestParam(name = "cselecttcontent27") String cSelecttContent27,
			@RequestParam(name = "cselecttcontent28") String cSelecttContent28,
			
			//获取所有选择题为d的选项内容
			@RequestParam(name = "dselecttcontent1") String dSelecttContent1,
			@RequestParam(name = "dselecttcontent2") String dSelecttContent2,
			@RequestParam(name = "dselecttcontent3") String dSelecttContent3,
			@RequestParam(name = "dselecttcontent4") String dSelecttContent4,
			@RequestParam(name = "dselecttcontent5") String dSelecttContent5,
			@RequestParam(name = "dselecttcontent6") String dSelecttContent6,
			@RequestParam(name = "dselecttcontent7") String dSelecttContent7,
			@RequestParam(name = "dselecttcontent8") String dSelecttContent8,
			@RequestParam(name = "dselecttcontent9") String dSelecttContent9,
			@RequestParam(name = "dselecttcontent10") String dSelecttContent10,
			@RequestParam(name = "dselecttcontent11") String dSelecttContent11,
			@RequestParam(name = "dselecttcontent12") String dSelecttContent12,
			@RequestParam(name = "dselecttcontent13") String dSelecttContent13,
			@RequestParam(name = "dselecttcontent14") String dSelecttContent14,
			@RequestParam(name = "dselecttcontent15") String dSelecttContent15,
			@RequestParam(name = "dselecttcontent16") String dSelecttContent16,
			@RequestParam(name = "dselecttcontent17") String dSelecttContent17,
			@RequestParam(name = "dselecttcontent18") String dSelecttContent18,
			@RequestParam(name = "dselecttcontent19") String dSelecttContent19,
			@RequestParam(name = "dselecttcontent20") String dSelecttContent20,
			@RequestParam(name = "dselecttcontent21") String dSelecttContent21,
			@RequestParam(name = "dselecttcontent22") String dSelecttContent22,
			@RequestParam(name = "dselecttcontent23") String dSelecttContent23,
			@RequestParam(name = "dselecttcontent24") String dSelecttContent24,
			@RequestParam(name = "dselecttcontent25") String dSelecttContent25,
			@RequestParam(name = "dselecttcontent26") String dSelecttContent26,
			@RequestParam(name = "dselecttcontent27") String dSelecttContent27,
			@RequestParam(name = "dselecttcontent28") String dSelecttContent28,
			
			//获取所有的question答案  所有题
			@RequestParam(name = "questionanswer1") String questionAnswer1,
			@RequestParam(name = "questionanswer2") String questionAnswer2,
			@RequestParam(name = "questionanswer3") String questionAnswer3,
			@RequestParam(name = "questionanswer4") String questionAnswer4,
			@RequestParam(name = "questionanswer5") String questionAnswer5,
			@RequestParam(name = "questionanswer6") String questionAnswer6,
			@RequestParam(name = "questionanswer7") String questionAnswer7,
			@RequestParam(name = "questionanswer8") String questionAnswer8,
			@RequestParam(name = "questionanswer9") String questionAnswer9,
			@RequestParam(name = "questionanswer10") String questionAnswer10,
			@RequestParam(name = "questionanswer11") String questionAnswer11,
			@RequestParam(name = "questionanswer12") String questionAnswer12,
			@RequestParam(name = "questionanswer13") String questionAnswer13,
			@RequestParam(name = "questionanswer14") String questionAnswer14,
			@RequestParam(name = "questionanswer15") String questionAnswer15,
			@RequestParam(name = "questionanswer16") String questionAnswer16,
			@RequestParam(name = "questionanswer17") String questionAnswer17,
			@RequestParam(name = "questionanswer18") String questionAnswer18,
			@RequestParam(name = "questionanswer19") String questionAnswer19,
			@RequestParam(name = "questionanswer20") String questionAnswer20,
			@RequestParam(name = "questionanswer21") String questionAnswer21,
			@RequestParam(name = "questionanswer22") String questionAnswer22,
			@RequestParam(name = "questionanswer23") String questionAnswer23,
			@RequestParam(name = "questionanswer24") String questionAnswer24,
			@RequestParam(name = "questionanswer25") String questionAnswer25,
			@RequestParam(name = "questionanswer26") String questionAnswer26,
			@RequestParam(name = "questionanswer27") String questionAnswer27,
			@RequestParam(name = "questionanswer28") String questionAnswer28,

			//获得所有questionexplain的参数 
			@RequestParam(name = "questionexplain1") String questionExplain1,
			@RequestParam(name = "questionexplain2") String questionExplain2,
			@RequestParam(name = "questionexplain3") String questionExplain3,
			@RequestParam(name = "questionexplain4") String questionExplain4,
			@RequestParam(name = "questionexplain5") String questionExplain5,
			@RequestParam(name = "questionexplain6") String questionExplain6,
			@RequestParam(name = "questionexplain7") String questionExplain7,
			@RequestParam(name = "questionexplain8") String questionExplain8,
			@RequestParam(name = "questionexplain9") String questionExplain9,
			@RequestParam(name = "questionexplain10") String questionExplain10,
			@RequestParam(name = "questionexplain11") String questionExplain11,
			@RequestParam(name = "questionexplain12") String questionExplain12,
			@RequestParam(name = "questionexplain13") String questionExplain13,
			@RequestParam(name = "questionexplain14") String questionExplain14,
			@RequestParam(name = "questionexplain15") String questionExplain15,
			@RequestParam(name = "questionexplain16") String questionExplain16,
			@RequestParam(name = "questionexplain17") String questionExplain17,
			@RequestParam(name = "questionexplain18") String questionExplain18,
			@RequestParam(name = "questionexplain19") String questionExplain19,
			@RequestParam(name = "questionexplain20") String questionExplain20,
			@RequestParam(name = "questionexplain21") String questionExplain21,
			@RequestParam(name = "questionexplain22") String questionExplain22,
			@RequestParam(name = "questionexplain23") String questionExplain23,
			@RequestParam(name = "questionexplain24") String questionExplain24,
			@RequestParam(name = "questionexplain25") String questionExplain25,
			@RequestParam(name = "questionexplain26") String questionExplain26,
			@RequestParam(name = "questionexplain27") String questionExplain27,
			@RequestParam(name = "questionexplain28") String questionExplain28,
		
			
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
			
			//听力文本域 解析参数
			@RequestParam(name = "textquestionexplain1") String textQuestionExplain1,
			@RequestParam(name = "textquestionexplain2") String textQuestionExplain2,
			@RequestParam(name = "textquestionexplain3") String textQuestionExplain3,
			@RequestParam(name = "textquestionexplain4") String textQuestionExplain4,
			@RequestParam(name = "textquestionexplain5") String textQuestionExplain5,
			@RequestParam(name = "textquestionexplain6") String textQuestionExplain6,
			@RequestParam(name = "textquestionexplain7") String textQuestionExplain7,
			@RequestParam(name = "textquestionexplain8") String textQuestionExplain8,
			@RequestParam(name = "textquestionexplain9") String textQuestionExplain9,
			@RequestParam(name = "textquestionexplain10") String textQuestionExplain10,
			
			//听力文本域 答案参数
			@RequestParam(name = "textquestionanswer1") String textQuestionAnswer1,
			@RequestParam(name = "textquestionanswer2") String textQuestionAnswer2,
			@RequestParam(name = "textquestionanswer3") String textQuestionAnswer3,
			@RequestParam(name = "textquestionanswer4") String textQuestionAnswer4,
			@RequestParam(name = "textquestionanswer5") String textQuestionAnswer5,
			@RequestParam(name = "textquestionanswer6") String textQuestionAnswer6,
			@RequestParam(name = "textquestionanswer7") String textQuestionAnswer7,
			@RequestParam(name = "textquestionanswer8") String textQuestionAnswer8,
			@RequestParam(name = "textquestionanswer9") String textQuestionAnswer9,
			@RequestParam(name = "textquestionanswer10") String textQuestionAnswer10,
			HttpServletRequest request) {
		
		
		//用集合！！很好用的方法！
		//用集合获取参数  再在for循环中使用 方便利用for循环添加question
				
		//list集合存储所有的question 答案和解析 信息   方便在for循环中存储
		List<String> questionLists = new ArrayList<String>();
		questionLists.add(questionAnswer1);
		questionLists.add(questionAnswer2);
		questionLists.add(questionAnswer3);
		questionLists.add(questionAnswer4);
		questionLists.add(questionAnswer5);
		questionLists.add(questionAnswer6);
		questionLists.add(questionAnswer7);
		questionLists.add(questionAnswer8);
		questionLists.add(questionAnswer9);
		questionLists.add(questionAnswer10);
		questionLists.add(questionAnswer11);
		questionLists.add(questionAnswer12);
		questionLists.add(questionAnswer13);
		questionLists.add(questionAnswer14);
		questionLists.add(questionAnswer15);
		questionLists.add(questionAnswer16);
		questionLists.add(questionAnswer17);
		questionLists.add(questionAnswer18);
		questionLists.add(questionAnswer19);
		questionLists.add(questionAnswer20);
		questionLists.add(questionAnswer21);
		questionLists.add(questionAnswer22);
		questionLists.add(questionAnswer23);
		questionLists.add(questionAnswer24);
		questionLists.add(questionAnswer25);
		questionLists.add(questionAnswer26);
		questionLists.add(questionAnswer27);
		questionLists.add(questionAnswer28);
		questionLists.add(questionExplain1);
		questionLists.add(questionExplain2);
		questionLists.add(questionExplain3);
		questionLists.add(questionExplain4);
		questionLists.add(questionExplain5);
		questionLists.add(questionExplain6);
		questionLists.add(questionExplain7);
		questionLists.add(questionExplain8);
		questionLists.add(questionExplain9);
		questionLists.add(questionExplain10);
		questionLists.add(questionExplain11);
		questionLists.add(questionExplain12);
		questionLists.add(questionExplain13);
		questionLists.add(questionExplain14);
		questionLists.add(questionExplain15);
		questionLists.add(questionExplain16);
		questionLists.add(questionExplain17);
		questionLists.add(questionExplain18);
		questionLists.add(questionExplain19);
		questionLists.add(questionExplain20);
		questionLists.add(questionExplain21);
		questionLists.add(questionExplain22);
		questionLists.add(questionExplain23);
		questionLists.add(questionExplain24);
		questionLists.add(questionExplain25);
		questionLists.add(questionExplain26);
		questionLists.add(questionExplain27);
		questionLists.add(questionExplain28);
		
		
		//用list集合保存单选内容   方便用循环存储数据
		List<String> selecttLists = new ArrayList<String>();
		selecttLists.add(aSelecttContent1);
		selecttLists.add(bSelecttContent1);
		selecttLists.add(cSelecttContent1);
		selecttLists.add(dSelecttContent1);
		selecttLists.add(aSelecttContent2);
		selecttLists.add(bSelecttContent2);
		selecttLists.add(cSelecttContent2);
		selecttLists.add(dSelecttContent2);
		selecttLists.add(aSelecttContent3);
		selecttLists.add(bSelecttContent3);
		selecttLists.add(cSelecttContent3);
		selecttLists.add(dSelecttContent3);
		selecttLists.add(aSelecttContent4);
		selecttLists.add(bSelecttContent4);
		selecttLists.add(cSelecttContent4);
		selecttLists.add(dSelecttContent4);
		selecttLists.add(aSelecttContent5);
		selecttLists.add(bSelecttContent5);
		selecttLists.add(cSelecttContent5);
		selecttLists.add(dSelecttContent5);
		selecttLists.add(aSelecttContent6);
		selecttLists.add(bSelecttContent6);
		selecttLists.add(cSelecttContent6);
		selecttLists.add(dSelecttContent6);
		selecttLists.add(aSelecttContent7);
		selecttLists.add(bSelecttContent7);
		selecttLists.add(cSelecttContent7);
		selecttLists.add(dSelecttContent7);
		selecttLists.add(aSelecttContent8);
		selecttLists.add(bSelecttContent8);
		selecttLists.add(cSelecttContent8);
		selecttLists.add(dSelecttContent8);
		selecttLists.add(aSelecttContent9);
		selecttLists.add(bSelecttContent9);
		selecttLists.add(cSelecttContent9);
		selecttLists.add(dSelecttContent9);
		selecttLists.add(aSelecttContent10);
		selecttLists.add(bSelecttContent10);
		selecttLists.add(cSelecttContent10);
		selecttLists.add(dSelecttContent10);
		selecttLists.add(aSelecttContent11);
		selecttLists.add(bSelecttContent11);
		selecttLists.add(cSelecttContent11);
		selecttLists.add(dSelecttContent11);
		selecttLists.add(aSelecttContent12);
		selecttLists.add(bSelecttContent12);
		selecttLists.add(cSelecttContent12);
		selecttLists.add(dSelecttContent12);
		selecttLists.add(aSelecttContent13);
		selecttLists.add(bSelecttContent13);
		selecttLists.add(cSelecttContent13);
		selecttLists.add(dSelecttContent13);
		selecttLists.add(aSelecttContent14);
		selecttLists.add(bSelecttContent14);
		selecttLists.add(cSelecttContent14);
		selecttLists.add(dSelecttContent14);
		selecttLists.add(aSelecttContent15);
		selecttLists.add(bSelecttContent15);
		selecttLists.add(cSelecttContent15);
		selecttLists.add(dSelecttContent15);
		selecttLists.add(aSelecttContent16);
		selecttLists.add(bSelecttContent16);
		selecttLists.add(cSelecttContent16);
		selecttLists.add(dSelecttContent16);
		selecttLists.add(aSelecttContent17);
		selecttLists.add(bSelecttContent17);
		selecttLists.add(cSelecttContent17);
		selecttLists.add(dSelecttContent17);
		selecttLists.add(aSelecttContent18);
		selecttLists.add(bSelecttContent18);
		selecttLists.add(cSelecttContent18);
		selecttLists.add(dSelecttContent18);
		selecttLists.add(aSelecttContent19);
		selecttLists.add(bSelecttContent19);
		selecttLists.add(cSelecttContent19);
		selecttLists.add(dSelecttContent19);
		selecttLists.add(aSelecttContent20);
		selecttLists.add(bSelecttContent20);
		selecttLists.add(cSelecttContent20);
		selecttLists.add(dSelecttContent20);
		selecttLists.add(aSelecttContent21);
		selecttLists.add(bSelecttContent21);
		selecttLists.add(cSelecttContent21);
		selecttLists.add(dSelecttContent21);
		selecttLists.add(aSelecttContent22);
		selecttLists.add(bSelecttContent22);
		selecttLists.add(cSelecttContent22);
		selecttLists.add(dSelecttContent22);
		selecttLists.add(aSelecttContent23);
		selecttLists.add(bSelecttContent23);
		selecttLists.add(cSelecttContent23);
		selecttLists.add(dSelecttContent23);
		selecttLists.add(aSelecttContent24);
		selecttLists.add(bSelecttContent24);
		selecttLists.add(cSelecttContent24);
		selecttLists.add(dSelecttContent24);
		selecttLists.add(aSelecttContent25);
		selecttLists.add(bSelecttContent25);
		selecttLists.add(cSelecttContent25);
		selecttLists.add(dSelecttContent25);
		selecttLists.add(aSelecttContent26);
		selecttLists.add(bSelecttContent26);
		selecttLists.add(cSelecttContent26);
		selecttLists.add(dSelecttContent26);
		selecttLists.add(aSelecttContent27);
		selecttLists.add(bSelecttContent27);
		selecttLists.add(cSelecttContent27);
		selecttLists.add(dSelecttContent27);
		selecttLists.add(aSelecttContent28);
		selecttLists.add(bSelecttContent28);
		selecttLists.add(cSelecttContent28);
		selecttLists.add(dSelecttContent28);
		
		// 根据examName找到exam对象
		Exam exam = this.examServiceImpl.findByName(examName);
		if (exam == null) {
			return "404";
		}
		
		
		
		/*
		 * 
		 * @desc				听力第一道大题存储  设置八道小题 没有参数的为空
		 * @author				孙永国
		 * @createDate 			2016/11/21
		 * @param 				获得相关参数
		 * @return				String
		 * 
		 */
		//将获取到的参数赋值给parentquestion,保存parentquestion
		ParentQuestion parentquestionone = new ParentQuestion();
		
		//parentquestion与exam关联;
		parentquestionone.setExam(exam);
		
		parentquestionone.setParentQuestionName(parentQuestionnameOne);
		parentquestionone.setDescription(descriptionOne);
		parentquestionone.setParentQuestionTitle(parentQuestiontitleOne);

		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> onequestions = new HashSet<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 0; i < questionToOne-questionFromOne+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestionone);
			question.setQuestionContent(((Integer)(i+questionFromOne)).toString());
			question.setQuestionAnswer(questionLists.get(i));
			
			//集合questionLists中  前十个是answer  后十个是explain
			question.setQuestionExplain(questionLists.get(i+28));
			question.setQuestionScore(Float.parseFloat(questionScoreOne));
			
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
		
		parentquestionone.setQuestions(onequestions);
		
		//存储parentquestion
		//听力第一道大题存储完毕
		this.parentQuestionServiceImpl.addParentQuestion(parentquestionone);
		
		
		
		
		/*
		 * 
		 * @desc				听力第二道大题存储  设置4道小题 没有参数的为空
		 * @author				孙永国
		 * @createDate 			2016/11/21
		 * @param 				获得相关参数
		 * @return				String
		 * 
		 */
//		将获取到的参数赋值给parentquestion,保存parentquestion
		ParentQuestion parentquestiontwo = new ParentQuestion();
		
//		这里没有实现
//		parentquestion与exam关联;
		parentquestiontwo.setExam(exam);
		
		parentquestiontwo.setParentQuestionName(parentQuestionnameTwo);
		parentquestiontwo.setDescription(descriptionTwo);
		parentquestiontwo.setParentQuestionTitle(parentQuestiontitleTwo);
		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> twoquestions = new HashSet<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 0; i < questionToTwo-questionFromTwo+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestiontwo);
			question.setQuestionContent(((Integer)(i+questionFromTwo)).toString());
			//集合questionLists中  前28个是answer  i+8 对应answer下标
			question.setQuestionAnswer(questionLists.get(i+8));
			
			//集合questionLists中  前28个是answer  后28个是explain
			question.setQuestionExplain(questionLists.get(i+8+28));
			question.setQuestionScore(Float.parseFloat(questionScoreTwo));
			
			Set<Selectt> selectts = new HashSet<Selectt>(0);
			
			//存储selectt表  将selectts赋值给question 与question联系起来
			for(Integer j = 0; j<4; j++){
				Selectt selectt = new Selectt();
				selectt.setQuestion(question);
				char c=(char) (j+65);
				
				//根据ASCII码转换成字符'A' 'B'..
				selectt.setSelecttName(c+"");
				//分别存储每道question 的selectt j对应selectt  i对应question
				selectt.setSelecttContent(selecttLists.get(j+(i+8)*4));
				
				this.selecttServiceImpl.addSelectt(selectt);
				selectts.add(selectt);
			}
			
			question.setSelectts(selectts);

			this.questionServiceImpl.addQuestion(question);

			twoquestions.add(question);
		}
		
		parentquestiontwo.setQuestions(twoquestions);
		
		//存储parentquestion
		this.parentQuestionServiceImpl.addParentQuestion(parentquestiontwo);
		
		
		/*
		 * 
		 * @desc				听力第三道大题存储  设置4道小题 没有参数的为空
		 * @author				孙永国
		 * @createDate 			2016/11/21
		 * @param 				获得相关参数
		 * @return				String
		 * 
		 */
		//将获取到的参数赋值给parentquestion,保存parentquestion
		ParentQuestion parentquestionthree = new ParentQuestion();
		
		
		//parentquestion与exam关联;
		parentquestionthree.setExam(exam);
		
		parentquestionthree.setParentQuestionName(parentQuestionnameThree);
		parentquestionthree.setDescription(descriptionThree);
		parentquestionthree.setParentQuestionTitle(parentQuestiontitleThree);
		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> threequestions = new HashSet<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 0; i < questionToThree-questionFromThree+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestionthree);
			question.setQuestionContent(((Integer)(i+questionFromThree)).toString());
			//集合questionLists中  前28个是answer  i+8+4对应answer下标
			question.setQuestionAnswer(questionLists.get(i+12));
			
			//集合questionLists中  前28个是answer  后28个是explain  i+8+28+4对应下标
			question.setQuestionExplain(questionLists.get(i+12+28));
			question.setQuestionScore(Float.parseFloat(questionScoreThree));
			
			Set<Selectt> selectts = new HashSet<Selectt>(0);
			
			//存储selectt表  将selectts赋值给question 与question联系起来
			for(Integer j = 0; j<4; j++){
				Selectt selectt = new Selectt();
				selectt.setQuestion(question);
				char c=(char) (j+65);
				
				//根据ASCII码转换成字符'A' 'B'..
				selectt.setSelecttName(c+"");
				//分别存储每道question 的selectt j对应selectt  i+8+4对应question
				selectt.setSelecttContent(selecttLists.get(j+(i+12)*4));
				
				this.selecttServiceImpl.addSelectt(selectt);
				selectts.add(selectt);
			}
			
			question.setSelectts(selectts);

			this.questionServiceImpl.addQuestion(question);

			threequestions.add(question);
		}
		
		parentquestionthree.setQuestions(threequestions);
		
		//存储parentquestion
		this.parentQuestionServiceImpl.addParentQuestion(parentquestionthree);
		
		
		/*
		 * 
		 * @desc				听力第四道大题存储  设置4道小题 没有参数的为空
		 * @author				孙永国
		 * @createDate 			2016/11/22
		 * @param 				获得相关参数
		 * @return				String
		 * 
		 */
		//将获取到的参数赋值给parentquestion,保存parentquestion
		ParentQuestion parentquestionfour = new ParentQuestion();
		
		
		//parentquestion与exam关联;
		parentquestionfour.setExam(exam);
		
		parentquestionfour.setParentQuestionName(parentQuestionnameFour);
		parentquestionfour.setDescription(descriptionFour);
		parentquestionfour.setParentQuestionTitle(parentQuestiontitleFour);
		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> fourquestions = new HashSet<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 0; i < questionToFour-questionFromFour+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestionfour);
			question.setQuestionContent(((Integer)(i+questionFromFour)).toString());
			//集合questionLists中  前28个是answer   i+8+4+4对应下标 answer
			question.setQuestionAnswer(questionLists.get(i+16));
			
			//集合questionLists中  前28个是answer  后28个是explain  i+8+28+4+4对应下标
			question.setQuestionExplain(questionLists.get(i+16+28));
			question.setQuestionScore(Float.parseFloat(questionScoreFour));
			
			Set<Selectt> selectts = new HashSet<Selectt>(0);
			
			//存储selectt表  将selectts赋值给question 与question联系起来
			for(Integer j = 0; j<4; j++){
				Selectt selectt = new Selectt();
				selectt.setQuestion(question);
				char c=(char) (j+65);
				
				//根据ASCII码转换成字符'A' 'B'..
				selectt.setSelecttName(c+"");
				//分别存储每道question 的selectt j对应selectt  i+8+4+4对应question
				selectt.setSelecttContent(selecttLists.get(j+(i+16)*4));
				
				this.selecttServiceImpl.addSelectt(selectt);
				selectts.add(selectt);
			}
			
			question.setSelectts(selectts);

			this.questionServiceImpl.addQuestion(question);

			fourquestions.add(question);
		}
		
		parentquestionfour.setQuestions(fourquestions);
		
		//存储parentquestion
		this.parentQuestionServiceImpl.addParentQuestion(parentquestionfour);
		
		
		
		/*
		 * 
		 * @desc				听力第5道大题存储  设置4道小题 没有参数的为空
		 * @author				孙永国
		 * @createDate 			2016/11/22
		 * @param 				获得相关参数
		 * @return				String
		 * 
		 */
		//将获取到的参数赋值给parentquestion,保存parentquestion
		ParentQuestion parentquestionfive = new ParentQuestion();
		
		
		//parentquestion与exam关联;
		parentquestionfive.setExam(exam);
		
		parentquestionfive.setParentQuestionName(parentQuestionnameFive);
		parentquestionfive.setDescription(descriptionFive);
		parentquestionfive.setParentQuestionTitle(parentQuestiontitleFive);
		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> fivequestions = new HashSet<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 0; i < questionToFive-questionFromFive+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestionfive);
			question.setQuestionContent(((Integer)(i+questionFromFive)).toString());
			//集合questionLists中  前28个是answer    i+8+4+4+4对应下标
			question.setQuestionAnswer(questionLists.get(i+20));
			
			//集合questionLists中  前28个是answer  后十个是explain  i+8+28+4+4+4对应下标
			question.setQuestionExplain(questionLists.get(i+20+28));
			question.setQuestionScore(Float.parseFloat(questionScoreFive));
			
			Set<Selectt> selectts = new HashSet<Selectt>(0);
			
			//存储selectt表  将selectts赋值给question 与question联系起来
			for(Integer j = 0; j<4; j++){
				Selectt selectt = new Selectt();
				selectt.setQuestion(question);
				char c=(char) (j+65);
				
				//根据ASCII码转换成字符'A' 'B'..
				selectt.setSelecttName(c+"");
				//分别存储每道question 的selectt j对应selectt  i+8+4+4+4对应question
				selectt.setSelecttContent(selecttLists.get(j+(i+20)*4));
				
				this.selecttServiceImpl.addSelectt(selectt);
				selectts.add(selectt);
			}
			
			question.setSelectts(selectts);

			this.questionServiceImpl.addQuestion(question);

			fivequestions.add(question);
		}
		
		parentquestionfive.setQuestions(fivequestions);
		
		//存储parentquestion
		this.parentQuestionServiceImpl.addParentQuestion(parentquestionfive);
		

		
		/*
		 * 
		 * @desc				听力第6道大题存储  设置4道小题 没有参数的为空
		 * @author				孙永国
		 * @createDate 			2016/11/22
		 * @param 				获得相关参数
		 * @return				String
		 * 
		 */
		//将获取到的参数赋值给parentquestion,保存parentquestion
		ParentQuestion parentquestionsix = new ParentQuestion();
		
		
		//parentquestion与exam关联;
		parentquestionsix.setExam(exam);
		
		parentquestionsix.setParentQuestionName(parentQuestionnameSix);
		parentquestionsix.setDescription(descriptionSix);
		parentquestionsix.setParentQuestionTitle(parentQuestiontitleSix);
		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> sixquestions = new HashSet<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 0; i < questionToSix-questionFromSix+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestionsix);
			question.setQuestionContent(((Integer)(i+questionFromSix)).toString());
			
			//集合questionLists中  前28个是answer  i+8+4+4+4+4对应下标
			question.setQuestionAnswer(questionLists.get(i+24));
			
			//集合questionLists中  前28个是answer  后28个是explain  i+8+28+4+4+4+4对应下标
			question.setQuestionExplain(questionLists.get(i+24+28));
			question.setQuestionScore(Float.parseFloat(questionScoreSix));
			
			Set<Selectt> selectts = new HashSet<Selectt>(0);
			
			//存储selectt表  将selectts赋值给question 与question联系起来
			for(Integer j = 0; j<4; j++){
				Selectt selectt = new Selectt();
				selectt.setQuestion(question);
				char c=(char) (j+65);
				
				//根据ASCII码转换成字符'A' 'B'..
				selectt.setSelecttName(c+"");
				//分别存储每道question 的selectt j对应selectt  i+8+4+4+4+4对应question
				selectt.setSelecttContent(selecttLists.get(j+(i+24)*4));
				
				this.selecttServiceImpl.addSelectt(selectt);
				selectts.add(selectt);
			}
			
			question.setSelectts(selectts);

			this.questionServiceImpl.addQuestion(question);

			sixquestions.add(question);
		}
		
		parentquestionsix.setQuestions(sixquestions);
		
		//存储parentquestion
		this.parentQuestionServiceImpl.addParentQuestion(parentquestionsix);
		
		
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
		
		List<String> questiontextLists = new ArrayList<String>();
		questiontextLists.add(textQuestionAnswer1);
		questiontextLists.add(textQuestionAnswer2);
		questiontextLists.add(textQuestionAnswer3);
		questiontextLists.add(textQuestionAnswer4);
		questiontextLists.add(textQuestionAnswer5);
		questiontextLists.add(textQuestionAnswer6);
		questiontextLists.add(textQuestionAnswer7);
		questiontextLists.add(textQuestionAnswer8);
		questiontextLists.add(textQuestionAnswer9);
		questiontextLists.add(textQuestionAnswer10);
		questiontextLists.add(textQuestionExplain1);
		questiontextLists.add(textQuestionExplain2);
		questiontextLists.add(textQuestionExplain3);
		questiontextLists.add(textQuestionExplain4);
		questiontextLists.add(textQuestionExplain5);
		questiontextLists.add(textQuestionExplain6);
		questiontextLists.add(textQuestionExplain7);
		questiontextLists.add(textQuestionExplain8);
		questiontextLists.add(textQuestionExplain9);
		questiontextLists.add(textQuestionExplain10);
	
		
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
		Set<Question> textquestions = new HashSet<Question>(0);
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		
		
		for (Integer i = 0; i < questionToTextInt-questionFromTextInt+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentQuestionText);
			question.setQuestionContent(((Integer)(i+questionFromTextInt)).toString());
			
			//集合questionLists中  前10个是answer  
			question.setQuestionAnswer(questiontextLists.get(i));
			//集合questionLists中  前10个是answer  后10个是explain 
			question.setQuestionExplain(questiontextLists.get(i+10));
			
			question.setQuestionScore(Float.parseFloat(questionScoreText));

			this.questionServiceImpl.addQuestion(question);

			textquestions.add(question); 
		}
		
		parentQuestionText.setQuestions(textquestions);
		
		//存储parentquestion
		this.parentQuestionServiceImpl.addParentQuestion(parentQuestionText);
		
		return "redirect:list";
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
