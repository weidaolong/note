package com.facedops.note.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.filter.OncePerRequestFilter;

import com.facedops.note.entity.rbac.SysUrl;
import com.facedops.note.service.url.SysUrlService;
import com.facedops.note.spring.SpringContextUtil;
public class SessionFilter extends OncePerRequestFilter{
	private static Logger logger = LoggerFactory
			.getLogger(SessionFilter.class);
	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		Subject subject = SecurityUtils.getSubject();
		Session  session=subject.getSession();
		
		@SuppressWarnings("unchecked")
		Map<String, List<SysUrl>> categorys=(Map<String, List<SysUrl>>) session.getAttribute("categorys");
		// && !subject.hasRole(RoleConstant.VISITOR)
		if(categorys==null){
			categorys=new HashMap<String, List<SysUrl>>();
			
			SysUrlService sysUrlService=(SysUrlService) SpringContextUtil.getBean("sysUrlService");
			List<SysUrl> rootUrls=sysUrlService.getByParentId(0L);
			for(SysUrl roostUrl:rootUrls){
				List<SysUrl> childUrls=sysUrlService.getByParentId(roostUrl.getParentId());
				categorys.put(roostUrl.getUrlName(), childUrls);
			}
			 session.setAttribute("categorys",categorys);
		}
		logger.info("--------session-update-----------");
		filterChain.doFilter(request, response);  
	}
}
