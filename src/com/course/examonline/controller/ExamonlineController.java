package com.course.examonline.controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.course.entity.Exam;
import com.course.exam.service.ExamServiceImpl;
import com.framework.Page;

/**
 * 
 * @Description 		试卷的排版功能
 * @author 				孙晓辉
 * @createDate  		2016/11/30
 * @version 			V1.0
 */

@Controller
@RequestMapping("examonline")
public class ExamonlineController {
	@Resource
	private ExamServiceImpl examServiceImpl;
	
	/**
	 * 
	 * @desc				查看试卷，封装到page对象里  返回查看试卷页面
	 * @author				孙晓辉
	 * @createDate 			2016/11/30
	 * @param 				pageNum页码，searchParam搜索参数
	 * @return				String
	 * 
	 */
	@RequestMapping("look")
	public String look(@RequestParam(name="examId",defaultValue="0") int examId,
			HttpServletRequest request,
			Model model){
		if(examId!=0){
			Exam exam = this.examServiceImpl.getExam(examId);
			request.setAttribute("exam", exam);
		}
		return "examzc/preview";
	}
	
	/**
	 * 
	 * @desc				查看试卷，封装到page对象里  返回考试页面
	 * @author				孙晓辉
	 * @createDate 			2016/11/30
	 * @param 				pageNum页码，searchParam搜索参数
	 * @return				String
	 * 
	 */
	@RequestMapping("exam")
	public String exam(@RequestParam(name="examId",defaultValue="0") int examId,
			HttpServletRequest request,
			HttpSession session,
			Model model){
		if(examId!=0){
			Exam exam = this.examServiceImpl.getExam(examId);
			//假如没有登录返回预览页面
			if(session.getAttribute("stuId") == null){
				request.setAttribute("exam", exam);
				JOptionPane.showMessageDialog(null, "对不起，您还没有登录！现在返回登录页面...", "警告", JOptionPane.ERROR_MESSAGE);
				return "login_use";
			}
			String examurl1[] = exam.getExamUrl().split("file/");
			String examurl2[] = examurl1[1].split("mp3");
			String url = "http://localhost:8080/myProject/ueditor/jsp/upload/file/"+examurl2[0]+"mp3";
			session.setAttribute("url", url);
			request.setAttribute("exam", exam);
			System.out.println(exam.getExamUrl());
		}
		return "examzc/test";
	}
	
	/**
	 * 
	 * @desc				查看试卷，封装到page对象里  返回考试页面
	 * @author				孙晓辉
	 * @createDate 			2016/11/30
	 * @param 				pageNum页码，searchParam搜索参数
	 * @return				String
	 * 
	 */
	@RequestMapping("listen")
	public String list(@RequestParam(name="examId",defaultValue="0") int examId,
			HttpServletRequest request,
			Model model){
		if(examId!=0){
			Exam exam = this.examServiceImpl.getExam(examId);
			request.setAttribute("exam", exam);
		}
		return "examzc/listening";
	}
	
	/**
	 * 
	 * @desc				查看试卷，封装到page对象里  返回自测列表页面
	 * @author				孙晓辉
	 * @createDate 			2016/11/30
	 * @param 				pageNum页码，searchParam搜索参数
	 * @return				String
	 * 
	 */
	@RequestMapping("list")
	public String list(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(value="examTime",required=false) String examTime,
			@RequestParam(name = "examType", defaultValue = "") String examType,
			HttpServletRequest request,
			Model model){
		Page<Exam> page=null; 
		
		try {
			examType = new String(examType.getBytes("ISO8859_1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		if(examTime!=null){
			switch(examTime){  
		    case "2016": 
		    	page = this.examServiceImpl.listExamByTimeAndType(pageNum, 10, new Object[]{2016,examType});
		    	break;  
		    case "2015":
		    	page = this.examServiceImpl.listExamByTimeAndType(pageNum, 10, new Object[]{2015,examType});
		    	break; 
		    case "2014":
		    	page = this.examServiceImpl.listExamByTimeAndType(pageNum, 10, new Object[]{2014,examType});
		    	break;
		    default:
		    	page = this.examServiceImpl.listExamByTimeAndType(pageNum, 10, new Object[]{examType});
		    	break;
		   }
		}else{
			page = this.examServiceImpl.listExamByTimeAndType(pageNum, 10, new Object[]{examType});
		}
		request.setAttribute("page", page);
		request.setAttribute("examTime", examTime);
		request.setAttribute("examType", examType);
		return "examzc/examinationlist";
	}
	/**
	 * 
	 * @desc				查看试卷，封装到page对象里  返回自测列表页面
	 * @author				孙晓辉
	 * @createDate 			2016/11/30
	 * @param 				pageNum页码，searchParam搜索参数
	 * @return				String
	 * 
	 */
	@RequestMapping("list1")
	public String list1(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(name="examTime",defaultValue="0") int examTime,
			HttpServletRequest request,
			Model model){
		Page<Exam> page=null; 
		if(examTime!=0){
			page = this.examServiceImpl.listExamByTime(pageNum, 10, new Object[]{examTime});
		}else{
			page = this.examServiceImpl.listExamByTime(pageNum, 10,null);
		}
		request.setAttribute("page", page);
		return "examzc/examinationlist";
	}
	/**
	 * 
	 * @desc				查看试卷，封装到page对象里  返回自测列表页面
	 * @author				孙晓辉
	 * @createDate 			2016/11/30
	 * @param 				pageNum页码，searchParam搜索参数
	 * @return				String
	 * 
	 */
	@RequestMapping("list2")
	public String list2(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(value="examType",required=false) String examType,
			HttpServletRequest request,
			Model model){
		Page<Exam> page=null;
		
		if(examType!=null){
			try {
				examType = new String(examType.getBytes("ISO8859_1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("examtype is not null:"+examType);
			page = this.examServiceImpl.listExamByType(pageNum, 10, new Object[]{examType});
		}else{
			System.out.println("examtype is null:"+examType);
			page = this.examServiceImpl.listExamByType(pageNum, 10,null);
		}
		request.setAttribute("page", page);
		return "examzc/examinationlist";
	}
}
