package com.facedops.note.web.sys;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.facedops.note.entity.rbac.SysUser;
import com.facedops.note.service.sys.SysService;

@Controller
@RequestMapping(value = "/register")
public class RegisterController {
	@Autowired
	private SysService sysService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String register(){
		return "/register/register";
	}
	@RequestMapping(method=RequestMethod.POST)
	public String register(@Valid SysUser user, RedirectAttributes redirectAttributes) {
		sysService.registerUser(user);
		redirectAttributes.addFlashAttribute("username", user.getLoginName());
		return "redirect:/login";
	}
	/**
	 * Ajax请求校验loginName是否唯一。
	 */
	@RequestMapping(value = "checkLoginName")
	@ResponseBody
	public String checkLoginName(@RequestParam("loginName") String loginName) {
		if (sysService.findUserByLoginName(loginName) == null) {
			return "true";
		} else {
			return "false";
		}
	}
}
