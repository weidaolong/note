package com.facedops.note.web.user;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.facedops.note.entity.rbac.Users;
import com.facedops.note.service.user.UserService;
import com.facedops.note.web.utils.Page;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String list(Page page,HttpServletRequest request,Model model,Users users) {
		
		org.springframework.data.domain.Page<Users> userList=userService.getUserList(page,users);
		model.addAttribute("userList", userList);
		model.addAttribute("users", users);
		model.addAttribute("page", page);
		model.addAttribute("searchParams", request.getQueryString());
		
		return "user/list";
	}
	@RequestMapping(method = RequestMethod.POST)
	public String toList(Page page,ServletRequest request,Model model,Users users){
		org.springframework.data.domain.Page<Users> userList=userService.getUserList(page,users);
		model.addAttribute("userList", userList);
		model.addAttribute("users", users);
		model.addAttribute("page", page);
		return "user/list";
	}
	
	@RequestMapping(method = RequestMethod.GET,value="toadd")
	public String toadd() {
		return "user/add";
	}
	
	@RequestMapping(method = RequestMethod.GET,value="save")
	public String save(Users users) {
		userService.save(users);
		return "redirect:/user";
	}
}
