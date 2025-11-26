package com.estudiante.frontend_sam.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.WebClient;

@Configuration //Indica que esta clase contiene configuraciones de Spring
public class WebClientConfig {
    @Value("${api.backend.url}")//Lee la URL del backend desde application.properties
    private String backendUrl;

    @Bean //Nuevo objeto WebClient para usar en toda la app
    public WebClient webClient() {
        return WebClient.builder()
                .baseUrl(backendUrl) //URL  de la API del backend
                .build();
    }
}
