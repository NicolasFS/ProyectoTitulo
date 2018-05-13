<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="cabecera.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
.error {
	color: #FF0000;
}
</style>

</head>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header"> <%@ include
			file="barraSuperior.jsp"%> </header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar"> <%@ include
			file="barraLateral.jsp"%> <!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">


			<!-- Main content -->
			<section class="content">

			<div class="row">
				<div class="col-xs-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Lista de Empleados</h3>
							<button id="agregarEmpleado" type="button"
								class="btn btn-primary pull-right" onclick="agregarEmpleado();">
								<i class="fa fa-plus-circle"> Agregar Empleado</i>
							</button>

						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="row">

								<div class="col-sm-12">
									<table id="listaEmpleados"
										class="table table-striped table-bordered table-hover">

										<thead>
											<tr>
												<th>N�</th>
												<th>Nombre</th>
												<th>Apellidos</th>
												<th>Rut</th>
												<th>Direcci�n</th>
												<th>Telefono</th>
												<th>Cargo</th>
												<th>Acci�n</th>

											</tr>
										</thead>

										<tbody>

											<c:forEach var="listaEmpleados" items="${listaEmpleados }"
												varStatus="loop">
												<tr>
													<c:set var="index" value="${loop.index}" />
													<c:set var="index" value="${index + 1}" />

													<td><c:out value="${index}"></c:out></td>
													<td><c:out value="${listaEmpleados.nombre}"></c:out></td>
													<td><c:out value="${listaEmpleados.apellidos}"></c:out></td>
													<td><c:out value="${listaEmpleados.rut}"></c:out></td>
													<td><c:out value="${listaEmpleados.direccion}"></c:out></td>
													<td><c:out value="${listaEmpleados.telefono}"></c:out></td>
													<td><c:out value="${listaEmpleados.cargo}"></c:out></td>
													<td><a href="#"
														onclick="editarEmpleado(${listaEmpleados.rut});"><i
															class="fa fa-edit fa-lg" style="color: #1CE4D0"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
														href="#"
														onclick="eliminarEmpleado(${listaEmpleados.rut});"><i
															class="fa fa-trash-o fa-lg" style="color: red"></i></a></td>

												</tr>
											</c:forEach>
										</tbody>

									</table>
								</div>
							</div>
							<br>

						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->


					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>


			<div class="modal fade" id="modalAgregarEmpleado" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">

							<h4 class="modal-title" id="myModalLabel">Agregar Empleado</h4>
						</div>
						<div class="modal-body">


							<div class="row">

								<div class="box-body">

									<div id="form-editar" class="form-group">


										<label class="col-sm-4 control-label">Nombre</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="nombreEmpleado">
											<span id="errorNombreEmpleado" class="error" style="display: none">Ingrese
												el nombre del empleado</span>
										</div>
										
                                         <br><br><label class="col-sm-4 control-label">Apellidos</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="apellidosEmpleado">
											<span id="errorApellidosEmpleado" class="error" style="display: none">Ingrese
											los apellidos del empleado</span>
										</div>
										
										
										<br><br><label class="col-sm-4 control-label">Rut</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="rutEmpleado" oninput="checkRut(this)" >
											<span id="errorRutEmpleado" class="error" style="display: none">Ingrese
												el rut del empleado</span>
										</div>
										
										<br><br><label class="col-sm-4 control-label">Fecha nacimiento</label>
										<div class="col-sm-6">
											<input type="date" class="form-control" id="fechaNacimientoEmpleado">
											<span id="errorFechaNacimientoEmpleado" class="error" style="display: none">Ingrese
												fecha de nacimiento del empleado</span>
												<span id="errorFechaNacimientoSuperior" class="error" style="display: none">Ingrese
												una fecha de nacimiento inferior </span>
										</div>
										
										<br><br><label class="col-sm-4 control-label">Direcci�n</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="direccionEmpleado">
											<span id="errorDireccionEmpleado" class="error" style="display: none">Ingrese
												direcci�n del empleado</span>
										</div>
										
										<br><br><label class="col-sm-4 control-label">Telefono</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="telefonoEmpleado">
											<span id="errorTelefonoEmpleado" class="error" style="display: none">Ingrese
												telefono del empleado</span>
										</div>
										
										<br> <br> <label class="col-sm-4 control-label">Cargo</label>

										<div class="col-sm-6">
											<select class="form-control" id="cargoEmpleado">
												<option value="-1">Cargo</option>
												<option value="1">Jefe de producci�n</option>
												<option value="2">Gerente</option>
											</select> <span id="errorCargoEmpleado" class="error" style="display: none">Debe seleccionar
												cargo del empleado</span>
										
										
									</div>


								</div>


							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger pull-left"
									data-dismiss="modal">Cerrar</button>
								<button id="botonGuardar" type="button" class="btn btn-primary"
									onclick="guardarDatosEmpleado();">Agregar</button>
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- Modal editar -->
  

			<div class="modal fade" id="modalEditarEmpleado" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">

							<h4 class="modal-title" id="myModalLabel">Editar Empleado</h4>
						</div>
						<div class="modal-body">


							<div class="row">

								<div class="box-body">

									<div id="form-editar" class="form-group">

										<div style="display: none">
											<input id="rutEmpleadoEditar" />
										</div>

										<label class="col-sm-4 control-label">Nombre</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="nombreEmpleadoEditar">
											<span id="errorNombreEmpleadoEditar" class="error" style="display: none">Ingrese
												el nombre del empleado</span>
										</div>
										
                                         <br><br><label class="col-sm-4 control-label">Apellidos</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="apellidosEmpleadoEditar">
											<span id="errorApellidosEmpleadoEditar" class="error" style="display: none">Ingrese
											los apellidos del empleado</span>
										</div>
										
										<br><br><label class="col-sm-4 control-label">Fecha nacimiento</label>
										<div class="col-sm-6">
											<input type="date" class="form-control" id="fechaNacimientoEmpleadoEditar">
											<span id="errorFechaNacimientoEmpleadoEditar" class="error" style="display: none">Ingrese
												fecha de nacimiento del empleado</span>
												<span id="errorFechaNacimientoSuperiorEditar" class="error" style="display: none">Ingrese
												una fecha de nacimiento inferior </span>
										</div>
										
										<br><br><label class="col-sm-4 control-label">Direcci�n</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="direccionEmpleadoEditar">
											<span id="errorDireccionEmpleadoEditar" class="error" style="display: none">Ingrese
												direcci�n del empleado</span>
										</div>
										
										<br><br><label class="col-sm-4 control-label">Telefono</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="telefonoEmpleadoEditar">
											<span id="errorTelefonoEmpleadoEditar" class="error" style="display: none">Ingrese
												telefono del empleado</span>
										</div>
										
										<br><br><label class="col-sm-4 control-label">Cargo</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="cargoEmpleadoEditar">
											<span id="errorCargoEmpleadoEditar" class="error" style="display: none">Ingrese
												cargo del empleado</span>
										</div>
										
										
									</div>


								</div>


							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger pull-left"
									data-dismiss="modal">Cerrar</button>
								<button id="botonGuardar" type="button" class="btn btn-primary"
									onclick="guardarDatosEmpleadoEditar();">Actualizar</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			</section>

		</div>

		<!-- /.content-wrapper -->

		<footer align="center" class="main-footer"
			style="background-color:#ecf0f5;"> <%@ include
			file="pieDePagina.jsp"%> </footer>

		<div class="control-sidebar-bg"></div>

	</div>
	<%@ include file="scripts.jsp"%>
