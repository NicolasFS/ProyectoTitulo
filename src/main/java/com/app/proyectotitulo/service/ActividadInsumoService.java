package com.app.proyectotitulo.service;

import java.util.List;

import com.app.proyectotitulo.domain.Actividad_Insumo;

public interface ActividadInsumoService {

	public void save(Actividad_Insumo ai);

	List<Actividad_Insumo> listaInsumosActividadRealizada(int idActividadRealizada);

	public void delete(Actividad_Insumo ai);

	Actividad_Insumo buscarActividadInsumo(int idActividadInsumo);

}
