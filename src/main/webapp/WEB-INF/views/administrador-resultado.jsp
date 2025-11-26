<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro Exitoso</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            max-width: 600px;
            width: 100%;
        }

        .success-icon {
            text-align: center;
            font-size: 80px;
            color: #28a745;
            margin-bottom: 20px;
        }

        h1 {
            color: #28a745;
            text-align: center;
            margin-bottom: 20px;
        }

        .mensaje {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
            font-size: 1.1em;
        }

        .info-card {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .info-row {
            display: flex;
            padding: 10px 0;
            border-bottom: 1px solid #dee2e6;
        }

        .info-row:last-child {
            border-bottom: none;
        }

        .info-label {
            font-weight: 600;
            color: #333;
            width: 150px;
            flex-shrink: 0;
        }

        .info-value {
            color: #666;
            flex-grow: 1;
        }

        .btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
            text-decoration: none;
            display: block;
            text-align: center;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="success-icon">✅</div>
    <h1>Registro Exitoso</h1>
    <p class="mensaje">${mensaje}</p>

    <div class="info-card">
        <h3 style="margin-bottom: 15px; color: #333;">Datos del Administrador:</h3>

        <div class="info-row">
            <span class="info-label">ID:</span>
            <span class="info-value">${administrador.idAdministrador}</span>
        </div>

        <div class="info-row">
            <span class="info-label">Nombre:</span>
            <span class="info-value">${administrador.nombre}</span>
        </div>

        <div class="info-row">
            <span class="info-label">Correo:</span>
            <span class="info-value">${administrador.correo}</span>
        </div>

        <div class="info-row">
            <span class="info-label">Rol:</span>
            <span class="info-value">${administrador.rol}</span>
        </div>
    </div>

    <a href="/administradores/registro" class="btn btn-primary">Registrar Otro Administrador</a>
    <a href="/" class="btn btn-secondary">Volver al Menú Principal</a>
</div>
</body>
</html>