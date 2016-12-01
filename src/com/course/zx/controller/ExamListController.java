package com.course.zx.controller;

import java.io.UnsupportedEncodingException;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.course.entity.ParentQuestion;
import com.course.parentquestion.service.ParentQuestionServiceImpl;
import com.framework.Page;

@Controller
@RequestMapping("examzx")
public class ExamListController {
	
	/**
	 * 
	 * @desc				实现依照大题名称获取parentQuestion  返回内容方便specialprojectlist.jsp的内容动态获取
	 * @author				翟佳帆
	 * @param 				parentQuestionName 
	 * @createDate 			2016/12/1
	 * @param 				pageNum页码，parentQuestionName大题名称
	 * @return				String
	 * 
	 */
	@Resource
	private ParentQuestionServiceImpl parentQuestionSeriviceImpl;
	
	@RequestMapping("list")
	public String list(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(name="parentQuestionName",defaultValue="") String parentQuestionName,
			HttpServletRequest request,
			Model model){
		
		Page<ParentQuestion> page;
		
		if( parentQuestionName== null || "".equals(parentQuestionName)){
			page=this.parentQuestionSeriviceImpl.listParentQuestionExamByParentQuestionName(pageNum, 5, null);	
		}else{
			page=this.parentQuestionSeriviceImpl.listParentQuestionExamByParentQuestionName(pageNum, 5, new Object[]{parentQuestionName});
		}
		
		request.setAttribute("page", page);
		request.setAttribute("pqType",parentQuestionName);
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
