package com.facedops.note.web.photo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.facedops.note.service.user.UserService;

@Controller
@RequestMapping(value = "/photo")
public class PhotoAction {
	@Autowired
	private UserService userService;
	@RequestMapping(value = "upload/{id}")
	public String load(@PathVariable("id") Long id) {
		userService.getUsers(id);
		return "redirect:/photo";
	}
}
