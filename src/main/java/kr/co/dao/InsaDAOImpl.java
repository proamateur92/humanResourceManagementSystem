package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.FileVO;
import kr.co.vo.InsaVO;
import kr.co.vo.SearchCriteria;
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
	public List<InsaVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("insaMapper.listPage", scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("insaMapper.listCount", scri);
	}
	
	@Override
	public List<comVO> comList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("insaMapper.comList");
	}
	
	public int insertFileByFileVo(FileVO fileVo) {
		return session.insert("insaMapper.insertFileByFileVo", fileVo);
	}

	@Override
	public int updateFile(int sabun, String saveName) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sabun", sabun);
		map.put("saveName", saveName);
		return session.update("insaMapper.updateFileBySabunAndOrgName", map);
	}

	@Override
	public int sabunCheck() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("insaMapper.sabunCheck");
	}

	@Override
	public int idChecking(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("insaMapper.idChecking", id);
	}

	@Override
	public int deleteSabun(InsaVO insaVO) throws Exception {
		// TODO Auto-generated method stub
		return session.delete("insaMapper.deleteSabun", insaVO);
	}

	@Override
	public InsaVO loadSabun(int sabun) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("insaMapper.loadSabun", sabun);
	}

	@Override
	public int updateSabun(InsaVO insaVO) throws Exception {
		// TODO Auto-generated method stub
		return session.update("insaMapper.updateSabun", insaVO);
	}

}
