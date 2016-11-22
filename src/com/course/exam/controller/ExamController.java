package com.course.exam.controller;
import java.io.UnsupportedEncodingException;
import java.util.List;

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

@Controller
@RequestMapping("exam")
public class ExamController {
	@Resource
	private ExamServiceImpl examServiceImpl;
	
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String toAdd(HttpServletRequest request){
		request.setAttribute("action", "add");
		return "exam/addpage";
	}
	
	@RequestMapping(value="add",method=RequestMethod.POST)
	public String add(@RequestParam("type") String type, @RequestParam("time") int time, 
			@RequestParam("name") String name, @RequestParam("examUrl") String examUrl){
		
		Exam e = new Exam();
		e.setExamName(name);
		e.setExamType(type);
		e.setExamTime(time);
		e.setExamUrl(examUrl);
		this.examServiceImpl.addExam(e);
		return "redirect:list";
	}
	
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String toEdit(@RequestParam("examId") int examId, HttpServletRequest request){
		Exam e = this.examServiceImpl.getExam(examId);
		request.setAttribute("ex", e);
		request.setAttribute("action", "edit");
		return "exam/form";
	}
	
	@RequestMapping(value="edit",method=RequestMethod.POST)
	public String edit(@RequestParam("examId") int examId, @RequestParam("name") String name, @RequestParam("type") String type, @RequestParam("time") int time){
		Exam e = this.examServiceImpl.getExam(examId);
		e.setExamName(name);
		e.setExamType(type);
		e.setExamTime(time);
		System.out.println(e.getExamName()+e.getExamType()+e.getExamTime());
		try {
			this.examServiceImpl.editExam(e);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return "redirect:list";
	}
	
	@RequestMapping(value="delete")
	public String delete(@RequestParam("examId") int examId, HttpServletRequest request){
		this.examServiceImpl.dropExam(examId);
		return "redirect:list";
	}
	
	@RequestMapping("list")
	public String list(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(name="searchParam",defaultValue="") String searchParam,HttpServletRequest request,
			Model model){
		
		Page<Exam> page;
		if(searchParam == null || "".equals(searchParam)){
			page = this.examServiceImpl.listExam(pageNum, 5, null);	
		}else{
			page = this.examServiceImpl.listExam(pageNum, 5, new Object[]{searchParam});
		}
		request.setAttribute("page", page);
		request.setAttribute("searchParam", searchParam);
		return "exampaperlist";
	}
}
