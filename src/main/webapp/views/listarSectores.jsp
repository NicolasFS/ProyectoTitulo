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
							<h3 class="box-title">Lista de Sectores</h3>

							<button class="btn btn-primary pull-right" id="AgregarSector"
								type="button" onclick="agregarSector();">
								<i class="fa fa-plus-circle"> Agregar Sector</i>
							</button>

						</div>

						<div class="box-body">
							<div class="row">
								<div class="col-xs-12">
									<table id="listaSectores"
										class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>N�</th>
												<th>Nombre</th>
												<th>Superficie (m<sup>2</sup>)
												</th>
												<th>Acci�n</th>

											</tr>
										</thead>
										<c:set var="i" value="0" />
										<c:forEach var="sectores" items="${sectores}">
											<c:set var="i" value="${i+1}" />
											<tr>


												<td><c:out value="${i}"></c:out></td>
												<td><c:out value="${sectores.nombre}"></c:out></td>
												<td><c:out value="${sectores.superficie}"></c:out></td>
												<td><a href="#"
													onclick="editarSector(${sectores.idSector});"><i
														class="fa fa-edit fa-lg" style="color: #1CE4D0"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
													href="#" onclick="eliminarSector(${sectores.idSector});"><i
														class="fa fa-trash-o fa-lg" style="color: red"></i></a></td>


											</tr>
										</c:forEach>

									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>




			<!-- Modal -->

			<div class="modal fade" id="modalAgregarSector" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">

							<h4 class="modal-title" id="myModalLabel">Agregar Sector</h4>
						</div>
						<div class="modal-body">


							<div class="row">

								<div class="box-body">

									<div id="form-editar" class="form-group">

										<label class="col-sm-4 control-label">* Nombre</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" id="nombreSector"
												onclick="sectorVacio();"> <span id="errorNombre"
												class="error" style="display: none">Ingrese el nombre
												del sector</span>
										</div>
										<br> <br> <label class="col-sm-4 control-label">*
											Superficie (m<sup>2</sup>)
										</label>

										<div class="col-sm-6">
											<input type="text" class="form-control" id="superficieSector"
												onkeypress="return filterFloat(event,this);"
												onclick="superficieVacia();"> <span
												id="errorSuperficie" class="error" style="display: none">Ingrese
												la superficie del sector</span> <span id="errorSuperficieNegativa"
												class="error" style="display: none">La superficie no
												puede ser negativa</span>
										</div>

										<br> <br> <label class="col-sm-4 control-label"></label>
										<div class="col-sm-6">
											<label class="pull-right"
												style="font-weight: normal; color: red">* Campos
												obligatorios</label>
										</div>
									</div>
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger pull-left"
									data-dismiss="modal">Cerrar</button>
								<button id="botonGuardar" type="button" class="btn btn-primary"
									onclick="guardarDatosSector();">Agregar</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal editar -->


			<div class="modal fade" id="modalEditarSector" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">

							<h4 class="modal-title" id="myModalLabel">Editar Sector</h4>
						</div>
						<div class="modal-body">


							<div class="row">

								<div class="box-body">

									<div id="form-editar" class="form-group">

										<div style="display: none">
											<input id="idSectorEditar" />
										</div>

										<label class="col-sm-4 control-label">* Nombre</label>
										<div class="col-sm-6">
											<input type="text" class="form-control"
												id="nombreSectorEditar"> <span
												id="errorNombreEditar" class="error" style="display: none">Ingrese
												el nombre del sector</span>

										</div>
										<br> <br> <label class="col-sm-4 control-label">*
											Superficie (m<sup>2</sup>)
										</label>
										<div class="col-sm-6">
											<input type="text" class="form-control"
												onkeypress="return filterFloat(event,this);"
												id="superficieSectorEditar"> <span
												id="errorSuperficieEditar" class="error"
												style="display: none">Ingrese la superficie del
												sector</span> <span id="errorSuperficieNegativaEditar"
												class="error" style="display: none">La superficie no
												puede ser negativa</span>

										</div>

										<br> <br> <label class="col-sm-4 control-label"></label>
										<div class="col-sm-6">
											<label class="pull-right"
												style="font-weight: normal; color: red">* Campos
												obligatorios</label>
										</div>
									</div>


								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger pull-left"
										data-dismiss="modal">Cerrar</button>
									<button id="botonGuardar" type="button" class="btn btn-primary"
										onclick="guardarDatosSectorEditar();">Actualizar</button>
								</div>
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


