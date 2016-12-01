package com.course.writing.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.course.entity.Exam;
import com.course.entity.ParentQuestion;
import com.course.entity.Question;
import com.course.exam.service.ExamServiceImpl;
import com.course.parentquestion.service.ParentQuestionServiceImpl;
import com.course.question.service.QuestionServiceImpl;
import com.framework.Page;

/**
 * 
 * @Description 		大题作文控制器  实现增加   删除  查看(list)功能
 * @author 				孙晓辉
 * @createDate  		2016/11/20
 * @version 			V1.0
 * 
 */

@Controller
@RequestMapping("writing")
public class WritingController {
	@Resource
	private ParentQuestionServiceImpl parentQuestionServiceImpl;

	@Resource
	private QuestionServiceImpl questionServiceImpl;

	@Resource
	private ExamServiceImpl examServiceImpl;

	/**
	 * 
	 * @desc				添加作文大题，获取addcomposition.jsp的参数，实现添加parentQuestion对象；
	 * @author				孙晓辉
	 * @createDate 			2016/11/21
	 * @param 				获得添加作文大题相关参数
	 * @return				String
	 * 
	 */
	@RequestMapping("add")
	public String add(@RequestParam(name = "examName") String examName,
			@RequestParam(name = "parentQuestionName") String parentQuestionName,
			@RequestParam(name = "parentQuestionArticle") String parentQuestionArticle,
			@RequestParam(name = "description") String description,
			@RequestParam(name = "questionExplain") String questionExplain,
			@RequestParam(value = "imgUrl", required = false) String imgUrl, 
			@RequestParam(name = "questionScore") float questionScore) {

		// 根据examName找到exam对象
		Exam exam = this.examServiceImpl.findByName(examName);
		if (exam == null) {
			return "404";
		}

		// 声明一个ParentQuestion并初始化
		ParentQuestion parentQuestion = new ParentQuestion();
		parentQuestion.setParentQuestionName(parentQuestionName);
		parentQuestion.setDescription(description);
		parentQuestion.setImgUrl(imgUrl);
		parentQuestion.setParentQuestionArticle(parentQuestionArticle);
		parentQuestion.setExam(exam);

		// 声明一个Question并初始化
		Question question = new Question();
		question.setQuestionExplain(questionExplain);
		question.setParentQuestion(parentQuestion);
		question.setQuestionScore(questionScore);

		// 设置questions集合将question加入questions
		Set<Question> questions = new HashSet<Question>(0);
		questions.add(question);

		// 将questions作为属性加入parentquestion
		parentQuestion.setQuestions(questions);

		// 存储parentquestion
		this.parentQuestionServiceImpl.addParentQuestion(parentQuestion);
		return "redirect:list";
	}
	/**
	 * 
	 * @desc				删除作文大题，获取compositionlist.jsp的参数，实现删除parentQuestion对象；
	 * @author				孙晓辉
	 * @createDate 			2016/11/21
	 * @param 				获得删除作文大题相关参数
	 * @return				String
	 * 
	 */
	@RequestMapping(value = "delete")
	public String delete(@RequestParam("parentQuestionId") int parentQuestionId) {
		// 根据题目名在数据库找到该
		ParentQuestion parentQuestion = this.parentQuestionServiceImpl.getParentQuestion(parentQuestionId);

		// 得到大题下的小题
		Set<Question> questions = parentQuestion.getQuestions();

		// 删除小题
		for (Question i : questions) {
			this.questionServiceImpl.dropQuestion(i.getQuestionId());
		}

		// 删除大题
		this.parentQuestionServiceImpl.dropParentQuestion(parentQuestionId);

		return "redirect:list";
	}

	/**
	 * 
	 * @desc				查看作文大题，获取compositionlist.jsp的参数，实现分页和搜索
	 * @author				孙晓辉
	 * @createDate 			2016/11/21
	 * @param 				获得查看作文大题相关参数
	 * @return				String
	 * 
	 */
	@RequestMapping("list")
	public String list(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(name = "searchParam", defaultValue = "") String searchParam,
			@RequestParam(name = "parentQuestionName", defaultValue = "Writing") String parentQuestionName,
			HttpServletRequest request, Model model) {

		Page<ParentQuestion> page;

		if (searchParam == null || "".equals(searchParam)) {
			page = this.parentQuestionServiceImpl.listParentQuestionByParentQuestionName(pageNum, 5,
					new Object[] { parentQuestionName });
		} else {
			try {
				 searchParam = new String(searchParam.getBytes("ISO8859_1"), "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			page = this.parentQuestionServiceImpl.listParentQuestionByParentQuestionName(pageNum, 5,
					new Object[] { parentQuestionName, searchParam });
		}

		request.setAttribute("page", page);
		request.setAttribute("searchParam", searchParam);

		return "writing/compositionlist";
	}
}
