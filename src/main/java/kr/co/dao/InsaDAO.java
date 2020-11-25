package kr.co.dao;

import java.util.List;

import kr.co.vo.InsaVO;
import kr.co.vo.comVO;

public interface InsaDAO {
	
	//직원 등록
	public int insert(InsaVO insaVO) throws Exception;
	
	//직원 리스트
	public List<InsaVO> list() throws Exception;
	
	//공통 리스트
	public List<comVO> comList() throws Exception;
}
