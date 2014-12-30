package com.facedops.note.web.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	@RequestMapping(method = RequestMethod.GET,value="urltoAdd")
	public String urltoAdd(Page page, HttpServletRequest request){
		List<SysUrl> url=sysUrlService.getByParentId(0L);
		
		request.setAttribute("url", url);
		return "/bgurl/urltoAdd";
	}
	@RequestMapping(method = RequestMethod.POST,value="save")
	public String save(SysUrl sysUrl){
		sysUrlService.save(sysUrl);
		return "redirect:/bgurl";
	}
	@ResponseBody
	@RequestMapping(method = RequestMethod.GET,value="getByParentId")
	public List<SysUrl> getByParentId(Long parentId){
		return sysUrlService.getByParentId(parentId);
	}
}
