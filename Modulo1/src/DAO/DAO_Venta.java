/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connection.DB_Manager;
import Model.Ventas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Jose_Gonzalez
 */
public class DAO_Venta {
    
    DB_Manager db_manager;
    Connection connection;
    
    public DAO_Venta() {
        db_manager = new DB_Manager();
        connection = db_manager.getConnection();
    }
    
    public Boolean validateExistsEmployee(int idEmpleado) {
        Ventas empleado = new Ventas();
        try {
            String SQL = "SELECT * FROM empleado WHERE idEmpleado = " + idEmpleado + ";";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | validateExistsEmployee(int idEmpleado): " + e);
            return false;
        }
    }
    
    public String getNameEmployeeByIDPersona(int idPersona) {
        String nombre = "";
        try {
            String SQL = "SELECT idPersona,(SELECT nombre FROM persona p WHERE p.idPersona=e.idPersona)AS nombre,"
                    + "(SELECT apaterno FROM persona p WHERE p.idPersona=e.idPersona)AS apaterno,"
                    + "(SELECT amaterno FROM persona p WHERE p.idPersona=e.idPersona)AS amaterno "
                    + "FROM empleado e WHERE idPersona = " + idPersona + ";";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                nombre = rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | getNameEmployeeByIDPersona(int idPersona): " + e);
        }
        return nombre;
    }
    
    public ArrayList<Ventas> getAllClientByName(String name) {
        ArrayList<Ventas> cliente = new ArrayList<>();
        try {
            String SQL = "select * from persona p "
                    + "inner join cliente c "
                    + "on p.idPersona = c.idPersona "
                    + "where concat(p.nombre, ' ', p.apaterno, ' ', p.amaterno) like '%" + name + "%';";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ventas lista = new Ventas();
                lista.setIdPersona(rs.getInt(1));
                lista.setNombre(rs.getString(2));
                lista.setaPaterno(rs.getString(3));
                lista.setaMaterno(rs.getString(4));
                lista.setEdad(rs.getInt(5));
                lista.setTelefono(rs.getString(6));
                lista.setEmail(rs.getString(7));
                lista.setDireccion(rs.getString(8));
                lista.setIdCliente(rs.getInt(9));
                lista.setRfc(rs.getString(11));
                lista.setFecuente(rs.getInt(12));
                cliente.add(lista);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | getAllByName(String name): " + e);
        }
        return cliente;
    }
    
    public ArrayList<Ventas> getAllClient() {
        ArrayList<Ventas> cliente = new ArrayList<>();
        try {
            String SQL = "select * from persona p "
                    + "inner join cliente c "
                    + "on p.idPersona = c.idPersona ;";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ventas lista = new Ventas();
                lista.setIdPersona(rs.getInt(1));
                lista.setNombre(rs.getString(2));
                lista.setaPaterno(rs.getString(3));
                lista.setaMaterno(rs.getString(4));
                lista.setEdad(rs.getInt(5));
                lista.setTelefono(rs.getString(6));
                lista.setEmail(rs.getString(7));
                lista.setDireccion(rs.getString(8));
                lista.setIdCliente(rs.getInt(9));
                lista.setRfc(rs.getString(11));
                lista.setFecuente(rs.getInt(12));
                cliente.add(lista);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | getAllClient(): " + e);
        }
        return cliente;
    }
    
