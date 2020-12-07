package kr.co.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.vo.FileVO;
import kr.co.vo.InsaVO;
import kr.co.vo.SearchCriteria;
import kr.co.vo.comVO;

public interface InsaService {
	public int insert(InsaVO insaVO) throws Exception;
	
	public List<InsaVO> list(SearchCriteria scri) throws Exception;
		
	public int listCount(SearchCriteria scri) throws Exception;
	
	public List<comVO> comList() throws Exception;
	
	public FileVO uploadFile(MultipartFile file, String fileType) throws Exception;
	
	public int updateFile(int sabun, String saveName) throws Exception;
	
	public int sabunCheck() throws Exception;
	
	public int idChecking(String id) throws Exception;
	
	public int deleteSabun(InsaVO insaVO) throws Exception;
	
	public InsaVO loadSabun(int sabun) throws Exception;
	
	public int updateSabun(InsaVO insaVO) throws Exception;
	}
