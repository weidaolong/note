package com.facedops.note.web.set;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/set")
public class SetController {
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String set() {
		return "set/set";
	}
	@RequestMapping(value = "{url}")
	public String toUrl(@PathVariable("url") String url) {
		return "redirect:/"+url;
	}

}
