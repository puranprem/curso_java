package com.talento.java.web.zzzzmostrarlafecha.controller;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
@Controller
public class HomeController {
	

	@RequestMapping("/")
	public String home(){
		
		System.out.println("estoy en home");
		return "home.jsp";		
	}
	
	@RequestMapping("/date")
	public String date(Model model){
		java.util.Date fechaActual = new java.util.Date();
		 model.addAttribute("fecha", fechaActual);
		return "date.jsp";		
	}
	
	@RequestMapping("/time")
	public String time(){
		return "time.jsp";		
	}
}

