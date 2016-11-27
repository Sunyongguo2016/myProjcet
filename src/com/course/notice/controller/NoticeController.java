package com.course.notice.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.course.entity.Notice;
import com.course.notice.service.NoticeServiceImpl;
import com.framework.Page;

/**
 * 
 * @Description 		公告栏模块   实现增删改查    (list内包括分页 搜索)功能
 * @author 				孙永国
 * @createDate  		2016/11/22
 * @version 			V1.0
 * 
 */
@Controller
@RequestMapping("notice")
public class NoticeController {
	@Resource
	private NoticeServiceImpl noticeServiceImpl;
	
	
	/**
	 * 
	 * @desc				添加公告，获取notice/addnotice.jsp参数  添加到notice表
	 * @author				孙永国
	 * @createDate 			2016/11/22
	 * @param 				获得添加公告相关参数
	 * @return				String
	 * 
	 */
	@RequestMapping("add")
	public String add(@RequestParam(name="title") String title,@RequestParam(name="type") String type,HttpServletRequest request)
	{
		String content = request.getParameter("content");

		//构建date类型，传入数据库
		Date date = new Date();
		
		Notice n = new Notice();
		n.setNoticeTitle(title);
		n.setNoticeType(type);
		n.setNoticeContent(content);
		n.setNoticeTime(date);
		
		this.noticeServiceImpl.addNotice(n);
		return "redirect:list";
	}
	
	
	/**
	 * 
	 * @desc				删除公告
	 * @author				孙永国
	 * @createDate 			2016/11/22
	 * @param 				公告id
	 * @return				String
	 * 
	 */
	@RequestMapping(value="delete")
	public String delete(@RequestParam("noticeId") int noticeId,
			HttpServletRequest request){
		this.noticeServiceImpl.dropNotice(noticeId);
		return "redirect:list";
	}
	
	
	/**
	 * 
	 * @desc				编辑公告功能
	 * @author				孙永国
	 * @createDate 			2016/11/22
	 * @param 				公告id
	 * @return				String
	 * 
	 */
	@RequestMapping(value="edit",method=RequestMethod.GET )
	public String toEdit(@RequestParam("noticeId") int noticeId,
			HttpServletRequest request){
		
		Notice n=this.noticeServiceImpl.getNotice(noticeId);
		//设置了两个session范围的属性
		request.setAttribute("notice", n);
		request.setAttribute("action", "edit");
		return "notice/editnotice";
	}
	
	/**
	 * 
	 * @desc				编辑公告功能
	 * @author				孙永国
	 * @createDate 			2016/11/22
	 * @param 				公告Notice修改后的内容
	 * @return				String
	 * 
	 */
	@RequestMapping(value="edit",method=RequestMethod.POST)
	public String edit(Notice n,HttpServletRequest request){
		
		Date noticeTime = new Date();
		
		n.setNoticeId(n.getNoticeId());
		n.setNoticeTitle(n.getNoticeTitle());
		n.setNoticeType(n.getNoticeType());
		n.setNoticeContent(n.getNoticeContent());
		n.setNoticeTime(noticeTime);
		
		this.noticeServiceImpl.editNotice(n);
		return "redirect:list";
	}
	
	
	/**
	 * 
	 * @desc				分页查询，获取公告主要信息
	 * @author				孙永国
	 * @createDate 			2016/11/22
	 * @param 				搜索参数searchParem
	 * @return				String
	 * 
	 */
	@RequestMapping("list")
	public String list(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(name="searchParam",defaultValue="") String searchParam,
			HttpServletRequest request, Model model){
		Page<Notice> page;
		if(searchParam == null || "".equals(searchParam)){
			page=this.noticeServiceImpl.listNotice(pageNum, 5, null);	
		}else{
			
			try {
			 searchParam = new String(searchParam.getBytes("ISO8859_1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			page=this.noticeServiceImpl.listNotice(pageNum, 5, new Object[]{searchParam});
		}
		request.setAttribute("page", page);
		request.setAttribute("searchParam", searchParam);
		
		return "notice/noticelist";
	}
	
	/**
	 * 
	 *  田瑞航  写 
	 */
	@RequestMapping("billboardlist")
	public String list(HttpServletRequest request, Model model){
		
//		田瑞航完成 这个函数 以及billboardlist.jsp内容动态获取
		return "billboard/billboardlist";
	}
	
}