</body>

<script>
	function agregarEmpleado() {
		$('#modalAgregarEmpleado').modal('show');

			//Limpiar modal
		$('#rutEmpleado').val("");
		$('#nombreEmpleado').val("");
		$('#apellidosEmpleado').val("");
		$("#fechaNacimientoEmpleado").val("");
		$("#direccionEmpleado").val("");
		$("#telefonoEmpleado").val("");
		$("#cargoEmpleado").val("");
		
		
		document.getElementById('errorRutEmpleado').style.display = 'none';
		document.getElementById('rutEmpleado').style.border = "";

		document.getElementById('errorNombreEmpleado').style.display = 'none';
		document.getElementById('nombreEmpleado').style.border = "";

		document.getElementById('errorApellidosEmpleado').style.display = 'none';
		document.getElementById('apellidosEmpleado').style.border = "";

		document.getElementById('errorFechaNacimientoEmpleado').style.display = 'none';
		document.getElementById('fechaNacimientoEmpleado').style.border = "";
		
		document.getElementById('errorDireccionEmpleado').style.display = 'none';
		document.getElementById('direccionEmpleado').style.border = "";
		
		document.getElementById('errorTelefonoEmpleado').style.display = 'none';
		document.getElementById('telefonoEmpleado').style.border = "";
		
		document.getElementById('errorCargoEmpleado').style.display = 'none';
		document.getElementById('cargoEmpleado').style.border = "";
	}
	
	
	

	function guardarDatosEmpleado() {
		
		
		//Obtener los datos
		var rutEmpleado = $('#rutEmpleado').val();
		var nombreEmpleado = $('#nombreEmpleado').val();
		var apellidosEmpleado = $('#apellidosEmpleado').val();
		var fechaNacimientoEmpleado = $('#fechaNacimientoEmpleado').val();
		var direccionEmpleado = $('#direccionEmpleado').val();
		var telefonoEmpleado = $('#telefonoEmpleado').val();
		var cargoEmpleado = $('#cargoEmpleado').val();
		

		var hoy = new Date();
		var fechaNacimiento = new Date(fechaNacimientoEmpleado);
	
		
		var claveEmpleado= (nombreEmpleado.substring(0,4)+ rutEmpleado.substring(0,4));
        
		console.log(rutEmpleado);
		console.log(nombreEmpleado);
		console.log(apellidosEmpleado);
		console.log(fechaNacimiento);
		console.log(direccionEmpleado);
		console.log(telefonoEmpleado);
		console.log(cargoEmpleado);
		console.log(claveEmpleado);


		//Validacion para el rut
		if (rutEmpleado == "") {
			document.getElementById('errorRutEmpleado').style.display = 'inline';
			document.getElementById('rutEmpleado').style.border = "1px solid red";
		} else {
			document.getElementById('errorRutEmpleado').style.display = 'none';
			document.getElementById('rutEmpleado').style.border = "";
		}
		
		
		
		//Validacion para el nombre
		if (nombreEmpleado == "") {
			document.getElementById('errorNombreEmpleado').style.display = 'inline';
			document.getElementById('nombreEmpleado').style.border = "1px solid red";
		} else {
			document.getElementById('errorNombreEmpleado').style.display = 'none';
			document.getElementById('nombreEmpleado').style.border = "";
		}

		//Validacion para los apellidos
		if ( apellidosEmpleado == "") {
			document.getElementById('errorApellidosEmpleado').style.display = 'inline';
			document.getElementById('apellidosEmpleado').style.border = "1px solid red";
		} else {
			document.getElementById('errorApellidosEmpleado').style.display = 'none';
			document.getElementById('apellidosEmpleado').style.border = "";
		}

		//Validacion par la fecha nacimiento
		if (fechaNacimientoEmpleado == ""){
			document.getElementById('errorFechaNacimientoEmpleado').style.display = 'inline';
			document.getElementById('fechaNacimientoEmpleado').style.border = "1px solid red";
		} else {
			document.getElementById('errorFechaNacimientoEmpleado').style.display = 'none';
			document.getElementById('fechaNacimientoEmpleado').style.border = "";
		}
		
		
		if (fechaNacimiento > hoy){
			document.getElementById('errorFechaNacimientoSuperior').style.display = 'inline';
			document.getElementById('fechaNacimientoEmpleado').style.border = "1px solid red";
		} else {
			document.getElementById('errorFechaNacimientoSuperior').style.display = 'none';
			document.getElementById('fechaNacimientoEmpleado').style.border = "";
		}
	   
		
		
		//Validacion para la direccion
		if (direccionEmpleado == "") {
			document.getElementById('errorDireccionEmpleado').style.display = 'inline';
			document.getElementById('direccionEmpleado').style.border = "1px solid red";
		} else {
			document.getElementById('errorDireccionEmpleado').style.display = 'none';
			document.getElementById('direccionEmpleado').style.border = "";
		}
		
		//Validacion para el telefono
		if (telefonoEmpleado == "") {
			document.getElementById('errorTelefonoEmpleado').style.display = 'inline';
			document.getElementById('telefonoEmpleado').style.border = "1px solid red";
		} else {
			document.getElementById('errorTelefonoEmpleado').style.display = 'none';
			document.getElementById('telefonoEmpleado').style.border = "";
		}
		
		
		//Validacion para el cargo
		if (cargoEmpleado == "") {
			document.getElementById('errorCargoEmpleado').style.display = 'inline';
			document.getElementById('cargoEmpleado').style.border = "1px solid red";
		} else {
			document.getElementById('errorCargoEmpleado').style.display = 'none';
			document.getElementById('cargoEmpleado').style.border = "";
		}
		
		if (nombreEmpleado != "" && apellidosEmpleado!="" && rutEmpleado != "" && fechaNacimientoEmpleado!="" && fechaNacimiento< hoy
			&& direccionEmpleado!=""  && telefonoEmpleado!="" && cargoEmpleado!="") {
			$.ajax({
				type : 'POST',
				url : "agregarEmpleado",
				dataType : 'json',
				data : {
					rut : rutEmpleado,
					nombre : nombreEmpleado,
					apellidos : apellidosEmpleado,
					fechaNacimiento : fechaNacimientoEmpleado,
					direccion : direccionEmpleado,
					telefono: telefonoEmpleado,
					cargo : cargoEmpleado,
					clave: claveEmpleado
				},
				success : function(data) {
					console.log(data);

					if (data.rut!="") {
						$('#modalAgregarEmpleado').modal('hide');

						var tabla = $('#listaEmpleados').dataTable();
						var num = tabla.fnSettings().fnRecordsTotal();

						$('#listaEmpleados').dataTable().fnAddData(

								[ num + 1, data.nombre, data.apellidos,data.rut,
										data.direccion, data.telefono,data.cargo, '<a href="#" onclick="editarEmpleado('+data.rut+');"><i class="fa fa-edit fa-lg" style="color: #1CE4D0"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="eliminarEmpleado('+data.rut+');"><i class="fa fa-trash-o fa-lg" style="color: red"></i></a>' ]

						);

						$("#listaEmpleados").DataTable().page('last')
								.draw('page');

						toastr.success("Empleado agregado correctamente");
					} else {
						toastr.error("Error al agregar el empleado");
					}

				},
				error : function(jqXHR, errorThrown) {
					toastr.error("Error al agregar el empleado");
				}
			});
		}

	}
	
	
	
	
	function editarEmpleado(rut) {
		console.log(rut);
		
		if(rut!=null){
			//Obtener los datos del insumo
			 $.ajax({
					type : 'POST',
					url : "obtenerEmpleadoAEditar",
					dataType : 'json',
					data:{
						rut:rut
					},
					success : function(data) {
						console.log(data);
						if(!$.isEmptyObject(data)){
							//Cargar los datos en el modal
							$('#nombreEmpleadoEditar').val(data.nombre);
							$('#apellidosEmpleadoEditar').val(data.apellidos);
							$('#fechaNacimientoEmpleadoEditar').val(data.fechaNac);
							$('#direccionEmpleadoEditar').val(data.direccion);
							$('#telefonoEmpleadoEditar').val(data.telefono);
							$('#cargoEmpleadoEditar').val(data.cargo);
						
							
							document.getElementById('errorNombreEmpleadoEditar').style.display = 'none';
							document.getElementById('nombreEmpleadoEditar').style.border = "";

							document.getElementById('errorApellidosEmpleadoEditar').style.display = 'none';
							document.getElementById('apellidosEmpleadoEditar').style.border = "";

							document.getElementById('errorFechaNacimientoEmpleadoEditar').style.display = 'none';
							document.getElementById('fechaNacimientoEmpleadoEditar').style.border = "";
							
							document.getElementById('errorDireccionEmpleadoEditar').style.display = 'none';
							document.getElementById('direccionEmpleadoEditar').style.border = "";

							document.getElementById('errorTelefonoEmpleadoEditar').style.display = 'none';
							document.getElementById('telefonoEmpleadoEditar').style.border = "";

							document.getElementById('errorCargoEmpleadoEditar').style.display = 'none';
							document.getElementById('cargoEmpleadoEditar').style.border = "";
							
							//Cargar el id del insumo en el input oculto
							$('#rutEmpleadoEditar').val(rut);
	
							$('#modalEditarEmpleado').modal('show');
						
							
						}

					},
					error : function(jqXHR, errorThrown) {
						toastr.error("Error al editar el empleado");
					}
				});
		}
			
	}
	
	function eliminarEmpleado(rutEmpleado){
		console.log(rutEmpleado);
		
		if(rutEmpleado!=null){
			swal({
				  title: "�Est� seguro de eliminar el empleado?",
				  text: "Esta acci�n no podr� ser recuperada",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-danger",
				  cancelButtonText: "Cancelar",
				  confirmButtonText: "Si, Eliminar",
				  closeOnConfirm: false
				},
				function(){
						  
				  //Ajax para eliminar
				  $.ajax({
						type : 'POST',
						url : "eliminarEmpleado",
						dataType : 'json',
						data : {
							rutEmpleado: rutEmpleado
						},
						success : function(data) {
							if(data==true){
								swal.close();
								toastr.success("Empleado eliminado correctamente");

								//Actualizar el data table
								 $.ajax({
										type : 'POST',
										url : "obtenerListaEmpleados",
										dataType : 'json',
										success : function(data) {
											
											if(!$.isEmptyObject(data)){
												//vaciar datatable
												var oTable = $('#listaEmpleados').dataTable();
												oTable.fnClearTable();
												
												//Llenar data table
												for(var i=0;i<data.length;i++){
													$('#listaEmpleados').dataTable().fnAddData(

															[i + 1, data[i].nombre, data[i].apellidos,data[i].rut,data[i].direccion,
																	data[i].telefono, data[i].cargo, '<a href="#" onclick="editarEmpleado('+data[i].rut+');"><i class="fa fa-edit fa-lg" style="color: #1CE4D0"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="eliminarEmpleado('+data[i].rut+');"><i class="fa fa-trash-o fa-lg" style="color: red"></i></a>' ]

													);
												}
											}
											

										},
										error : function(jqXHR, errorThrown) {
											toastr.error("Error al obtener los empleados");
										}
									});
							}else{
								toastr.error("Error al obtener los empleados");
							}

						},
						error : function(jqXHR, errorThrown) {
							toastr.error("Error al eliminar el empleado");
						}
					});
				  
				});
		}
		
	}
	
	function guardarDatosEmpleadoEditar(){
		//Obtener los datos
		var rutEmpleadoEditar = $('#rutEmpleadoEditar').val();
		var nombreEmpleadoEditar = $('#nombreEmpleadoEditar').val();
		var apellidosEmpleadoEditar = $('#apellidosEmpleadoEditar').val();
		var fechaNacimientoEmpleadoEditar = $('#fechaNacimientoEmpleadoEditar').val();
		var direccionEmpleadoEditar = $('#direccionEmpleadoEditar').val();
		var telefonoEmpleadoEditar = $('#telefonoEmpleadoEditar').val();
		var cargoEmpleadoEditar = $('#cargoEmpleadoEditar').val();
		
		var hoy = new Date();
		var FechaNacimiento = new Date(fechaNacimientoEmpleadoEditar);
	
		
		var claveEmpleadoEditar= (nombreEmpleadoEditar.substring(0,4)+ rutEmpleadoEditar.substring(0,4));

		console.log(nombreEmpleadoEditar);
		console.log(apellidosEmpleadoEditar);
		console.log(fechaNacimientoEmpleadoEditar);
		console.log(direccionEmpleadoEditar);
		console.log(telefonoEmpleadoEditar);
		console.log(cargoEmpleadoEditar);

		//Validacion para el rut
		if (rutEmpleado == "") {
			document.getElementById('errorRutEmpleado').style.display = 'inline';
			document.getElementById('rutEmpleado').style.border = "1px solid red";
		} else {
			document.getElementById('errorRutEmpleado').style.display = 'none';
			document.getElementById('rutEmpleado').style.border = "";
		}
		
		
		
		//Validacion para el nombre
		if (nombreEmpleadoEditar == "") {
			document.getElementById('errorNombreEmpleadoEditar').style.display = 'inline';
			document.getElementById('nombreEmpleadoEditar').style.border = "1px solid red";
		} else {
			document.getElementById('errorNombreEmpleadoEditar').style.display = 'none';
			document.getElementById('nombreEmpleadoEditar').style.border = "";
		}

		//Validacion para los apellidos
		if ( apellidosEmpleadoEditar == "") {
			document.getElementById('errorApellidosEmpleadoEditar').style.display = 'inline';
			document.getElementById('apellidosEmpleadoEditar').style.border = "1px solid red";
		} else {
			document.getElementById('errorApellidosEmpleadoEditar').style.display = 'none';
			document.getElementById('apellidosEmpleadoEditar').style.border = "";
		}

		//Validacion par la fecha nacimiento
		if (fechaNacimientoEmpleadoEditar == ""){
			document.getElementById('errorFechaNacimientoEmpleadoEditar').style.display = 'inline';
			document.getElementById('fechaNacimientoEmpleado').style.border = "1px solid red";
		} else {
			document.getElementById('errorFechaNacimientoEmpleadoEditar').style.display = 'none';
			document.getElementById('fechaNacimientoEmpleadoEditar').style.border = "";
		}
		
		
		if (FechaNacimiento > hoy){
			document.getElementById('errorFechaNacimientoSuperiorEditar').style.display = 'inline';
			document.getElementById('fechaNacimientoEmpleadoEditar').style.border = "1px solid red";
		} else {
			document.getElementById('errorFechaNacimientoSuperiorEditar').style.display = 'none';
			document.getElementById('fechaNacimientoEmpleadoEditar').style.border = "";
		}
	   
		
		
		//Validacion para la direccion
		if (direccionEmpleadoEditar == "") {
			document.getElementById('errorDireccionEmpleadoEditar').style.display = 'inline';
			document.getElementById('direccionEmpleadoEditar').style.border = "1px solid red";
		} else {
			document.getElementById('errorDireccionEmpleadoEditar').style.display = 'none';
			document.getElementById('direccionEmpleadoEditar').style.border = "";
		}
		
		//Validacion para el telefono
		if (telefonoEmpleadoEditar == "") {
			document.getElementById('errorTelefonoEmpleadoEditar').style.display = 'inline';
			document.getElementById('telefonoEmpleadoEditar').style.border = "1px solid red";
		} else {
			document.getElementById('errorTelefonoEmpleado').style.display = 'none';
			document.getElementById('telefonoEmpleado').style.border = "";
		}
		
		
		//Validacion para el cargo
		if (cargoEmpleadoEditar == "") {
			document.getElementById('errorCargoEmpleadoEditar').style.display = 'inline';
			document.getElementById('cargoEmpleadoEditar').style.border = "1px solid red";
		} else {
			document.getElementById('errorCargoEmpleadoEditar').style.display = 'none';
			document.getElementById('cargoEmpleadoEditar').style.border = "";
		}

		if (nombreEmpleadoEditar != "" && apellidosEmpleadoEditar!="" && rutEmpleadoEditar != "" && fechaNacimientoEmpleadoEditar!="" && FechaNacimiento< hoy
				&& direccionEmpleadoEditar!=""  && telefonoEmpleadoEditar!="" && cargoEmpleadoEditar!="") {
			$.ajax({
				type : 'POST',
				url : "editarEmpleado",
				dataType : 'json',
				data : {
					rutEditar : rutEmpleadoEditar,
					nombreEditar : nombreEmpleadoEditar,
					apellidosEditar : apellidosEmpleadoEditar,
					fechaNacimientoEditar : fechaNacimientoEmpleadoEditar,
					direccionEditar : direccionEmpleadoEditar,
					telefonoEditar: telefonoEmpleadoEditar,
					cargoEditar : cargoEmpleadoEditar,
					claveEditar: claveEmpleadoEditar
				},
				success : function(data) {
					console.log(data);

					if(data==true){
						
						//Actualizar el data table
						 $.ajax({
								type : 'POST',
								url : "obtenerListaEmpleados",
								dataType : 'json',
								success : function(data) {
									
									if(!$.isEmptyObject(data)){
										//vaciar datatable
										var oTable = $('#listaEmpleados').dataTable();
										oTable.fnClearTable();
										
										//Llenar data table
										for(var i=0;i<data.length;i++){
											$('#listaEmpleados').dataTable().fnAddData(

													[i + 1, data[i].nombre, data[i].apellidos,data[i].rut,data[i].direccion,
															data[i].telefono, data[i].cargo, '<a href="#" onclick="editarEmpleado('+data[i].rut+');"><i class="fa fa-edit fa-lg" style="color: #1CE4D0"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="eliminarEmpleado('+data[i].rut+');"><i class="fa fa-trash-o fa-lg" style="color: red"></i></a>' ]

											);
										}
									}
									
									//Close modal
									$('#modalEditarEmpleado').modal('hide');
									

								},
								error : function(jqXHR, errorThrown) {
									toastr.error("Error al obtener los empleados");
								}
							});
						
							toastr.success("Empleado editado correctamente");
						
						
						
					}else{
						toastr.error("Error al editar el empleado");
					}

				},
				error : function(jqXHR, errorThrown) {
					toastr.error("Error al editar el empleado");
				}
			});
		}

	}
