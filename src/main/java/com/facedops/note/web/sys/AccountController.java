package com.facedops.note.web.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/account")
public class AccountController {
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String set() {
		return "account/account";
	}
	@RequestMapping(value = "{url}")
	public String toUrl(@PathVariable("url") String url) {
		return "redirect:/"+url;
	}

}
