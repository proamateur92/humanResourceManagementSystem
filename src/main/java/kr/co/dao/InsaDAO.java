package kr.co.dao;

import java.util.List;

import kr.co.vo.FileVO;
import kr.co.vo.InsaVO;
import kr.co.vo.comVO;

public interface InsaDAO {
	
	//직원 등록
	public int insert(InsaVO insaVO) throws Exception;
	
	//직원 리스트
	public List<InsaVO> list() throws Exception;
	
	//공통 리스트
	public List<comVO> comList() throws Exception;
	
	//이미지 파일 추가
	public int insertFileByFileVo(FileVO fileVo) throws Exception;
	
	//이미지 파일 생성 시 사번 부여
	public int updateFile(int sabun, String saveName) throws Exception;
	
	//현재 사번의 최대값 
	public int sabunCheck() throws Exception;
	
	//아이디 중복체크
	public int idChecking(String id) throws Exception;
	
	//사원 삭제
	public int deleteSabun(InsaVO insaVO) throws Exception;
}
