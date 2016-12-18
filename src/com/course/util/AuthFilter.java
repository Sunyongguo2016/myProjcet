package com.course.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

	/**
	 * 
	 * @desc            过滤器（拦截器）
	 * @param           查看用户是否登陆过，未登录禁止访问页面
	 * @author          田瑞航
	 * @createDate      2016/12/5
	 * @return          void
	 * 
	 */

	public class AuthFilter implements Filter {
		
		//销毁
	    @Override
	    public void destroy() {
	    }
	    @Override
	    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
	            throws IOException, ServletException {
	       
	    	HttpServletRequest request = (HttpServletRequest) servletRequest;
	        HttpServletResponse response = (HttpServletResponse) servletResponse;
	        //获取根目录所对应的绝对路径
	        String currentURL = request.getRequestURI();
	        //截取到当前文件名用于比较
	        String targetURL = currentURL.substring(currentURL.indexOf("/",1),currentURL.length());
	        //System.out.println(targetURL);
	        //如果session不为空就返回该session，如果为空就返回null
	        HttpSession session = request.getSession(false);
	        if(!"/login_use.jsp".equals(targetURL)){
	            //判断当前页面是否是重定参后的登陆页面页面，如果是就不做session的判断，防止死循环
	        	//if(session==null||session.getAttribute("user")==null){
	        	//如果访问前天测试页面进入这个判断
	            if("/examzc/test.jsp".equals(targetURL)||"/examzx/zxcontent.jsp".equals(targetURL)){
	            	//如果session为空表示用户没有登陆就重新登录
	            	if(session==null||session.getAttribute("student")==null){
	            		//System.out.println("request.getContextPath()=" + request.getContextPath());  
	            		response.sendRedirect(request.getContextPath()+"/login_use.jsp");
	            		return;
	            	}
	            }else{
	            	//如果访问后台系统 进入这里
	            	//如果session属性manager不为空，可以访问后台所有页面；
	            	if(session!=null&&session.getAttribute("manager")!=null){
	            		chain.doFilter(request, response);
	            		return;
	            	}else{
	            		response.sendRedirect(request.getContextPath()+"/login_use.jsp");
	            		return;
	            	}
	            }
	            
	        }
	
	        //继续向下执行
	        chain.doFilter(request, response);
	    }
	
	    /**
	     * 初始化
	     */
	    @Override
	    public void init(FilterConfig arg0) throws ServletException {
	    }
	
	}
