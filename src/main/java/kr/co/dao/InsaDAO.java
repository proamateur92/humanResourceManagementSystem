package kr.co.dao;

import java.util.List;

import kr.co.vo.FileVO;
import kr.co.vo.InsaVO;
import kr.co.vo.SearchCriteria;
import kr.co.vo.comVO;

public interface InsaDAO {
	
	//직원 등록
	public int insert(InsaVO insaVO) throws Exception;
	
	//직원 리스트
	public List<InsaVO> list(SearchCriteria scri) throws Exception;
	
	//게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
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
	
	//사원 정보 불러오기
	public InsaVO loadSabun(int sabun) throws Exception;

	//사원 정보 수정
	public int updateSabun(InsaVO insaVO) throws Exception;
}
