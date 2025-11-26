<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro de Administrador</title>
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
            max-width: 500px;
            width: 100%;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        input:focus,
        select:focus {
            outline: none;
            border-color: #667eea;
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

        .error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #667eea;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>📝 Registro de Administrador</h1>

    <c:if test="${not empty error}">
        <div class="error">
                ${error}
        </div>
    </c:if>

    <form action="/administradores/registro" method="post">
        <div class="form-group">
            <label for="nombre">Nombre completo:</label>
            <input type="text"
                   id="nombre"
                   name="nombre"
                   value="${administrador.nombre}"
                   required
                   placeholder="Ej: Laura Perez">
        </div>

        <div class="form-group">
            <label for="correo">Correo electrónico:</label>
            <input type="email"
                   id="correo"
                   name="correo"
                   value="${administrador.correo}"
                   required
                   placeholder="ejemplo@admin.com">
        </div>

        <div class="form-group">
            <label for="contrasena">Contraseña:</label>
            <input type="password"
                   id="contrasena"
                   name="contrasena"
                   required
                   placeholder="Ingresa una contraseña segura">
        </div>

        <div class="form-group">
            <label for="rol">Rol:</label>
            <select id="rol" name="rol" required>
                <option value="">Selecciona un rol</option>
                <option value="administrador" ${administrador.rol == 'administrador' ? 'selected' : ''}>Administrador</option>
                <option value="administradora" ${administrador.rol == 'administradora' ? 'selected' : ''}>Administradora</option>
                <option value="superadmin" ${administrador.rol == 'superadmin' ? 'selected' : ''}>Super Administrador</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Registrar Administrador</button>
        <a href="/" class="btn btn-secondary" style="display: block; text-align: center; text-decoration: none;">Volver al Inicio</a>
    </form>

    <div class="back-link">
        <a href="/">← Volver al menú principal</a>
    </div>
</div>
</body>
</html>