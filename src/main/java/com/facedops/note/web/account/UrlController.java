package com.facedops.note.web.account;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.facedops.note.entity.rbac.SysUrl;
import com.facedops.note.service.url.SysUrlService;
import com.facedops.note.web.utils.Page;

@Controller
@RequestMapping(value="bgurl")
public class UrlController {
	@Autowired
	private SysUrlService sysUrlService;
	@RequestMapping(method = RequestMethod.GET)
	public String url(Page page, HttpServletRequest request, Model model,
			SysUrl sysUrl){
		org.springframework.data.domain.Page<SysUrl> list = sysUrlService
				.getUrlList(page, sysUrl);
		model.addAttribute("list", list);
		model.addAttribute("sysUrl", sysUrl);
		model.addAttribute("page", page);
		model.addAttribute("searchParams", request.getQueryString());
		return "/bgurl/urlList";
	}
	
	public String save(SysUrl sysUrl){
		sysUrlService.save(sysUrl);
		return "/bgurl/urlList";
	}

}
