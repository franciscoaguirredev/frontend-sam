<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalle del Administrador</title>
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
            max-width: 700px;
            width: 100%;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header-icon {
            font-size: 80px;
            margin-bottom: 10px;
        }

        h1 {
            color: #333;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #666;
            font-size: 0.9em;
        }

        .info-card {
            background-color: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .info-row {
            display: flex;
            padding: 15px 0;
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
            word-break: break-word;
        }

        .badge {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.9em;
            font-weight: 600;
        }

        .badge-admin {
            background-color: #667eea;
            color: white;
        }

        .actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .btn {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: block;
            text-align: center;
            transition: all 0.3s;
            min-width: 120px;
        }

        .btn-warning {
            background-color: #ffc107;
            color: #333;
        }

        .btn-warning:hover {
            background-color: #e0a800;
            transform: translateY(-2px);
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c82333;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            transform: translateY(-2px);
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="header-icon">👤</div>
        <h1>Detalle del Administrador</h1>
        <p class="subtitle">Información completa del registro</p>
    </div>

    <div class="info-card">
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
            <span class="info-value">
                    <span class="badge badge-admin">${administrador.rol}</span>
                </span>
        </div>
    </div>

    <div class="actions">
        <a href="/administradores/editar/${administrador.idAdministrador}" class="btn btn-warning">
            ✏️ Editar
        </a>
        <a href="/administradores/eliminar/${administrador.idAdministrador}"
           class="btn btn-danger"
           onclick="return confirm('¿Estás seguro de eliminar este administrador?')">
            🗑️ Eliminar
        </a>
    </div>

    <div style="margin-top: 15px;">
        <a href="/administradores" class="btn btn-primary">
            📋 Ver Todos
        </a>
        <a href="/" class="btn btn-secondary" style="margin-top: 10px;">
            🏠 Volver al Inicio
        </a>
    </div>
</div>
</body>
</html>