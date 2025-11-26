package com.estudiante.frontend_sam.service;

import com.estudiante.frontend_sam.model.Administrador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import java.util.List;

@Service
public class AdministradorService {

    private final WebClient webClient;

    @Autowired
    public AdministradorService(WebClient webClient) {
        this.webClient = webClient;
    }

    //Create - Registrar un administrador
    public Administrador registrarAdministrador(Administrador administrador) {
        return webClient.post()
                .uri("/api/administradores")
                .bodyValue(administrador)
                .retrieve()
                .bodyToMono(Administrador.class)//Convierte la respuesta JSON a objeto Administrador
                .block();
    }

    //Read - Obtener todos los administradores
    public List<Administrador> obtenerTodosLosAdministradores() {
        return webClient.get()
                .uri("/api/administradores")
                .retrieve()
                .bodyToFlux(Administrador.class) //Para listas (multiples elementos)
                .collectList()
                .block();
    }

    //Read - Obtener administrador por ID
    public Administrador obtenerAdministradorPorId(Long id) {
        return webClient.get()
                .uri("/api/administradores/{id}", id)
                .retrieve()
                .bodyToMono(Administrador.class)
                .onErrorResume(e -> Mono.empty())
                .block();
    }

    //Update - Actualizar un administrador
    public Administrador actualizarAdministrador(Long id, Administrador administrador) {
        return webClient.put()
                .uri("/api/administradores/{id}", id)
                .bodyValue(administrador)
                .retrieve()
                .bodyToMono(Administrador.class)
                .block();
    }

    //Delete - Eliminar un administrador
    public void eliminarAdministrador(Long id) {
        webClient.delete()
                .uri("/api/administradores/{id}", id)
                .retrieve()
                .bodyToMono(Void.class)
                .block();
    }

}
