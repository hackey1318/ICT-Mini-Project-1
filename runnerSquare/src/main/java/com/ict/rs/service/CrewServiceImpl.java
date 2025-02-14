package com.ict.rs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ict.rs.dao.CrewDAO;

@Service
public class CrewServiceImpl implements CrewService {
	@Inject
	CrewDAO dao;
}
