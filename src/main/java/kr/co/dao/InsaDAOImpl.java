package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.FileVO;
import kr.co.vo.InsaVO;
import kr.co.vo.comVO;

@Repository
public class InsaDAOImpl implements InsaDAO{
	
	@Inject
	private SqlSession session;
	
	@Override
	public int insert(InsaVO insaVO) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("insaMapper.insert", insaVO);
	}

	@Override
	public List<InsaVO> list() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("insaMapper.list");
	}

	@Override
	public List<comVO> comList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("insaMapper.comList");
	}
	
	public int insertFileByFileVo(FileVO fileVo) {
		return session.insert("insaMapper.insertFileByFileVo", fileVo);
	}
}
