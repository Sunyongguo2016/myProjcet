package com.course.error.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.course.entity.Error;
import com.course.entity.ParentQuestion;
import com.course.error.service.ErrorServiceImpl;
import com.course.login.service.LoginServiceImpl;
import com.course.parentquestion.service.ParentQuestionServiceImpl;
import com.framework.Page;

@Controller
@RequestMapping("error")
public class ErrorController {
	@Resource
	private ErrorServiceImpl errorServiceImpl;
	@Resource
	private LoginServiceImpl loginServiceImpl;
	@Resource
	private ParentQuestionServiceImpl parentQuestionServiceImpl;
	
	/**
	 * 
	 * @Description 		错题本的列表页分页查询功能,展示当前登录的学生本人的错题本
	 * @author 				童海苹
	 * @createDate  		2016/12/3
	 * @version 			V1.0
	 * 
	 */
	@RequestMapping("collect")
	public String selectCollect(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(name="isCollect", defaultValue="0") int isCollect, HttpSession session,
			@RequestParam(name="searchParam",defaultValue="") String searchParam,HttpServletRequest request,
			Model model){
		//获取当前登录的学生Id
		int stuId = (int)session.getAttribute("stuId");
		System.out.println("error--controller:"+stuId);
		Page<Error> page;
		if(searchParam == null || "".equals(searchParam)){
			if(isCollect == 1){
				request.setAttribute("isCol", 1);
			}else{
				request.setAttribute("isCol", 0);
			}
			page = this.errorServiceImpl.errorCollect(pageNum, 10, isCollect, stuId, null);
		}else{
			try {
				 searchParam = new String(searchParam.getBytes("ISO8859_1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
			}
			page = this.errorServiceImpl.errorCollect(pageNum, 10, isCollect, stuId, new Object[]{searchParam});
		} 
		
		request.setAttribute("page", page);
		request.setAttribute("searchParam", searchParam);
		return "wrongpage/wrongpagelist";
	}
	
	/**
	 * 
	 * @Description 		错题本内容页的查询功能
	 * @author 				童海苹
	 * @createDate  		2016/12/3
	 * @version 			V1.0
	 * 
	 */
	@RequestMapping("wrongpage")
	public String selectContent(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			 HttpSession session, @RequestParam(name="examId") int examId, @RequestParam(name="parentQuestionId") int parentQuestionId, 
			 HttpServletRequest request, Model model){
		int stuId = (int)session.getAttribute("stuId");
		Page<Error> page;
		page = this.errorServiceImpl.errorContent(pageNum, 2, stuId, examId, parentQuestionId);
		
		ParentQuestion pq = this.parentQuestionServiceImpl.getParentQuestion(parentQuestionId);
		request.setAttribute("exId", examId);
		request.setAttribute("pque", pq);
		request.setAttribute("page", page);
		return "wrongpage/wrongpage";
	}
	
	/**
	 * 
	 * @Description 		收藏某道题功能
	 * @author 				童海苹
	 * @createDate  		2016/12/4
	 * @version 			V1.0
	 * 
	 */
	@RequestMapping(value = "setCollect")
	public String setCollect(HttpSession session, @RequestParam(name="examId") int examId, 
			@RequestParam(name="parentQuestionId") int parentQuestionId, HttpServletRequest request){
		int stuId = (int)session.getAttribute("stuId");
		List<Error> list = (List<Error>) this.errorServiceImpl.findEList(stuId, examId, parentQuestionId);
		for(int i = 0;i < list.size();i++){
			Error error = list.get(i);
			System.out.println("finderrorlist:"+error.getErrorId()+error.getExperience());
			error.setIsCollect(1);
			this.errorServiceImpl.editError(error);
			
		}
		return "wrongpage/wrongpagelist";
		
	}
	/**
	 * 
	 * @Description 		提交之后判题并展示做错的题的答案及解析
	 * @author 				童海苹
	 * @createDate  		2016/12/4
	 * @version 			V1.0
	 * 
	 */
/*	@RequestMapping("comment")
	public String comment(HttpSession session, @RequestParam(name="examId") int examId, 
			@RequestParam(name="parentQuestionId") int parentQuestionId, 
			 HttpServletRequest request, Model model){
//		int stuId = (int)session.getAttribute("stuId");
//		System.out.println("get:"+examId+parentQuestionId);
//		Error error = this.errorServiceImpl.findError(stuId, examId, parentQuestionId);
//		System.out.println("finderror"+error.getErrorId()+error.getExperience());
		//判题待完成
		System.out.println();
		request.setAttribute("submitt", "on");
		return "wrongpage/wrongpage";
	}
*/	
	@RequestMapping("comment")
	public String comment(HttpSession session, @RequestParam(name="examId") int examId, 
			@RequestParam(name="parentQuestionId") int parentQuestionId, 
			 HttpServletRequest request, Model model){
		//判题待完成
		System.out.println("判题");
		session.setAttribute("submitt","on");
		return "redirect:wrongpage?examId="+examId+"&parentQuestionId="+parentQuestionId;
	}
	/**
	 * 
	 * @Description 		错题本对某条记录的删除功能
	 * @author 				童海苹
	 * @createDate  		2016/12/4
	 * @version 			V1.0
	 * 
	 */
	//此方法删除失败
	@RequestMapping("delete")
	public String deleteWrongQuestion(HttpSession session, @RequestParam(name="examId") int examId, 
			@RequestParam(name="parentQuestionId") int parentQuestionId, 
			 HttpServletRequest request, Model model){
		int stuId = (int)session.getAttribute("stuId");
		System.out.println("get:"+examId+parentQuestionId);
		List<Error> list = (List<Error>) this.errorServiceImpl.findEList(stuId, examId, parentQuestionId);
		for(int i = 0;i < list.size();i++){
			System.out.println("controller-errorlist:"+list.get(i).getErrorId()+list.get(i).getExperience());
			this.errorServiceImpl.dropError(list.get(i).getErrorId());
			System.out.println("delete");
		}
		
		return "wrongpage/wrongpagelist";
	}
	
}

	


