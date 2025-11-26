<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Administradores</title>
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
            padding: 20px;
        }

        .container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            max-width: 1200px;
            margin: 0 auto;
        }

        h1 {
            color: #333;
            margin-bottom: 30px;
            text-align: center;
        }

        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 10px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s;
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

        .btn-info {
            background-color: #17a2b8;
            color: white;
            padding: 8px 15px;
            font-size: 13px;
        }

        .btn-info:hover {
            background-color: #138496;
        }

        .btn-warning {
            background-color: #ffc107;
            color: #333;
            padding: 8px 15px;
            font-size: 13px;
        }

        .btn-warning:hover {
            background-color: #e0a800;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
            padding: 8px 15px;
            font-size: 13px;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid #c3e6cb;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid #dee2e6;
        }

        tbody tr:hover {
            background-color: #f8f9fa;
        }

        .actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #666;
        }

        .empty-state-icon {
            font-size: 60px;
            margin-bottom: 20px;
        }

        .empty-state h3 {
            margin-bottom: 10px;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>📋 Lista de Administradores</h1>

    <div class="header-actions">
        <a href="/administradores/registro" class="btn btn-primary">➕ Nuevo Administrador</a>
        <a href="/" class="btn btn-secondary">🏠 Volver al Inicio</a>
    </div>

    <c:if test="${not empty error}">
        <div class="error">
            ❌ ${error}
        </div>
    </c:if>

    <c:if test="${not empty mensaje}">
        <div class="success">
            ✅ ${mensaje}
        </div>
    </c:if>

    <c:choose>
        <c:when test="${empty administradores}">
            <div class="empty-state">
                <div class="empty-state-icon">📭</div>
                <h3>No hay administradores registrados</h3>
                <p>Comienza agregando tu primer administrador</p>
                <a href="/administradores/registro" class="btn btn-primary" style="margin-top: 20px;">
                    ➕ Registrar Primer Administrador
                </a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="table-container">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Rol</th>
                        <th>Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="admin" items="${administradores}">
                        <tr>
                            <td>${admin.idAdministrador}</td>
                            <td>${admin.nombre}</td>
                            <td>${admin.correo}</td>
                            <td>${admin.rol}</td>
                            <td>
                                <div class="actions">
                                    <a href="/administradores/${admin.idAdministrador}" class="btn btn-info">
                                        👁️ Ver
                                    </a>
                                    <a href="/administradores/editar/${admin.idAdministrador}" class="btn btn-warning">
                                        ✏️ Editar
                                    </a>
                                    <a href="/administradores/eliminar/${admin.idAdministrador}"
                                       class="btn btn-danger"
                                       onclick="return confirm('¿Estás seguro de eliminar este administrador?')">
                                        🗑️ Eliminar
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>