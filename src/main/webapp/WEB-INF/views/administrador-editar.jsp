<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Administrador</title>
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
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
            font-size: 0.9em;
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

        input:disabled {
            background-color: #e9ecef;
            cursor: not-allowed;
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

        .btn-warning {
            background-color: #ffc107;
            color: #333;
        }

        .btn-warning:hover {
            background-color: #e0a800;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            display: block;
            text-align: center;
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

        .info-box {
            background-color: #d1ecf1;
            color: #0c5460;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid #bee5eb;
            font-size: 0.9em;
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
    <h1>✏️ Editar Administrador</h1>
    <p class="subtitle">ID: ${administrador.idAdministrador}</p>

    <c:if test="${not empty error}">
        <div class="error">
            ❌ ${error}
        </div>
    </c:if>

    <div class="info-box">
        ℹ️ Los campos marcados son requeridos. El ID no se puede modificar.
    </div>

    <form action="/administradores/editar/${administrador.idAdministrador}" method="post">
        <div class="form-group">
            <label for="idAdministrador">ID del Administrador:</label>
            <input type="text"
                   id="idAdministrador"
                   value="${administrador.idAdministrador}"
                   disabled>
        </div>

        <div class="form-group">
            <label for="nombre">Nombre completo: *</label>
            <input type="text"
                   id="nombre"
                   name="nombre"
                   value="${administrador.nombre}"
                   required
                   placeholder="Ej: Laura Perez">
        </div>

        <div class="form-group">
            <label for="correo">Correo electrónico: *</label>
            <input type="email"
                   id="correo"
                   name="correo"
                   value="${administrador.correo}"
                   required
                   placeholder="ejemplo@admin.com">
        </div>

        <div class="form-group">
            <label for="contrasena">Nueva Contraseña: *</label>
            <input type="password"
                   id="contrasena"
                   name="contrasena"
                   required
                   placeholder="Ingresa una nueva contraseña">
            <small style="color: #666; font-size: 0.85em;">
                Por seguridad, debes ingresar una nueva contraseña
            </small>
        </div>

        <div class="form-group">
            <label for="rol">Rol: *</label>
            <select id="rol" name="rol" required>
                <option value="">Selecciona un rol</option>
                <option value="administrador" ${administrador.rol == 'administrador' ? 'selected' : ''}>Administrador</option>
                <option value="administradora" ${administrador.rol == 'administradora' ? 'selected' : ''}>Administradora</option>
                <option value="superadmin" ${administrador.rol == 'superadmin' ? 'selected' : ''}>Super Administrador</option>
            </select>
        </div>

        <button type="submit" class="btn btn-warning">💾 Guardar Cambios</button>
        <a href="/administradores" class="btn btn-secondary">❌ Cancelar</a>
    </form>

    <div class="back-link">
        <a href="/administradores/${administrador.idAdministrador}">← Ver detalle del administrador</a>
    </div>
</div>
</body>
</html>