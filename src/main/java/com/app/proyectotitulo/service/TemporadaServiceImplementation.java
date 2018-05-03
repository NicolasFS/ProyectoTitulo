package com.app.proyectotitulo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.proyectotitulo.domain.Temporada;
import com.app.proyectotitulo.repository.TemporadaRepository;

@Service
public class TemporadaServiceImplementation implements TemporadaService {

	private TemporadaRepository temporadaRepo;

	@Autowired
	public void setTemporadaRepository(TemporadaRepository temporadaRepository) {
		temporadaRepo = temporadaRepository;
	}

	@Override
	public List<Temporada> listaTemporadas(boolean temporadaEliminada) {
		// TODO Auto-generated method stub
		return temporadaRepo.findByTemporadaEliminadaOrderByIdTemporadaDesc(temporadaEliminada);
	}

	@Override
	public Temporada saveTemporada(Temporada t) {
		// TODO Auto-generated method stub
		return temporadaRepo.saveAndFlush(t);
	}

	@Override
	public Temporada buscarTemporada(int idTemporada) {
		// TODO Auto-generated method stub
		return temporadaRepo.findByIdTemporada(idTemporada);
	}

}
