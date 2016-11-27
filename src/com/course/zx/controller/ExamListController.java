package com.course.zx.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("examzx")
public class ExamListController {
	
	/**
	 * 
	 * @desc				查看试卷，封装到page对象里  返回jsp页面
	 * @author				翟佳帆
	 * @createDate 			2016/11/22
	 * @param 				pageNum页码，searchParam搜索参数
	 * @return				String
	 * 
	 */
	@RequestMapping("list")
	public String list(@RequestParam(name="parentQuestionName", defaultValue="") String parentQuestionName,
			HttpServletRequest request,
			Model model){
		
//		实现这个函数  以及specialprojectlist.jsp的内容动态获取
		return "examzx/specialprojectlist";
	}
	
	
	
	/**
	 * 
	 * @desc				查看试卷，封装到page对象里  返回jsp页面
	 * @author				李翘楚
	 * @createDate 			2016/11/22
	 * @param 				pageNum页码，searchParam搜索参数
	 * @return				String
	 * 
	 */
	@RequestMapping("preview")
	public String preview(@RequestParam(name="parentQuestionId", defaultValue="1") int parentQuestionId ,
			HttpServletRequest request,
			Model model){
		
//		实现这个函数  以及zxpreview的动态获取内容
		return "examzx/zxpreview";
	}
	
}
