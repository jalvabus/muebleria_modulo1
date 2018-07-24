/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connection.DB_Manager;
import java.sql.Connection;

import Model.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 *
 * @author juana
 */
public class DAO_Empelado {

    DB_Manager db_manager;
    Connection connection;

    public DAO_Empelado() {
        db_manager = new DB_Manager();
        connection = db_manager.getConnection();
    }

    public ArrayList<Empleado> getAll() {
        ArrayList<Empleado> empleados = new ArrayList<>();
        try {
            String SQL = "select * from persona p "
                    + "inner join empleado e "
                    + "on p.idPersona = e.idPersona "
                    + "inner join usuarios u "
                    + "on p.idPersona = u.id_persona;";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Empleado empleado = new Empleado();
                empleado.setId_persona(rs.getInt(1));
                empleado.setNombre(rs.getString(2));
                empleado.setApaterno(rs.getString(3));
                empleado.setAmaterno(rs.getString(4));
                empleado.setEdad(rs.getInt(5));
                empleado.setTelefono(rs.getString(6));
                empleado.setEmail(rs.getString(7));
                empleado.setDireccion(rs.getString(8));
                empleado.setId_empleado(rs.getInt(9));
                empleado.setCargo(rs.getString(11));
                empleado.setId_usuario(rs.getInt(12));
                empleado.setNombreUsuario(rs.getString(13));
                empleado.setContrasenia(rs.getString(14));
                empleados.add(empleado);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Empleado > getAll: " + e);
        }
        return empleados;
    }

    public boolean createEmpleado(Empleado empleado) {
        try {
            String SQL = "CALL insertEmpleado('"
                    + empleado.getNombre() + "','"
                    + empleado.getApaterno() + "','"
                    + empleado.getAmaterno() + "','"
                    + empleado.getEdad() + "','"
                    + empleado.getTelefono() + "','"
                    + empleado.getEmail() + "','"
                    + empleado.getDireccion() + "','"
                    + empleado.getCargo() + "','"
                    + empleado.getNombreUsuario() + "','"
                    + empleado.getContrasenia() + "')";
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Empelado > createEmpleado : " + e);
            return false;
        }
    }

    public boolean updateEmpleado(Empleado empleado) {
        try {
            String SQL = "CALL updateEmpleado('"
                    + empleado.getId_persona() + "', '"
                    + empleado.getNombre() + "','"
                    + empleado.getApaterno() + "','"
                    + empleado.getAmaterno() + "','"
                    + empleado.getEdad() + "','"
                    + empleado.getTelefono() + "','"
                    + empleado.getEmail() + "','"
                    + empleado.getDireccion() + "','"
                    + empleado.getCargo() + "','"
                    + empleado.getNombreUsuario() + "','"
                    + empleado.getContrasenia() + "')";
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Empelado > updateEmpleado : " + e);
            return false;
        }
    }

    public boolean deleteEmpleado(Empleado empleado) {
        try {
            String SQL = "CALL deleteEmpleado('" + empleado.getId_persona() + "')";
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Empelado > deleteEmpleado : " + e);
            return false;
        }
    }

    public Empleado getOneByIDPersona(String idPersona) {
        Empleado empleado = new Empleado();
        try {
            String SQL = "select * from persona p "
                    + "inner join empleado e "
                    + "on p.idPersona = e.idPersona "
                    + "inner join usuarios u "
                    + "on p.idPersona = u.id_persona "
                    + "where p.idPersona = " + idPersona + ";";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                empleado.setId_persona(rs.getInt(1));
                empleado.setNombre(rs.getString(2));
                empleado.setApaterno(rs.getString(3));
                empleado.setAmaterno(rs.getString(4));
                empleado.setEdad(rs.getInt(5));
                empleado.setTelefono(rs.getString(6));
                empleado.setEmail(rs.getString(7));
                empleado.setDireccion(rs.getString(8));
                empleado.setId_empleado(rs.getInt(9));
                empleado.setCargo(rs.getString(11));
                empleado.setId_usuario(rs.getInt(12));
                empleado.setNombreUsuario(rs.getString(13));
                empleado.setContrasenia(rs.getString(14));
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Empleado > getOneByIDPersona: " + e);
        }
        return empleado;
    }
}
