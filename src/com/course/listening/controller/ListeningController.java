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
	 * @desc				添加听力大题，一共七道parentquestion;获取addlistening.jsp的参数，实现添加parentQuestion对象；
	 * @author				孙永国
	 * @createDate 			2016/11/22
	 * @param 				获得添加十五选十大题相关参数
	 * @return				String
	 * 
	 */
	@RequestMapping("add")
	public String add(@RequestParam(name = "examname") String examname,
			//获取所有选择题为a的选项内容
			@RequestParam(name = "aselecttcontent1") String aselecttcontent1,
			@RequestParam(name = "aselecttcontent2") String aselecttcontent2,
			@RequestParam(name = "aselecttcontent3") String aselecttcontent3,
			@RequestParam(name = "aselecttcontent4") String aselecttcontent4,
			@RequestParam(name = "aselecttcontent5") String aselecttcontent5,
			@RequestParam(name = "aselecttcontent6") String aselecttcontent6,
			@RequestParam(name = "aselecttcontent7") String aselecttcontent7,
			@RequestParam(name = "aselecttcontent8") String aselecttcontent8,
			@RequestParam(name = "aselecttcontent9") String aselecttcontent9,
			@RequestParam(name = "aselecttcontent10") String aselecttcontent10,
			@RequestParam(name = "aselecttcontent11") String aselecttcontent11,
			@RequestParam(name = "aselecttcontent12") String aselecttcontent12,
			@RequestParam(name = "aselecttcontent13") String aselecttcontent13,
			@RequestParam(name = "aselecttcontent14") String aselecttcontent14,
			@RequestParam(name = "aselecttcontent15") String aselecttcontent15,
			@RequestParam(name = "aselecttcontent16") String aselecttcontent16,
			@RequestParam(name = "aselecttcontent17") String aselecttcontent17,
			@RequestParam(name = "aselecttcontent18") String aselecttcontent18,
			@RequestParam(name = "aselecttcontent19") String aselecttcontent19,
			@RequestParam(name = "aselecttcontent20") String aselecttcontent20,
			@RequestParam(name = "aselecttcontent21") String aselecttcontent21,
			@RequestParam(name = "aselecttcontent22") String aselecttcontent22,
			@RequestParam(name = "aselecttcontent23") String aselecttcontent23,
			@RequestParam(name = "aselecttcontent24") String aselecttcontent24,
			@RequestParam(name = "aselecttcontent25") String aselecttcontent25,
			@RequestParam(name = "aselecttcontent26") String aselecttcontent26,
			@RequestParam(name = "aselecttcontent27") String aselecttcontent27,
			@RequestParam(name = "aselecttcontent28") String aselecttcontent28,
			
			//获取所有选择题为b的选项内容
			@RequestParam(name = "bselecttcontent1") String bselecttcontent1,
			@RequestParam(name = "bselecttcontent2") String bselecttcontent2,
			@RequestParam(name = "bselecttcontent3") String bselecttcontent3,
			@RequestParam(name = "bselecttcontent4") String bselecttcontent4,
			@RequestParam(name = "bselecttcontent5") String bselecttcontent5,
			@RequestParam(name = "bselecttcontent6") String bselecttcontent6,
			@RequestParam(name = "bselecttcontent7") String bselecttcontent7,
			@RequestParam(name = "bselecttcontent8") String bselecttcontent8,
			@RequestParam(name = "bselecttcontent9") String bselecttcontent9,
			@RequestParam(name = "bselecttcontent10") String bselecttcontent10,
			@RequestParam(name = "bselecttcontent11") String bselecttcontent11,
			@RequestParam(name = "bselecttcontent12") String bselecttcontent12,
			@RequestParam(name = "bselecttcontent13") String bselecttcontent13,
			@RequestParam(name = "bselecttcontent14") String bselecttcontent14,
			@RequestParam(name = "bselecttcontent15") String bselecttcontent15,
			@RequestParam(name = "bselecttcontent16") String bselecttcontent16,
			@RequestParam(name = "bselecttcontent17") String bselecttcontent17,
			@RequestParam(name = "bselecttcontent18") String bselecttcontent18,
			@RequestParam(name = "bselecttcontent19") String bselecttcontent19,
			@RequestParam(name = "bselecttcontent20") String bselecttcontent20,
			@RequestParam(name = "bselecttcontent21") String bselecttcontent21,
			@RequestParam(name = "bselecttcontent22") String bselecttcontent22,
			@RequestParam(name = "bselecttcontent23") String bselecttcontent23,
			@RequestParam(name = "bselecttcontent24") String bselecttcontent24,
			@RequestParam(name = "bselecttcontent25") String bselecttcontent25,
			@RequestParam(name = "bselecttcontent26") String bselecttcontent26,
			@RequestParam(name = "bselecttcontent27") String bselecttcontent27,
			@RequestParam(name = "bselecttcontent28") String bselecttcontent28,
			
			//获取所有选择题为c的选项内容
			@RequestParam(name = "cselecttcontent1") String cselecttcontent1,
			@RequestParam(name = "cselecttcontent2") String cselecttcontent2,
			@RequestParam(name = "cselecttcontent3") String cselecttcontent3,
			@RequestParam(name = "cselecttcontent4") String cselecttcontent4,
			@RequestParam(name = "cselecttcontent5") String cselecttcontent5,
			@RequestParam(name = "cselecttcontent6") String cselecttcontent6,
			@RequestParam(name = "cselecttcontent7") String cselecttcontent7,
			@RequestParam(name = "cselecttcontent8") String cselecttcontent8,
			@RequestParam(name = "cselecttcontent9") String cselecttcontent9,
			@RequestParam(name = "cselecttcontent10") String cselecttcontent10,
			@RequestParam(name = "cselecttcontent11") String cselecttcontent11,
			@RequestParam(name = "cselecttcontent12") String cselecttcontent12,
			@RequestParam(name = "cselecttcontent13") String cselecttcontent13,
			@RequestParam(name = "cselecttcontent14") String cselecttcontent14,
			@RequestParam(name = "cselecttcontent15") String cselecttcontent15,
			@RequestParam(name = "cselecttcontent16") String cselecttcontent16,
			@RequestParam(name = "cselecttcontent17") String cselecttcontent17,
			@RequestParam(name = "cselecttcontent18") String cselecttcontent18,
			@RequestParam(name = "cselecttcontent19") String cselecttcontent19,
			@RequestParam(name = "cselecttcontent20") String cselecttcontent20,
			@RequestParam(name = "cselecttcontent21") String cselecttcontent21,
			@RequestParam(name = "cselecttcontent22") String cselecttcontent22,
			@RequestParam(name = "cselecttcontent23") String cselecttcontent23,
			@RequestParam(name = "cselecttcontent24") String cselecttcontent24,
			@RequestParam(name = "cselecttcontent25") String cselecttcontent25,
			@RequestParam(name = "cselecttcontent26") String cselecttcontent26,
			@RequestParam(name = "cselecttcontent27") String cselecttcontent27,
			@RequestParam(name = "cselecttcontent28") String cselecttcontent28,
			
			//获取所有选择题为d的选项内容
			@RequestParam(name = "dselecttcontent1") String dselecttcontent1,
			@RequestParam(name = "dselecttcontent2") String dselecttcontent2,
			@RequestParam(name = "dselecttcontent3") String dselecttcontent3,
			@RequestParam(name = "dselecttcontent4") String dselecttcontent4,
			@RequestParam(name = "dselecttcontent5") String dselecttcontent5,
			@RequestParam(name = "dselecttcontent6") String dselecttcontent6,
			@RequestParam(name = "dselecttcontent7") String dselecttcontent7,
			@RequestParam(name = "dselecttcontent8") String dselecttcontent8,
			@RequestParam(name = "dselecttcontent9") String dselecttcontent9,
			@RequestParam(name = "dselecttcontent10") String dselecttcontent10,
			@RequestParam(name = "dselecttcontent11") String dselecttcontent11,
			@RequestParam(name = "dselecttcontent12") String dselecttcontent12,
			@RequestParam(name = "dselecttcontent13") String dselecttcontent13,
			@RequestParam(name = "dselecttcontent14") String dselecttcontent14,
			@RequestParam(name = "dselecttcontent15") String dselecttcontent15,
			@RequestParam(name = "dselecttcontent16") String dselecttcontent16,
			@RequestParam(name = "dselecttcontent17") String dselecttcontent17,
			@RequestParam(name = "dselecttcontent18") String dselecttcontent18,
			@RequestParam(name = "dselecttcontent19") String dselecttcontent19,
			@RequestParam(name = "dselecttcontent20") String dselecttcontent20,
			@RequestParam(name = "dselecttcontent21") String dselecttcontent21,
			@RequestParam(name = "dselecttcontent22") String dselecttcontent22,
			@RequestParam(name = "dselecttcontent23") String dselecttcontent23,
			@RequestParam(name = "dselecttcontent24") String dselecttcontent24,
			@RequestParam(name = "dselecttcontent25") String dselecttcontent25,
			@RequestParam(name = "dselecttcontent26") String dselecttcontent26,
			@RequestParam(name = "dselecttcontent27") String dselecttcontent27,
			@RequestParam(name = "dselecttcontent28") String dselecttcontent28,
			
			//获取所有的question答案  所有题
			@RequestParam(name = "questionanswer1") String questionanswer1,
			@RequestParam(name = "questionanswer2") String questionanswer2,
			@RequestParam(name = "questionanswer3") String questionanswer3,
			@RequestParam(name = "questionanswer4") String questionanswer4,
			@RequestParam(name = "questionanswer5") String questionanswer5,
			@RequestParam(name = "questionanswer6") String questionanswer6,
			@RequestParam(name = "questionanswer7") String questionanswer7,
			@RequestParam(name = "questionanswer8") String questionanswer8,
			@RequestParam(name = "questionanswer9") String questionanswer9,
			@RequestParam(name = "questionanswer10") String questionanswer10,
			@RequestParam(name = "questionanswer11") String questionanswer11,
			@RequestParam(name = "questionanswer12") String questionanswer12,
			@RequestParam(name = "questionanswer13") String questionanswer13,
			@RequestParam(name = "questionanswer14") String questionanswer14,
			@RequestParam(name = "questionanswer15") String questionanswer15,
			@RequestParam(name = "questionanswer16") String questionanswer16,
			@RequestParam(name = "questionanswer17") String questionanswer17,
			@RequestParam(name = "questionanswer18") String questionanswer18,
			@RequestParam(name = "questionanswer19") String questionanswer19,
			@RequestParam(name = "questionanswer20") String questionanswer20,
			@RequestParam(name = "questionanswer21") String questionanswer21,
			@RequestParam(name = "questionanswer22") String questionanswer22,
			@RequestParam(name = "questionanswer23") String questionanswer23,
			@RequestParam(name = "questionanswer24") String questionanswer24,
			@RequestParam(name = "questionanswer25") String questionanswer25,
			@RequestParam(name = "questionanswer26") String questionanswer26,
			@RequestParam(name = "questionanswer27") String questionanswer27,
			@RequestParam(name = "questionanswer28") String questionanswer28,

			//获得所有questionexplain的参数 
			@RequestParam(name = "questionexplain1") String questionexplain1,
			@RequestParam(name = "questionexplain2") String questionexplain2,
			@RequestParam(name = "questionexplain3") String questionexplain3,
			@RequestParam(name = "questionexplain4") String questionexplain4,
			@RequestParam(name = "questionexplain5") String questionexplain5,
			@RequestParam(name = "questionexplain6") String questionexplain6,
			@RequestParam(name = "questionexplain7") String questionexplain7,
			@RequestParam(name = "questionexplain8") String questionexplain8,
			@RequestParam(name = "questionexplain9") String questionexplain9,
			@RequestParam(name = "questionexplain10") String questionexplain10,
			@RequestParam(name = "questionexplain11") String questionexplain11,
			@RequestParam(name = "questionexplain12") String questionexplain12,
			@RequestParam(name = "questionexplain13") String questionexplain13,
			@RequestParam(name = "questionexplain14") String questionexplain14,
			@RequestParam(name = "questionexplain15") String questionexplain15,
			@RequestParam(name = "questionexplain16") String questionexplain16,
			@RequestParam(name = "questionexplain17") String questionexplain17,
			@RequestParam(name = "questionexplain18") String questionexplain18,
			@RequestParam(name = "questionexplain19") String questionexplain19,
			@RequestParam(name = "questionexplain20") String questionexplain20,
			@RequestParam(name = "questionexplain21") String questionexplain21,
			@RequestParam(name = "questionexplain22") String questionexplain22,
			@RequestParam(name = "questionexplain23") String questionexplain23,
			@RequestParam(name = "questionexplain24") String questionexplain24,
			@RequestParam(name = "questionexplain25") String questionexplain25,
			@RequestParam(name = "questionexplain26") String questionexplain26,
			@RequestParam(name = "questionexplain27") String questionexplain27,
			@RequestParam(name = "questionexplain28") String questionexplain28,
			
			
			//parentquestionname 获取 从听力一到六 text
			@RequestParam(name = "parentquestionnameone") String parentquestionnameone,
			@RequestParam(name = "parentquestionnametwo") String parentquestionnametwo,
			@RequestParam(name = "parentquestionnamethree") String parentquestionnamethree,
			@RequestParam(name = "parentquestionnamefour") String parentquestionnamefour,
			@RequestParam(name = "parentquestionnamefive") String parentquestionnamefive,
			@RequestParam(name = "parentquestionnamesix") String parentquestionnamesix,
			@RequestParam(name = "parentquestionnametext") String parentquestionnametext,
			
			//parentquestiondescription获取 从听力一到六 text
			@RequestParam(name = "descriptionone") String descriptionone,
			@RequestParam(name = "descriptiontwo") String descriptiontwo,
			@RequestParam(name = "descriptionthree") String descriptionthree,
			@RequestParam(name = "descriptionfour") String descriptionfour,
			@RequestParam(name = "descriptionfive") String descriptionfive,
			@RequestParam(name = "descriptionsix") String descriptionsix,
			@RequestParam(name = "descriptiontext") String descriptiontext,
			
			//parentquestiontitle 获取 从听力一到六 text
			@RequestParam(name = "parentquestiontitleone") String parentquestiontitleone,
			@RequestParam(name = "parentquestiontitletwo") String parentquestiontitletwo,
			@RequestParam(name = "parentquestiontitlethree") String parentquestiontitlethree,
			@RequestParam(name = "parentquestiontitlefour") String parentquestiontitlefour,
			@RequestParam(name = "parentquestiontitlefive") String parentquestiontitlefive,
			@RequestParam(name = "parentquestiontitlesix") String parentquestiontitlesix,
			@RequestParam(name = "parentquestiontitletext") String parentquestiontitletext,
			
			//parentquestionscore 获取 从听力一到六 text
			@RequestParam(name = "questionscoreone") String questionscoreone,
			@RequestParam(name = "questionscoretwo") String questionscoretwo,
			@RequestParam(name = "questionscorethree") String questionscorethree,
			@RequestParam(name = "questionscorefour") String questionscorefour,
			@RequestParam(name = "questionscorefive") String questionscorefive,
			@RequestParam(name = "questionscoresix") String questionscoresix,
			@RequestParam(name = "questionscoretext") String questionscoretext,
			
			//questionfrom  获取 从听力一到六 text
			@RequestParam(name = "questionfromone") Integer questionfromone,
			@RequestParam(name = "questionfromtwo") Integer questionfromtwo,
			@RequestParam(name = "questionfromthree") Integer questionfromthree,
			@RequestParam(name = "questionfromfour") Integer questionfromfour,
			@RequestParam(name = "questionfromfive") Integer questionfromfive,
			@RequestParam(name = "questionfromsix") Integer questionfromsix,
			@RequestParam(name = "questionfromtext") String questionfromtext,
			
			//questionto  获取 从听力一到六 text
			@RequestParam(name = "questiontoone") Integer questiontoone,
			@RequestParam(name = "questiontotwo") Integer questiontotwo,
			@RequestParam(name = "questiontothree") Integer questiontothree,
			@RequestParam(name = "questiontofour") Integer questiontofour,
			@RequestParam(name = "questiontofive") Integer questiontofive,
			@RequestParam(name = "questiontosix") Integer questiontosix,
			@RequestParam(name = "questiontotext") String questiontotext,
			
			//听力文本域   parentquestion参数 parentquestionarticle
			@RequestParam(name = "parentquestionarticle") String parentquestionarticletext,
			
			//听力文本域 解析参数
			@RequestParam(name = "textquestionexplain1") String textquestionexplain1,
			@RequestParam(name = "textquestionexplain2") String textquestionexplain2,
			@RequestParam(name = "textquestionexplain3") String textquestionexplain3,
			@RequestParam(name = "textquestionexplain4") String textquestionexplain4,
			@RequestParam(name = "textquestionexplain5") String textquestionexplain5,
			@RequestParam(name = "textquestionexplain6") String textquestionexplain6,
			@RequestParam(name = "textquestionexplain7") String textquestionexplain7,
			@RequestParam(name = "textquestionexplain8") String textquestionexplain8,
			@RequestParam(name = "textquestionexplain9") String textquestionexplain9,
			@RequestParam(name = "textquestionexplain10") String textquestionexplain10,
			
			//听力文本域 答案参数
			@RequestParam(name = "textquestionanswer1") String textquestionanswer1,
			@RequestParam(name = "textquestionanswer2") String textquestionanswer2,
			@RequestParam(name = "textquestionanswer3") String textquestionanswer3,
			@RequestParam(name = "textquestionanswer4") String textquestionanswer4,
			@RequestParam(name = "textquestionanswer5") String textquestionanswer5,
			@RequestParam(name = "textquestionanswer6") String textquestionanswer6,
			@RequestParam(name = "textquestionanswer7") String textquestionanswer7,
			@RequestParam(name = "textquestionanswer8") String textquestionanswer8,
			@RequestParam(name = "textquestionanswer9") String textquestionanswer9,
			@RequestParam(name = "textquestionanswer10") String textquestionanswer10,
			HttpServletRequest request) {
		
		
		//用集合！！很好用的方法！
		//用集合获取参数  再在for循环中使用 方便利用for循环添加question
				
		//list集合存储所有的question 答案和解析 信息   方便在for循环中存储
		List<String> questionLists = new ArrayList<String>();
		questionLists.add(questionanswer1);
		questionLists.add(questionanswer2);
		questionLists.add(questionanswer3);
		questionLists.add(questionanswer4);
		questionLists.add(questionanswer5);
		questionLists.add(questionanswer6);
		questionLists.add(questionanswer7);
		questionLists.add(questionanswer8);
		questionLists.add(questionanswer9);
		questionLists.add(questionanswer10);
		questionLists.add(questionanswer11);
		questionLists.add(questionanswer12);
		questionLists.add(questionanswer13);
		questionLists.add(questionanswer14);
		questionLists.add(questionanswer15);
		questionLists.add(questionanswer16);
		questionLists.add(questionanswer17);
		questionLists.add(questionanswer18);
		questionLists.add(questionanswer19);
		questionLists.add(questionanswer20);
		questionLists.add(questionanswer21);
		questionLists.add(questionanswer22);
		questionLists.add(questionanswer23);
		questionLists.add(questionanswer24);
		questionLists.add(questionanswer25);
		questionLists.add(questionanswer26);
		questionLists.add(questionanswer27);
		questionLists.add(questionanswer28);
		questionLists.add(questionexplain1);
		questionLists.add(questionexplain2);
		questionLists.add(questionexplain3);
		questionLists.add(questionexplain4);
		questionLists.add(questionexplain5);
		questionLists.add(questionexplain6);
		questionLists.add(questionexplain7);
		questionLists.add(questionexplain8);
		questionLists.add(questionexplain9);
		questionLists.add(questionexplain10);
		questionLists.add(questionexplain11);
		questionLists.add(questionexplain12);
		questionLists.add(questionexplain13);
		questionLists.add(questionexplain14);
		questionLists.add(questionexplain15);
		questionLists.add(questionexplain16);
		questionLists.add(questionexplain17);
		questionLists.add(questionexplain18);
		questionLists.add(questionexplain19);
		questionLists.add(questionexplain20);
		questionLists.add(questionexplain21);
		questionLists.add(questionexplain22);
		questionLists.add(questionexplain23);
		questionLists.add(questionexplain24);
		questionLists.add(questionexplain25);
		questionLists.add(questionexplain26);
		questionLists.add(questionexplain27);
		questionLists.add(questionexplain28);
		
		
		//用list集合保存单选内容   方便用循环存储数据
		List<String> selecttLists = new ArrayList<String>();
		selecttLists.add(aselecttcontent1);
		selecttLists.add(bselecttcontent1);
		selecttLists.add(cselecttcontent1);
		selecttLists.add(dselecttcontent1);
		selecttLists.add(aselecttcontent2);
		selecttLists.add(bselecttcontent2);
		selecttLists.add(cselecttcontent2);
		selecttLists.add(dselecttcontent2);
		selecttLists.add(aselecttcontent3);
		selecttLists.add(bselecttcontent3);
		selecttLists.add(cselecttcontent3);
		selecttLists.add(dselecttcontent3);
		selecttLists.add(aselecttcontent4);
		selecttLists.add(bselecttcontent4);
		selecttLists.add(cselecttcontent4);
		selecttLists.add(dselecttcontent4);
		selecttLists.add(aselecttcontent5);
		selecttLists.add(bselecttcontent5);
		selecttLists.add(cselecttcontent5);
		selecttLists.add(dselecttcontent5);
		selecttLists.add(aselecttcontent6);
		selecttLists.add(bselecttcontent6);
		selecttLists.add(cselecttcontent6);
		selecttLists.add(dselecttcontent6);
		selecttLists.add(aselecttcontent7);
		selecttLists.add(bselecttcontent7);
		selecttLists.add(cselecttcontent7);
		selecttLists.add(dselecttcontent7);
		selecttLists.add(aselecttcontent8);
		selecttLists.add(bselecttcontent8);
		selecttLists.add(cselecttcontent8);
		selecttLists.add(dselecttcontent8);
		selecttLists.add(aselecttcontent9);
		selecttLists.add(bselecttcontent9);
		selecttLists.add(cselecttcontent9);
		selecttLists.add(dselecttcontent9);
		selecttLists.add(aselecttcontent10);
		selecttLists.add(bselecttcontent10);
		selecttLists.add(cselecttcontent10);
		selecttLists.add(dselecttcontent10);
		selecttLists.add(aselecttcontent11);
		selecttLists.add(bselecttcontent11);
		selecttLists.add(cselecttcontent11);
		selecttLists.add(dselecttcontent11);
		selecttLists.add(aselecttcontent12);
		selecttLists.add(bselecttcontent12);
		selecttLists.add(cselecttcontent12);
		selecttLists.add(dselecttcontent12);
		selecttLists.add(aselecttcontent13);
		selecttLists.add(bselecttcontent13);
		selecttLists.add(cselecttcontent13);
		selecttLists.add(dselecttcontent13);
		selecttLists.add(aselecttcontent14);
		selecttLists.add(bselecttcontent14);
		selecttLists.add(cselecttcontent14);
		selecttLists.add(dselecttcontent14);
		selecttLists.add(aselecttcontent15);
		selecttLists.add(bselecttcontent15);
		selecttLists.add(cselecttcontent15);
		selecttLists.add(dselecttcontent15);
		selecttLists.add(aselecttcontent16);
		selecttLists.add(bselecttcontent16);
		selecttLists.add(cselecttcontent16);
		selecttLists.add(dselecttcontent16);
		selecttLists.add(aselecttcontent17);
		selecttLists.add(bselecttcontent17);
		selecttLists.add(cselecttcontent17);
		selecttLists.add(dselecttcontent17);
		selecttLists.add(aselecttcontent18);
		selecttLists.add(bselecttcontent18);
		selecttLists.add(cselecttcontent18);
		selecttLists.add(dselecttcontent18);
		selecttLists.add(aselecttcontent19);
		selecttLists.add(bselecttcontent19);
		selecttLists.add(cselecttcontent19);
		selecttLists.add(dselecttcontent19);
		selecttLists.add(aselecttcontent20);
		selecttLists.add(bselecttcontent20);
		selecttLists.add(cselecttcontent20);
		selecttLists.add(dselecttcontent20);
		selecttLists.add(aselecttcontent21);
		selecttLists.add(bselecttcontent21);
		selecttLists.add(cselecttcontent21);
		selecttLists.add(dselecttcontent21);
		selecttLists.add(aselecttcontent22);
		selecttLists.add(bselecttcontent22);
		selecttLists.add(cselecttcontent22);
		selecttLists.add(dselecttcontent22);
		selecttLists.add(aselecttcontent23);
		selecttLists.add(bselecttcontent23);
		selecttLists.add(cselecttcontent23);
		selecttLists.add(dselecttcontent23);
		selecttLists.add(aselecttcontent24);
		selecttLists.add(bselecttcontent24);
		selecttLists.add(cselecttcontent24);
		selecttLists.add(dselecttcontent24);
		selecttLists.add(aselecttcontent25);
		selecttLists.add(bselecttcontent25);
		selecttLists.add(cselecttcontent25);
		selecttLists.add(dselecttcontent25);
		selecttLists.add(aselecttcontent26);
		selecttLists.add(bselecttcontent26);
		selecttLists.add(cselecttcontent26);
		selecttLists.add(dselecttcontent26);
		selecttLists.add(aselecttcontent27);
		selecttLists.add(bselecttcontent27);
		selecttLists.add(cselecttcontent27);
		selecttLists.add(dselecttcontent27);
		selecttLists.add(aselecttcontent28);
		selecttLists.add(bselecttcontent28);
		selecttLists.add(cselecttcontent28);
		selecttLists.add(dselecttcontent28);
		
		
//		根据examname查询exam,赋值给parentquestion,实现关联关系;
//		前提必须有exam  需要判空
//		Exam exam = new Exam();
//		exam = this.examServiceImpl.findByExamName(examname);
//		
//		if(exam == null){
//			return "404";
//		}
		
		
		
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
		//parentquestion.setExam(exam);
		
		parentquestionone.setParentQuestionName(parentquestionnameone);
		parentquestionone.setDescription(descriptionone);
		parentquestionone.setParentQuestionTitle(parentquestiontitleone);

		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> onequestions = new HashSet<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 0; i < questiontoone-questionfromone+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestionone);
			question.setQuestionContent(((Integer)(i+questionfromone)).toString());
			question.setQuestionAnswer(questionLists.get(i));
			
			//集合questionLists中  前十个是answer  后十个是explain
			question.setQuestionExplain(questionLists.get(i+28));
			question.setQuestionScore(Float.parseFloat(questionscoreone));
			
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
//		parentquestion.setExam(exam);
		
		parentquestiontwo.setParentQuestionName(parentquestionnametwo);
		parentquestiontwo.setDescription(descriptiontwo);
		parentquestiontwo.setParentQuestionTitle(parentquestiontitletwo);
		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> twoquestions = new HashSet<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 0; i < questiontotwo-questionfromtwo+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestiontwo);
			question.setQuestionContent(((Integer)(i+questionfromtwo)).toString());
			//集合questionLists中  前28个是answer  i+8 对应answer下标
			question.setQuestionAnswer(questionLists.get(i+8));
			
			//集合questionLists中  前28个是answer  后28个是explain
			question.setQuestionExplain(questionLists.get(i+8+28));
			question.setQuestionScore(Float.parseFloat(questionscoretwo));
			
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
		//parentquestion.setExam(exam);
		
		parentquestionthree.setParentQuestionName(parentquestionnamethree);
		parentquestionthree.setDescription(descriptionthree);
		parentquestionthree.setParentQuestionTitle(parentquestiontitlethree);
		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> threequestions = new HashSet<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 0; i < questiontothree-questionfromthree+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestionthree);
			question.setQuestionContent(((Integer)(i+questionfromthree)).toString());
			//集合questionLists中  前28个是answer  i+8+4对应answer下标
			question.setQuestionAnswer(questionLists.get(i+12));
			
			//集合questionLists中  前28个是answer  后28个是explain  i+8+28+4对应下标
			question.setQuestionExplain(questionLists.get(i+12+28));
			question.setQuestionScore(Float.parseFloat(questionscorethree));
			
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
		//parentquestion.setExam(exam);
		
		parentquestionfour.setParentQuestionName(parentquestionnamefour);
		parentquestionfour.setDescription(descriptionfour);
		parentquestionfour.setParentQuestionTitle(parentquestiontitlefour);
		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> fourquestions = new HashSet<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 0; i < questiontofour-questionfromfour+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestionfour);
			question.setQuestionContent(((Integer)(i+questionfromfour)).toString());
			//集合questionLists中  前28个是answer   i+8+4+4对应下标 answer
			question.setQuestionAnswer(questionLists.get(i+16));
			
			//集合questionLists中  前28个是answer  后28个是explain  i+8+28+4+4对应下标
			question.setQuestionExplain(questionLists.get(i+16+28));
			question.setQuestionScore(Float.parseFloat(questionscorefour));
			
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
		//parentquestion.setExam(exam);
		
		parentquestionfive.setParentQuestionName(parentquestionnamefive);
		parentquestionfive.setDescription(descriptionfive);
		parentquestionfive.setParentQuestionTitle(parentquestiontitlefive);
		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> fivequestions = new HashSet<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 0; i < questiontofive-questionfromfive+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestionfive);
			question.setQuestionContent(((Integer)(i+questionfromfive)).toString());
			//集合questionLists中  前28个是answer    i+8+4+4+4对应下标
			question.setQuestionAnswer(questionLists.get(i+20));
			
			//集合questionLists中  前28个是answer  后十个是explain  i+8+28+4+4+4对应下标
			question.setQuestionExplain(questionLists.get(i+20+28));
			question.setQuestionScore(Float.parseFloat(questionscorefive));
			
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
		//parentquestion.setExam(exam);
		
		parentquestionsix.setParentQuestionName(parentquestionnamesix);
		parentquestionsix.setDescription(descriptionsix);
		parentquestionsix.setParentQuestionTitle(parentquestiontitlesix);
		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> sixquestions = new HashSet<Question>(0);
		
		
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		for (Integer i = 0; i < questiontosix-questionfromsix+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestionsix);
			question.setQuestionContent(((Integer)(i+questionfromsix)).toString());
			
			//集合questionLists中  前28个是answer  i+8+4+4+4+4对应下标
			question.setQuestionAnswer(questionLists.get(i+24));
			
			//集合questionLists中  前28个是answer  后28个是explain  i+8+28+4+4+4+4对应下标
			question.setQuestionExplain(questionLists.get(i+24+28));
			question.setQuestionScore(Float.parseFloat(questionscoresix));
			
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
		if(examname.contains("2016")){
			return "redirect:list";
		}
		
		List<String> questiontextLists = new ArrayList<String>();
		questiontextLists.add(textquestionanswer1);
		questiontextLists.add(textquestionanswer2);
		questiontextLists.add(textquestionanswer3);
		questiontextLists.add(textquestionanswer4);
		questiontextLists.add(textquestionanswer5);
		questiontextLists.add(textquestionanswer6);
		questiontextLists.add(textquestionanswer7);
		questiontextLists.add(textquestionanswer8);
		questiontextLists.add(textquestionanswer9);
		questiontextLists.add(textquestionanswer10);
		questiontextLists.add(textquestionexplain1);
		questiontextLists.add(textquestionexplain2);
		questiontextLists.add(textquestionexplain3);
		questiontextLists.add(textquestionexplain4);
		questiontextLists.add(textquestionexplain5);
		questiontextLists.add(textquestionexplain6);
		questiontextLists.add(textquestionexplain7);
		questiontextLists.add(textquestionexplain8);
		questiontextLists.add(textquestionexplain9);
		questiontextLists.add(textquestionexplain10);
		
		
		Integer questiontotextint = Integer.parseInt(questiontotext);
		Integer questionfromtextint = Integer.parseInt(questionfromtext);
		//判断 如果没传入参数questionform questionto 或      两者相等 不创建题；
		if(questiontotextint == questionfromtextint){
			return "redirect:list";
		}
		
		//将获取到的参数赋值给parentquestion,保存parentquestion
		ParentQuestion parentquestiontext = new ParentQuestion();
		
		//parentquestion与exam关联;
		//parentquestion.setExam(exam);
		
		parentquestiontext.setParentQuestionName(parentquestionnametext);
		parentquestiontext.setDescription(descriptiontext);
		parentquestiontext.setParentQuestionTitle(parentquestiontitletext);
		parentquestiontext.setParentQuestionArticle(parentquestionarticletext);
		
		//设置questions集合  将question加入questions  将questions作为属性加入parentquestion
		Set<Question> textquestions = new HashSet<Question>(0);
		//存储question表     根据传参 questionfrom questionto 决定循环次数 决定存储多少question
		
		
		for (Integer i = 0; i < questiontotextint-questionfromtextint+1; i++) {
			Question question = new Question();
			question.setParentQuestion(parentquestiontext);
			question.setQuestionContent(((Integer)(i+questionfromtextint)).toString());
			
			//集合questionLists中  前10个是answer  
			question.setQuestionAnswer(questiontextLists.get(i));
			//集合questionLists中  前10个是answer  后10个是explain 
			question.setQuestionExplain(questiontextLists.get(i+10));
			
			question.setQuestionScore(Float.parseFloat(questionscoretext));

			this.questionServiceImpl.addQuestion(question);

			textquestions.add(question); 
		}
		
		parentquestiontext.setQuestions(textquestions);
		
		//存储parentquestion
		this.parentQuestionServiceImpl.addParentQuestion(parentquestiontext);
		
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
