package com.westar.core.web.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.westar.core.service.LogsService;

@Controller
@RequestMapping("/Logs")
public class LogsController extends BaseController{

	@Autowired
	LogsService logsService;
	
	
	
}