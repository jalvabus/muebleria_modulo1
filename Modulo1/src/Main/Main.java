/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Main;

import DAO.*;
import Model.*;
import java.util.ArrayList;

/**
 *
 * @author juana
 */
public class Main {

    private void getAll() {
        DAO_Empelado $empleado = new DAO_Empelado();
        ArrayList<Empleado> empleados = $empleado.getAll();
        
        empleados.forEach((e) -> {
            System.out.println(e.getNombre());
        });
    }

    public static void main(String[] args) {
        Main main = new Main();
        main.getAll();
    }
}
