package com.facedops.note.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.filter.OncePerRequestFilter;

import com.facedops.note.service.url.SysUrlService;

public class SessionFilter extends OncePerRequestFilter{
	private int i=0;
	@Autowired
	private SysUrlService sysUrlService;
	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		Subject subject = SecurityUtils.getSubject();
		Session  session=subject.getSession();
		
		Object name=session.getAttribute("name");
		System.out.println(name);
		if(name==null){
			session.setAttribute("name", "张三"+i);
			i++;
		}
		filterChain.doFilter(request, response);  
	}

}
