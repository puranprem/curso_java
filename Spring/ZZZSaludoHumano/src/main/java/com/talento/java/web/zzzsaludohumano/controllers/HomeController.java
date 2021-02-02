package com.talento.java.web.zzzsaludohumano.controllers;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class HomeController {
	@RequestMapping("/{nombre}")
	public String  saludoHumano(@PathVariable("nombre") String nombre){
					
	
		
		return "Hello "+nombre;		
	}
}