package com.estudiante.frontend_sam.controller;

import com.estudiante.frontend_sam.model.Administrador;
import com.estudiante.frontend_sam.service.AdministradorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/administradores") //Todas las rutas para el frontend empiezan con /administradores
public class AdministradorController {
    @Autowired
    private AdministradorService administradorService;

    // Mostrar el formulario de registro
    @GetMapping("/registro") //Muestra el formulario vacío
    public String mostrarFormularioRegistro(Model model) {
        model.addAttribute("administrador", new Administrador());
        return "administrador-registro";
    }

    // Procesar el formulario de registro y llama al backend
    @PostMapping("/registro")
    public String registrarAdministrador(@ModelAttribute Administrador administrador, Model model) {
        try {
            Administrador administradorCreado = administradorService.registrarAdministrador(administrador);
            //model.addAtribute: captura los datos del formulario automaticamente
            model.addAttribute("mensaje", "Administrador registrado exitosamente");
            model.addAttribute("administrador", administradorCreado);
            model.addAttribute("exito", true);
            return "administrador-resultado";
        } catch (Exception e) {
            model.addAttribute("error", "Error al registrar administrador: " + e.getMessage());
            model.addAttribute("administrador", administrador);
            return "administrador-registro";
        }
    }
}