</script>


<script>

function checkRut(rut) {
    // Despejar Puntos
    var valor = rut.value.replace('.','');
    // Despejar Gui�n
    valor = valor.replace('-','');
    
    // Aislar Cuerpo y D�gito Verificador
    cuerpo = valor.slice(0,-1);
    dv = valor.slice(-1).toUpperCase();
    
    // Formatear RUN
    rut.value = cuerpo + '-'+ dv
    
    // Si no cumple con el m�nimo ej. (n.nnn.nnn)
    if(cuerpo.length < 7) { rut.setCustomValidity("RUT Incompleto"); return false;}
    
    // Calcular D�gito Verificador
    suma = 0;
    multiplo = 2;
    
    // Para cada d�gito del Cuerpo
    for(i=1;i<=cuerpo.length;i++) {
    
        // Obtener su Producto con el M�ltiplo Correspondiente
        index = multiplo * valor.charAt(cuerpo.length - i);
        
        // Sumar al Contador General
        suma = suma + index;
        
        // Consolidar M�ltiplo dentro del rango [2,7]
        if(multiplo < 7) { multiplo = multiplo + 1; } else { multiplo = 2; }
  
    }
    
    // Calcular D�gito Verificador en base al M�dulo 11
    dvEsperado = 11 - (suma % 11);
    
    // Casos Especiales (0 y K)
    dv = (dv == 'K')?10:dv;
    dv = (dv == 0)?11:dv;
    
    // Validar que el Cuerpo coincide con su D�gito Verificador
    if(dvEsperado != dv) { rut.setCustomValidity("RUT Inv�lido"); return false; }
    
    // Si todo sale bien, eliminar errores (decretar que es v�lido)
    rut.setCustomValidity('');
}

</script>


<script>
	$('#listaEmpleados').DataTable({
		'dom' : 'Bfrtip',
		'paging' : true,
		'lengthChange' : true,
		'searching' : false,
		'ordering' : false,
		'info' : true,
		'autoWidth' : true,
		'responsive' : true,
		"language" : {
			"sProcessing" : "Procesando...",
			"sLengthMenu" : "Mostrar _MENU_ registros",
			"sZeroRecords" : "No se encontraron resultados",
			"sEmptyTable" : "Ning�n dato disponible en esta tabla",
			"sInfo" : "",
			"sInfoEmpty" : "No hay datos para mostrar",
			"sInfoFiltered" : "(filtrado de un total de _MAX_ registros)",
			"sInfoPostFix" : "",
			"sSearch" : "Buscar:",
			"sUrl" : "",
			"sInfoThousands" : ",",
			"sLoadingRecords" : "Cargando...",
			"oPaginate" : {
				"sFirst" : "Primero",
				"sLast" : "�ltimo",
				"sNext" : "Siguiente",
				"sPrevious" : "Anterior"
			}
		}
	})
</script>

</html>