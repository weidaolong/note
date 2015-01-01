package com.facedops.note.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		System.out.println("---------"+i++ +"---------------");
		System.out.println(request.getRequestURI());
		
		filterChain.doFilter(request, response);  
	}

}