function sectorVacio(){
	nombreSector=$('#nombreSector').val();
	
		document.getElementById('errorNombre').style.display = 'none';
		document.getElementById('nombreSector').style.border = "";
		
}


function superficieVacia(){
		document.getElementById('errorSuperficie').style.display = 'none';
		document.getElementById('superficieSector').style.border = "";
}

 
 function agregarSector() {
	 
		$('#modalAgregarSector').modal('show');

		//Limpiar modal
		$('#nombreSector').val("");
		$('#superficieSector').val("");
		
		
		document.getElementById('errorNombre').style.display = 'none';
		document.getElementById('nombreSector').style.border = "";

		document.getElementById('errorSuperficie').style.display = 'none';
		document.getElementById('superficieSector').style.border = "";

		
	}

 function guardarDatosSector() {
		//Obtener los datos
		var nombreSector = $('#nombreSector').val();
		var superficieSector = $('#superficieSector').val();

		console.log(nombreSector);
		console.log(superficieSector);
		
		//Validacion para el nombre
		if (nombreSector == "") {
			document.getElementById('errorNombre').style.display = 'inline';
			document.getElementById('nombreSector').style.border = "1px solid red";
		} else {
			document.getElementById('errorNombre').style.display = 'none';
			document.getElementById('nombreSector').style.border = "";
		}
		
		//Validacion para la superficie
		if (superficieSector =="") {
			document.getElementById('errorSuperficie').style.display = 'inline';
			document.getElementById('superficieSector').style.border = "1px solid red";
		} else {
			//Validacion para la superficie
			if (superficieSector<0 && superficieSector !="") {
				document.getElementById('errorSuperficie').style.display = 'none';
				document.getElementById('errorSuperficieNegativa').style.display = 'inline';
				document.getElementById('superficieSector').style.border = "1px solid red";
			} else {
				document.getElementById('errorSuperficieNegativa').style.display = 'none';
				document.getElementById('superficieSector').style.border = "";
			}
			
		}
		
		if(superficieSector!="" && superficieSector>0){
			document.getElementById('errorSuperficie').style.display = 'none';
			document.getElementById('superficieSector').style.border = "";
		}
		
		if (nombreSector != "" && superficieSector>0) {
			
			$
			.ajax({
				type : 'POST',
				url : "verificarNombreRepetidoSector",
				dataType : 'json',
				async : false,
				data : {
					nombre : nombreSector
				},
				success : function(data) {
					if (data == true) {
						swal(
								{
									title : "Ya existe un sector con el nombre ingresado �Desea continuar?",
									text : "",
									type : "warning",
									showCancelButton : true,
									confirmButtonClass : "btn-danger",
									cancelButtonText : "Cancelar",
									confirmButtonText : "Si, continuar",
									closeOnConfirm : false
								},
								function() {
			
			
			$.ajax({
				type : 'POST',
				url : "agregarSector",
				dataType : 'json',
				data : {
					nombre : nombreSector,
					superficie : superficieSector,
					
				},
				
				success : function(data) {
					console.log(data);

					if (data.idSector > 0) {
						swal.close();
						$('#modalAgregarSector').modal('hide');

						//Actualizar el data table
						$.ajax({
									type : 'POST',
									url : "obtenerListaSectores",
									dataType : 'json',
									success : function(data) {
										

										if (!$.isEmptyObject(data)) {
											//vaciar datatable
											var oTable = $(
													'#listaSectores')
													.dataTable();
											oTable
													.fnClearTable();

											//Llenar data table
											for (var i = 0; i < data.length; i++) {
												$(
														'#listaSectores')
														.dataTable()
														.fnAddData(

																[i + 1,
																		data[i].nombre,
																		data[i].superficie,
																		'<a href="#" onclick="editarSector('
																				+ data[i].idSector
																				+ ');"><i class="fa fa-edit fa-lg" style="color: #1CE4D0"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="eliminarSector('
																				+ data[i].idSector
																				+ ');"><i class="fa fa-trash-o fa-lg" style="color: red"></i></a>' ]

														);
											}
										}

									},
									error : function(jqXHR,
											errorThrown) {
										toastr
												.error("Error al obtener los sectores");
									}
								}); 
					            //

						toastr.success("Sector agregado correctamente");
					} else {
						toastr.error("Error al agregar el sector");
					}

				},
				error : function(jqXHR, errorThrown) {
					toastr.error("Error al agregar el sector");
				}
				
			});
								
								});
						
				
					}else{
						
						$.ajax({
							type : 'POST',
							url : "agregarSector",
							dataType : 'json',
							data : {
								nombre : nombreSector,
								superficie : superficieSector,
								
							},
							
							success : function(data) {
								console.log(data);

								if (data.idSector > 0) {
									$('#modalAgregarSector').modal('hide');

									//Actualizar el data table
									$.ajax({
												type : 'POST',
												url : "obtenerListaSectores",
												dataType : 'json',
												success : function(data) {

													if (!$.isEmptyObject(data)) {
														//vaciar datatable
														var oTable = $(
																'#listaSectores')
																.dataTable();
														oTable
																.fnClearTable();

														//Llenar data table
														for (var i = 0; i < data.length; i++) {
															$(
																	'#listaSectores')
																	.dataTable()
																	.fnAddData(

																			[i + 1,
																					data[i].nombre,
																					data[i].superficie,
																					'<a href="#" onclick="editarSector('
																							+ data[i].idSector
																							+ ');"><i class="fa fa-edit fa-lg" style="color: #1CE4D0"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="eliminarSector('
																							+ data[i].idSector
																							+ ');"><i class="fa fa-trash-o fa-lg" style="color: red"></i></a>' ]

																	);
														}
													}

												},
												error : function(jqXHR,
														errorThrown) {
													toastr
															.error("Error al obtener los sectores");
												}
											}); 
								            //

									toastr.success("Sector agregado correctamente");
								} else {
									toastr.error("Error al agregar el sector");
								}

							},
							error : function(jqXHR, errorThrown) {
								toastr.error("Error al agregar el sector");
							}
							
						});
											
											
									
							
								}
					},
					error : function(jqXHR, errorThrown) {
						toastr
								.error("Error, revisar datos");
					}
		
				});
			
			}
		}
 
 
 function editarSector(idSector) {
		console.log(idSector);
		
		if(idSector>0){
			//Obtener los datos del sector
			 $.ajax({
					type : 'POST',
					url : "obtenerSectorAEditar",
					dataType : 'json',
					data:{
						idSector:idSector
					},
					success : function(data) {
						console.log(data);
						if(!$.isEmptyObject(data)){
							//Cargar los datos en el modal
							$('#nombreSectorEditar').val(data.nombre);
							$('#superficieSectorEditar').val(data.superficie);
							
							
							
							document.getElementById('errorNombreEditar').style.display = 'none';
							document.getElementById('nombreSectorEditar').style.border = "";

							document.getElementById('errorSuperficieEditar').style.display = 'none';
							document.getElementById('superficieSectorEditar').style.border = "";
							
							document.getElementById('errorSuperficieNegativaEditar').style.display = 'none';
							document.getElementById('superficieSectorEditar').style.border = "";
							
							//Cargar el id del sector en el input oculto
							$('#idSectorEditar').val(idSector);
	
							$('#modalEditarSector').modal('show');
							
						}

					},
					error : function(jqXHR, errorThrown) {
						toastr.error("Error al editar el sector");
					}
				});
		}
			
	}
	

 function eliminarSector(idSector){
		console.log(idSector);
		
		if(idSector>0){
			swal({
				  title: "�Est� seguro de eliminar el sector?",
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
						url : "eliminarSector",
						dataType : 'json',
						data : {
							idSector:idSector
						},
						success : function(data) {
							if(data==true){
								swal.close();
								
								toastr.success("Sector eliminado correctamente");
								//Actualizar el data table
								$.ajax({
											type : 'POST',
											url : "obtenerListaSectores",
											dataType : 'json',
											success : function(data) {

												if (!$.isEmptyObject(data)) {
													//vaciar datatable
													var oTable = $(
															'#listaSectores')
															.dataTable();
													oTable
															.fnClearTable();

													//Llenar data table
													for (var i = 0; i < data.length; i++) {
														$(
																'#listaSectores')
																.dataTable()
																.fnAddData(

																		[i + 1,
																				data[i].nombre,
																				data[i].superficie,
																				'<a href="#" onclick="editarSector('
																						+ data[i].idSector
																						+ ');"><i class="fa fa-edit fa-lg" style="color: #1CE4D0"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="eliminarSector('
																						+ data[i].idSector
																						+ ');"><i class="fa fa-trash-o fa-lg" style="color: red"></i></a>' ]

																);
													}
												}

											},
											error : function(jqXHR,
													errorThrown) {
												toastr
														.error("Error al obtener los sectores");
											}
										}); 
							            //
					
								//elimina los predios asociados a un sector
								$.ajax({
								type : 'POST',
								url : "eliminarPrediosDeUnSector",
								dataType : 'json',
								data : {
								idSector:idSector
							 },
							  success : function(data) {
							  if(data==true){
												

							           } 
							          	
                                  },
						         error : function(jqXHR, errorThrown) {
							       
						       }
				             });
							} 
							else {
								toastr.error("Error al obtener los sectores");
							
						}	
							
							
                       },
						error : function(jqXHR, errorThrown) {
							toastr.error("Error al eliminar sector");
					}
				});
			})
		}
			
        }
 

 function guardarDatosSectorEditar(){
		//Obtener los datos
		var nombreSector = $('#nombreSectorEditar').val();
		var superficie= $('#superficieSectorEditar').val();
		var idSector=$('#idSectorEditar').val();

		console.log(nombreSector);
		console.log(superficie);

		//Validacion para el nombre
		if (nombreSector == "") {
			document.getElementById('errorNombreEditar').style.display = 'inline';
			document.getElementById('nombreSectorEditar').style.border = "1px solid red";
		} else {
			document.getElementById('errorNombreEditar').style.display = 'none';
			document.getElementById('nombreSectorEditar').style.border = "";
		}
		
		//Validacion para la superficie
		if (superficie =="") {
			document.getElementById('errorSuperficieEditar').style.display = 'inline';
			document.getElementById('superficieSectorEditar').style.border = "1px solid red";
		} else {
			//Validacion para la superficie
			if (superficie<0 && superficie !="") {
				document.getElementById('errorSuperficieEditar').style.display = 'none';
				document.getElementById('errorSuperficieNegativaEditar').style.display = 'inline';
				document.getElementById('superficieSectorEditar').style.border = "1px solid red";
			} else {
				document.getElementById('errorSuperficieNegativaEditar').style.display = 'none';
				document.getElementById('superficieSectorEditar').style.border = "";
			}
			
		}
		
		if(superficie!="" && superficie>0){
			document.getElementById('errorSuperficieEditar').style.display = 'none';
			document.getElementById('superficieSectorEditar').style.border = "";
		}

	
		if (nombreSector != "" && superficie>0 && idSector>0) {
			$.ajax({
				type : 'POST',
				url : "editarSector",
				dataType : 'json',
				data : {
					idSector:idSector,
					nombre : nombreSector,
					superficie : superficie,
					
				},
				success : function(data) {
					console.log(data);

					if(data==true){
						
						//Actualizar el data table
						 $.ajax({
								type : 'POST',
								url : "obtenerListaSectores",
								dataType : 'json',
								success : function(data) {
									
									if(!$.isEmptyObject(data)){
										//vaciar datatable
										var oTable = $('#listaSectores').dataTable();
										oTable.fnClearTable();
										
										//Llenar data table
										for(var i=0;i<data.length;i++){
											$('#listaSectores').dataTable().fnAddData(

													[i + 1, data[i].nombre, data[i].superficie, '<a href="#" onclick="editarSector('+data[i].idSector+');"><i class="fa fa-edit fa-lg" style="color: #1CE4D0"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="eliminarSector('+data[i].idSector+');"><i class="fa fa-trash-o fa-lg" style="color: red"></i></a>' ]

											);
										}
										toastr.success("Sector editado correctamente");
									}
									
									//Close modal
									$('#modalEditarSector').modal('hide');
									

								},
								error : function(jqXHR, errorThrown) {
									toastr.error("Error al obtener los sectores");
								}
							});
						
						
						
					}else{
						toastr.error("Error al editar el sector");
					}

				},
				error : function(jqXHR, errorThrown) {
					toastr.error("Error al editar el sector");
				}
			});
		}

	}
 
 
 function filterFloat(evt, input) {

		var key = window.Event ? evt.which : evt.keyCode;
		var chark = String.fromCharCode(key);
		var tempValue = input.value + chark;
		if (key >= 48 && key <= 57) {
			if (filter(tempValue) === false) {
				return false;
			} else {
				return true;
			}
		} else {
			if (key == 8 || key == 13 || key == 0) {
				return true;
			} else if (key == 46) {
				if (filter(tempValue) === false) {
					return false;
				} else {
					return true;
				}
			} else {
				return false;
			}
		}
	}

	function filter(__val__) {
		var preg = /^\d*$/;
		if (preg.test(__val__) === true) {
			return true;
		} else {
			return false;
		}

	}
 
</script>

<script>
	$('#listaSectores').DataTable({
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