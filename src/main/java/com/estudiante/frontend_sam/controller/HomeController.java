package com.estudiante.frontend_sam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller //Indica que esta clase es un controlador de Spring MVC
public class HomeController {
    @GetMapping("/") //Define que este metodo responde a peticiones GET en la raíz de la ruta "/"
    public String home(Model model) {
        model.addAttribute("mensaje", "¡Bienvenido a tu proyecto Frontend con JSP!");
        return "home";
    }
}
