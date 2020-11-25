package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.InsaDAO;
import kr.co.vo.InsaVO;
import kr.co.vo.comVO;


@Service
public class InsaServiceImpl implements InsaService{

	@Inject
	private InsaDAO dao;

	@Override
	public int insert(InsaVO insaVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.insert(insaVO);
	}

	@Override
	public List<InsaVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public List<comVO> comList() throws Exception {
		// TODO Auto-generated method stub
		return dao.comList();
	}
}
