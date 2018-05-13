package com.app.proyectotitulo.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.proyectotitulo.domain.Empleado;
import com.app.proyectotitulo.service.EmpleadoService;


@Controller
public class EmpleadoController {
	
	@Autowired
	private EmpleadoService empleadoService;

	@RequestMapping(value = "ListarEmpleados")
	public ModelAndView listarEmpleados(ModelAndView vista, HttpServletRequest request, HttpSession sesion) {

		sesion = request.getSession(true);
		Empleado e = (Empleado) sesion.getAttribute("empleado");

		if (e != null) {

			List<Empleado> listaEmpleados = empleadoService.listarEmpleados();
			vista.addObject("listaEmpleados", listaEmpleados);
			vista.setViewName("listarEmpleados");

		} else {
			vista.setViewName("login");
			vista.addObject("empleado", new Empleado());
			vista.addObject("sesionExpirada", "Su sesión ha expirado");

		}
		return vista;
	}
	
	
	@RequestMapping(value = "agregarEmpleado")
	public @ResponseBody Empleado agregarEmpleado(@RequestParam String rut, @RequestParam String nombre, @RequestParam String apellidos,
			@RequestParam Date fechaNacimiento, @RequestParam String telefono, @RequestParam String direccion, @RequestParam String cargo,
			@RequestParam String clave) {
        
		System.out.println(rut);
		System.out.println(nombre);
		System.out.println(apellidos);
		System.out.println(fechaNacimiento);
		System.out.println(telefono);
		System.out.println(direccion);
		System.out.println(cargo);
		System.out.println(clave);
		Empleado e = new Empleado();
		Empleado empleado = new Empleado();

		if (!nombre.equalsIgnoreCase("") && !apellidos.equalsIgnoreCase("") && !rut.equalsIgnoreCase("")&& fechaNacimiento!=null
				&& !telefono.equalsIgnoreCase("") && !direccion.equalsIgnoreCase("") && !cargo.equalsIgnoreCase("") && !clave.equalsIgnoreCase("")) {
			e.setRut(rut);
			e.setNombre(nombre);
			e.setApellidos(apellidos);
			e.setFechaNac(fechaNacimiento);
			e.setTelefono(telefono);
			e.setDireccion(direccion);
			e.setCargo(cargo);
			e.setClave(clave);

			// Guardar
			empleado = empleadoService.saveAndFlush(e);
			return empleado;

		}

		return empleado;

	}
	
	
	@RequestMapping(value = "obtenerListaEmpleados")
	public @ResponseBody List<Empleado> obtenerListaEmpleados() {

		List<Empleado> lista = empleadoService.listarEmpleados();

		return lista;
	}

	@RequestMapping(value = "eliminarEmpleado")
	public @ResponseBody boolean eliminarEmpleado(@RequestParam String rutEmpleado) {

		Empleado e= empleadoService.findByRut(rutEmpleado);
		if (e != null) {
			e.setEmpleadoEliminado(true);

			empleadoService.eliminarEmpleado(e);
			return true;
		}

		return false;
	}
	
	
	@RequestMapping(value = "obtenerEmpleadoAEditar")
	public @ResponseBody Empleado obtenerEmpleadoAEditar(@RequestParam String rut) {

		Empleado e = empleadoService.findByRut(rut);
		if (e != null) {
			return e;
		} else {
			return new Empleado();
		}

	}
	
	
	@RequestMapping(value = "editarEmpleado")
	public @ResponseBody boolean editar(@RequestParam String rutEditar, @RequestParam String nombreEditar, @RequestParam String apellidosEditar,
			@RequestParam Date fechaNacimientoEditar, @RequestParam String telefonoEditar, @RequestParam String direccionEditar, @RequestParam String cargoEditar,
			@RequestParam String claveEditar) {
		System.out.println(rutEditar);
		System.out.println(nombreEditar);
		System.out.println(apellidosEditar);
		System.out.println(fechaNacimientoEditar);
		System.out.println(telefonoEditar);
		System.out.println(direccionEditar);
		System.out.println(cargoEditar);
		System.out.println(claveEditar);

		Empleado e = new Empleado();

		if (!nombreEditar.equalsIgnoreCase("") && !apellidosEditar.equalsIgnoreCase("") && !rutEditar.equalsIgnoreCase("")&& fechaNacimientoEditar!=null
				&& !telefonoEditar.equalsIgnoreCase("") && !direccionEditar.equalsIgnoreCase("") && !cargoEditar.equalsIgnoreCase("") && !claveEditar.equalsIgnoreCase("")) {

			// Buscar el empleado
			e = empleadoService.findByRut(rutEditar);
			e.setNombre(nombreEditar);
			e.setApellidos(apellidosEditar);
			e.setFechaNac(fechaNacimientoEditar);
			e.setTelefono(telefonoEditar);
			e.setDireccion(direccionEditar);
			e.setCargo(cargoEditar);
			e.setClave(claveEditar);

			// Guardar
			empleadoService.editarEmpleado(e);
			return true;

		}

		return false;

	}


}
