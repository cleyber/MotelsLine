/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.dao;

import java.sql.*;
import models.Reservas;
import models.Servicios;

/**
 *
 * @author Cleyber
 */
public class DaoReservas {
    
    public int insertar(Reservas reserva){
        Conexion conexion = new Conexion();
        int insertado = 0;
        if(conexion.transaccion()){
            PreparedStatement statement = conexion.prepareStatement("INSERT INTO reservas(id_habitacion, id_usuario, fecha, horas_extras, personas_extras) values (?,?,?,?,?)");
            try{
                statement.setInt(1, reserva.getHabitacion().getId());
                statement.setInt(2, reserva.getUsuario().getId());
                statement.setDate(3,reserva.getFecha());
                statement.setInt(4, reserva.getHorasExtras());
                statement.setInt(5, reserva.getPersonasExtras());
                insertado = statement.executeUpdate();
                PreparedStatement statement2 = conexion.prepareStatement("SELECT * FROM reservas ORDER BY id_reserva desc limit 1");
                ResultSet result = statement.executeQuery();
                result.next();
                reserva.setId(result.getInt("id_reserva"));
                for(Servicios servicio : reserva.getServicios()){
                    PreparedStatement statement3 = conexion.prepareStatement("INSERT INTO reservas_x_servicios (id_servicio, id_reserva) values (?,?)");
                    statement3.setInt(1, servicio.getId());
                    statement3.setInt(2, reserva.getId());
                    statement3.executeUpdate();
                }
                conexion.guardarTrans();
            }catch(SQLException se){
                System.out.println("Error al insertar reserva: " + se);
                conexion.cancelarTrans();
            }
        }
        return insertado;
    }
    
}