    public String comparar(String idProducto) {
        String cant = "";
        try {
            String SQL = "SELECT cantidad FROM producto WHERE idProducto='" + idProducto + "'";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cant = rs.getString(1);
            }

        } catch (Exception e) {
            System.out.println("Error DAO_Venta | comparar(int idProducto): " + e);
        }
        return cant;
    }
    
    public ArrayList<Ventas> buscarMueblesCategoria(String categoria) {
        ArrayList<Ventas> lista = new ArrayList<>();
        try {
            String SQL = "SELECT * FROM producto WHERE categoria = '" + categoria + "'";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ventas producto = new Ventas();
                producto.setIdProducto(rs.getInt(1));
                producto.setCategoria(rs.getString(2));
                producto.setProducto(rs.getString(3));
                producto.setCosto(rs.getFloat(4));
                producto.setCantidad(rs.getInt(5));
                producto.setDescripcion(rs.getString(6));
                lista.add(producto);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | buscarMueblesCategoria(String categoria): " + e);
        }
        return lista;
    }
    
    public ArrayList<Ventas> getAllProduct() {
        ArrayList<Ventas> lista = new ArrayList<>();
        try {
            String SQL = "SELECT * FROM producto;";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ventas producto = new Ventas();
                producto.setIdProducto(rs.getInt(1));
                producto.setCategoria(rs.getString(2));
                producto.setProducto(rs.getString(3));
                producto.setCosto(rs.getFloat(4));
                producto.setCantidad(rs.getInt(5));
                producto.setDescripcion(rs.getString(6));
                lista.add(producto);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | getAllProduct(): " + e);
        }
        return lista;
    }
    
    public ArrayList<Ventas> buscarMuebles(String id) {
        ArrayList<Ventas> lista = new ArrayList<>();
        try {
            String SQL = "SELECT * FROM producto WHERE CONCAT(idProducto,producto) LIKE '%" + id + "%'";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ventas producto = new Ventas();
                producto.setIdProducto(rs.getInt(1));
                producto.setCategoria(rs.getString(2));
                producto.setProducto(rs.getString(3));
                producto.setCosto(rs.getFloat(4));
                producto.setCantidad(rs.getInt(5));
                producto.setDescripcion(rs.getString(6));
                lista.add(producto);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | buscarMuebles(String id): " + e);
        }
        return lista;
    }
    
    public boolean registrarFlete(Ventas flete) {
        try {
            String SQL = "INSERT INTO flete VALUES (null, '"
                    + flete.getDireccion() + "', '"
                    + flete.getCosto() + "');";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | registrarFlete(Ventas flete): " + e);
            return false;
        }
    }
    
    public boolean registrarPagoVenta(Ventas pago) {
        try {
            String SQL = "INSERT INTO pagoventa VALUES (null, '"
                    + pago.getIdVenta() + "', '"
                    + pago.getIdFlete() + "', '"
                    + pago.getFechaPago()+ "', '"
                    + pago.getTotalPago() + "');";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | registrarPagoVenta(Ventas pago): " + e);
            return false;
        }
    }
    
    public boolean registrarVenta(Ventas venta) {
        try {
            String SQL = "INSERT INTO venta VALUES (null, '"
                    + venta.getIdCliente() + "', '"
                    + venta.getIdEmpleado() + "', '"
                    + venta.getIdFlete() + "', '"
                    + venta.getIdPagoVenta() + "', '"
                    + venta.getCantidadTotal() + "', '"
                    + venta.getTotalVenta() + "', '"
                    + venta.getTotalIVA() + "', '"
                    + venta.getFecha() + "');";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | registrarVenta(Ventas venta): " + e);
            return false;
        }
    }
    
    public boolean registrarDetalleVenta(Ventas detalle) {
        try {
            String SQL = "INSERT INTO detalleventa VALUES (null, '"
                    + detalle.getIdVenta() + "', '"
                    + detalle.getIdProducto() + "', '"
                    + detalle.getCantidad() + "', '"
                    + detalle.getSubTotal() + "');";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | registrarDetalleVenta(Ventas detalle): " + e);
            return false;
        }
    }
    
    public boolean updateFrecuenciaCliente(Ventas cliente) {
        try {
            String SQL = "UPDATE cliente SET frecuente = '"
                    + cliente.getFecuente() + "' where idCliente = '"
                    + cliente.getIdCliente() + "';";

            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | updateFrecuenciaCliente(Ventas cliente): " + e);
            return false;
        }
    }
    
    public boolean updateIdPagoVenta(Ventas producto) {
        try {
            String SQL = "UPDATE venta SET idPagoVenta = '"
                    + producto.getIdPagoVenta() + "' where idPagoVenta = '"
                    + producto.getIdVenta() + "';";

            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | updateIdPagoVenta(Ventas producto): " + e);
            return false;
        }
    }
    
    public float getSaldo(int tarjeta) {
        float saldo = 0;
        try {
            String SQL = "SELECT * FROM tarjeta WHERE idTarjeta = '" + tarjeta + "' ";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                saldo = rs.getInt(4);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | getSaldo(int tarjeta): " + e);
        }   
        return saldo;
    }
    
    public boolean updateSaldo(Ventas tarjeta) {
        try {
            String SQL = "UPDATE tarjeta SET saldo = '"
                    + tarjeta.getSaldo() + "' where idTarjeta = '"
                    + tarjeta.getIdTarjeta() + "';";

            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | updateSaldo(Ventas tarjeta): " + e);
            return false;
        }
    }
    
    public int getLastIdFlete() {
        int id = 0;
        try {
            String SQL = "SELECT MAX(idFlete) AS idFlete FROM flete;";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | getLastIdFlete(): " + e);
        }   
        return id;
    }
    
    public int getLastIdVenta() {
        int id = 0;
        try {
            String SQL = "SELECT MAX(idVenta) AS idVenta FROM venta;";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | getLastIdVenta(): " + e);
        }   
        return id;
    }
    
    public int getLastIdPagoVenta() {
        int id = 0;
        try {
            String SQL = "SELECT MAX(idPagoVenta) AS idPagoVenta FROM pagoventa;";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | getLastIdPagoVenta(): " + e);
        }   
        return id;
    }
    
    public int getFrecuencia(int idCliente) {
        int frecuencia = 0;
        try {
            String SQL = "SELECT * FROM cliente where idCliente='"+ idCliente +"';";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                frecuencia = rs.getInt(4);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | etFrecuencia(int idCliente): " + e);
        }   
        return frecuencia;
    }
    
    public int getCantidadStock(int idProducto) {
        int existencia = 0;
        try {
            String SQL = "SELECT * FROM producto where idProducto='"+ idProducto +"';";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                existencia = rs.getInt(5);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | getCantidadStock(int idProducto): " + e);
        }   
        return existencia;
    }
    
    public boolean registrarComision(Ventas comision) {
        try {
            String SQL = "INSERT INTO comision VALUES (null, '"
                    + comision.getIdVenta() + "', '"
                    + comision.getMontoComision() + "', '"
                    + comision.getFechaComision() + "');";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | registrarComision(Ventas comision): " + e);
            return false;
        }
    }
    
    public boolean updateStock(Ventas stock) {
        try {
            String SQL = "UPDATE producto SET cantidad = '"
                    + stock.getCantidad() + "' where idProducto = '"
                    + stock.getIdProducto() + "';";

            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | updateStock(Ventas stock): " + e);
            return false;
        }
    }
    
    public Ventas getOneByIDPersona(int idPersona) {
        Ventas cliente = new Ventas();
        try {
            String SQL = "SELECT idPersona,nombre,apaterno,amaterno,edad,telefono,email,direccion,"
                    + "(SELECT idCliente FROM cliente c WHERE c.idPersona=p.idPersona)AS idCliente,"
                    + "(SELECT idPersona FROM cliente c WHERE c.idPersona=p.idPersona)AS idPersona,"
                    + "(SELECT rfc FROM cliente c WHERE c.idPersona=p.idPersona)AS rfc,"
                    + "(SELECT frecuente FROM cliente c WHERE c.idPersona=p.idPersona)AS frecuente "
                    + "FROM persona p WHERE idPersona = " + idPersona + ";";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cliente.setIdPersona(rs.getInt(1));
                cliente.setNombre(rs.getString(2));
                cliente.setaPaterno(rs.getString(3));
                cliente.setaMaterno(rs.getString(4));
                cliente.setEdad(rs.getInt(5));
                cliente.setTelefono(rs.getString(6));
                cliente.setEmail(rs.getString(7));
                cliente.setDireccion(rs.getString(8));
                cliente.setIdCliente(rs.getInt(9));
                cliente.setRfc(rs.getString(11));
                cliente.setFecuente(rs.getInt(12));
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Venta | getOneByIDPersona(int idPersona): " + e);
        }
        return cliente;
    }
    
}
