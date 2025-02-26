package com.ict.rs.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.ict.rs.dao.myPageDAO;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

@Service
public class myPageServiceImpl implements myPageService {

    @Inject
    myPageDAO dao;

	@Override
	public int pwdChk(String userId, String pwd) {
	
		return dao.pwdChk(userId, pwd);
	}
}
