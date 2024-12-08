<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="java.sql.*,java.util.*" %> page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JGP page</title>
</head>
<body>

<h2>Energias renovables</h2>

<table border="1">
    <thead>
        <tr>
            <th>id</th>
            <th>name</th>
            <th>description</th>
        </tr>
    </thead>
    <tbody>
        <%
            // Configuración de la conexión a la base de datos
            String url = "jdbc:mysql://localhost:3306/energymanagement"; // URL de la base de datos
            String usuarioDB = "root"; // Usuario de MySQL
            String claveDB = ""; // Contraseña de MySQL

            // Establecer la conexión
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, usuarioDB, claveDB);
                Statement stmt = conn.createStatement();
                String sql = "SELECT * FROM energysource"; // Consulta SQL para obtener los usuarios
                ResultSet rs = stmt.executeQuery(sql);

                // Mostrar los resultados en la tabla HTML
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
                // Cerrar la conexión
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </tbody>
</table>

    
    <h2>Datos de energía</h2>

<!-- Tabla para energydata -->
<table border="1">
    <thead>
        <tr>
            <th>id</th>
            <th>source id</th>
            <th>year</th>
            <th>production</th>
            <th>consumption</th>
        </tr>
    </thead>
    <tbody>
         <%
             // Establecer la conexión
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, usuarioDB, claveDB);
                Statement stmt = conn.createStatement();
                String sql = "SELECT * FROM energydata"; // Consulta SQL para obtener los usuarios
                ResultSet rs = stmt.executeQuery(sql);    

                // Mostrar los resultados en la tabla HTML
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
                // Cerrar la conexión
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </tbody>
</table>
