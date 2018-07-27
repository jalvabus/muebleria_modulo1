/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Jose_Gonzalez
 */
public class Ventas {
    
    //Table venta
    private int idVenta;
    private int idCliente;
    private int idEmpleado;
    private int idFlete;
    private int idPagoVenta;
    private int cantidadTotal;
    private float totalVenta;
    private float totalIVA;
    private String fecha;
    
    //Table flete
    private String direccion;
    private float costo;
    
    //Table pagoventa
    private String fechaPago;
    private float totalPago;
    
    //Table detalleventa
    private int idDetalleVenta;
    private int idProducto;
    private int cantidad;
    private float subTotal;
    
    //Table Cliente
    private int idPersona;
    private String nombre;
    private String aPaterno;
    private String aMaterno;
    private int edad;
    private String telefono;
    private String email;
    private String rfc;
    private int Fecuente;
    
    //Table Producto
    private String categoria;
    private String producto;
    private String descripcion;
    
    //Table Trajeta
    private int idTarjeta;
    private float saldo;
    
    //Table comision
    private int idComision;
    private float montoComision;
    private String fechaComision;

    public Ventas() {
        
    }
    
    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public int getIdFlete() {
        return idFlete;
    }

    public void setIdFlete(int idFlete) {
        this.idFlete = idFlete;
    }

    public int getIdPagoVenta() {
        return idPagoVenta;
    }

    public void setIdPagoVenta(int idPagoVenta) {
        this.idPagoVenta = idPagoVenta;
    }

    public int getCantidadTotal() {
        return cantidadTotal;
    }

    public void setCantidadTotal(int cantidadTotal) {
        this.cantidadTotal = cantidadTotal;
    }

    public float getTotalVenta() {
        return totalVenta;
    }

    public void setTotalVenta(float totalVenta) {
        this.totalVenta = totalVenta;
    }

    public float getTotalIVA() {
        return totalIVA;
    }

    public void setTotalIVA(float totalIVA) {
        this.totalIVA = totalIVA;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public float getCosto() {
        return costo;
    }

    public void setCosto(float costo) {
        this.costo = costo;
    }

    public String getFechaPago() {
        return fechaPago;
    }

    public void setFechaPago(String fechaPago) {
        this.fechaPago = fechaPago;
    }

    public float getTotalPago() {
        return totalPago;
    }

    public void setTotalPago(float totalPago) {
        this.totalPago = totalPago;
    }

    public int getIdDetalleVenta() {
        return idDetalleVenta;
    }

    public void setIdDetalleVenta(int idDetalleVenta) {
        this.idDetalleVenta = idDetalleVenta;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(float subTotal) {
        this.subTotal = subTotal;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getaPaterno() {
        return aPaterno;
    }

    public void setaPaterno(String aPaterno) {
        this.aPaterno = aPaterno;
    }

    public String getaMaterno() {
        return aMaterno;
    }

    public void setaMaterno(String aMaterno) {
        this.aMaterno = aMaterno;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRfc() {
        return rfc;
    }

    public void setRfc(String rfc) {
        this.rfc = rfc;
    }

    public int getFecuente() {
        return Fecuente;
    }

    public void setFecuente(int Fecuente) {
        this.Fecuente = Fecuente;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdTarjeta() {
        return idTarjeta;
    }

    public void setIdTarjeta(int idTarjeta) {
        this.idTarjeta = idTarjeta;
    }

    public float getSaldo() {
        return saldo;
    }

    public void setSaldo(float saldo) {
        this.saldo = saldo;
    }

    public int getIdComision() {
        return idComision;
    }

    public void setIdComision(int idComision) {
        this.idComision = idComision;
    }

    public float getMontoComision() {
        return montoComision;
    }

    public void setMontoComision(float montoComision) {
        this.montoComision = montoComision;
    }

    public String getFechaComision() {
        return fechaComision;
    }

    public void setFechaComision(String fechaComision) {
        this.fechaComision = fechaComision;
    }
    
    
    
}
