package com.facedops.note.web.database;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.facedops.note.service.database.DatabaseService;

@Controller
@RequestMapping(value="/database")
public class DatabaseAction {
	@RequestMapping(method = RequestMethod.GET)
	public String show(){
		service.backFile();
		return "/database/databaseShow";
	}
	@Autowired
	private DatabaseService service;
}
