<%@ page import="java.sql.*,java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tablas y Gráfica Dinámica</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="estilos.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="script.js" defer></script>
    <a href="index.html"></a>

</head>
<body>
    <!-- Encabezado -->
    <header style="display: flex; align-items: center; padding: 10px; background-color: #f8f9fa;">
        <img src="imagenes/logo.jpg" alt="Logotipo" style="height: 80px; margin-right: 20px;">
        <h1>Tablas y Gráfica Dinámica</h1>
    </header>

    <center>
        <table border="1" width="1300" bgcolor="#FFFFFF">
        <tr height="300">
            <td class="banner"></td>
 
        </tr>
        
        <tr height="700">
             <td> 
        <center>
    
    
    
    
    
    
    
    <!-- Menú -->
    <nav id="menu">
        <ul>
            <li><a href="index.html">Inicio</a></li>
            <li><a href="tabla.jsp">Tablas y grafico</a></li>
            <li><a href="tips.html">Tips de Ahorro</a></li>
            <li><a href="tiposenergia.html">Tipos de Energía</a></li>
        </ul>
    </nav>

    <!-- Tabla dinámica: Fuentes de Energía -->
    <div class="container mt-4">
        <h2>Fuentes de Energía</h2>
        <table class="table table-hover table-dark">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Descripción</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String url = "jdbc:mysql://localhost:3306/energymanagement";
                    String usuarioDB = "root";
                    String claveDB = "";

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection(url, usuarioDB, claveDB);
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM energysource");

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                            String description = rs.getString("description");
                %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= name %></td>
                            <td><%= description %></td>
                        </tr>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Tabla dinámica: Datos de Energía -->
    <div class="container mt-4">
        <h2>Datos de Energía</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Fuente</th>
                    <th>Año</th>
                    <th>Producción (GWh)</th>
                    <th>Consumo (GWh)</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection(url, usuarioDB, claveDB);
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM energydata");

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            int sourceId = rs.getInt("source_id");
                            int year = rs.getInt("year");
                            double production = rs.getDouble("production");
                            double consumption = rs.getDouble("consumption");
                %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= sourceId %></td>
                            <td><%= year %></td>
                            <td><%= production %></td>
                            <td><%= consumption %></td>
                        </tr>
                <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Gráfica dinámica -->
    <div class="container mt-4">
        <h1>Producción y Consumo de Energía</h1>
        <div class="chart-container">
            <canvas id="energyChart" width="600" height="400"></canvas>
        </div>
    </div>
</body>
</html>










    

