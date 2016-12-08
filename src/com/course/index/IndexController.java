package com.course.index;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.course.entity.Exam;
import com.course.entity.Notice;
import com.course.entity.ParentQuestion;
import com.course.entity.Question;
import com.course.exam.service.ExamServiceImpl;
import com.course.notice.service.NoticeServiceImpl;
import com.framework.Page;

@Controller
public class IndexController {
	
	@Resource
	private NoticeServiceImpl noticeServiceImpl;
	
	@Resource
	private ExamServiceImpl examServiceImpl;
	

    @RequestMapping("/")
    public String index(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(name="type",defaultValue="") String type,
			HttpServletRequest request,
			Model model) {
    	Page<Exam> pageExamFour;
    	Page<Exam> pageExamSix;
    	
    	try {
			type = new String(type.getBytes("ISO8859_1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	
    	pageExamFour = this.examServiceImpl.listExam(pageNum, 8, new Object[]{"","四级"});
    	pageExamSix = this.examServiceImpl.listExam(pageNum, 8, new Object[]{"","六级"});
    	
    	request.setAttribute("pageExamFour", pageExamFour);
    	request.setAttribute("pageExamSix", pageExamSix);
    	return "index_before";
    }
	
	@RequestMapping("category")
	public String category(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(name="type",defaultValue="") String type,
			HttpServletRequest request,
			Model model){
		Page<Notice> pageNotice;
		Page<Exam> pageExam;
		
		try {
			type = new String(type.getBytes("ISO8859_1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		pageExam = this.examServiceImpl.listExam(pageNum, 8, new Object[]{"",type});	
		pageNotice=this.noticeServiceImpl.listNotice(pageNum, 8, null);
		
		request.setAttribute("pageNotice", pageNotice);
		request.setAttribute("pageExam", pageExam);
		request.setAttribute("examType", type);
		return "category";
	}
}
