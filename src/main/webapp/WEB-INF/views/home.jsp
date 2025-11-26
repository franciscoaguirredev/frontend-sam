<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${titulo}</title>
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
            max-width: 1000px;
            width: 90%;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.5em;
        }

        .menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .menu-item {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px 20px;
            text-align: center;
            border-radius: 10px;
            text-decoration: none;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }

        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .menu-item h3 {
            margin-bottom: 10px;
            font-size: 1.3em;
        }

        .menu-item p {
            font-size: 0.9em;
            opacity: 0.9;
        }

        .menu-item.disabled {
            background: linear-gradient(135deg, #95a5a6 0%, #7f8c8d 100%);
            cursor: not-allowed;
            opacity: 0.7;
        }

        .menu-item.disabled:hover {
            transform: none;
            box-shadow: none;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
            color: #666;
            font-size: 0.9em;
        }

        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>${titulo}</h1>
    <p class="subtitle">
        Bienvenido al sistema de gestión. Selecciona una opción del menú.
    </p>

    <div class="menu">
        <a href="/administradores" class="menu-item">
            <h3>👤 Administradores</h3>
            <p>Gestionar administradores</p>
        </a>

        <a href="#" class="menu-item disabled">
            <h3>💳 Cuenta</h3>
            <p>Gestionar cuentas</p>
        </a>

        <a href="#" class="menu-item disabled">
            <h3>💰 Pago</h3>
            <p>Gestionar pagos</p>
        </a>

        <a href="#" class="menu-item disabled">
            <h3>👥 Perfil</h3>
            <p>Gestionar perfiles</p>
        </a>

        <a href="#" class="menu-item disabled">
            <h3>🎬 Plataforma</h3>
            <p>Gestionar plataformas</p>
        </a>

        <a href="#" class="menu-item disabled">
            <h3>📋 Suscripción</h3>
            <p>Gestionar suscripciones</p>
        </a>

        <a href="#" class="menu-item disabled">
            <h3>🎫 Suscriptor</h3>
            <p>Gestionar suscriptores</p>
        </a>

        <a href="#" class="menu-item disabled">
            <h3>📊 Reportes</h3>
            <p>Ver estadísticas</p>
        </a>
    </div>

    <div class="footer">
        <p>Sistema desarrollado con Spring Boot y JSP</p>
        <p>Fecha: <%= new java.util.Date() %></p>
    </div>
</div>
</body>
</html>