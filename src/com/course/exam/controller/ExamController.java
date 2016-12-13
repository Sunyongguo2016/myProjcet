package com.course.exam.controller;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.course.entity.Exam;
import com.course.exam.service.ExamServiceImpl;
import com.framework.Page;

/**
 * 
 * @Description 		试卷的增删改查功能
 * @author 				童海苹
 * @createDate  		2016/11/22
 * @version 			V1.0
 * 
 */

@Controller
@RequestMapping("exam")
public class ExamController {
	@Resource
	private ExamServiceImpl examServiceImpl;
	
	/**
	 * 
	 * @desc				跳转到添加页面；
	 * @author				童海苹
	 * @createDate 			2016/11/22
	 * @param 				获得试卷相关参数
	 * @return				String
	 * 
	 */
	
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String toAdd(HttpServletRequest request){
		request.setAttribute("action", "add");
		return "exam/addpage";
	}
	
	/**
	 * 
	 * @desc				添加试卷，获取addpage.jsp的参数，通过post方法实现添加exam对象；
	 * @author				童海苹
	 * @createDate 			2016/11/22
	 * @param 				type试卷类型，time试卷年份,name试卷名,examUrl试卷音频
	 * @return				String
	 * 
	 */
	@RequestMapping(value="add",method=RequestMethod.POST)
	public String add(@RequestParam("type") String type, @RequestParam("time") int time, 
			@RequestParam("name") String name, @RequestParam(value = "examUrl", required = false) String examUrl){
		Exam e = new Exam();
		e.setExamName(name);
		e.setExamType(type);
		e.setExamTime(time);
		//数据库examUrl长度改成800 
		e.setExamUrl(examUrl);
		this.examServiceImpl.addExam(e);
		return "redirect:list";
	}
	
	/**
	 * 
	 * @desc				编辑试卷，获取exam文件夹中form.jsp的参数，通过get方法实现添加exam对象；
	 * @author				童海苹
	 * @createDate 			2016/11/22
	 * @param 				获得试卷相关参数
	 * @return				String
	 * 
	 */
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String toEdit(@RequestParam("examId") int examId, HttpServletRequest request){
		Exam e = this.examServiceImpl.getExam(examId);
		request.setAttribute("ex", e);
		request.setAttribute("action", "edit");
		return "exam/form";
	}
	
	/**
	 * 
	 * @desc				编辑试卷，获取exam文件夹中form.jsp的参数，通过post方法实现添加exam对象；
	 * @author				童海苹
	 * @createDate 			2016/11/22
	 * @param 				examId试卷编号,type试卷类型，time试卷年份,name试卷名,examUrl试卷音频
	 * @return				String
	 * 
	 */
	@RequestMapping(value="edit",method=RequestMethod.POST)
	public String edit(@RequestParam("examId") int examId, @RequestParam("name") String name, @RequestParam("type") String type, @RequestParam("examUrl") String examUrl, @RequestParam("time") int time){
		Exam e = this.examServiceImpl.getExam(examId);
		e.setExamName(name);
		e.setExamType(type);
		e.setExamUrl(examUrl);
		e.setExamTime(time);
		try {
			this.examServiceImpl.editExam(e);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return "redirect:list";
	}
	
	/**
	 * 
	 * @desc				删除试卷，级联删除下面的parentquestion,question,selectt 表内容
	 * @author				童海苹
	 * @createDate 			2016/11/22
	 * @param 				examId  试卷编号 
	 * @return				String
	 * 
	 */
	@RequestMapping(value="delete")
	public String delete(@RequestParam("examId") int examId, HttpServletRequest request){
		this.examServiceImpl.dropExam(examId);
		return "redirect:list";
	}
	
	/**
	 * 
	 * @desc				查看试卷，封装到page对象里  返回jsp页面
	 * @author				童海苹
	 * @createDate 			2016/11/22
	 * @param 				pageNum页码，searchParam搜索参数
	 * @return				String
	 * 
	 */
	@RequestMapping("list")
	public String list(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(name="searchParam",defaultValue="") String searchParam,HttpServletRequest request,
			Model model){
		Page<Exam> page;
		if(searchParam == null || "".equals(searchParam)){
			page = this.examServiceImpl.listExam(pageNum, 5, null);	
		}else{
			try {
				 searchParam = new String(searchParam.getBytes("ISO8859_1"), "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			page = this.examServiceImpl.listExam(pageNum, 5, new Object[]{searchParam});
		}
		request.setAttribute("page", page);
		request.setAttribute("searchParam", searchParam);
		return "exam/exampaperlist";
	}
	
	
	/**
	 * 
	 * @desc				试卷搜索功能
	 * @author				孙永国
	 * @createDate 			2016/12/3
	 * @param 				pageNum页码，searchParam搜索参数
	 * @return				String
	 * 
	 */
	@RequestMapping("search")
	public String search(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(name="searchParam",defaultValue="") String searchParam,
			@RequestParam(name="examType",defaultValue="") String examType,
			HttpServletRequest request,
			Model model){
		Page<Exam> page;
		
		try {
			 searchParam = new String(searchParam.getBytes("ISO8859_1"), "UTF-8");
			 examType = new String(examType.getBytes("ISO8859_1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
		}
		
		page = this.examServiceImpl.listExam(pageNum, 5, new Object[]{searchParam,examType});
		
		request.setAttribute("page", page);
		request.setAttribute("searchParam", searchParam);
		request.setAttribute("examType", examType);
		
		//搜索jsp
		return "search";
	}
	
}
