package com.estudiante.frontend_sam.controller;

import com.estudiante.frontend_sam.model.Administrador;
import com.estudiante.frontend_sam.service.AdministradorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/administradores") //Todas las rutas para el frontend empiezan con /administradores
public class AdministradorController {
    @Autowired
    private AdministradorService administradorService;

    @GetMapping
    public String listarAdministradores(Model model) {
        try {
            List<Administrador> administradores = administradorService.obtenerTodosLosAdministradores();
            model.addAttribute("administradores", administradores);
            return "administrador-lista";
        } catch (Exception e) {
            model.addAttribute("error", "Error al obtener la lista de administradores: " + e.getMessage());
            return "administrador-lista";
        }
    }

    // VER detalle de un administrador
    @GetMapping("/{id}")
    public String verAdministrador(@PathVariable Long id, Model model) {
        try {
            Administrador administrador = administradorService.obtenerAdministradorPorId(id);
            if (administrador != null) {
                model.addAttribute("administrador", administrador);
                return "administrador-detalle";
            } else {
                model.addAttribute("error", "Administrador no encontrado");
                return "redirect:/administradores";
            }
        } catch (Exception e) {
            model.addAttribute("error", "Error al obtener el administrador: " + e.getMessage());
            return "redirect:/administradores";
        }
    }

    // MOSTRAR formulario de registro (CREATE)
    @GetMapping("/registro")
    public String mostrarFormularioRegistro(Model model) {
        model.addAttribute("administrador", new Administrador());
        return "administrador-registro";
    }

    // PROCESAR formulario de registro (CREATE)
    @PostMapping("/registro")
    public String registrarAdministrador(@ModelAttribute Administrador administrador, Model model) {
        try {
            Administrador administradorCreado = administradorService.registrarAdministrador(administrador);
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

    // MOSTRAR formulario de edición (UPDATE)
    @GetMapping("/editar/{id}")
    public String mostrarFormularioEdicion(@PathVariable Long id, Model model) {
        try {
            Administrador administrador = administradorService.obtenerAdministradorPorId(id);
            if (administrador != null) {
                model.addAttribute("administrador", administrador);
                return "administrador-editar";
            } else {
                model.addAttribute("error", "Administrador no encontrado");
                return "redirect:/administradores";
            }
        } catch (Exception e) {
            model.addAttribute("error", "Error al obtener el administrador: " + e.getMessage());
            return "redirect:/administradores";
        }
    }

    // PROCESAR formulario de edición (UPDATE)
    @PostMapping("/editar/{id}")
    public String actualizarAdministrador(@PathVariable Long id,
                                          @ModelAttribute Administrador administrador,
                                          Model model) {
        try {
            Administrador administradorActualizado = administradorService.actualizarAdministrador(id, administrador);
            model.addAttribute("mensaje", "Administrador actualizado exitosamente");
            model.addAttribute("administrador", administradorActualizado);
            return "administrador-resultado";
        } catch (Exception e) {
            model.addAttribute("error", "Error al actualizar administrador: " + e.getMessage());
            model.addAttribute("administrador", administrador);
            return "administrador-editar";
        }
    }

    // ELIMINAR administrador (DELETE)
    @GetMapping("/eliminar/{id}")
    public String eliminarAdministrador(@PathVariable Long id, Model model) {
        try {
            administradorService.eliminarAdministrador(id);
            model.addAttribute("mensaje", "Administrador eliminado exitosamente");
            return "redirect:/administradores";
        } catch (Exception e) {
            model.addAttribute("error", "Error al eliminar administrador: " + e.getMessage());
            return "redirect:/administradores";
        }
    }
}
